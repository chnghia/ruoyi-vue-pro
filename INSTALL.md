# Cài đặt & Build ruoyi-vue-pro

Tài liệu này hướng dẫn nhanh cách chuẩn bị môi trường, build và chạy backend. Các biến thể frontend không kèm mã nguồn đầy đủ trong repo này; phần cuối có hướng dẫn lấy và chạy UI.

## 1) Yêu cầu hệ thống

- JDK 17 (hoặc 21)
- Maven 3.8+ (repo không có `mvnw`)
- MySQL 8.x và Redis 6.x (mặc định profile `local` dùng hai dịch vụ này)
- Docker (tùy chọn, để khởi tạo MySQL nhanh bằng compose)

## 2) Chuẩn bị cơ sở dữ liệu và Redis

Mặc định cấu hình dùng profile `local` (đặt tại `yudao-server/src/main/resources/application.yaml`) và cổng API 48080 (xem `yudao-server/src/main/resources/application-local.yaml`).

### Cách A: Dùng Docker Compose để bật MySQL (khuyến nghị cho nhanh)

```bash
cd sql/tools
docker compose up -d mysql
```

- Dịch vụ MySQL sẽ lắng nghe `3306` và tự động import dữ liệu mẫu từ `sql/mysql/ruoyi-vue-pro.sql`. Lần đầu có thể mất 1–2 phút.
- Redis bạn có thể chạy riêng bằng Docker:

```bash
docker run -d --name redis -p 6379:6379 redis:6-alpine
```

### Cách B: Cài MySQL/Redis cục bộ và import thủ công

1) Tạo database và import:

```bash
mysql -uroot -p123456 -h127.0.0.1 -P3306 < sql/mysql/ruoyi-vue-pro.sql
```

2) Đảm bảo Redis chạy ở `127.0.0.1:6379`.

3) Kiểm tra/cập nhật thông số kết nối (nếu bạn không dùng cấu hình mặc định):

- JDBC URL: chỉnh tại `yudao-server/src/main/resources/application-local.yaml`
- Username/Password DB: chỉnh tại `yudao-server/src/main/resources/application-local.yaml`
- Redis host/port: chỉnh tại `yudao-server/src/main/resources/application-local.yaml`

## 3) Build Backend (Maven)

Build toàn bộ module đang bật (bỏ qua test cho nhanh):

```bash
mvn -DskipTests clean package
```

Chỉ build server và các phụ thuộc của nó:

```bash
mvn -pl yudao-server -am -DskipTests clean package
```

Kết quả jar sẽ ở: `yudao-server/target/yudao-server.jar`.

## 4) Chạy Backend

Profile mặc định là `local` (khai báo trong `yudao-server/src/main/resources/application.yaml`). Chạy:

```bash
java -jar yudao-server/target/yudao-server.jar
```

Hoặc chỉ định rõ profile:

```bash
java -jar -Dspring.profiles.active=local yudao-server/target/yudao-server.jar
```

Mặc định API chạy ở: http://localhost:48080

### Ghi chú: ghi đè cấu hình kết nối không cần sửa YAML

Bạn có thể truyền tham số Spring Boot khi chạy để đổi DB/Redis:

```bash
java -jar yudao-server/target/yudao-server.jar \
  --spring.datasource.dynamic.datasource.master.url="jdbc:mysql://127.0.0.1:3306/ruoyi-vue-pro?useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true&nullCatalogMeansCurrent=true" \
  --spring.datasource.dynamic.datasource.master.username=root \
  --spring.datasource.dynamic.datasource.master.password=123456 \
  --spring.data.redis.host=127.0.0.1 \
  --spring.data.redis.port=6379
```

## 5) Bật thêm module (BPM, CRM, ERP)

Mặc định để tăng tốc độ compile, một số module nâng cao bị comment trong `pom.xml` và phụ thuộc của `yudao-server` cũng bị comment. Để bật thêm tính năng:

