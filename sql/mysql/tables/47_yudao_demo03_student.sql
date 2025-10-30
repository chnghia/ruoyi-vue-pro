DROP TABLE IF EXISTS `yudao_demo03_student`;
CREATE TABLE `yudao_demo03_student`  (
`id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
`name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Name',
`sex` tinyint NOT NULL COMMENT 'Gender',
`birthday` datetime NOT NULL COMMENT 'Birthday',
`description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Description',
`creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Creator',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create Time',
`updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Updater',
`update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
`deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Deleted',
`tenant_id` bigint NOT NULL DEFAULT 0 COMMENT 'Tenant ID',
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