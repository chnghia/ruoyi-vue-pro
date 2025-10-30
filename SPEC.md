# ruoyi-vue-pro Architecture and Module Pipelines (SPEC)

This SPEC summarizes the backend architecture, cross-cutting pipelines, and the main processing flows of each module in this repository. It also includes recommendations for improvements, MinIO/S3 integration guidance, and a step-by-step tutorial for building a new module that fits into the existing system.

## Overview

- Tech stack: Spring Boot multi-module backend, MySQL + MyBatis Plus, Redis + Redisson, Redis/RabbitMQ/Kafka/RocketMQ for MQ, Flowable for BPM, Quartz for jobs, Spring Security + token for auth, SaaS multi-tenant support, WebSocket.
- Repository entrypoint: `yudao-server` runs a single Spring Boot app scanning all module packages.
- Common cross-cutting pieces are provided by `yudao-framework` starters (security, mybatis, redis, mq, tenant, web, websocket, quartz/job, excel, monitor, protection, etc.).
- Functional domains are organized in `yudao-module-*` modules: system, infra, bpm, pay, mall, mp, member, crm, erp, ai, iot, report.

## Request Lifecycle (Cross-Cutting Pipeline)

1) Inbound HTTP → Security + Tenant
- Token filter authenticates user and loads `LoginUser` into context: `yudao-framework/yudao-spring-boot-starter-security/.../TokenAuthenticationFilter.java`.
- Authorization is handled by Spring Security config: `.../YudaoWebSecurityConfigurerAdapter.java` with `@PreAuthorize` checks in controllers.
- Tenant context is populated by web filters and used in DB/MQ: `yudao-framework/yudao-spring-boot-starter-biz-tenant/.../TenantContextWebFilter.java`, `TenantDatabaseInterceptor.java`.

2) Controller → Service → DAL
- Controllers expose REST APIs (VOs). Services hold business logic. Mappers interact with DB using MyBatis Plus mappers & DOs.
- Code conventions: `controller` → `service` → `dal` (mysql mappers + data objects), with `convert` package for VO/DTO/DO conversions (MapStruct).

3) Web layer concerns
- Unified response + exception handling: `.../web/core/handler/GlobalResponseBodyHandler.java`, `GlobalExceptionHandler.java`.
- Swagger/Knife4j OpenAPI: `yudao-framework/yudao-spring-boot-starter-web/.../YudaoSwaggerAutoConfiguration.java`.

4) Jobs (Quartz)
- Quartz triggers `JobHandlerInvoker` which locates a Spring `JobHandler` bean and calls `execute`: `yudao-framework/yudao-spring-boot-starter-job/.../JobHandlerInvoker.java` → `JobHandler.java`.
- Multi-tenant job execution runs per-tenant via `@TenantJob`: `yudao-framework/yudao-spring-boot-starter-biz-tenant/.../TenantJobAspect.java`.

5) Messaging (MQ)
- Redis Streams and Pub/Sub wrappers: `yudao-framework/yudao-spring-boot-starter-mq/.../redis/core/*` and RabbitMQ wrappers. Interceptors propagate tenant metadata.

6) Caching, Data Permission, Observability
- Redis cache via starter-redis; data permissions via `yudao-spring-boot-starter-biz-data-permission`.
- API error logs are captured from exceptions and sent through `ApiErrorLogCommonApi`. Trace IDs via `TracerUtils`.

7) File Storage (S3, local, FTP, DB)
- Unified file client abstraction with S3 support (MinIO, Aliyun, Tencent, Qiniu, Huawei, Volcengine): `S3FileClient`, `S3FileClientConfig` under `yudao-module-infra/.../framework/file/core/client/s3/`.

## Module Pipelines

Below are the main flows (“pipelines”) for each domain module. All modules follow the same layered structure: Controller → Service → DAL (Mapper/DO), plus Convert/VO/DTO.

### System (Users, Roles, Menus, Tenants, Dict, Config)
- Auth pipeline: login/captcha/social login → token issuance → `TokenAuthenticationFilter` populates user context → controller `@PreAuthorize` permission checks → dynamic menu tree/permissions returned via `AuthConvert`.
- Permission + Data-permission: menu/btn permissions + AOP data-scope interceptors.
- Tenant: tenant context in security and DB interceptors; opt-out with `@TenantIgnore` if necessary.

### Infra (File, Codegen, Logs, Jobs, SMS, Config, Notice)
- File pipeline: upload API → resolve master `FileClient` from `FileConfigService` → store to S3/local/FTP/DB → return domain/presigned URL.
- Code generation pipeline: read DB table meta → persist `CodegenTable/ColumnDO` → render Velocity templates via `CodegenEngine` → generate backend+frontend code preview → export.
- Logging pipeline: operate logs via AOP, API error logs via global exception handler → persist and view.
- Jobs pipeline: business jobs implement `JobHandler` (e.g., `TradeOrderAutoReceiveJob`) and are scheduled by Quartz.

