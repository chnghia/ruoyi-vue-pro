DROP TABLE IF EXISTS `system_notice`;
CREATE TABLE `system_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告内容',
  `type` tinyint NOT NULL COMMENT '公告类型（1通知 2公告）',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '公告状态（0正常 1关闭）',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '通知公告表';

-- ----------------------------
-- Records of system_notice
-- ----------------------------
BEGIN;
INSERT INTO `system_notice` (`id`, `title`, `content`, `type`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '芋道的公众', '<p>新版本内容133222</p>', 1, 0, 'admin', '2021-01-05 17:03:48', '\"1\"', '2025-08-31 09:38:22', b'0', 1);
INSERT INTO `system_notice` (`id`, `title`, `content`, `type`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, '维护通知：2018-07-01 系统凌晨维护', '<p><img src=\"http://test.yudao.iocoder.cn/b7cb3cf49b4b3258bf7309a09dd2f4e5.jpg\" alt=\"\" data-href=\"\">11112222<img src=\"http://test.yudao.iocoder.cn/fe44fc7bdb82ca421184b2eebbaee9e2148d4a1827479a4eb4521e11d2a062ba.png\" alt=\"image\" data-href=\"http://test.yudao.iocoder.cn/fe44fc7bdb82ca421184b2eebbaee9e2148d4a1827479a4eb4521e11d2a062ba.png\">3333</p>', 2, 1, 'admin', '2021-01-05 17:03:48', '1', '2025-04-18 23:56:40', b'0', 1);
INSERT INTO `system_notice` (`id`, `title`, `content`, `type`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (4, '我是测试标题', '<p>哈哈哈哈123</p>', 1, 0, '110', '2022-02-22 01:01:25', '110', '2022-02-22 01:01:46', b'0', 121);
COMMIT;