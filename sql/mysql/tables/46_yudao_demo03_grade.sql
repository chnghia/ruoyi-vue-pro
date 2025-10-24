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