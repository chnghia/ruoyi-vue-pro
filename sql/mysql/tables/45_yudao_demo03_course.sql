DROP TABLE IF EXISTS `yudao_demo03_course`;
CREATE TABLE `yudao_demo03_course`  (
`id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
`student_id` bigint NOT NULL COMMENT 'Student ID',
`name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Name',
`score` tinyint NOT NULL COMMENT 'Score',
`creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Creator',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create Time',
`updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Updater',
`update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
`deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Deleted',
`tenant_id` bigint NOT NULL DEFAULT 0 COMMENT 'Tenant ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Student Course Table';

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