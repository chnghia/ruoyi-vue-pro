# Templates

This folder contains sample scaffolds that you can copy into the repo when creating new modules.

- `yudao-module-foo/`: minimal backend module skeleton demonstrating controller/service/dal/convert/enums/vo structure and a sample `pom.xml`.

How to use:
1) Copy `templates/yudao-module-foo` to the repository root and rename it to your module name (e.g., `yudao-module-foo` → `yudao-module-inventory`).
2) Replace package `cn.iocoder.yudao.module.foo` with your domain (e.g., `inventory`).
3) Add the module name to the `<modules>` section of root `pom.xml`.
4) Create database tables and seed menu/permission/dict entries.
5) Run and test.