### BPM (Flowable)
- Definition pipeline: upload BPMN or design online → persist `BpmProcessDefinitionInfoDO` and deploy to Flowable.
- Instance pipeline: start process with variables → task assignment (user/role/dept) → approve/reject/transfer/delegate/add/sub sign → update status/history → send notifications.
- Form/Model: supports dynamic forms and BPMN model visualization; message DTOs for task create/approve/reject notifications.

### Pay (Payment + Refund + Wallet)
- Order pipeline: create pay order → select channel (Alipay/WeChat/etc.) → create channel-specific order/params → redirect/SDK → async notify/callback → update `PayOrderDO` status → produce `PayNotifyTaskDO` to notify business.
- Refund pipeline: create refund for a paid order → call channel API → async notify/callback → update `PayRefundDO` → notify business.
- Channel/app config managed via admin; wallet and recharge flows supported.

### Mall (Product, Trade, Promotion, Statistics)
- Product pipeline: SPU/SKU CRUD, inventory fields maintained.
- Trade pipeline: cart → order create (compute price/promo/shipping) → payment (via Pay module) → delivery/receive → after-sale/returns/refunds (feedback to Pay).
- Promotion pipeline: coupons, seckill, group, discounts; checked during pricing and order creation.
- Statistics pipeline: scheduled jobs & queries aggregate trade/product metrics.

### MP (WeChat Official Account)
- Pipeline: bind app config → message/subscribe events in → route to handlers → user bind/update profile → menu/material mgmt.

### Member
- Pipeline: member profile, level, points/growth rules → events from order/pay update member stats.

### CRM
- Pipeline: leads → customers → business opportunities → contracts → follow-up/activity → (optionally) link to orders/receivables.

### ERP
- Pipeline: purchase → inbound → stock ledger → sale → outbound; integrates with product/trade for stock changes.

### Report (Data Visualization)
- Pipeline: integrates “积木报表” and GoView. Controller endpoints under `/report/`; projects/dashboards stored as DOs; datasets queried per report config.

### AI
- Pipeline: platform-agnostic AI calls via Spring AI; API keys/models configured; `AiUtils` builds `ChatOptions` for Aliyun DashScope, OpenAI, ZhiPu, DeepSeek, MiniMax, Moonshot, Azure OpenAI, Anthropic, Baidu QianFan, etc.; supports chat, image (Midjourney sync job), tools/functions.

### IoT
- Gateway pipeline: MQTT/HTTP/TCP protocols under `yudao-module-iot-gateway`. MQTT example: device connect → authenticate via remote device API → manage connection/lifecycle → upstream message decode → route to device message service → downstream publish.
- Core/business pipeline: device registry/auth, productKey/deviceName conventions, online/offline events.

## MinIO/S3 Integration

The platform natively supports S3-compatible storage (MinIO, Aliyun OSS, COS, Qiniu, Huawei OBS, Volcengine TOS) via `S3FileClient`.

Configuration options (DB-driven):
- Table: `infra_file_config` holds multiple file configs; one can be master.
- The initial SQL contains MinIO example (‘MinIO 存储（示例）’). Update to match your environment.

Key fields in `S3FileClientConfig`:
- `endpoint`: MinIO endpoint, e.g. `http://127.0.0.1:9000`.
- `domain`: public domain to access files. For MinIO, typically `http://<endpoint>/<bucket>` if directly exposed or via Nginx.
- `bucket`: bucket name.
- `accessKey` / `accessSecret`: MinIO credentials.
- `enablePathStyleAccess`: true/false depending on your MinIO/Nginx path-style.
- `enablePublicAccess`: true to return direct URLs; false to return presigned GET URLs.

How uploads flow:
- API receives file → `FileConfigService` resolves master client → `S3FileClient#upload` stores object → returns accessible URL or presigned URL.

Programmatic usage (service layer):
- Resolve a file client: `fileConfigService.getMasterFileClient()` or by ID.
- Upload: `fileClient.upload(byte[], path, contentType)` → returns URL; `presignPutUrl` available for client-direct uploads.

Checklist for MinIO:
- Create bucket and credentials in MinIO.
- Insert/update `infra_file_config` with S3 config; set master.
- If private, set `enablePublicAccess=false`; clients will get presigned GET URLs with default 24h expiration.
- If using a custom Nginx domain, set `domain` and path-style to match your routing.

## Building a New Module

This section describes how to create a module that cleanly integrates into the system.

1) Module scaffold
- Create `yudao-module-foo` with standard packages: `controller`, `service`, `dal` (mysql mappers + DO), `convert`, `enums`, `framework` (module-specific config), and `api` (optional for cross-module APIs).
- Add a `pom.xml` that depends on necessary `yudao-framework` starters: at minimum `starter-web`, `starter-security`, `starter-mybatis`, `starter-redis`. Add `starter-mq`, `starter-websocket`, `starter-biz-tenant`, `starter-job` as needed.

