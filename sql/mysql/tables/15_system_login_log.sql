DROP TABLE IF EXISTS `system_login_log`;
CREATE TABLE `system_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Access ID',
  `log_type` bigint NOT NULL COMMENT 'Log type',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Trace ID',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT 'User ID',
  `user_type` tinyint NOT NULL DEFAULT 0 COMMENT 'User type',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'User account',
  `result` tinyint NOT NULL COMMENT 'Login result',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'User IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Browser UA',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Creator',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Updater',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Is deleted',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT 'Tenant ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4021 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'System access record';
