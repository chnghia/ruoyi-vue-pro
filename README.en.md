<p align="center">
 <img src="https://img.shields.io/badge/Spring%20Boot-2.7.18-blue.svg" alt="Downloads">
 <img src="https://img.shields.io/badge/Vue-3.2-blue.svg" alt="Downloads">
 <img src="https://img.shields.io/github/license/YunaiV/ruoyi-vue-pro"/>
</p>

**Serious Statement: There will be no commercial version now or in the future, all code is open source!**

**"I love writing code, tirelessly"**
**"I love open source, it brings me joy"**

I, a dog, work hard in Shanghai, diligently coding at a top 3 tech company morning, noon, and night, and contributing to open source in the evenings.

If this project has been helpful to you, please remember to Star and follow it. This would be a great encouragement and support for me.

## 🐶 Newbie Must-Read

* Demo Address [Vue3 + element-plus]: <http://dashboard-vue3.yudao.iocoder.cn>
* Demo Address [Vue3 + vben(ant-design-vue)]: <http://dashboard-vben.yudao.iocoder.cn>
* Demo Address [Vue2 + element-ui]: <http://dashboard.yudao.iocoder.cn>
* Getting Started Documentation: <https://doc.iocoder.cn/quick-start/>
* Video Tutorials: <https://doc.iocoder.cn/video/>

## 🐰 Version Description

