DROP TABLE IF EXISTS `system_mail_account`;
CREATE TABLE `system_mail_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'User name',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Password',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SMTP server domain name',
  `port` int NOT NULL COMMENT 'SMTP server port',
  `ssl_enable` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Is SSL enabled',
  `starttls_enable` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Is STARTTLS enabled',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Is deleted',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Email account table';

-- ----------------------------
-- Records of system_mail_account
-- ----------------------------
BEGIN;
INSERT INTO `system_mail_account` (`id`, `mail`, `username`, `password`, `host`, `port`, `ssl_enable`, `starttls_enable`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1, '7684413@qq.com', '7684413@qq.com', '1234576', '127.0.0.1', 8080, b'0', b'0', '1', '2023-01-25 17:39:52', '1', '2025-04-04 16:34:40', b'0');
INSERT INTO `system_mail_account` (`id`, `mail`, `username`, `password`, `host`, `port`, `ssl_enable`, `starttls_enable`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2, 'ydym_test@163.com', 'ydym_test@163.com', 'WBZTEINMIFVRYSOE', 'smtp.163.com', 465, b'1', b'0', '1', '2023-01-26 01:26:03', '1', '2025-07-26 21:57:55', b'0');
INSERT INTO `system_mail_account` (`id`, `mail`, `username`, `password`, `host`, `port`, `ssl_enable`, `starttls_enable`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3, '76854114@qq.com', '3335', '11234', 'yunai1.cn', 466, b'0', b'0', '1', '2023-01-27 15:06:38', '1', '2023-01-27 07:08:36', b'1');
INSERT INTO `system_mail_account` (`id`, `mail`, `username`, `password`, `host`, `port`, `ssl_enable`, `starttls_enable`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (4, '7685413x@qq.com', '2', '3', '4', 5, b'1', b'0', '1', '2023-04-12 23:05:06', '1', '2023-04-12 15:05:11', b'1');
COMMIT;
