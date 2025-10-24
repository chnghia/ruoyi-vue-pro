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