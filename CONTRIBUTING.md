# Contributing Guide

Thank you for contributing! This guide documents conventions and expectations for changes to this repository.

## Prerequisites
- Match the branch’s JDK + Spring Boot versions (see README.md: version matrix).
- Maven 3.9+, Node tooling only if you touch frontend subprojects.
- MySQL (or your DB) and Redis instances for local runs.

## Project Structure
- Multi-module Spring Boot backend. Entry: `yudao-server` scans `${yudao.info.base-package}.module`.
- Cross-cutting features live under `yudao-framework` starters (security, web, mybatis, mq, redis, tenant, websocket, quartz/job, excel, test, etc.).
- Business domains live in `yudao-module-*` modules (system, infra, bpm, pay, mall, mp, member, crm, erp, ai, iot, report).

## Coding Conventions
- Package naming: lowercase, `cn.iocoder.yudao.module.<domain>`.
- Layering: controller → service → dal (mysql mapper + DO). Use `convert` (MapStruct) for VO/DTO/DO mapping.
- Naming:
  - DO: `*DO`, Mapper: `*Mapper`, VO: `*ReqVO`/`*RespVO`, Convert: `*Convert`.
  - Permissions: `'module:entity:action'` (e.g., `foo:bar:create`).
  - Error codes: one `ErrorCodeConstants` per module with descriptive names.
- Validation: annotate VOs with `jakarta.validation` and enable `@Valid` in controllers.
- Transactions: put `@Transactional` on service methods that modify multiple aggregates.
- Exceptions: throw `ServiceException` via `ServiceExceptionUtil.exception(ErrorCode)`; let `GlobalExceptionHandler` translate to `CommonResult`.
- Multi-tenant: extend `TenantBaseDO` for tenant tables. Use `@TenantJob` for per-tenant jobs. Only use `@TenantIgnore` when strictly necessary.
- Data permission: rely on starter’s interceptors; don’t bypass without justification.
- File storage: use Infra’s `FileConfigService` and `FileClient` abstraction (S3/local/FTP/DB). Don’t call object stores directly.
- MQ: use `yudao-framework` MQ wrappers (Redis Streams/RabbitMQ/Kafka/RocketMQ) and tenant interceptors.
- WebSocket: use `starter-websocket` senders; handshake uses login token.
- Swagger: annotate controllers/VOs (`@Operation`, `@Schema`) for docs.

## Database
- DOs extend `BaseDO` or `TenantBaseDO`.
- Annotate with `@TableName` and for non-MySQL DBs add `@KeySequence`.
- Mappers extend `BaseMapperX<T>` and prefer `LambdaQueryWrapperX` for dynamic queries.
- Add DDL to `sql/<db>/ruoyi-vue-pro.sql` or your migration set; seed data if needed.

## Jobs
- Implement `JobHandler#execute(String)`; keep idempotent.
- Use `@TenantJob` for per-tenant fan-out execution.

## Code Generation
- Prefer using the built-in code generator in Infra to bootstrap CRUD (Java + Vue + SQL); then refine.
- Keep generated file locations and naming consistent with the module structure.

## Testing
- Use `yudao-spring-boot-starter-test`.
- Unit test service and mapper logic; mock external dependencies.
- For multi-tenant or MQ/Job code, add targeted tests to catch tenant propagation, idempotency, and retry behaviors.

## Security
- Protect admin endpoints with `@PreAuthorize` and proper permission keys.
- Validate file uploads (size, content type) and sanitize inputs (including search filters).
- Avoid embedding secrets in code; use environment variables/config.

## Submitting Changes
1) Keep PRs focused; one logical change/module enhancement per PR.
2) Update `SPEC.md` if the architecture or pipelines change, or a new module is added.
3) Include SQL changes and minimal docs for any new feature flags/permissions/menus.
4) Ensure builds and tests pass locally.
5) Follow Conventional Commits for messages (e.g., `feat(foo): add bar CRUD`).

## New Module Checklist
- Module scaffold created; added as a `<module>` in root `pom.xml`.
- Tables created; DO/Mapper/Service/Controller wired; permissions/menu seeded.
- Tenant + data-permission verified; logs and exceptions align with conventions.
- Optional: MQ consumers/producers, jobs, file storage, websockets integrated.
- Tests written; `SPEC.md` updated with pipeline notes.

