DROP TABLE IF EXISTS `infra_job`;
CREATE TABLE `infra_job`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `status` tinyint NOT NULL COMMENT '任务状态',
  `handler_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '处理器的名字',
  `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处理器的参数',
  `cron_expression` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'CRON 表达式',
  `retry_count` int NOT NULL DEFAULT 0 COMMENT '重试次数',
  `retry_interval` int NOT NULL DEFAULT 0 COMMENT '重试间隔',
  `monitor_timeout` int NOT NULL DEFAULT 0 COMMENT '监控超时时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务表';

-- ----------------------------
-- Records of infra_job
-- ----------------------------
BEGIN;
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5, '支付通知 Job', 2, 'payNotifyJob', NULL, '* * * * * ?', 0, 0, 0, '1', '2021-10-27 08:34:42', '1', '2024-09-12 13:32:48', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (17, '支付订单同步 Job', 2, 'payOrderSyncJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-22 14:36:26', '1', '2023-07-22 15:39:08', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (18, '支付订单过期 Job', 2, 'payOrderExpireJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-22 15:36:23', '1', '2023-07-22 15:39:54', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (19, '退款订单的同步 Job', 2, 'payRefundSyncJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-23 21:03:44', '1', '2023-07-23 21:09:00', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (21, '交易订单的自动过期 Job', 2, 'tradeOrderAutoCancelJob', '', '0 * * * * ?', 3, 0, 0, '1', '2023-09-25 23:43:26', '1', '2023-09-26 19:23:30', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (22, '交易订单的自动收货 Job', 2, 'tradeOrderAutoReceiveJob', '', '0 * * * * ?', 3, 0, 0, '1', '2023-09-26 19:23:53', '1', '2023-09-26 23:38:08', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (23, '交易订单的自动评论 Job', 2, 'tradeOrderAutoCommentJob', '', '0 * * * * ?', 3, 0, 0, '1', '2023-09-26 23:38:29', '1', '2023-09-27 11:03:10', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (24, '佣金解冻 Job', 2, 'brokerageRecordUnfreezeJob', '', '0 * * * * ?', 3, 0, 0, '1', '2023-09-28 22:01:46', '1', '2023-09-28 22:01:56', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (25, '访问日志清理 Job', 2, 'accessLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 10:59:41', '1', '2023-10-03 11:01:10', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (26, '错误日志清理 Job', 2, 'errorLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 11:00:43', '1', '2023-10-03 11:01:12', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (27, '任务日志清理 Job', 2, 'jobLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 11:01:33', '1', '2024-09-12 13:40:34', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (33, 'demoJob', 2, 'demoJob', '', '0 * * * * ?', 1, 1, 0, '1', '2024-10-27 19:38:46', '1', '2025-05-10 18:13:54', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (35, '转账订单的同步 Job', 2, 'payTransferSyncJob', '', '0 * * * * ?', 0, 0, 0, '1', '2025-05-10 17:35:54', '1', '2025-05-10 18:13:52', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (36, 'IoT 设备离线检查 Job', 2, 'iotDeviceOfflineCheckJob', '', '0 * * * * ?', 0, 0, 0, '1', '2025-07-03 23:48:44', '\"1\"', '2025-07-03 23:48:47', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (37, 'IoT OTA 升级推送 Job', 2, 'iotOtaUpgradeJob', '', '0 * * * * ?', 0, 0, 0, '1', '2025-07-03 23:49:07', '\"1\"', '2025-07-03 23:49:13', b'0');
COMMIT;