| Version | JDK 8 + Spring Boot 2.7 | JDK 17/21 + Spring Boot 3.2 |
|---|---|---|
| [Full Version] [ruoyi-vue-pro](https://gitee.com/zhijiantianya/ruoyi-vue-pro) | [`master`](https://gitee.com/zhijiantianya/ruoyi-vue-pro/tree/master/) branch | `master-jdk17` branch |
| [Lite Version] yudao-boot-mini | `master` branch | `master-jdk17` branch |

* [Full Version]: Includes system functions, infrastructure, member center, data reports, workflow, e-commerce system, WeChat official account, CRM, ERP, and other features.
* [Lite Version]: Only includes system functions and infrastructure features, excluding member center, data reports, workflow, e-commerce system, WeChat official account, CRM, ERP, and other features.

Refer to the Migration Document. It only takes 5-10 minutes to migrate the [Full Version] to the [Lite Version] as needed.

## 🐯 Platform Introduction

**Yudao**, centered on developers, aims to build China's first-class rapid development platform, fully open source, 100% free for individuals and enterprises to use.

> If you have any questions or desired features, you can submit them to Nian Nian in _Issues_.
>
> 😜 Please give the project a Star, it's really important to us!

!Architecture Diagram

* Java Backend: `master` branch for JDK 8 + Spring Boot 2.7, `master-jdk17` branch for JDK 17/21 + Spring Boot 3.2
* Admin Backend (PC): Vue3 offers `element-plus` and `vben(ant-design-vue)` versions; Vue2 offers `element-ui` version.
* Admin Backend (Mobile): Uses `uni-app` solution, one codebase adapts to multiple terminals, supporting APP, mini-programs, and H5!
* Backend uses Spring Boot multi-module architecture, MySQL + MyBatis Plus, Redis + Redisson.
* Databases can include MySQL, Oracle, PostgreSQL, SQL Server, MariaDB, domestic Dameng DM, TiDB, etc.
* Message queues can include Event, Redis, RabbitMQ, Kafka, RocketMQ, etc.
* Permission authentication uses Spring Security & Token & Redis, supporting multi-terminal, multi-user authentication systems, and SSO single sign-on.
* Supports loading dynamic permission menus, button-level permission control, and Redis caching for performance improvement.
* Supports SaaS multi-tenancy, allowing custom permissions for each tenant and providing transparent multi-tenancy encapsulation.
* Workflow uses Flowable, supporting dynamic forms, online process design, counter-signing/or-signing, and various task assignment methods.
* High-efficiency development, using a code generator to generate Java, Vue front-end and back-end code, SQL scripts, and API documentation with one click, supporting single tables, tree tables, and master-detail tables.
* Real-time communication, implemented with Spring WebSocket, built-in Token identity verification, supporting WebSocket clusters.
* Integrates WeChat mini-program, WeChat official account, WeChat Enterprise, DingTalk, and other third-party logins; integrates Alipay, WeChat, and other payment and refund services.
* Integrates Alibaba Cloud, Tencent Cloud, and other SMS channels; integrates MinIO, Alibaba Cloud, Tencent Cloud, Qiniu Cloud, and other cloud storage services.
* Integrates report designer, large screen designer, allowing drag-and-drop to generate cool reports and large screens.

## 🐳 Project Relationships

!Architecture Evolution

For a comparison of features across the three projects, refer to the Comparison of Domestic Open Source Projects table compiled by the community.

### Backend Projects

| Project | Star | Description |
|---|---|---|
| ruoyi-vue-pro | [!Gitee star](https://gitee.com/zhijiantianya/ruoyi-vue-pro) [!GitHub stars](https://github.com/YunaiV/ruoyi-vue-pro) | Based on Spring Boot multi-module architecture |
| yudao-cloud | [!Gitee star](https://gitee.com/zhijiantianya/yudao-cloud) [!GitHub stars](https://github.com/YunaiV/yudao-cloud) | Based on Spring Cloud microservice architecture |
| Spring-Boot-Labs | [!Gitee star](https://gitee.com/zhijiantianya/yudao-cloud) [!GitHub stars](https://github.com/yudaocode/SpringBoot-Labs) | Column for learning Spring Boot & Cloud |

### Frontend Projects

| Project | Star | Description |
|---|---|---|
| yudao-ui-admin-vue3 | [!Gitee star](https://gitee.com/yudaocode/yudao-ui-admin-vue3) [!GitHub stars](https://github.com/yudaocode/yudao-ui-admin-vue3) | Admin backend based on Vue3 + element-plus |
| yudao-ui-admin-vben | [!Gitee star](https://gitee.com/yudaocode/yudao-ui-admin-vben) [!GitHub stars](https://github.com/yudaocode/yudao-ui-admin-vben) | Admin backend based on Vue3 + vben(ant-design-vue) |
| yudao-mall-uniapp | [!Gitee star](https://gitee.com/yudaocode/yudao-mall-uniapp) [!GitHub stars](https://github.com/yudaocode/yudao-mall-uniapp) | E-commerce mini-program based on uni-app |
| yudao-ui-admin-vue2 | [!Gitee star](https://gitee.com/yudaocode/yudao-ui-admin-vue2) [!GitHub stars](https://github.com/yudaocode/yudao-ui-admin-vue2) | Admin backend based on Vue2 + element-ui |
| yudao-ui-admin-uniapp | [!Gitee star](https://gitee.com/yudaocode/yudao-ui-admin-uniapp) [!GitHub stars](https://github.com/yudaocode/yudao-ui-admin-uniapp) | Admin backend based on Vue2 + element-ui |
| yudao-ui-go-view | [!Gitee star](https://gitee.com/yudaocode/yudao-ui-go-view) [!GitHub stars](https://github.com/yudaocode/yudao-ui-go-view) | Large screen report based on Vue3 + naive-ui |

## 😎 Open Source License

**Why recommend using this project?**

① This project adopts the MIT License open-source protocol, which is more permissive than Apache 2.0. Individuals and enterprises can use it 100% free of charge, without needing to retain class author or Copyright information.

② All code is open source, unlike other projects that only open source part of the code, preventing you from understanding the entire project's architectural design. Comparison of Domestic Open Source Projects

!Open Source Project Comparison

③ Clean code, clean architecture, adhering to the "Alibaba Java Development Manual" specifications, with detailed code comments: 113,770 lines of Java code, 42,462 lines of code comments.

## 🤝 Project Outsourcing

We also undertake outsourcing projects. If you have a project you'd like to outsource, you can contact us on WeChat: **Aix9975**.

Our team includes professional project managers, architects, front-end engineers, back-end engineers, test engineers, and operations engineers, capable of providing full-process outsourcing services.

Projects can include e-commerce, SCRM systems, OA systems, logistics systems, ERP systems, CMS systems, HIS systems, payment systems, IM chat, WeChat official accounts, WeChat mini-programs, and more.

## 🐼 Built-in Features

The system includes various business functions, which can be used to quickly build your business system:

!Feature Layers

* General Modules (Required): System Functions, Infrastructure
* General Modules (Optional): Workflow, Payment System, Data Reports, Member Center
* Business Systems (On-demand): ERP System, CRM System, E-commerce System, WeChat Official Account, AI Large Model

> Friendly reminder: This project is based on RuoYi-Vue, with **refactored and optimized** backend code and **beautified** frontend interface.
>
> * Newly added features are marked with 🚀.
> * Re-implemented features are marked with ⭐️.

🙂 All functions are guaranteed high quality through **unit tests**.

### System Functions

| | Feature | Description |
|---|---|---|
| | User Management | Users are system operators; this function primarily configures system users. |
| ⭐️ | Online Users | Monitors the status of active users in the current system, supports manual forced logout. |
| | Role Management | Role menu permission assignment, setting data scope permissions for roles by organization. |
| | Menu Management | Configures system menus, operation permissions, button permission identifiers, etc., with local caching for performance. |
| | Department Management | Configures system organizational structure (company, department, team), tree structure display supports data permissions. |
| | Post Management | Configures the positions held by system users. |
| 🚀 | Tenant Management | Configures system tenants, supports multi-tenancy features in SaaS scenarios. |
| 🚀 | Tenant Package | Configures tenant packages, customizing menu, operation, and button permissions for each tenant. |
| | Dictionary Management | Maintains some frequently used and relatively fixed data in the system. |
| 🚀 | SMS Management | SMS channels, SMS templates, SMS logs, integrated with mainstream SMS platforms like Alibaba Cloud and Tencent Cloud. |
| 🚀 | Email Management | Email accounts, email templates, email sending logs, supports all email platforms. |
| 🚀 | In-site Message | System internal message notifications, providing in-site message templates and messages. |
| 🚀 | Operation Log | Records and queries system normal operation logs, integrates Swagger to generate log content. |
| ⭐️ | Login Log | Records and queries system login logs, including login exceptions. |
| 🚀 | Error Code Management | Manages all error codes in the system, allows online modification of error messages without restarting services. |
| | Notification Announcement | Publishes and maintains system notification announcements. |
| 🚀 | Sensitive Words | Configures system sensitive words, supports tag grouping. |
| 🚀 | Application Management | Manages SSO single sign-on applications, supports various OAuth2 authorization methods. |
| 🚀 | Area Management | Displays province, city, district, and town information, supports IP to city mapping. |

!Feature Diagram

### Workflow

!Feature Diagram

Built on Flowable, it supports domestic (Chinese) databases and meets the unique workflow operations of China:

| BPMN Designer | DingTalk/Feishu Designer |
|---|---|
| ! | ! |

> After production verification by leading enterprises, workflow engines must be equipped with both DingTalk/Feishu-like and BPMN designers!
>
> The former supports lightweight configuration of simple processes, while the latter enables deep orchestration for complex scenarios.

| Feature List | Description | Status |
|---|---|---|
| SIMPLE Designer | DingTalk/Feishu-like designer, supports drag-and-drop form building for processes, 10-minute quick approval process configuration. | ✅ |
| BPMN Designer | Developed based on BPMN standard, adapts to complex business scenarios, meets multi-level approval and process automation requirements. | ✅ |
| Counter-signing | Sets multiple people for the same approval node (e.g., A, B, C; all three receive pending tasks simultaneously). Approval proceeds to the next node only after all agree. | ✅ |
| Or-signing | Sets multiple people for the same approval node; approval proceeds to the next node after any one person processes it. | ✅ |
| Sequential Approval | (Sequential counter-signing) Sets multiple people for the same approval node (e.g., A, B, C). They receive pending tasks sequentially (A approves first, then B after A submits). Approval proceeds to the next node only after all agree. | ✅ |
| Carbon Copy | Notifies CC recipients of approval results. Duplicate CCs are removed by default, not sending to the same person repeatedly. | ✅ |
| Rejection | (Rollback) Resets approval to a specific node for re-approval. Can reject to initiator, previous node, or any node. | ✅ |
| Transfer | A transfers to B for approval. After B approves, it proceeds to the next node. | ✅ |
| Delegation | A delegates to B for approval. After B approves, it returns to A. A continues approval, then proceeds to the next node. | ✅ |
| Add Signatories | Allows current approver to add more approvers to the current node as needed, supporting adding before or after. | ✅ |
| Remove Signatories | (Cancel added signatories) Reduces the number of approvers before the current approver takes action. | ✅ |
| Revocation | (Cancel process) Process initiator can revoke the process. | ✅ |
| Termination | System administrator can terminate process instances at any node. | ✅ |
| Form Permissions | Supports drag-and-drop form configuration, each approval node can be configured with read-only, edit, or hidden permissions. | ✅ |
| Timeout Approval | Configures timeout approval time. After timeout, approval automatically passes, fails, or rejects. | ✅ |
| Automatic Reminders | Configures reminder times. When time is reached, automatically triggers SMS, email, in-site message notifications, supports custom repeat reminder frequencies. | ✅ |
| Parent-Child Processes | Main process sets sub-process nodes. Sub-process nodes automatically trigger sub-processes. After sub-process completion, the main process continues (synchronous or asynchronous sub-processes supported). | ✅ |
| Conditional Branch | (Exclusive branch) Used to implement decisions in a process, executing one branch based on conditions. | ✅ |
| Parallel Branch | Allows splitting a process into multiple branches without conditional judgment; all branches execute. | ✅ |
| Inclusive Branch | (Combination of conditional and parallel branches) Allows selecting multiple branches based on conditions. If no branch meets conditions, a default branch can be chosen. | ✅ |
| Route Branch | Selects one branch to execute based on conditions (redirects to a specified configured node), or can choose to execute a default branch (continues downward). | ✅ |
| Trigger Node | When this node is reached, triggers HTTP requests, HTTP callbacks, data updates, data deletions, etc. | ✅ |
| Delay Node | When this node is reached, approval waits for a period before executing, supporting fixed duration or fixed date. | ✅ |
| Extension Settings | Pre/post-process notifications, pre/post-node (task) notifications, process reports, automatic approval de-duplication, custom process numbers, titles, summaries, process reports, etc. | ✅ |

### Payment System

| | Feature | Description |
|---|---|---|
| 🚀 | Application Info | Configures merchant application information, integrates with multiple payment channels like Alipay and WeChat. |
| 🚀 | Payment Orders | Views Alipay, WeChat, and other payment orders initiated by users. |
| 🚀 | Refund Orders | Views Alipay, WeChat, and other refund orders initiated by users. |
| 🚀 | Callback Notifications | Views payment callback business's payment and refund notification results. |
| 🚀 | Integration Examples | Provides practical examples of integrating payment system's payment and refund functions. |

### Infrastructure

| | Feature | Description |
|---|---|---|
| 🚀 | Code Generation | Generates front-end and back-end code (Java, Vue, SQL, unit tests), supports CRUD download. |
| 🚀 | System API | Automatically generates RESTful API interface documentation based on Swagger. |
| 🚀 | Database Document | Automatically generates database documentation based on Screw, supports exporting Word, HTML, MD formats. |
| | Form Builder | Drag-and-drop form elements to generate corresponding HTML code, supports exporting JSON, Vue files. |
| 🚀 | Configuration Management | Configures common parameters for dynamic system configuration, supports SpringBoot loading. |
| ⭐️ | Scheduled Tasks | Online (add, modify, delete) task scheduling including execution result logs. |
| 🚀 | File Service | Supports storing files to S3 (MinIO, Alibaba Cloud, Tencent Cloud, Qiniu Cloud), local, FTP, database, etc. |
| 🚀 | WebSocket | Provides WebSocket integration examples, supports one-to-one and one-to-many sending methods. |
| 🚀 | API Log | Includes RESTful API access logs and exception logs, convenient for troubleshooting API-related issues. |
| | MySQL Monitoring | Monitors the status of the current system's database connection pool, can analyze SQL to find system performance bottlenecks. |
| | Redis Monitoring | Monitors Redis database usage, manages Redis Keys. |
| 🚀 | Message Queue | Implements message queue based on Redis, Stream provides cluster consumption, Pub/Sub provides broadcast consumption. |
| 🚀 | Java Monitoring | Implements Java application monitoring based on Spring Boot Admin. |
| 🚀 | Distributed Tracing | Integrates SkyWalking component to achieve distributed tracing. |
| 🚀 | Log Center | Integrates SkyWalking component to achieve log center. |
| 🚀 | Service Assurance | Implements distributed locks, idempotency, and rate limiting based on Redis, meeting high-concurrency scenarios. |
| 🚀 | Log Service | Lightweight log center, views remote server logs. |
| 🚀 | Unit Testing | Implements unit testing based on JUnit + Mockito, ensuring functional correctness and code quality. |

!Feature Diagram

### Data Reports

| | Feature | Description |
|---|---|---|
| 🚀 | Report Designer | Supports data reports, graphical reports, print design, etc. |
| 🚀 | Large Screen Designer | Drag-and-drop to generate data large screens, built-in dozens of chart components. |

### WeChat Official Account

| | Feature | Description |
|---|---|---|
| 🚀 | Account Management | Configures integrated WeChat official accounts, supports multiple official accounts. |
| 🚀 | Data Statistics | Statistics on user growth, cumulative users, message overview, interface analysis, and other data for official accounts. |
| 🚀 | Fan Management | Views lists of followed and unfollowed fans, supports syncing and tagging fans. |
| 🚀 | Message Management | Views fan messages, can actively reply to fan messages. |
| 🚀 | Auto-reply | Automatically replies to fan messages, supports follow-up replies, message replies, and keyword replies. |
| 🚀 | Tag Management | Creates, queries, modifies, and deletes tags for official accounts. |
| 🚀 | Menu Management | Customizes official account menus, can also sync menus from the official account. |
| 🚀 | Material Management | Manages official account images, audio, video, and other materials, supports online playback of audio and video. |
| 🚀 | Graphic Draft Box | Adds commonly used graphic materials to the draft box, can be published to the official account. |
| 🚀 | Graphic Publication Records | Views successfully published graphic materials, supports deletion. |

### E-commerce System

Demo Address: <https://doc.iocoder.cn/mall-preview/>

!Feature Diagram

!Feature Diagram

### Member Center

| | Feature | Description |
|---|---|---|
| 🚀 | Member Management | Members are C-end consumers; this function is used for member search and management. |
| 🚀 | Member Tags | Creates, queries, modifies, and deletes member tags. |
| 🚀 | Member Levels | Manages member levels and growth values, can be used for member benefits like order discounts. |
| 🚀 | Member Grouping | Groups members for user profiling, content push, and other operational strategies. |
| 🚀 | Points Check-in | Rewards points for check-ins, consumption, etc. Members can use points for order deductions, point redemption, etc. |

### ERP System

Demo Address: <https://doc.iocoder.cn/erp-preview/>

!Feature Diagram

### CRM System

Demo Address: <https://doc.iocoder.cn/crm-preview/>

!Feature Diagram

### AI Large Model

Demo Address: <https://doc.iocoder.cn/ai-preview/>

!Feature Diagram

!Feature Diagram

## 🐨 Technology Stack

### Modules

| Project | Description |
|---|---|
| `yudao-dependencies` | Maven dependency version management |
| `yudao-framework` | Java framework extension |
| `yudao-server` | Admin backend + User APP server |
| `yudao-module-system` | System functions Module |
| `yudao-module-member` | Member center Module |
| `yudao-module-infra` | Infrastructure Module |
| `yudao-module-bpm` | Workflow Module |
| `yudao-module-pay` | Payment system Module |
| `yudao-module-mall` | E-commerce system Module |
| `yudao-module-erp` | ERP system Module |
| `yudao-module-crm` | CRM system Module |
| `yudao-module-ai` | AI Large Model Module |
| `yudao-module-mp` | WeChat Official Account Module |
| `yudao-module-report` | Large screen report Module |

### Frameworks

| Framework | Description | Version | Learning Guide |
|---|---|---|---|
| Spring Boot | Application development framework | 2.7.18 | Docs |
| MySQL | Database server | 5.7 / 8.0+ | |
| Druid | JDBC connection pool, monitoring component | 1.2.23 | Docs |
| MyBatis Plus | MyBatis enhancement toolkit | 3.5.7 | Docs |
| Dynamic Datasource | Dynamic data source | 3.6.1 | Docs |
| Redis | key-value database | 5.0 / 6.0 /7.0 | |
| Redisson | Redis client | 3.32.0 | Docs |
| Spring MVC | MVC framework | 5.3.24 | Docs |
| Spring Security | Spring security framework | 5.7.11 | Docs |
| Hibernate Validator | Parameter validation component | 6.2.5 | Docs |
| Flowable | Workflow engine | 6.8.0 | Docs |
| Quartz | Task scheduling component | 2.3.2 | Docs |
| Springdoc | Swagger documentation | 1.7.0 | Docs |
| SkyWalking | Distributed application tracing system | 8.12.0 | Docs |
| Spring Boot Admin | Spring Boot monitoring platform | 2.7.10 | Docs |
| Jackson | JSON utility library | 2.13.5 | |
| MapStruct | Java Bean conversion | 1.6.3 | Docs |
| Lombok | Eliminates verbose Java code | 1.18.34 | Docs |
| JUnit | Java unit testing framework | 5.8.2 | - |
| Mockito | Java Mock framework | 4.8.0 | - |

## 🐷 Demo Images

### System Functions

| Module | biu | biu | biu |
|---|---|---|---|
| Login & Homepage | !Login | !Homepage | !Personal Center |
| Users & Applications | !User Management | !Token Management | !Application Management |
| Tenants & Packages | !Tenant Management | !Tenant Package | - |
| Departments & Posts | !Department Management | !Post Management | - |
| Menus & Roles | !Menu Management | !Role Management | - |
| Audit Logs | !Operation Log | !Login Log | - |
| SMS | !SMS Channel | !SMS Template | !SMS Log |
| Dictionary & Sensitive Words | !Dictionary Type | !Dictionary Data | !Sensitive Words |
| Error Codes & Notifications | !Error Code Management | !Notification Announcement | - |

### Workflow

| Module | biu | biu | biu |
|---|---|---|---|
| Process Model | !Process Model - List | !Process Model - Design | !Process Model - Definition |
| Forms & Groups | !Process Form | !User Group | - |
| My Processes | !My Processes - List | !My Processes - Initiate | !My Processes - Details |
| To-do & Done | !Task List - Approval | !Task List - To-do | !Task List - Done |
| OA Leave | !OA Leave - List | !OA Leave - Initiate | !OA Leave - Details |

### Infrastructure

| Module | biu | biu | biu |
|---|---|---|---|
| Code Generation | !Code Generation | !Generation Effect | - |
| Documentation | !System API | !Database Document | - |
| Files & Configuration | !File Configuration | !File Management | !Configuration Management |
| Scheduled Tasks | !Scheduled Tasks | !Task Log | - |
| API Logs | !Access Log | !Error Log | - |
| MySQL & Redis | !MySQL | !Redis | - |
| Monitoring Platform | !Java Monitoring | !Distributed Tracing | !Log Center |

### Payment System

| Module | biu | biu | biu |
|---|---|---|---|
| Merchant & Application | !Merchant Info | !Application Info - List | !Application Info - Edit |
| Payment & Refund | !Payment Order | !Refund Order | --- |

### Data Reports

| Module | biu | biu | biu |
|---|---|---|---|
| Report Designer | !Data Report | !Graphical Report | !Report Designer - Print Design |
| Large Screen Designer | !Large Screen List | !Large Screen Preview | !Large Screen Edit |

### Mobile (Admin Backend)

| biu | biu | biu |
|---|---|---|
| ! | ! | ! |
| ! | ! | ! |
| ! | ! | ! |

Currently, basic functions such as login, "My", workbench, edit profile, avatar modification, password modification, common problems, and about us have been implemented.