CREATE TABLE IF NOT EXISTS `bpm_user_group` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(63) NOT NULL,
    `description` varchar(255) NOT NULL,
    `status` tinyint NOT NULL,
    `user_ids` text NOT NULL, /* Changed from varchar(255) to text */
    `creator` varchar(64) DEFAULT '',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater` varchar(64) DEFAULT '',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, /* Added ON UPDATE */
    `deleted` bit(1) NOT NULL DEFAULT b'0', /* Changed FALSE to b'0' */
    `tenant_id` bigint NOT NULL,
    PRIMARY KEY (`id`)
) COMMENT 'User Group'; /* Translated comment */

CREATE TABLE IF NOT EXISTS `bpm_category` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(63) NOT NULL,
    `code` varchar(63) NOT NULL,
    `description` varchar(255) NOT NULL,
    `status` tinyint NOT NULL,
    `sort` int NOT NULL,
    `creator` varchar(64) DEFAULT '',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater` varchar(64) DEFAULT '',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Thêm ON UPDATE nếu muốn tự động cập nhật
    `deleted` bit(1) NOT NULL DEFAULT b'0', -- Dùng b'0' cho giá trị bit
    `tenant_id` bigint NOT NULL,
    PRIMARY KEY (`id`)
) COMMENT '分类'; -- Chuyển sang tiếng Anh nếu cần: 'Category'

CREATE TABLE IF NOT EXISTS `bpm_form` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(63) NOT NULL,
    `status` tinyint NOT NULL,
    `fields` text NOT NULL, /* Changed from varchar(255) to text for potentially long JSON/data */
    `conf` text NOT NULL, /* Changed from varchar(255) to text */
    `remark` varchar(255),
    `creator` varchar(64) DEFAULT '',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater` varchar(64) DEFAULT '',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, /* Added ON UPDATE CURRENT_TIMESTAMP */
    `deleted` bit(1) NOT NULL DEFAULT b'0', /* Changed FALSE to b'0' */
    `tenant_id` bigint NOT NULL,
    PRIMARY KEY (`id`)
) COMMENT 'Dynamic Form'; /* Translated comment */