- Bật module ở root aggregator:
  - Mở `pom.xml` và bỏ comment các dòng module bạn cần, ví dụ:
    - `pom.xml:19` — `<module>yudao-module-bpm</module>`
    - `pom.xml:24` — `<module>yudao-module-crm</module>`
    - `pom.xml:25` — `<module>yudao-module-erp</module>`

- Kéo module vào server (để REST API có hiệu lực):
  - Mở `yudao-server/pom.xml` và bỏ comment các dependency tương ứng, ví dụ:
    - `yudao-server/pom.xml:51` — `yudao-module-bpm`
    - `yudao-server/pom.xml:93` — `yudao-module-crm`
    - `yudao-server/pom.xml:100` — `yudao-module-erp`

- CSDL khi bật module:
  - CRM/ERP: các bảng dữ liệu nằm trong `sql/mysql/ruoyi-vue-pro.sql` nên không cần import thêm.
  - BPM (Flowable): cấu hình `application.yaml` đặt `flowable.database-schema-update: true` (`yudao-server/src/main/resources/application.yaml:44`), nên Flowable sẽ tự tạo bảng; hãy đảm bảo user DB có quyền DDL.
  - Quartz: cấu hình local dùng JDBC JobStore và `initialize-schema: NEVER` (`yudao-server/src/main/resources/application-local.yaml:116`), vì vậy bạn cần import thêm `sql/mysql/quartz.sql` cho MySQL (hoặc script tương ứng với DB khác) trước khi chạy.

- Build lại sau khi bật module:

```bash
mvn -DskipTests clean package
```

- Lưu ý: Bật nhiều module sẽ làm thời gian build tăng lên đáng kể.

## 5) Frontend (tùy chọn)

Thư mục `yudao-ui/*` trong repo này chỉ chứa README cho các biến thể UI (Vue3 element-plus, Vue3 vben, Vue2, uni-app...). Nếu cần giao diện quản trị, hãy lấy dự án UI tương ứng (ví dụ biến thể Vue3), sau đó:

```bash
npm install     # hoặc pnpm install / yarn
npm run dev     # chạy dev
npm run build   # build sản phẩm
```

Hãy cấu hình base API của UI trỏ về backend `http://localhost:48080` theo tài liệu của dự án UI bạn dùng (env hoặc config tương ứng).

Tài liệu khởi động nhanh chính thức (khuyến nghị đọc thêm): https://doc.iocoder.cn/quick-start/

## 6) Khởi tạo CSDL Quartz (nếu dùng JDBC JobStore)

- MySQL (cục bộ hoặc Docker):

```bash
mysql -uroot -p123456 -h127.0.0.1 -P3306 ruoyi-vue-pro < sql/mysql/quartz.sql
```

- PostgreSQL/Oracle/khác: dùng script trong `sql/<db>/quartz.sql` (nếu có), hoặc tham chiếu `sql/mysql/quartz.sql` để chuyển đổi.

## 7) Khắc phục sự cố (FAQ)

- JDK không đúng phiên bản: chạy `java -version` và đảm bảo là 17+.
- Không kết nối được DB/Redis: kiểm tra service đang chạy và cập nhật thông số trong `application-local.yaml` cho đúng host/user/password.
- Cổng 48080 bận: đổi `server.port` trong `yudao-server/src/main/resources/application-local.yaml`.
- Build chậm/lỗi test: thêm `-DskipTests` khi build Maven.
- Dùng Docker MySQL lần đầu: chờ 1–2 phút để nhập dữ liệu mẫu.

## 8) Ghi chú bảo mật

- File `yudao-server/src/main/resources/application.yaml` có các cấu hình cho dịch vụ AI/thứ ba ở trạng thái ví dụ. Khi chạy thật, vui lòng thay bằng khóa của bạn hoặc tắt các phần không dùng.
- Không commit khóa thật của bạn lên kho mã công khai.