2) Wire into application
- Ensure `yudao-server/pom.xml` depends on `yudao-module-foo`.
- `YudaoServerApplication` already scans `${yudao.info.base-package}.module` so new module beans are discovered automatically.

3) Database & MyBatis
- Create DOs under `dal/dataobject/...` and Mappers under `dal/mysql/...` extending `BaseMapperX`.
- Add SQL DDL to `sql/<db>/create_tables.sql` or your migration tool; add seed data if needed.
- If the module has tenant-specific tables, extend `TenantBaseDO` and verify tenant interceptors apply.

4) Security & Permissions
- Controllers expose endpoints; secure with `@PreAuthorize("@ss.hasPermission('foo:entity:action')")`.
- Create dictionary/menu entries for permissions and menus to expose in the admin UI.

5) DTO/VO and Convert
- Define request/response VOs for controllers, and use MapStruct converters in `convert` package.
- Follow naming conventions: `SaveReqVO`, `UpdateReqVO`, `PageReqVO`, `RespVO`.

6) Transactions, Validation, Errors
- Use `@Transactional` in service methods that modify multiple aggregates.
- Use `@Valid` on controller inputs; put `@NotNull` etc. on VOs.
- Define module-scoped `ErrorCodeConstants` and throw `ServiceException` with codes.

7) Jobs & MQ (optional)
- Jobs: implement `JobHandler#execute` and annotate business methods with `@TenantJob` if per-tenant.
- MQ: define message classes and listeners using `starter-mq` Redis Streams or RabbitMQ; apply tenant interceptors.

8) File storage (optional)
- Reuse Infra’s file service: call `FileConfigService` and `FileClient` to store files; do not write storage-specific code.

9) WebSocket (optional)
- Use `starter-websocket` sender abstraction; security handshake uses login token.

10) Code generation (recommended)
- Use Infra’s code generator to bootstrap CRUD scaffolding for your module (Java + Vue + SQL). Adjust generated files to module naming.

11) Tests
- Follow existing test patterns; use `starter-test` base; test Service and Mapper layers. Keep tests deterministic.

New Module Checklist
- Module structure and POM are in place.
- SQL schema created; DO/Mapper done; basic CRUD services passing.
- Controllers secure with permissions; menus/dicts seeded.
- Tenant/data-permission verified if applicable.
- Logging/operate logs appear in admin.
- Optional: MQ consumers/producers, Jobs scheduled, File storage integrated, WebSocket messaging working.

## Architecture Improvements (Recommendations)

- Strengthen module boundaries
  - Continue using API submodules (e.g., `yudao-module-trade-api`) for cross-module contracts. Avoid DO/Mapper references across modules; use DTOs via API modules to reduce coupling.

- Events and integration contracts
  - Standardize domain events across modules using a common naming/versioning convention; provide an internal event catalog. Enforce tenant metadata propagation; add dead-letter handling and idempotency keys for critical flows (pay/refund/order/bpm tasks).

- Observability
  - Add centralized tracing (OpenTelemetry) and structured logs with correlation IDs across HTTP, MQ, and jobs. Provide dashboards for slow SQL, job failures, and MQ lag.

- Validation and error consistency
  - Keep error code enums per module but document shared style; ensure consistent HTTP statuses, i18n error messages, and client-friendly codes.

- Caching and performance
  - Document cache keys and eviction strategies per aggregate. Consider second-level caches for heavy reads (product, dicts, menus). Add request-level caching for read-only pages.

- Security hardening
  - Rate limit sensitive endpoints; add IP allow/deny lists using `starter-protection`; enforce password/2FA policies; validate file uploads with MIME checks and size limits.

- Data permission clarity
  - Document data scope rules and provide test coverage for each scope type; surface effective data scope in admin UI to reduce confusion.

- Codegen UX
  - Offer presets/templates per module type (CRUD only vs. aggregate with children vs. workflow-bound), and compose front templates (Vue3 variants) consistently.

## Appendix: Directory Landmarks

- App entry: `yudao-server/src/main/java/cn/iocoder/yudao/server/YudaoServerApplication.java`.
- Framework starters: `yudao-framework/*` for security, web, mq, mybatis, redis, tenant, websocket, job.
- File S3 client: `yudao-module-infra/src/main/java/.../file/core/client/s3/S3FileClient.java` and `S3FileClientConfig.java`.
- Codegen engine: `yudao-module-infra/src/main/java/.../service/codegen/inner/CodegenEngine.java`.
- Pay DOs and controllers: `yudao-module-pay/src/main/java/...`.
- BPM Flowable adapters: `yudao-module-bpm/src/main/java/...`.
- Mall submodules: `yudao-module-mall/*` (product, trade, promotion, statistics).
- IoT gateway: `yudao-module-iot/yudao-module-iot-gateway/src/main/java/...`.

---

Maintenance note: keep this SPEC updated when adding modules, changing cross-cutting flows, or introducing new integrations (e.g., new S3 vendors, MQ types, or auth providers).

