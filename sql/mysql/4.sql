





-- ----------------------------
-- Table structure for system_sms_channel
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_channel`;
CREATE TABLE `system_sms_channel`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `signature` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信签名',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道编码',
  `status` tinyint NOT NULL COMMENT '开启状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `api_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的账号',
  `api_secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 的秘钥',
  `callback_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信发送回调 URL',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信渠道';

-- ----------------------------
-- Records of system_sms_channel
-- ----------------------------
BEGIN;
INSERT INTO `system_sms_channel` (`id`, `signature`, `code`, `status`, `remark`, `api_key`, `api_secret`, `callback_url`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2, 'Ballcat', 'ALIYUN', 0, '你要改哦，只有我可以用！！！！', 'LTAI5tCnKso2uG3kJ5gRav88', 'fGJ5SNXL7P1NHNRmJ7DJaMJGPyE55C', NULL, '', '2021-03-31 11:53:10', '1', '2024-08-04 08:53:26', b'0');
INSERT INTO `system_sms_channel` (`id`, `signature`, `code`, `status`, `remark`, `api_key`, `api_secret`, `callback_url`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (4, '测试渠道', 'DEBUG_DING_TALK', 0, '123', '696b5d8ead48071237e4aa5861ff08dbadb2b4ded1c688a7b7c9afc615579859', 'SEC5c4e5ff888bc8a9923ae47f59e7ccd30af1f14d93c55b4e2c9cb094e35aeed67', NULL, '1', '2021-04-13 00:23:14', '1', '2022-03-27 20:29:49', b'0');
INSERT INTO `system_sms_channel` (`id`, `signature`, `code`, `status`, `remark`, `api_key`, `api_secret`, `callback_url`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (7, 'mock腾讯云', 'TENCENT', 0, '', '1 2', '2 3', '', '1', '2024-09-30 08:53:45', '1', '2024-09-30 08:55:01', b'0');
COMMIT;

-- ----------------------------
-- Table structure for system_sms_code
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_code`;
CREATE TABLE `system_sms_code`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证码',
  `create_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建 IP',
  `scene` tinyint NOT NULL COMMENT '发送场景',
  `today_index` tinyint NOT NULL COMMENT '今日发送的第几条',
  `used` tinyint NOT NULL COMMENT '是否使用',
  `used_time` datetime NULL DEFAULT NULL COMMENT '使用时间',
  `used_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '使用 IP',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_mobile`(`mobile` ASC) USING BTREE COMMENT '手机号'
) ENGINE = InnoDB AUTO_INCREMENT = 681 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '手机验证码';

-- ----------------------------
-- Records of system_sms_code
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_log`;
CREATE TABLE `system_sms_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `channel_id` bigint NOT NULL COMMENT '短信渠道编号',
  `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信渠道编码',
  `template_id` bigint NOT NULL COMMENT '模板编号',
  `template_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `template_type` tinyint NOT NULL COMMENT '短信类型',
  `template_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信内容',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信参数',
  `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的模板编号',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户编号',
  `user_type` tinyint NULL DEFAULT NULL COMMENT '用户类型',
  `send_status` tinyint NOT NULL DEFAULT 0 COMMENT '发送状态',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `api_send_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 发送结果的编码',
  `api_send_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 发送失败的提示',
  `api_request_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 发送返回的唯一请求 ID',
  `api_serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 发送返回的序号',
  `receive_status` tinyint NOT NULL DEFAULT 0 COMMENT '接收状态',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '接收时间',
  `api_receive_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'API 接收结果的编码',
  `api_receive_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'API 接收结果的说明',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1491 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信日志';

-- ----------------------------
-- Records of system_sms_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_template`;
CREATE TABLE `system_sms_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` tinyint NOT NULL COMMENT '模板类型',
  `status` tinyint NOT NULL COMMENT '开启状态',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板内容',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数数组',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的模板编号',
  `channel_id` bigint NOT NULL COMMENT '短信渠道编号',
  `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信渠道编码',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信模板';

-- ----------------------------
-- Records of system_sms_template
-- ----------------------------
BEGIN;
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2, 1, 0, 'test_01', '测试验证码短信', '正在进行登录操作{operation}，您的验证码是{code}', '[\"operation\",\"code\"]', '测试备注', '4383920', 4, 'DEBUG_DING_TALK', '', '2021-03-31 10:49:38', '1', '2024-08-18 11:57:18', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3, 1, 0, 'test_02', '公告通知', '您的验证码{code}，该验证码5分钟内有效，请勿泄漏于他人！', '[\"code\"]', NULL, 'SMS_207945135', 2, 'ALIYUN', '', '2021-03-31 11:56:30', '1', '2021-04-10 01:22:02', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6, 3, 0, 'test-01', '测试模板', '哈哈哈 {name}', '[\"name\"]', 'f哈哈哈', '4383920', 4, 'DEBUG_DING_TALK', '1', '2021-04-10 01:07:21', '1', '2024-08-18 11:57:07', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (7, 3, 0, 'test-04', '测试下', '老鸡{name}，牛逼{code}', '[\"name\",\"code\"]', '哈哈哈哈', 'suibian', 7, 'DEBUG_DING_TALK', '1', '2021-04-13 00:29:53', '1', '2024-09-30 00:56:24', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (8, 1, 0, 'user-sms-login', '前台用户短信登录', '您的验证码是{code}', '[\"code\"]', NULL, '4372216', 4, 'DEBUG_DING_TALK', '1', '2021-10-11 08:10:00', '1', '2024-08-18 11:57:06', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (9, 2, 0, 'bpm_task_assigned', '【工作流】任务被分配', '您收到了一条新的待办任务：{processInstanceName}-{taskName}，申请人：{startUserNickname}，处理链接：{detailUrl}', '[\"processInstanceName\",\"taskName\",\"startUserNickname\",\"detailUrl\"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2022-01-21 22:31:19', '1', '2022-01-22 00:03:36', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (10, 2, 0, 'bpm_process_instance_reject', '【工作流】流程被不通过', '您的流程被审批不通过：{processInstanceName}，原因：{reason}，查看链接：{detailUrl}', '[\"processInstanceName\",\"reason\",\"detailUrl\"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2022-01-22 00:03:31', '1', '2022-05-01 12:33:14', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (11, 2, 0, 'bpm_process_instance_approve', '【工作流】流程被通过', '您的流程被审批通过：{processInstanceName}，查看链接：{detailUrl}', '[\"processInstanceName\",\"detailUrl\"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2022-01-22 00:04:31', '1', '2022-03-27 20:32:21', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (12, 2, 0, 'demo', '演示模板', '我就是测试一下下', '[]', NULL, 'biubiubiu', 4, 'DEBUG_DING_TALK', '1', '2022-04-10 23:22:49', '1', '2024-08-18 11:57:04', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (14, 1, 0, 'user-update-mobile', '会员用户 - 修改手机', '您的验证码{code}，该验证码 5 分钟内有效，请勿泄漏于他人！', '[\"code\"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-08-19 11:34:04', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (15, 1, 0, 'user-update-password', '会员用户 - 修改密码', '您的验证码{code}，该验证码 5 分钟内有效，请勿泄漏于他人！', '[\"code\"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-08-19 11:34:18', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (16, 1, 0, 'user-reset-password', '会员用户 - 重置密码', '您的验证码{code}，该验证码 5 分钟内有效，请勿泄漏于他人！', '[\"code\"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-12-02 22:35:27', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (17, 2, 0, 'bpm_task_timeout', '【工作流】任务审批超时', '您收到了一条超时的待办任务：{processInstanceName}-{taskName}，处理链接：{detailUrl}', '[\"processInstanceName\",\"taskName\",\"detailUrl\"]', '', 'X', 4, 'DEBUG_DING_TALK', '1', '2024-08-16 21:59:15', '1', '2024-08-16 21:59:34', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (18, 1, 0, 'admin-reset-password', '后台用户 - 忘记密码', '您的验证码{code}，该验证码 5 分钟内有效，请勿泄漏于他人！', '[\"code\"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2025-03-16 14:19:34', '1', '2025-03-16 14:19:45', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (19, 1, 0, 'admin-sms-login', '后台用户短信登录', '您的验证码是{code}', '[\"code\"]', '', '4372216', 4, 'DEBUG_DING_TALK', '1', '2025-04-08 09:36:03', '1', '2025-04-08 09:36:17', b'0');
COMMIT;

-- ----------------------------
-- Table structure for system_social_client
-- ----------------------------
DROP TABLE IF EXISTS `system_social_client`;
CREATE TABLE `system_social_client`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `social_type` tinyint NOT NULL COMMENT '社交平台的类型',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端密钥',
  `agent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '代理编号',
  `status` tinyint NOT NULL COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社交客户端表';

-- ----------------------------
-- Records of system_social_client
-- ----------------------------
BEGIN;
INSERT INTO `system_social_client` (`id`, `name`, `social_type`, `user_type`, `client_id`, `client_secret`, `agent_id`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '钉钉', 20, 2, 'dingvrnreaje3yqvzhxg', 'i8E6iZyDvZj51JIb0tYsYfVQYOks9Cq1lgryEjFRqC79P3iJcrxEwT6Qk2QvLrLI', NULL, 0, '', '2023-10-18 11:21:18', '1', '2023-12-20 21:28:26', b'1', 1);
INSERT INTO `system_social_client` (`id`, `name`, `social_type`, `user_type`, `client_id`, `client_secret`, `agent_id`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, '钉钉（王土豆）', 20, 2, 'dingtsu9hpepjkbmthhw', 'FP_bnSq_HAHKCSncmJjw5hxhnzs6vaVDSZZn3egj6rdqTQ_hu5tQVJyLMpgCakdP', NULL, 0, '', '2023-10-18 11:21:18', '', '2023-12-20 21:28:26', b'1', 121);
INSERT INTO `system_social_client` (`id`, `name`, `social_type`, `user_type`, `client_id`, `client_secret`, `agent_id`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3, '微信公众号', 31, 1, 'wx5b23ba7a5589ecbb', '2a7b3b20c537e52e74afd395eb85f61f', NULL, 0, '', '2023-10-18 16:07:46', '1', '2023-12-20 21:28:23', b'1', 1);
INSERT INTO `system_social_client` (`id`, `name`, `social_type`, `user_type`, `client_id`, `client_secret`, `agent_id`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (43, '微信小程序', 34, 1, 'wx63c280fe3248a3e7', '6f270509224a7ae1296bbf1c8cb97aed', NULL, 0, '', '2023-10-19 13:37:41', '1', '2023-12-20 21:28:25', b'1', 1);
INSERT INTO `system_social_client` (`id`, `name`, `social_type`, `user_type`, `client_id`, `client_secret`, `agent_id`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (44, '1', 10, 1, '2', '3', NULL, 0, '1', '2025-04-06 20:36:28', '1', '2025-04-06 20:43:12', b'1', 1);
COMMIT;

-- ----------------------------
-- Table structure for system_social_user
-- ----------------------------
DROP TABLE IF EXISTS `system_social_user`;
CREATE TABLE `system_social_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键(自增策略)',
  `type` tinyint NOT NULL COMMENT '社交平台的类型',
  `openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '社交 openid',
  `token` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '社交 token',
  `raw_token_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始 Token 数据，一般是 JSON 格式',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `raw_user_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始用户数据，一般是 JSON 格式',
  `code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '最后一次的认证 code',
  `state` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后一次的认证 state',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社交用户表';

-- ----------------------------
-- Records of system_social_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_social_user_bind
-- ----------------------------
DROP TABLE IF EXISTS `system_social_user_bind`;
CREATE TABLE `system_social_user_bind`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键(自增策略)',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `social_type` tinyint NOT NULL COMMENT '社交平台的类型',
  `social_user_id` bigint NOT NULL COMMENT '社交用户的编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社交绑定表';

-- ----------------------------
-- Records of system_social_user_bind
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_tenant
-- ----------------------------
DROP TABLE IF EXISTS `system_tenant`;
CREATE TABLE `system_tenant`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '租户编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户名',
  `contact_user_id` bigint NULL DEFAULT NULL COMMENT '联系人的用户编号',
  `contact_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人',
  `contact_mobile` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系手机',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '租户状态',
  `websites` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '绑定域名数组',
  `package_id` bigint NOT NULL COMMENT '租户套餐编号',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `account_count` int NOT NULL COMMENT '账号数量',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 162 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '租户表';

-- ----------------------------
-- Records of system_tenant
-- ----------------------------
BEGIN;
INSERT INTO `system_tenant` (`id`, `name`, `contact_user_id`, `contact_name`, `contact_mobile`, `status`, `websites`, `package_id`, `expire_time`, `account_count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1, '芋道源码', NULL, '芋艿', '17321315478', 0, 'www.iocoder.cn,127.0.0.1:3000,wxc4598c446f8a9cb3', 0, '2099-02-19 17:14:16', 9999, '1', '2021-01-05 17:03:47', '1', '2025-08-19 05:18:41', b'0');
INSERT INTO `system_tenant` (`id`, `name`, `contact_user_id`, `contact_name`, `contact_mobile`, `status`, `websites`, `package_id`, `expire_time`, `account_count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (121, '小租户', 110, '小王2', '15601691300', 0, 'zsxq.iocoder.cn,123321', 111, '2026-07-10 00:00:00', 30, '1', '2022-02-22 00:56:14', '1', '2025-08-19 21:19:29', b'0');
INSERT INTO `system_tenant` (`id`, `name`, `contact_user_id`, `contact_name`, `contact_mobile`, `status`, `websites`, `package_id`, `expire_time`, `account_count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (122, '测试租户', 113, '芋道', '15601691300', 0, 'test.iocoder.cn', 111, '2022-04-29 00:00:00', 50, '1', '2022-03-07 21:37:58', '1', '2025-08-24 14:46:15', b'0');
COMMIT;

-- ----------------------------
-- Table structure for system_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS `system_tenant_package`;
CREATE TABLE `system_tenant_package`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '套餐编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '套餐名',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '租户状态（0正常 1停用）',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `menu_ids` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联的菜单编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '租户套餐表';

-- ----------------------------
-- Records of system_tenant_package
-- ----------------------------
BEGIN;
INSERT INTO `system_tenant_package` (`id`, `name`, `status`, `remark`, `menu_ids`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (111, '普通套餐', 0, '小功能', '[1,2,5,1031,1032,1033,1034,1035,1036,1037,1038,1039,1050,1051,1052,1053,1054,1056,1057,1058,1059,1060,1063,1064,1065,1066,1067,1070,1075,1077,1078,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1118,1119,1120,100,101,102,103,106,107,110,111,112,113,114,1138,1139,115,1140,116,1141,1142,1143,2713,2714,2715,2716,2717,2718,2720,2721,1185,2722,1186,1187,2723,1188,2724,1189,2725,1190,2726,1191,2727,2472,1192,2728,2729,1193,1194,2730,1195,2731,2732,1197,2733,2478,1198,2734,2479,1199,2735,2480,1200,2481,1201,2482,1202,2739,2483,2484,2740,2485,2486,2487,1207,2488,1208,2489,1209,2490,1210,2491,1211,2492,1212,2493,1213,2494,2495,1215,1216,2497,1217,1218,1219,1220,1221,1222,1224,1225,1226,1227,1228,1229,1237,1238,1239,1240,1241,1242,1243,2525,1255,1256,1001,1257,1002,1258,1003,1259,1004,1260,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020]', '1', '2022-02-22 00:54:00', '1', '2025-05-14 14:06:34', b'0');
COMMIT;

-- ----------------------------
-- Table structure for system_user_post
-- ----------------------------
DROP TABLE IF EXISTS `system_user_post`;
CREATE TABLE `system_user_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户ID',
  `post_id` bigint NOT NULL DEFAULT 0 COMMENT '岗位ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户岗位表';

-- ----------------------------
-- Records of system_user_post
-- ----------------------------
BEGIN;
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (112, 1, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (113, 100, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (115, 104, 1, '1', '2022-05-16 19:36:28', '1', '2022-05-16 19:36:28', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (116, 117, 2, '1', '2022-07-09 17:40:26', '1', '2022-07-09 17:40:26', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (117, 118, 1, '1', '2022-07-09 17:44:44', '1', '2022-07-09 17:44:44', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (119, 114, 5, '1', '2024-03-24 20:45:51', '1', '2024-03-24 20:45:51', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (123, 115, 1, '1', '2024-04-04 09:37:14', '1', '2024-04-04 09:37:14', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (124, 115, 2, '1', '2024-04-04 09:37:14', '1', '2024-04-04 09:37:14', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (125, 1, 2, '1', '2024-07-13 22:31:39', '1', '2024-07-13 22:31:39', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户和角色关联表';

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
BEGIN;
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 1, 1, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:17', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, 2, 2, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:13', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5, 100, 1, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:12', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6, 100, 2, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:11', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (10, 103, 1, '1', '2022-01-11 13:19:45', '1', '2022-01-11 13:19:45', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (14, 110, 109, '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', b'0', 121);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (15, 111, 110, '110', '2022-02-23 13:14:38', '110', '2022-02-23 13:14:38', b'0', 121);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (16, 113, 111, '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', b'0', 122);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (18, 1, 2, '1', '2022-05-12 20:39:29', '1', '2022-05-12 20:39:29', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (22, 115, 2, '1', '2022-07-21 22:08:30', '1', '2022-07-21 22:08:30', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (35, 112, 1, '1', '2024-03-15 20:00:24', '1', '2024-03-15 20:00:24', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (36, 118, 1, '1', '2024-03-17 09:12:08', '1', '2024-03-17 09:12:08', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (46, 117, 1, '1', '2024-10-02 10:16:11', '1', '2024-10-02 10:16:11', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (47, 104, 2, '1', '2025-01-04 10:40:33', '1', '2025-01-04 10:40:33', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (48, 100, 155, '1', '2025-04-04 10:41:14', '1', '2025-04-04 10:41:14', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (49, 142, 1, '1', '2025-07-23 09:11:42', '1', '2025-07-23 09:11:42', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for system_users
-- ----------------------------
DROP TABLE IF EXISTS `system_users`;
CREATE TABLE `system_users`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `post_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '岗位编号数组',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` tinyint NULL DEFAULT 0 COMMENT '用户性别',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像地址',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '帐号状态（0正常 1停用）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表';

-- ----------------------------
-- Records of system_users
-- ----------------------------
BEGIN;
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 'admin', '$2a$04$KljJDa/LK7QfDm0lF5OhuePhlPfjRH3tB2Wu351Uidz.oQGJXevPi', '芋道源码', '管理员', 103, '[1,2]', '11aoteman@126.com', '18818260272', 2, 'http://test.yudao.iocoder.cn/user/avatar/20250709/blob_1752042302026.jpg', 0, '0:0:0:0:0:0:0:1', '2025-08-30 19:57:52', 'admin', '2021-01-05 17:03:47', NULL, '2025-08-30 19:57:52', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (100, 'yudao', '$2a$04$h.aaPKgO.odHepnk5PCsWeEwKdojFWdTItxGKfx1r0e1CSeBzsTJ6', '芋道', '不要吓我', 104, '[1]', 'yudao@iocoder.cn', '15601691300', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2025-04-08 09:36:40', '', '2021-01-07 09:07:17', NULL, '2025-04-21 14:23:08', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (103, 'yuanma', '$2a$04$fUBSmjKCPYAUmnMzOb6qE.eZCGPhHi1JmAKclODbfS/O7fHOl2bH6', '源码', NULL, 106, NULL, 'yuanma@iocoder.cn', '15601701300', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2024-08-11 17:48:12', '', '2021-01-13 23:50:35', '1', '2025-07-09 23:41:58', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (104, 'test', '$2a$04$BrwaYn303hjA/6TnXqdGoOLhyHOAA0bVrAFu6.1dJKycqKUnIoRz2', '测试号', NULL, 107, '[1,2]', '111@qq.com', '15601691200', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2025-03-28 20:01:16', '', '2021-01-21 02:13:53', NULL, '2025-04-21 14:23:08', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (107, 'admin107', '$2a$10$dYOOBKMO93v/.ReCqzyFg.o67Tqk.bbc2bhrpyBGkIw9aypCtr2pm', '芋艿', NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '', NULL, '1', '2022-02-20 22:59:33', '1', '2025-04-21 14:23:08', b'0', 118);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (108, 'admin108', '$2a$10$y6mfvKoNYL1GXWak8nYwVOH.kCWqjactkzdoIDgiKl93WN3Ejg.Lu', '芋艿', NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '', NULL, '1', '2022-02-20 23:00:50', '1', '2025-04-21 14:23:08', b'0', 119);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (109, 'admin109', '$2a$10$JAqvH0tEc0I7dfDVBI7zyuB4E3j.uH6daIjV53.vUS6PknFkDJkuK', '芋艿', NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '', NULL, '1', '2022-02-20 23:11:50', '1', '2025-04-21 14:23:08', b'0', 120);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (110, 'admin110', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', '小王', NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2024-07-20 22:23:17', '1', '2022-02-22 00:56:14', NULL, '2025-04-21 14:23:08', b'0', 121);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (111, 'test', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', '测试用户', NULL, NULL, '[]', '', '', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2023-12-30 11:42:17', '110', '2022-02-23 13:14:33', NULL, '2025-04-21 14:23:08', b'0', 121);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (112, 'newobject', '$2a$04$dB0z8Q819fJWz0hbaLe6B.VfHCjYgWx6LFfET5lyz3JwcqlyCkQ4C', '新对象', NULL, 100, '[]', '', '15601691235', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2024-03-16 23:11:38', '1', '2022-02-23 19:08:03', NULL, '2025-04-21 14:23:08', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (113, 'aoteman', '$2a$10$0acJOIk2D25/oC87nyclE..0lzeu9DtQ/n3geP4fkun/zIVRhHJIO', '芋道1', NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '127.0.0.1', '2022-03-19 18:38:51', '1', '2022-03-07 21:37:58', '1', '2025-05-05 15:30:53', b'0', 122);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (114, 'hrmgr', '$2a$10$TR4eybBioGRhBmDBWkqWLO6NIh3mzYa8KBKDDB5woiGYFVlRAi.fu', 'hr 小姐姐', NULL, NULL, '[5]', '', '15601691236', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2024-03-24 22:21:05', '1', '2022-03-19 21:50:58', NULL, '2025-04-21 14:23:08', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (115, 'aotemane', '$2a$04$GcyP0Vyzb2F2Yni5PuIK9ueGxM0tkZGMtDwVRwrNbtMvorzbpNsV2', '阿呆', '11222', 102, '[1,2]', '7648@qq.com', '15601691229', 2, NULL, 0, '', NULL, '1', '2022-04-30 02:55:43', '1', '2025-04-21 14:23:08', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (117, 'admin123', '$2a$04$sEtimsHu9YCkYY4/oqElHem2Ijc9ld20eYO6lN.g/21NfLUTDLB9W', '测试号02', '1111', 100, '[2]', '', '15601691234', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2024-10-02 10:16:20', '1', '2022-07-09 17:40:26', '1', '2025-05-14 09:56:04', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (118, 'goudan', '$2a$04$jth0yOj8cSJq84D6vrzusOHDwW/LpBfgBnQ6bfFlD8zNZfM632Ta2', '狗蛋', NULL, 103, '[1]', '', '15601691239', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2024-03-17 09:10:27', '1', '2022-07-09 17:44:43', '1', '2025-07-09 23:52:36', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (139, 'wwbwwb', '$2a$04$aOHoFbQU6zfBk/1Z9raF/ugTdhjNdx7culC1HhO0zvoczAnahCiMq', '小秃头', NULL, NULL, NULL, '', '', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2024-09-10 21:03:58', NULL, '2024-09-10 21:03:58', NULL, '2025-04-21 14:23:08', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (141, 'admin1', '$2a$04$oj6F6d7HrZ70kYVD3TNzEu.m3TPUzajOVuC66zdKna8KRerK1FmVa', '新用户', NULL, NULL, NULL, '', '', 0, '', 0, '0:0:0:0:0:0:0:1', '2025-04-08 13:09:07', '1', '2025-04-08 13:09:07', '1', '2025-05-14 19:11:48', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (142, 'test01', '$2a$04$vxfBq9d3vVIfUbo6Dw7Mt.KOJfvG7RJ.l2/B3Kw09NtNyAZ1vbB1m', 'test01', '', NULL, '[]', '', '', 1, '', 0, '0:0:0:0:0:0:0:1', '2025-07-29 19:47:17', '1', '2025-07-09 21:07:10', NULL, '2025-07-29 19:47:17', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for yudao_demo01_contact
-- ----------------------------
DROP TABLE IF EXISTS `yudao_demo01_contact`;
CREATE TABLE `yudao_demo01_contact`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `sex` tinyint(1) NOT NULL COMMENT '性别',
  `birthday` datetime NOT NULL COMMENT '出生年',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '简介',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '示例联系人表';

-- ----------------------------
-- Records of yudao_demo01_contact
-- ----------------------------
BEGIN;
INSERT INTO `yudao_demo01_contact` (`id`, `name`, `sex`, `birthday`, `description`, `avatar`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '土豆', 2, '2023-11-07 00:00:00', '<p>天蚕土豆！呀</p>', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/46f8fa1a37db3f3960d8910ff2fe3962ab3b2db87cf2f8ccb4dc8145b8bdf237.jpeg', '1', '2023-11-15 23:34:30', '1', '2023-11-15 23:47:39', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for yudao_demo02_category
-- ----------------------------
DROP TABLE IF EXISTS `yudao_demo02_category`;
CREATE TABLE `yudao_demo02_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `parent_id` bigint NOT NULL COMMENT '父级编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '示例分类表';

-- ----------------------------
-- Records of yudao_demo02_category
-- ----------------------------
BEGIN;
INSERT INTO `yudao_demo02_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '土豆', 0, '1', '2023-11-15 23:34:30', '1', '2023-11-16 20:24:23', b'0', 1);
INSERT INTO `yudao_demo02_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, '番茄', 0, '1', '2023-11-16 20:24:00', '1', '2023-11-16 20:24:15', b'0', 1);
INSERT INTO `yudao_demo02_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3, '怪怪', 0, '1', '2023-11-16 20:24:32', '1', '2023-11-16 20:24:32', b'0', 1);
INSERT INTO `yudao_demo02_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (4, '小番茄', 2, '1', '2023-11-16 20:24:39', '1', '2023-11-16 20:24:39', b'0', 1);
INSERT INTO `yudao_demo02_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5, '大番茄', 2, '1', '2023-11-16 20:24:46', '1', '2023-11-16 20:24:46', b'0', 1);
INSERT INTO `yudao_demo02_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6, '11', 3, '1', '2023-11-24 19:29:34', '1', '2023-11-24 19:29:34', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for yudao_demo03_course
-- ----------------------------
DROP TABLE IF EXISTS `yudao_demo03_course`;
CREATE TABLE `yudao_demo03_course`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `student_id` bigint NOT NULL COMMENT '学生编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `score` tinyint NOT NULL COMMENT '分数',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生课程表';

-- ----------------------------
-- Records of yudao_demo03_course
-- ----------------------------
BEGIN;
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, 2, '语文', 66, '1', '2023-11-16 23:21:49', '1', '2024-09-17 10:55:30', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3, 2, '数学', 22, '1', '2023-11-16 23:21:49', '1', '2024-09-17 10:55:30', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6, 5, '体育', 23, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:44:40', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (7, 5, '计算机', 11, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:44:40', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (8, 5, '体育', 23, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:47:09', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (9, 5, '计算机', 11, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:47:09', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (10, 5, '体育', 23, '1', '2023-11-16 23:22:46', '1', '2024-09-17 10:55:28', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (11, 5, '计算机', 11, '1', '2023-11-16 23:22:46', '1', '2024-09-17 10:55:28', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (12, 2, '电脑', 33, '1', '2023-11-17 00:20:42', '1', '2023-11-16 16:20:45', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (13, 9, '滑雪', 12, '1', '2023-11-17 13:13:20', '1', '2024-09-17 10:55:26', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (14, 9, '滑雪', 12, '1', '2023-11-17 13:13:20', '1', '2024-09-17 10:55:49', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (15, 5, '体育', 23, '1', '2023-11-16 23:22:46', '1', '2024-09-17 18:55:29', b'0', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (16, 5, '计算机', 11, '1', '2023-11-16 23:22:46', '1', '2024-09-17 18:55:29', b'0', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (17, 2, '语文', 66, '1', '2023-11-16 23:21:49', '1', '2024-09-17 18:55:31', b'0', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (18, 2, '数学', 22, '1', '2023-11-16 23:21:49', '1', '2024-09-17 18:55:31', b'0', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (19, 9, '滑雪', 12, '1', '2023-11-17 13:13:20', '1', '2025-04-19 02:49:03', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (20, 9, '滑雪', 12, '1', '2023-11-17 13:13:20', '1', '2025-04-19 10:49:04', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for yudao_demo03_grade
-- ----------------------------
DROP TABLE IF EXISTS `yudao_demo03_grade`;
CREATE TABLE `yudao_demo03_grade`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `student_id` bigint NOT NULL COMMENT '学生编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `teacher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '班主任',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生班级表';

-- ----------------------------
-- Records of yudao_demo03_grade
-- ----------------------------
BEGIN;
INSERT INTO `yudao_demo03_grade` (`id`, `student_id`, `name`, `teacher`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (7, 2, '三年 2 班', '周杰伦', '1', '2023-11-16 23:21:49', '1', '2024-09-17 18:55:31', b'0', 1);
INSERT INTO `yudao_demo03_grade` (`id`, `student_id`, `name`, `teacher`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (8, 5, '华为', '遥遥领先', '1', '2023-11-16 23:22:46', '1', '2024-09-17 18:55:29', b'0', 1);
INSERT INTO `yudao_demo03_grade` (`id`, `student_id`, `name`, `teacher`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (9, 9, '小图', '小娃111', '1', '2023-11-17 13:10:23', '1', '2025-04-19 10:49:04', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for yudao_demo03_student
-- ----------------------------
DROP TABLE IF EXISTS `yudao_demo03_student`;
CREATE TABLE `yudao_demo03_student`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `sex` tinyint NOT NULL COMMENT '性别',
  `birthday` datetime NOT NULL COMMENT '出生日期',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '简介',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生表';

-- ----------------------------
-- Records of yudao_demo03_student
-- ----------------------------
BEGIN;
INSERT INTO `yudao_demo03_student` (`id`, `name`, `sex`, `birthday`, `description`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, '小白', 1, '2023-11-16 00:00:00', '<p>厉害</p>', '1', '2023-11-16 23:21:49', '1', '2024-09-17 18:55:31', b'0', 1);
INSERT INTO `yudao_demo03_student` (`id`, `name`, `sex`, `birthday`, `description`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5, '大黑', 2, '2023-11-13 00:00:00', '<p>你在教我做事?</p>', '1', '2023-11-16 23:22:46', '1', '2024-09-17 18:55:29', b'0', 1);
INSERT INTO `yudao_demo03_student` (`id`, `name`, `sex`, `birthday`, `description`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (9, '小花', 1, '2023-11-07 00:00:00', '<p>哈哈哈</p>', '1', '2023-11-17 00:04:47', '1', '2025-04-19 10:49:04', b'0', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
