/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : hrm

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 17/02/2023 22:46:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for att_attendance
-- ----------------------------
DROP TABLE IF EXISTS `att_attendance`;
CREATE TABLE `att_attendance`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NULL DEFAULT NULL COMMENT '员工id',
  `mor_start_time` time(0) NULL DEFAULT NULL COMMENT '上午上班时间',
  `mor_end_time` time(0) NULL DEFAULT NULL COMMENT '上午下班时间',
  `aft_start_time` time(0) NULL DEFAULT NULL COMMENT '下午上班时间',
  `aft_end_time` time(0) NULL DEFAULT NULL COMMENT '下午下班时间',
  `attendance_date` date NOT NULL COMMENT '考勤日期',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '0正常，1迟到，2早退，3旷工，4休假',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 260 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工考勤表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of att_attendance
-- ----------------------------
INSERT INTO `att_attendance` VALUES (197, 1, '07:30:00', '11:30:00', '13:30:00', '18:00:00', '2022-05-09', 0, NULL, '2022-05-06 16:52:25', '2022-05-06 17:35:20', 0);
INSERT INTO `att_attendance` VALUES (198, 1, '06:50:00', '12:00:00', '13:00:00', '17:00:16', '2022-05-10', 0, NULL, '2022-05-06 16:52:25', '2022-05-06 16:52:25', 0);
INSERT INTO `att_attendance` VALUES (199, 1, '09:00:00', '10:30:00', '13:01:55', '16:00:16', '2022-05-11', 3, NULL, '2022-05-06 16:52:25', '2022-05-06 16:52:25', 0);
INSERT INTO `att_attendance` VALUES (200, 2, '07:00:00', '12:35:00', '13:12:55', '19:20:16', '2022-05-09', 1, NULL, '2022-05-06 16:52:25', '2022-05-06 16:52:25', 0);
INSERT INTO `att_attendance` VALUES (201, 2, '07:40:00', '12:20:00', '13:09:55', '18:10:16', '2022-05-10', 0, NULL, '2022-05-06 16:52:25', '2022-05-06 16:52:25', 0);
INSERT INTO `att_attendance` VALUES (202, 2, '07:40:00', '12:30:00', NULL, '18:49:00', '2022-05-11', 0, NULL, '2022-05-06 16:52:25', '2022-05-06 16:52:25', 0);
INSERT INTO `att_attendance` VALUES (203, 3, '06:12:00', '11:00:00', '13:01:55', '16:00:16', '2022-05-09', 2, NULL, '2022-05-06 16:52:25', '2022-05-06 16:52:25', 0);
INSERT INTO `att_attendance` VALUES (204, 3, '07:00:00', '11:30:00', '13:30:00', '18:00:00', '2022-05-10', 3, NULL, '2022-05-06 16:52:25', '2022-05-06 16:52:25', 0);
INSERT INTO `att_attendance` VALUES (205, 3, '07:20:00', '12:30:00', '13:00:00', '18:00:16', '2022-05-11', 0, NULL, '2022-05-06 16:52:25', '2022-05-06 16:52:25', 0);
INSERT INTO `att_attendance` VALUES (206, 4, '09:30:00', '10:40:00', '13:10:55', '16:30:16', '2022-05-09', 3, NULL, '2022-05-06 16:52:25', '2022-05-06 16:52:25', 0);
INSERT INTO `att_attendance` VALUES (207, 4, '05:00:00', '12:35:00', '13:00:55', '19:20:16', '2022-05-10', 0, NULL, '2022-05-06 16:52:25', '2022-05-06 16:52:25', 0);
INSERT INTO `att_attendance` VALUES (208, 4, '05:40:00', '13:00:00', '13:00:55', '18:10:16', '2022-05-11', 0, NULL, '2022-05-06 16:52:25', '2022-05-06 16:52:25', 0);
INSERT INTO `att_attendance` VALUES (209, 1, NULL, NULL, NULL, NULL, '2022-05-06', 0, NULL, '2022-05-06 17:35:20', '2022-05-06 17:35:20', 0);
INSERT INTO `att_attendance` VALUES (210, 1, NULL, NULL, NULL, NULL, '2022-05-16', 0, NULL, '2022-05-06 17:38:40', '2022-05-06 17:38:40', 0);
INSERT INTO `att_attendance` VALUES (211, 1, NULL, NULL, NULL, NULL, '2022-05-17', 1, NULL, '2022-05-06 17:38:40', '2022-05-06 17:38:40', 0);
INSERT INTO `att_attendance` VALUES (212, 3, '07:20:00', '12:30:00', '13:00:00', '18:00:16', '2022-04-06', 0, NULL, '2022-05-06 17:54:37', '2022-05-13 15:09:39', 0);
INSERT INTO `att_attendance` VALUES (213, 4, NULL, NULL, NULL, NULL, '2022-04-12', 0, NULL, '2022-05-06 17:54:43', '2022-05-06 17:54:43', 0);
INSERT INTO `att_attendance` VALUES (214, 1, NULL, NULL, NULL, NULL, '2022-04-12', 2, NULL, '2022-05-06 17:54:50', '2022-05-06 17:54:50', 0);
INSERT INTO `att_attendance` VALUES (215, 2, NULL, NULL, NULL, NULL, '2022-04-14', 1, NULL, '2022-05-06 17:54:56', '2022-05-06 17:54:56', 0);
INSERT INTO `att_attendance` VALUES (216, 6, NULL, NULL, NULL, NULL, '2022-04-13', 3, NULL, '2022-05-06 17:55:03', '2022-05-06 17:55:03', 0);
INSERT INTO `att_attendance` VALUES (217, 6, NULL, NULL, NULL, NULL, '2022-05-13', 2, NULL, '2022-05-06 18:05:27', '2022-05-06 18:05:27', 0);
INSERT INTO `att_attendance` VALUES (218, 9, NULL, NULL, NULL, NULL, '2022-05-13', 1, NULL, '2022-05-06 18:05:34', '2022-05-06 18:05:34', 0);
INSERT INTO `att_attendance` VALUES (219, 1, '06:00:00', '12:00:00', '13:00:55', '18:00:16', '2022-07-08', 1, NULL, '2022-05-12 20:50:04', '2023-02-16 07:48:16', 0);
INSERT INTO `att_attendance` VALUES (220, 1, '09:00:00', '10:30:00', '13:01:55', '16:00:16', '2022-07-11', 1, NULL, '2022-05-12 20:50:04', '2023-02-01 21:59:35', 0);
INSERT INTO `att_attendance` VALUES (221, 2, '06:45:00', '11:40:00', '13:10:55', '16:30:16', '2022-07-08', 1, NULL, '2022-05-12 20:50:04', '2023-02-16 07:48:16', 0);
INSERT INTO `att_attendance` VALUES (222, 2, '07:40:00', '12:30:00', NULL, '18:49:16', '2022-07-11', 3, NULL, '2022-05-12 20:50:04', '2023-02-01 21:59:35', 0);
INSERT INTO `att_attendance` VALUES (223, 3, '07:34:00', '12:10:00', '15:11:55', '21:00:16', '2022-07-08', 1, NULL, '2022-05-12 20:50:04', '2023-02-16 07:48:16', 0);
INSERT INTO `att_attendance` VALUES (224, 3, '07:20:00', '12:30:00', '13:00:00', '18:00:16', '2022-07-11', 1, NULL, '2022-05-12 20:50:04', '2023-02-01 21:59:35', 0);
INSERT INTO `att_attendance` VALUES (225, 4, '08:00:00', '11:00:00', '13:01:55', '16:00:16', '2022-07-08', 3, NULL, '2022-05-12 20:50:04', '2023-02-16 07:48:16', 0);
INSERT INTO `att_attendance` VALUES (226, 4, '05:40:00', '13:00:00', '13:00:55', '18:10:16', '2022-07-11', 0, NULL, '2022-05-12 20:50:04', '2022-05-12 20:50:04', 0);
INSERT INTO `att_attendance` VALUES (227, 4, NULL, NULL, NULL, NULL, '2022-04-26', 2, NULL, '2022-05-12 20:53:46', '2022-05-12 20:53:46', 0);
INSERT INTO `att_attendance` VALUES (228, 1, NULL, NULL, NULL, NULL, '2022-04-20', 3, NULL, '2022-05-13 09:27:18', '2022-05-13 09:27:18', 0);
INSERT INTO `att_attendance` VALUES (229, 5, NULL, NULL, NULL, NULL, '2022-05-05', 2, NULL, '2022-05-13 14:20:43', '2022-05-13 14:20:43', 0);
INSERT INTO `att_attendance` VALUES (230, 1, '07:30:00', '11:30:00', '13:30:00', '18:00:00', '2022-04-04', 3, NULL, '2022-05-13 15:09:38', '2022-05-13 15:09:38', 0);
INSERT INTO `att_attendance` VALUES (231, 1, '06:50:00', '12:00:00', '13:00:00', '17:00:16', '2022-04-05', 0, NULL, '2022-05-13 15:09:38', '2022-05-13 15:09:38', 0);
INSERT INTO `att_attendance` VALUES (232, 1, '09:00:00', '10:30:00', '13:01:55', '16:00:16', '2022-04-06', 3, NULL, '2022-05-13 15:09:38', '2022-05-13 15:09:38', 0);
INSERT INTO `att_attendance` VALUES (233, 2, '07:00:00', '12:35:00', '13:12:55', '19:20:16', '2022-04-04', 1, NULL, '2022-05-13 15:09:38', '2022-05-13 15:09:38', 0);
INSERT INTO `att_attendance` VALUES (234, 2, '07:40:00', '12:20:00', '13:09:55', '18:10:16', '2022-04-05', 0, NULL, '2022-05-13 15:09:38', '2022-05-13 15:09:38', 0);
INSERT INTO `att_attendance` VALUES (235, 2, '07:40:00', '12:30:00', NULL, '18:49:16', '2022-04-06', 3, NULL, '2022-05-13 15:09:38', '2022-05-13 15:09:38', 0);
INSERT INTO `att_attendance` VALUES (236, 3, '06:12:00', '11:00:00', '13:01:55', '16:00:16', '2022-04-04', 2, NULL, '2022-05-13 15:09:39', '2022-05-13 15:09:39', 0);
INSERT INTO `att_attendance` VALUES (237, 3, '07:00:00', '11:30:00', '13:30:00', '18:00:00', '2022-04-05', 3, NULL, '2022-05-13 15:09:39', '2022-05-13 15:09:39', 0);
INSERT INTO `att_attendance` VALUES (238, 4, '09:30:00', '10:40:00', '13:10:55', '16:30:16', '2022-04-04', 3, NULL, '2022-05-13 15:09:40', '2022-05-13 15:09:40', 0);
INSERT INTO `att_attendance` VALUES (239, 4, '05:00:00', '12:35:00', '13:00:55', '19:20:16', '2022-04-05', 0, NULL, '2022-05-13 15:09:40', '2022-05-13 15:09:40', 0);
INSERT INTO `att_attendance` VALUES (240, 4, '05:40:00', '13:00:00', '13:00:55', '18:10:16', '2022-04-06', 0, NULL, '2022-05-13 15:09:40', '2022-05-13 15:09:40', 0);
INSERT INTO `att_attendance` VALUES (241, 1, NULL, NULL, NULL, NULL, '2022-05-19', 4, NULL, '2022-05-13 15:12:39', '2022-05-13 15:12:39', 0);
INSERT INTO `att_attendance` VALUES (242, 1, NULL, NULL, NULL, NULL, '2022-05-20', 4, NULL, '2022-05-13 15:12:39', '2022-05-13 15:12:39', 0);
INSERT INTO `att_attendance` VALUES (247, 1, NULL, NULL, NULL, NULL, '2023-01-01', 2, NULL, '2023-01-02 13:50:02', '2023-01-02 13:50:02', 0);
INSERT INTO `att_attendance` VALUES (250, 1, NULL, NULL, NULL, NULL, '2023-01-02', 1, NULL, '2023-01-25 21:13:29', '2023-01-25 21:13:29', 0);
INSERT INTO `att_attendance` VALUES (251, 3, NULL, NULL, NULL, NULL, '2023-01-04', 4, NULL, '2023-01-25 21:17:59', '2023-01-25 21:17:59', 0);
INSERT INTO `att_attendance` VALUES (252, 2, NULL, NULL, NULL, NULL, '2023-02-07', 3, NULL, '2023-02-14 12:10:00', '2023-02-14 12:10:00', 0);
INSERT INTO `att_attendance` VALUES (253, 1, NULL, NULL, NULL, NULL, '2023-02-16', 4, NULL, '2023-02-14 22:07:48', '2023-02-14 22:07:48', 0);
INSERT INTO `att_attendance` VALUES (254, 1, NULL, NULL, NULL, NULL, '2023-02-17', 3, NULL, '2023-02-14 22:07:49', '2023-02-14 22:07:49', 0);
INSERT INTO `att_attendance` VALUES (255, 1, NULL, NULL, NULL, NULL, '2023-02-15', 4, NULL, '2023-02-14 22:09:39', '2023-02-14 22:09:39', 0);
INSERT INTO `att_attendance` VALUES (256, 1, NULL, NULL, NULL, NULL, '2023-02-21', 4, NULL, '2023-02-14 22:15:58', '2023-02-14 22:15:58', 0);
INSERT INTO `att_attendance` VALUES (257, 1, NULL, NULL, NULL, NULL, '2023-02-22', 4, NULL, '2023-02-14 22:15:58', '2023-02-14 22:15:58', 0);
INSERT INTO `att_attendance` VALUES (258, 1, NULL, NULL, NULL, NULL, '2023-02-08', 2, NULL, '2023-02-15 01:04:56', '2023-02-15 01:04:56', 0);
INSERT INTO `att_attendance` VALUES (259, 1, NULL, NULL, NULL, NULL, '2023-02-23', 1, NULL, '2023-02-15 01:05:17', '2023-02-15 01:05:17', 0);

-- ----------------------------
-- Table structure for att_leave
-- ----------------------------
DROP TABLE IF EXISTS `att_leave`;
CREATE TABLE `att_leave`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `days` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '休假天数',
  `type_num` tinyint(4) UNSIGNED NULL DEFAULT NULL COMMENT '休假类型',
  `status` tinyint(4) UNSIGNED NULL DEFAULT 1 COMMENT '0禁用，1正常，默认1',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '请假表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of att_leave
-- ----------------------------
INSERT INTO `att_leave` VALUES (1, 2, 40, 1, 1, NULL, '2022-03-26 11:53:04', '2022-03-26 11:53:46', 0);
INSERT INTO `att_leave` VALUES (2, 2, 4, 2, 0, NULL, '2022-03-26 12:00:32', '2022-03-26 12:00:32', 0);
INSERT INTO `att_leave` VALUES (3, 3, NULL, 1, 1, NULL, '2022-03-27 08:58:39', '2022-03-27 08:58:39', 0);
INSERT INTO `att_leave` VALUES (4, 3, NULL, 4, 1, NULL, '2022-03-27 08:58:46', '2022-03-27 08:58:46', 0);
INSERT INTO `att_leave` VALUES (5, 3, NULL, 5, 1, NULL, '2022-03-27 08:58:58', '2022-03-27 08:58:58', 0);
INSERT INTO `att_leave` VALUES (6, 2, 3, 4, 0, NULL, '2022-03-27 12:03:52', '2022-03-27 12:03:52', 0);
INSERT INTO `att_leave` VALUES (7, 2, 10, 0, 1, NULL, '2022-03-27 12:05:14', '2022-12-30 11:02:33', 0);
INSERT INTO `att_leave` VALUES (8, 2, 4, 3, 1, NULL, '2022-03-27 13:50:04', '2022-03-27 13:50:04', 0);
INSERT INTO `att_leave` VALUES (9, 5, 10, 2, 1, NULL, '2022-04-08 20:22:36', '2022-04-08 20:22:36', 0);
INSERT INTO `att_leave` VALUES (10, 5, 10, 4, 0, NULL, '2022-04-08 20:22:49', '2022-04-08 20:22:49', 0);
INSERT INTO `att_leave` VALUES (11, 5, 10, 0, 1, NULL, '2022-04-08 20:23:01', '2022-12-30 11:02:38', 0);
INSERT INTO `att_leave` VALUES (12, 5, 30, 1, 0, NULL, '2022-05-06 15:21:20', '2022-05-06 15:21:20', 0);
INSERT INTO `att_leave` VALUES (13, 5, 10, 3, 1, NULL, '2022-05-06 15:21:34', '2022-05-06 15:21:34', 0);
INSERT INTO `att_leave` VALUES (14, 12, 10, 2, 1, NULL, '2022-05-06 17:33:14', '2022-05-06 17:33:14', 0);
INSERT INTO `att_leave` VALUES (15, 12, 10, 4, 0, NULL, '2022-05-06 17:33:27', '2023-01-02 21:11:58', 0);
INSERT INTO `att_leave` VALUES (16, 12, 10, 0, 1, NULL, '2022-05-06 17:33:36', '2022-12-30 11:02:41', 0);
INSERT INTO `att_leave` VALUES (17, 2, 2, 5, 1, NULL, '2023-01-01 19:49:15', '2023-01-01 19:49:45', 0);

-- ----------------------------
-- Table structure for att_overtime
-- ----------------------------
DROP TABLE IF EXISTS `att_overtime`;
CREATE TABLE `att_overtime`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `salary_multiple` decimal(5, 2) NULL DEFAULT NULL COMMENT '工资倍数，如按照小时计算，就是员工平均小时工资乘以倍数',
  `bonus` decimal(10, 3) NULL DEFAULT NULL COMMENT '加班奖金',
  `type_num` int(11) NULL DEFAULT NULL COMMENT '加班类型',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `count_type` tinyint(4) NULL DEFAULT NULL COMMENT '0小时，1天，默认0，计数加班工资的类型',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_time_off` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '0不补休，1补休，默认0',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '加班表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of att_overtime
-- ----------------------------
INSERT INTO `att_overtime` VALUES (1, 4.00, 200.000, 1, 2, 1, NULL, 0, '2022-03-28 19:16:06', '2022-03-28 19:16:06', 0);
INSERT INTO `att_overtime` VALUES (2, 0.00, 0.000, 3, 15, 0, NULL, 1, '2022-03-28 22:00:05', '2022-03-28 22:00:05', 0);
INSERT INTO `att_overtime` VALUES (3, 0.10, NULL, 1, 5, 0, NULL, 0, '2022-03-28 22:24:08', '2022-03-28 22:24:08', 0);
INSERT INTO `att_overtime` VALUES (4, 0.30, NULL, 2, 5, 1, NULL, 0, '2022-03-28 22:26:03', '2022-03-28 22:26:03', 0);
INSERT INTO `att_overtime` VALUES (5, 0.00, 0.000, 2, 2, 1, NULL, 1, '2022-03-28 22:28:01', '2022-03-28 22:28:01', 0);
INSERT INTO `att_overtime` VALUES (6, 0.00, 0.000, 3, 2, 0, NULL, 1, '2022-03-31 20:00:21', '2022-03-31 20:00:21', 0);
INSERT INTO `att_overtime` VALUES (7, 2.00, 150.000, 0, 2, 0, NULL, 0, '2023-02-14 20:44:26', '2023-02-14 20:44:26', 0);

-- ----------------------------
-- Table structure for att_staff_leave
-- ----------------------------
DROP TABLE IF EXISTS `att_staff_leave`;
CREATE TABLE `att_staff_leave`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NULL DEFAULT NULL COMMENT '员工id',
  `days` int(11) NULL DEFAULT NULL COMMENT '请假的天数',
  `type_num` int(11) NULL DEFAULT NULL COMMENT '请假类型id',
  `start_date` date NULL DEFAULT NULL COMMENT '请假的开始日期',
  `status` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '0未审核，1审核通过，2驳回，3撤销',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工请假表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of att_staff_leave
-- ----------------------------
INSERT INTO `att_staff_leave` VALUES (18, 1, 4, 4, '2022-05-06', 1, '回家喽', '2022-05-06 17:34:33', '2022-05-06 17:35:20', 0);
INSERT INTO `att_staff_leave` VALUES (19, 1, 4, 4, '2022-05-14', 1, '回家喽', '2022-05-06 17:38:32', '2022-05-06 17:38:40', 0);
INSERT INTO `att_staff_leave` VALUES (20, 1, 4, 4, '2022-05-19', 1, NULL, '2022-05-13 15:11:41', '2022-05-13 15:12:39', 0);
INSERT INTO `att_staff_leave` VALUES (21, 1, 5, 0, '2023-01-10', 3, '努力复习中！', '2023-01-02 21:44:24', '2023-01-02 22:16:45', 1);
INSERT INTO `att_staff_leave` VALUES (22, 1, 2, 2, '2023-02-16', 1, NULL, '2023-02-14 20:45:44', '2023-02-14 22:07:49', 0);
INSERT INTO `att_staff_leave` VALUES (23, 1, 5, 0, '2023-02-15', 1, '有事情需要处理', '2023-02-14 22:09:05', '2023-02-14 22:09:39', 0);
INSERT INTO `att_staff_leave` VALUES (24, 1, 2, 0, '2023-02-21', 1, '有事', '2023-02-14 22:15:35', '2023-02-14 22:15:58', 0);

-- ----------------------------
-- Table structure for per_menu
-- ----------------------------
DROP TABLE IF EXISTS `per_menu`;
CREATE TABLE `per_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单编码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父菜单id，0代表根菜单，默认0',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of per_menu
-- ----------------------------
INSERT INTO `per_menu` VALUES (1, 'staff', '员工管理', 'user', '/staff', 5, NULL, '2022-02-22 19:47:58', '2022-04-08 12:33:56', 0);
INSERT INTO `per_menu` VALUES (2, 'docs', '文件管理', 'folder', '/docs', 5, NULL, '2022-12-22 19:48:47', '2022-04-08 13:30:34', 0);
INSERT INTO `per_menu` VALUES (3, 'role', '角色管理', 's-custom', '/role', 6, '', '2022-10-22 19:49:42', '2022-03-05 20:26:47', 0);
INSERT INTO `per_menu` VALUES (4, 'menu', '菜单管理', 'collection', '/menu', 6, NULL, '2022-01-27 14:32:37', '2022-04-08 14:15:14', 0);
INSERT INTO `per_menu` VALUES (5, 'system', '系统管理', 's-management', '/system', 0, '', '2022-01-27 14:36:17', '2022-04-08 13:30:35', 0);
INSERT INTO `per_menu` VALUES (6, 'permission', '权限管理', 's-cooperation\r\n', '/permission', 0, NULL, '2022-11-20 18:00:21', '2022-04-08 13:30:37', 0);
INSERT INTO `per_menu` VALUES (13, 'department', '部门管理', 's-operation', '/department', 5, NULL, '2022-03-07 15:36:59', '2022-03-07 15:45:37', 0);
INSERT INTO `per_menu` VALUES (14, 'attendance', '考勤管理', 'edit', '/attendance', 0, NULL, '2022-03-21 23:30:38', '2022-04-08 12:52:19', 0);
INSERT INTO `per_menu` VALUES (15, 'insurance', '五险一金', 's-data', '/insurance', 17, NULL, '2022-03-21 23:33:59', '2022-03-25 08:29:39', 0);
INSERT INTO `per_menu` VALUES (16, 'salary', '薪资管理', 'data-line', '/salary', 17, NULL, '2022-03-21 23:34:56', '2023-02-11 14:38:15', 0);
INSERT INTO `per_menu` VALUES (17, 'money', '财务管理', 's-finance\r\n', '/money', 0, NULL, '2022-03-22 11:42:06', '2023-02-11 14:38:06', 0);
INSERT INTO `per_menu` VALUES (18, 'city', '参保城市', 'coordinate\r\n', '/city', 17, NULL, '2022-03-22 18:27:13', '2022-03-23 16:30:34', 0);
INSERT INTO `per_menu` VALUES (19, 'leave', '请假审批', 'suitcase', '/leave', 14, NULL, '2022-03-26 09:40:15', '2022-04-06 06:21:07', 0);
INSERT INTO `per_menu` VALUES (20, 'performance', '考勤表现', 'reading', '/performance', 14, NULL, '2022-03-26 09:46:24', '2022-03-26 09:47:41', 0);

-- ----------------------------
-- Table structure for per_role
-- ----------------------------
DROP TABLE IF EXISTS `per_role`;
CREATE TABLE `per_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `code` varchar(20) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色备注',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of per_role
-- ----------------------------
INSERT INTO `per_role` VALUES (1, 'admin', '管理员', '', '2022-01-22 19:46:27', '2022-04-08 12:32:56', 0);
INSERT INTO `per_role` VALUES (2, 'manager', '总经理', '', '2022-02-22 19:47:58', '2022-04-08 13:27:28', 0);
INSERT INTO `per_role` VALUES (3, 'ceo', '首席执行官', '', '2022-02-28 17:08:48', '2022-04-08 14:50:36', 0);
INSERT INTO `per_role` VALUES (4, 'director_of_sales', '销售总监', '', '2022-03-01 21:57:42', '2022-04-08 14:14:55', 0);
INSERT INTO `per_role` VALUES (5, 'cto', '首席技术官', NULL, '2022-03-01 21:58:39', '2022-04-08 13:27:30', 0);
INSERT INTO `per_role` VALUES (6, 'publicity_director', '宣传部长', NULL, '2022-03-01 21:58:54', '2022-04-08 14:14:58', 0);
INSERT INTO `per_role` VALUES (7, 'hr', '人事经理', NULL, '2022-03-01 21:59:30', '2022-04-08 14:15:00', 0);
INSERT INTO `per_role` VALUES (8, 'director_of_planning', '企划部总监', NULL, '2022-03-01 21:59:47', '2022-03-28 20:14:00', 0);
INSERT INTO `per_role` VALUES (9, 'finance_minister', '薪酬总监', NULL, '2022-03-01 22:00:05', '2022-03-28 20:14:05', 0);

-- ----------------------------
-- Table structure for per_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `per_role_menu`;
CREATE TABLE `per_role_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NOT NULL COMMENT '角色id',
  `menu_id` int(10) UNSIGNED NOT NULL COMMENT '菜单id',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0禁用，1正常，默认1',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色菜单关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of per_role_menu
-- ----------------------------
INSERT INTO `per_role_menu` VALUES (1, 1, 2, 1, '2022-03-02 16:14:31', '2023-01-01 10:32:40', 0);
INSERT INTO `per_role_menu` VALUES (2, 1, 5, 1, '2022-03-02 16:18:01', '2023-01-01 10:32:37', 0);
INSERT INTO `per_role_menu` VALUES (3, 1, 6, 1, '2022-03-02 16:56:04', '2023-01-01 10:32:35', 0);
INSERT INTO `per_role_menu` VALUES (5, 1, 3, 1, '2022-03-02 17:01:42', '2023-01-01 10:32:33', 0);
INSERT INTO `per_role_menu` VALUES (6, 1, 4, 1, '2022-03-02 17:01:42', '2023-01-01 10:32:32', 0);
INSERT INTO `per_role_menu` VALUES (7, 1, 1, 1, '2022-03-02 17:01:57', '2023-01-01 10:32:30', 0);
INSERT INTO `per_role_menu` VALUES (9, 2, 3, 1, '2022-03-04 15:12:09', '2022-03-20 12:21:24', 0);
INSERT INTO `per_role_menu` VALUES (10, 2, 4, 1, '2022-03-04 15:12:09', '2022-03-20 12:21:30', 0);
INSERT INTO `per_role_menu` VALUES (11, 2, 6, 1, '2022-03-04 15:12:09', '2022-03-20 12:21:34', 0);
INSERT INTO `per_role_menu` VALUES (13, 3, 1, 1, '2022-03-04 15:54:00', NULL, 0);
INSERT INTO `per_role_menu` VALUES (14, 3, 5, 1, '2022-03-04 15:54:00', NULL, 0);
INSERT INTO `per_role_menu` VALUES (16, 2, 1, 1, '2022-03-05 21:47:35', NULL, 0);
INSERT INTO `per_role_menu` VALUES (17, 2, 5, 1, '2022-03-05 21:47:36', NULL, 0);
INSERT INTO `per_role_menu` VALUES (18, 1, 13, 1, '2022-03-07 16:20:03', '2023-01-01 10:32:27', 0);
INSERT INTO `per_role_menu` VALUES (19, 9, 13, 0, '2022-03-20 12:04:34', '2022-04-10 21:30:22', 0);
INSERT INTO `per_role_menu` VALUES (20, 9, 5, 0, '2022-03-20 12:04:35', '2022-04-10 21:30:22', 0);
INSERT INTO `per_role_menu` VALUES (21, 7, 1, 1, '2022-03-20 16:58:10', NULL, 0);
INSERT INTO `per_role_menu` VALUES (22, 7, 13, 1, '2022-03-20 16:58:10', NULL, 0);
INSERT INTO `per_role_menu` VALUES (23, 7, 5, 1, '2022-03-20 16:58:10', NULL, 0);
INSERT INTO `per_role_menu` VALUES (24, 1, 15, 1, '2022-03-22 13:57:49', '2023-01-01 10:32:43', 0);
INSERT INTO `per_role_menu` VALUES (25, 1, 17, 1, '2022-03-22 13:57:49', '2023-01-01 10:32:45', 0);
INSERT INTO `per_role_menu` VALUES (26, 1, 18, 1, '2022-03-22 22:09:01', '2023-01-01 10:32:48', 0);
INSERT INTO `per_role_menu` VALUES (27, 1, 14, 1, '2022-03-25 11:08:03', '2023-01-01 10:32:52', 0);
INSERT INTO `per_role_menu` VALUES (28, 1, 19, 1, '2022-03-26 12:30:24', '2023-01-01 10:32:53', 0);
INSERT INTO `per_role_menu` VALUES (29, 1, 20, 1, '2022-03-29 13:10:20', '2023-01-01 10:32:56', 0);
INSERT INTO `per_role_menu` VALUES (30, 1, 16, 1, '2022-04-06 15:20:14', '2023-01-01 10:33:00', 0);
INSERT INTO `per_role_menu` VALUES (31, 9, 17, 1, '2022-04-10 21:30:22', NULL, 0);
INSERT INTO `per_role_menu` VALUES (32, 9, 15, 1, '2022-04-10 21:30:23', NULL, 0);
INSERT INTO `per_role_menu` VALUES (33, 9, 16, 1, '2022-04-10 21:30:23', NULL, 0);
INSERT INTO `per_role_menu` VALUES (34, 9, 18, 1, '2022-04-10 21:30:23', NULL, 0);
INSERT INTO `per_role_menu` VALUES (35, 3, 13, 1, '2022-05-13 13:36:31', NULL, 0);
INSERT INTO `per_role_menu` VALUES (36, 2, 19, 1, '2023-01-02 22:19:09', NULL, 0);
INSERT INTO `per_role_menu` VALUES (37, 2, 14, 1, '2023-01-02 22:19:09', NULL, 0);
INSERT INTO `per_role_menu` VALUES (38, 4, 6, 1, '2023-01-10 20:38:22', NULL, 0);
INSERT INTO `per_role_menu` VALUES (39, 4, 3, 1, '2023-01-10 20:38:22', NULL, 0);
INSERT INTO `per_role_menu` VALUES (40, 4, 4, 1, '2023-01-10 20:38:22', NULL, 0);

-- ----------------------------
-- Table structure for per_staff_role
-- ----------------------------
DROP TABLE IF EXISTS `per_staff_role`;
CREATE TABLE `per_staff_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '员工id',
  `role_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '角色id',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0禁用，1正常，默认1',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of per_staff_role
-- ----------------------------
INSERT INTO `per_staff_role` VALUES (1, 1, 1, 1, '2022-03-02 16:13:59', '2022-03-20 12:56:12', 0);
INSERT INTO `per_staff_role` VALUES (2, 29, 2, 1, '2022-03-04 15:11:38', '2022-03-20 12:21:47', 0);
INSERT INTO `per_staff_role` VALUES (3, 29, 3, 1, '2022-03-04 15:11:39', '2022-03-20 12:21:51', 0);
INSERT INTO `per_staff_role` VALUES (4, 3, 3, 0, '2022-03-11 11:03:43', '2022-12-29 11:58:29', 0);
INSERT INTO `per_staff_role` VALUES (5, 3, 9, 0, '2022-03-11 11:03:44', '2022-03-20 12:21:55', 0);
INSERT INTO `per_staff_role` VALUES (6, 3, 5, 0, '2022-03-11 11:51:41', '2022-12-29 11:58:29', 0);
INSERT INTO `per_staff_role` VALUES (7, 31, 9, 1, '2022-03-20 12:04:56', NULL, 0);
INSERT INTO `per_staff_role` VALUES (8, 1, 9, 0, '2022-03-20 12:32:45', '2022-03-22 14:08:02', 0);
INSERT INTO `per_staff_role` VALUES (9, 6, 9, 1, '2022-03-20 16:41:12', NULL, 0);
INSERT INTO `per_staff_role` VALUES (10, 6, 2, 1, '2022-03-20 16:41:12', NULL, 0);
INSERT INTO `per_staff_role` VALUES (11, 9, 7, 1, '2022-03-20 16:58:40', NULL, 0);
INSERT INTO `per_staff_role` VALUES (12, 2, 9, 0, '2022-04-10 21:29:21', '2023-01-02 22:20:00', 0);
INSERT INTO `per_staff_role` VALUES (13, 3, 6, 1, '2022-12-29 11:58:29', NULL, 0);
INSERT INTO `per_staff_role` VALUES (14, 3, 8, 1, '2022-12-29 11:58:30', NULL, 0);
INSERT INTO `per_staff_role` VALUES (15, 2, 2, 0, '2023-01-02 22:19:27', '2023-02-02 21:29:58', 0);
INSERT INTO `per_staff_role` VALUES (16, 1, 4, 0, '2023-01-08 22:01:12', '2023-01-08 22:01:23', 0);
INSERT INTO `per_staff_role` VALUES (17, 2, 4, 1, '2023-02-02 21:51:59', NULL, 0);

-- ----------------------------
-- Table structure for sal_salary
-- ----------------------------
DROP TABLE IF EXISTS `sal_salary`;
CREATE TABLE `sal_salary`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '员工id',
  `base_salary` decimal(10, 3) NULL DEFAULT NULL COMMENT '基础工资',
  `overtime_salary` decimal(10, 3) NULL DEFAULT NULL COMMENT '加班费',
  `subsidy` decimal(10, 3) UNSIGNED NULL DEFAULT NULL COMMENT '生活补贴',
  `bonus` decimal(10, 3) UNSIGNED NULL DEFAULT NULL COMMENT '奖金',
  `total_salary` decimal(10, 3) UNSIGNED NULL DEFAULT NULL COMMENT '总工资',
  `late_deduct` decimal(10, 3) NULL DEFAULT NULL COMMENT '早退扣款',
  `leave_deduct` decimal(10, 3) NULL DEFAULT NULL COMMENT '休假扣款',
  `leave_early_deduct` decimal(10, 3) NULL DEFAULT NULL COMMENT '早退扣款',
  `absenteeism_deduct` decimal(10, 3) NULL DEFAULT NULL COMMENT '旷工扣款',
  `month` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月份',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工工资表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sal_salary
-- ----------------------------
INSERT INTO `sal_salary` VALUES (1, 1, 7000.000, NULL, 400.000, 200.000, 5595.000, 0.000, 640.000, 0.000, 100.000, '202204', 'jack的工资明细', '2022-04-06 14:40:36', '2022-04-09 15:15:56', 0);
INSERT INTO `sal_salary` VALUES (2, 1, 6800.000, NULL, 0.000, 100.000, 4795.000, 50.000, 160.000, 50.000, 100.000, '202205', NULL, '2022-04-06 14:44:54', '2022-05-06 16:40:06', 0);
INSERT INTO `sal_salary` VALUES (3, 1, 6500.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '202105', NULL, '2022-04-06 14:45:09', '2022-04-09 16:02:45', 0);
INSERT INTO `sal_salary` VALUES (4, 1, 7000.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '202112', NULL, '2022-04-06 14:45:22', '2022-04-09 16:02:39', 0);
INSERT INTO `sal_salary` VALUES (5, 2, 6000.000, NULL, 600.000, 200.000, 5270.000, 0.000, 240.000, 50.000, 0.000, '202204', NULL, '2022-04-06 14:45:42', '2022-04-09 17:02:55', 0);
INSERT INTO `sal_salary` VALUES (6, 2, 7000.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '202104', NULL, '2022-04-06 14:46:09', '2022-04-09 16:02:34', 0);
INSERT INTO `sal_salary` VALUES (7, 3, 6000.000, NULL, 0.000, 0.000, 5175.000, NULL, NULL, NULL, NULL, '202204', NULL, '2022-04-06 22:58:16', '2022-04-06 22:58:16', 0);
INSERT INTO `sal_salary` VALUES (8, 1, 6000.000, NULL, 0.000, 0.000, 4735.000, NULL, NULL, NULL, NULL, '202202', NULL, '2022-04-07 10:39:24', '2022-04-07 10:39:24', 0);
INSERT INTO `sal_salary` VALUES (9, 4, 6000.000, NULL, 500.000, 300.000, 5710.000, NULL, NULL, NULL, NULL, '202204', NULL, '2022-04-08 10:04:50', '2022-04-08 10:04:50', 0);
INSERT INTO `sal_salary` VALUES (10, 5, 7000.000, NULL, 0.000, 0.000, 5368.000, NULL, NULL, NULL, NULL, '202204', NULL, '2022-04-08 15:34:50', '2022-04-08 15:34:50', 0);
INSERT INTO `sal_salary` VALUES (11, 6, 8000.000, NULL, 0.000, 0.000, 6340.000, 0.000, 0.000, 50.000, 0.000, '202204', NULL, '2022-04-08 18:37:05', '2022-04-08 18:37:05', 0);
INSERT INTO `sal_salary` VALUES (12, 7, 6000.000, NULL, 1000.000, 0.000, 5710.000, 0.000, 0.000, 0.000, 0.000, '202204', NULL, '2022-04-08 18:46:20', '2022-04-08 18:46:20', 0);
INSERT INTO `sal_salary` VALUES (13, 8, 6000.000, NULL, 0.000, 0.000, 2100.000, 0.000, 0.000, 0.000, 0.000, '202204', NULL, '2022-04-08 20:45:43', '2022-04-08 20:45:43', 0);
INSERT INTO `sal_salary` VALUES (14, 9, 6000.000, NULL, 0.000, 0.000, 5275.000, 0.000, 0.000, 0.000, 0.000, '202204', NULL, '2022-04-08 20:58:47', '2022-04-08 20:58:47', 0);
INSERT INTO `sal_salary` VALUES (15, 1, 6666.000, NULL, 0.000, 0.000, 5401.000, 0.000, 0.000, 0.000, 0.000, '202203', NULL, '2022-04-09 16:35:15', '2022-04-09 16:35:15', 0);
INSERT INTO `sal_salary` VALUES (16, 10, 8000.000, NULL, 0.000, 0.000, 5030.000, 0.000, 0.000, 0.000, 0.000, '202205', NULL, '2022-05-02 21:39:53', '2022-05-06 17:41:45', 0);
INSERT INTO `sal_salary` VALUES (17, 2, 6050.000, NULL, 0.000, 0.000, 4660.000, 50.000, 0.000, 0.000, 100.000, '202205', NULL, '2022-05-02 21:40:12', '2022-05-06 17:42:20', 0);
INSERT INTO `sal_salary` VALUES (18, 3, 6000.000, NULL, 0.000, 0.000, 4632.000, 50.000, 0.000, 100.000, 300.000, '202205', NULL, '2022-05-02 21:40:21', '2022-05-02 21:40:21', 0);
INSERT INTO `sal_salary` VALUES (19, 4, 7000.000, NULL, 0.000, 0.000, 5510.000, 100.000, 0.000, 0.000, 300.000, '202205', NULL, '2022-05-02 21:40:30', '2022-05-02 21:40:30', 0);
INSERT INTO `sal_salary` VALUES (20, 5, 7500.000, NULL, 0.000, 0.000, 5868.000, 0.000, 0.000, 0.000, 0.000, '202205', NULL, '2022-05-02 21:40:44', '2022-05-02 21:40:44', 0);
INSERT INTO `sal_salary` VALUES (21, 6, 6500.000, NULL, 0.000, 0.000, 4890.000, 0.000, 0.000, 0.000, 0.000, '202205', NULL, '2022-05-02 21:40:54', '2022-05-02 21:40:54', 0);
INSERT INTO `sal_salary` VALUES (22, 7, 7878.000, NULL, 0.000, 0.000, 6588.000, 0.000, 0.000, 0.000, 0.000, '202205', NULL, '2022-05-02 21:41:03', '2022-05-02 21:41:03', 0);
INSERT INTO `sal_salary` VALUES (23, 8, 7999.000, NULL, 0.000, 0.000, 4099.000, 0.000, 0.000, 0.000, 0.000, '202205', NULL, '2022-05-02 21:41:12', '2022-05-06 17:42:10', 0);
INSERT INTO `sal_salary` VALUES (24, 9, 7000.000, NULL, 0.000, 0.000, 6275.000, 0.000, 0.000, 0.000, 0.000, '202205', NULL, '2022-05-02 21:41:23', '2022-05-06 17:42:34', 0);
INSERT INTO `sal_salary` VALUES (25, 11, 7000.000, NULL, 200.000, 0.000, 5345.000, 0.000, 0.000, 0.000, 0.000, '202205', NULL, '2022-05-13 08:28:04', '2022-05-13 08:28:04', 0);

-- ----------------------------
-- Table structure for sal_salary_deduct
-- ----------------------------
DROP TABLE IF EXISTS `sal_salary_deduct`;
CREATE TABLE `sal_salary_deduct`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '部门id',
  `type_num` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '扣款类型，0迟到，1早退，2旷工，3休假',
  `deduct` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '每次扣款金额',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工资扣除表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sal_salary_deduct
-- ----------------------------
INSERT INTO `sal_salary_deduct` VALUES (1, 2, 2, 200, '旷工绝不姑息', '2022-03-27 22:55:07', '2023-01-01 20:59:30', 0);
INSERT INTO `sal_salary_deduct` VALUES (2, 2, 1, 0, NULL, '2022-03-28 07:20:50', '2023-01-01 20:59:32', 0);
INSERT INTO `sal_salary_deduct` VALUES (3, 2, 3, 0, NULL, '2022-03-31 19:57:56', '2023-01-01 20:59:35', 0);
INSERT INTO `sal_salary_deduct` VALUES (4, 2, 0, 100, NULL, '2023-01-01 21:38:28', '2023-01-01 21:38:28', 0);

-- ----------------------------
-- Table structure for soc_city
-- ----------------------------
DROP TABLE IF EXISTS `soc_city`;
CREATE TABLE `soc_city`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保城市',
  `average_salary` decimal(10, 3) UNSIGNED NULL DEFAULT NULL COMMENT '职工上年度平均月工资',
  `lower_salary` decimal(10, 3) NULL DEFAULT NULL COMMENT '职工上年度最低月工资',
  `soc_upper_limit` decimal(10, 3) UNSIGNED NULL DEFAULT NULL COMMENT '职工社保缴纳基数上限',
  `soc_lower_limit` decimal(10, 3) UNSIGNED NULL DEFAULT NULL COMMENT '职工社保缴纳基数下限',
  `hou_upper_limit` decimal(10, 3) NULL DEFAULT NULL COMMENT '公积金缴纳基数上限',
  `hou_lower_limit` decimal(10, 3) NULL DEFAULT NULL COMMENT '公积金缴纳基数下限',
  `per_pension_rate` decimal(6, 3) UNSIGNED NULL DEFAULT NULL COMMENT '个人养老保险缴费比例',
  `com_pension_rate` decimal(6, 3) UNSIGNED NULL DEFAULT NULL COMMENT '企业养老保险缴费比例',
  `per_medical_rate` decimal(6, 3) UNSIGNED NULL DEFAULT NULL COMMENT '个人医疗保险缴费比例',
  `com_medical_rate` decimal(6, 3) UNSIGNED NULL DEFAULT NULL COMMENT '企业医疗保险缴费比例',
  `per_unemployment_rate` decimal(6, 3) UNSIGNED NULL DEFAULT NULL COMMENT '个人失业保险缴费比例',
  `com_unemployment_rate` decimal(6, 3) UNSIGNED NULL DEFAULT NULL COMMENT '企业失业保险缴费比例',
  `com_maternity_rate` decimal(6, 3) UNSIGNED NULL DEFAULT NULL COMMENT '企业生育保险缴费比例',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参保城市表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soc_city
-- ----------------------------
INSERT INTO `soc_city` VALUES (1, '成都', 10000.000, 3000.000, 30000.000, 6000.000, 30000.000, 3000.000, 0.090, 0.160, 0.020, 0.090, 0.007, 0.006, 0.010, NULL, '2022-03-22 15:53:53', '2022-03-24 23:05:28', 0);
INSERT INTO `soc_city` VALUES (2, '重庆', 8000.000, 3000.000, 24000.000, 4800.000, 24000.000, 3000.000, 0.100, 0.100, 0.020, 0.085, 0.005, 0.009, 0.028, NULL, '2022-03-22 16:28:43', '2022-03-23 16:28:51', 0);
INSERT INTO `soc_city` VALUES (3, '北京', 12000.000, 4000.000, 36000.000, 7200.000, 36000.000, 4000.000, 0.080, 0.120, 0.020, 0.090, 0.011, 0.005, 0.008, NULL, '2022-03-23 22:33:51', '2022-03-23 22:33:51', 0);
INSERT INTO `soc_city` VALUES (4, '上海', 15000.000, 10000.000, 45000.000, 9000.000, 45000.000, 10000.000, 0.076, 0.022, 0.010, 0.020, 0.100, 0.120, 0.090, NULL, '2022-03-23 23:29:22', '2022-04-13 11:12:38', 0);
INSERT INTO `soc_city` VALUES (5, '武汉', 5000.000, 3400.000, 15000.000, 3000.000, 15000.000, 3400.000, 0.100, 0.130, 0.100, 0.130, 0.140, 0.021, 0.025, NULL, '2022-03-31 20:02:30', '2022-04-12 17:58:51', 0);
INSERT INTO `soc_city` VALUES (6, '深圳', 13000.000, 10000.000, 39000.000, 7800.000, 39000.000, 10000.000, 0.050, 0.070, 0.030, 0.060, 0.015, 0.010, 0.010, NULL, '2022-05-02 22:10:01', '2022-05-02 22:10:01', 0);

-- ----------------------------
-- Table structure for soc_insurance
-- ----------------------------
DROP TABLE IF EXISTS `soc_insurance`;
CREATE TABLE `soc_insurance`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市id',
  `staff_id` int(11) NULL DEFAULT NULL COMMENT '员工id',
  `house_base` decimal(10, 3) NULL DEFAULT NULL COMMENT '公积金基数',
  `per_house_rate` decimal(6, 3) NULL DEFAULT NULL COMMENT '公积金个人缴纳比例',
  `per_house_pay` decimal(10, 3) NULL DEFAULT NULL COMMENT '公积金个人缴纳费用',
  `com_house_rate` decimal(6, 3) NULL DEFAULT NULL COMMENT '公积金企业缴纳比例',
  `com_house_pay` decimal(10, 3) NULL DEFAULT NULL COMMENT '公积金企业缴纳费用',
  `social_base` decimal(10, 3) NULL DEFAULT NULL COMMENT '社保基数',
  `com_social_pay` decimal(10, 3) NULL DEFAULT NULL COMMENT '社保企业缴纳费用',
  `per_social_pay` decimal(10, 3) NULL DEFAULT NULL COMMENT '社保个人缴纳费用',
  `com_injury_rate` decimal(6, 3) NULL DEFAULT NULL COMMENT '工伤保险企业缴纳比例',
  `social_remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社保备注',
  `house_remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公积金备注',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0未支付，1已支付，2支付失败',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工五险一金表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soc_insurance
-- ----------------------------
INSERT INTO `soc_insurance` VALUES (1, 4, 1, 10000.000, 0.080, 800.000, 0.050, 500.000, 9000.000, 2313.000, 1674.000, 0.005, '社保个人缴纳1674元', '公积金个人缴纳800元', 0, '2022-03-25 00:40:24', '2022-03-25 00:40:24', 0);
INSERT INTO `soc_insurance` VALUES (2, 3, 2, 5000.000, 0.080, 400.000, 0.080, 400.000, 8000.000, 2224.000, 840.000, 0.015, NULL, NULL, 0, '2022-04-06 20:38:41', '2022-04-06 20:38:41', 0);
INSERT INTO `soc_insurance` VALUES (3, 4, 3, 3000.000, 0.120, 360.000, 0.120, 360.000, 3000.000, 813.000, 558.000, 0.019, NULL, NULL, 0, '2022-04-06 20:39:47', '2022-04-06 20:39:47', 0);
INSERT INTO `soc_insurance` VALUES (4, 3, 4, 5000.000, 0.050, 250.000, 0.050, 250.000, 8000.000, 2256.000, 840.000, 0.019, NULL, NULL, 0, '2022-04-07 10:42:09', '2022-04-07 10:42:09', 0);
INSERT INTO `soc_insurance` VALUES (5, 5, 5, 3400.000, 0.080, 272.000, 0.080, 272.000, 4000.000, 1916.000, 1360.000, 0.003, NULL, NULL, 0, '2022-04-07 10:43:13', '2022-04-07 10:43:13', 0);
INSERT INTO `soc_insurance` VALUES (6, 5, 6, 5000.000, 0.050, 250.000, 0.050, 250.000, 4000.000, 1916.000, 1360.000, 0.003, NULL, NULL, 0, '2022-04-07 10:44:26', '2022-04-07 10:44:26', 0);
INSERT INTO `soc_insurance` VALUES (7, 3, 7, 4500.000, 0.100, 450.000, 0.100, 450.000, 8000.000, 2120.000, 840.000, 0.002, NULL, NULL, 0, '2022-04-08 18:38:15', '2022-04-08 18:38:15', 0);
INSERT INTO `soc_insurance` VALUES (8, 5, 8, 10000.000, 0.050, 500.000, 0.050, 500.000, 10000.000, 4910.000, 3400.000, 0.015, NULL, NULL, 0, '2022-04-08 20:38:15', '2022-04-08 20:38:15', 0);
INSERT INTO `soc_insurance` VALUES (9, 2, 9, 4000.000, 0.050, 200.000, 0.050, 200.000, 5000.000, 1375.000, 525.000, 0.010, NULL, NULL, 0, '2022-04-08 20:50:13', '2022-04-08 20:50:13', 0);
INSERT INTO `soc_insurance` VALUES (10, 5, 10, 5000.000, 0.050, 250.000, 0.050, 250.000, 8000.000, 3888.000, 2720.000, 0.010, NULL, NULL, 0, '2022-05-02 21:39:04', '2022-05-02 21:39:04', 0);
INSERT INTO `soc_insurance` VALUES (11, 6, 11, 10000.000, 0.100, 1000.000, 0.100, 1000.000, 9000.000, 1485.000, 855.000, 0.015, NULL, NULL, 0, '2022-05-12 22:03:25', '2022-05-12 22:03:25', 0);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门编码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `mor_start_time` time(0) NULL DEFAULT NULL COMMENT '上午上班时间',
  `mor_end_time` time(0) NULL DEFAULT NULL COMMENT '上午下班时间',
  `aft_start_time` time(0) NULL DEFAULT NULL COMMENT '下午上班时间',
  `aft_end_time` time(0) NULL DEFAULT NULL COMMENT '下午下班时间',
  `total_work_time` decimal(3, 1) NULL DEFAULT NULL COMMENT '员工工作总时长',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门备注',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级部门id，0根部门',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, NULL, '运维部门', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-07 16:15:57', '2022-04-08 12:09:04', 0);
INSERT INTO `sys_dept` VALUES (2, NULL, '运维1部', '06:00:00', '11:30:00', '13:00:00', '17:00:00', 9.5, '核心部门', 1, '2022-03-07 16:16:11', '2023-02-17 21:46:15', 0);
INSERT INTO `sys_dept` VALUES (3, NULL, '运维2部', '06:00:00', '10:30:00', '13:30:00', '17:30:00', 8.5, NULL, 1, '2022-03-07 16:16:30', '2023-01-01 20:06:09', 0);
INSERT INTO `sys_dept` VALUES (4, NULL, '销售部门', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-07 16:16:46', '2022-05-06 16:23:09', 0);
INSERT INTO `sys_dept` VALUES (5, NULL, '销售1部', '06:00:00', '10:00:00', '13:00:00', '16:30:00', 7.5, NULL, 4, '2022-03-07 16:16:57', '2022-05-06 16:23:26', 0);
INSERT INTO `sys_dept` VALUES (6, NULL, '销售2部', '06:00:00', '10:30:00', '13:30:00', '17:00:00', 8.0, NULL, 4, '2022-03-07 16:17:10', '2022-05-06 16:23:37', 0);
INSERT INTO `sys_dept` VALUES (7, NULL, '财务部门', NULL, NULL, NULL, NULL, NULL, '财务', 0, '2022-03-07 16:17:40', '2022-05-06 16:24:09', 0);
INSERT INTO `sys_dept` VALUES (8, NULL, '财务1部', '06:00:00', '10:00:00', '14:00:00', '18:00:00', 8.0, NULL, 7, '2022-03-07 16:17:49', '2022-03-07 16:18:11', 0);
INSERT INTO `sys_dept` VALUES (9, NULL, '财务2部', '06:00:00', '10:00:00', '13:00:00', '16:30:00', 7.5, NULL, 7, '2022-03-07 16:18:02', '2022-03-07 16:18:14', 0);
INSERT INTO `sys_dept` VALUES (10, NULL, '财务3部', '06:00:00', '11:30:00', '13:00:00', '16:30:00', 9.0, NULL, 7, '2022-03-07 16:18:32', '2022-03-07 16:18:32', 0);
INSERT INTO `sys_dept` VALUES (11, NULL, '开发部门', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-07 16:18:41', '2022-03-07 16:18:41', 0);
INSERT INTO `sys_dept` VALUES (12, NULL, '开发1部', '06:00:00', '12:00:00', '13:30:00', '17:30:00', 10.0, NULL, 11, '2022-03-07 16:19:00', '2022-03-07 16:19:10', 0);
INSERT INTO `sys_dept` VALUES (13, NULL, '开发2部', '06:00:00', '11:00:00', '14:00:00', '17:30:00', 8.5, NULL, 11, '2022-03-07 22:21:39', '2022-03-07 22:21:39', 0);
INSERT INTO `sys_dept` VALUES (14, NULL, '财务4部', '06:00:00', '10:30:00', '14:30:00', '18:00:00', 8.0, NULL, 7, '2022-03-20 12:08:16', '2022-03-20 12:08:16', 0);
INSERT INTO `sys_dept` VALUES (15, NULL, '运维3部', '06:00:00', '12:00:00', '13:30:00', '18:00:00', 10.5, NULL, 1, '2022-03-26 17:09:55', '2022-03-26 17:09:55', 0);
INSERT INTO `sys_dept` VALUES (16, NULL, '人事部门', NULL, NULL, NULL, NULL, NULL, '人力资源管理', 0, '2022-03-26 17:13:01', '2022-05-02 22:22:30', 0);
INSERT INTO `sys_dept` VALUES (17, NULL, '人事1部', '07:00:00', '11:00:00', '13:30:00', '17:30:00', 8.0, NULL, 16, '2022-03-26 17:17:26', '2022-04-08 12:51:21', 0);
INSERT INTO `sys_dept` VALUES (18, NULL, '人事2部', '06:10:00', '10:40:00', '13:40:00', '17:10:00', 8.0, NULL, 16, '2022-12-29 22:17:00', '2022-12-29 22:32:26', 0);
INSERT INTO `sys_dept` VALUES (19, NULL, '人事3部', '06:10:00', '10:20:00', '13:30:00', '17:00:00', 7.7, NULL, 16, '2022-12-29 22:17:31', '2022-12-29 22:32:30', 0);
INSERT INTO `sys_dept` VALUES (20, NULL, '运维4部', '06:00:00', '11:00:00', '13:00:00', '17:30:00', 9.5, NULL, 1, '2023-02-17 22:16:33', '2023-02-17 22:16:33', 0);

-- ----------------------------
-- Table structure for sys_docs
-- ----------------------------
DROP TABLE IF EXISTS `sys_docs`;
CREATE TABLE `sys_docs`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `old_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件的原名称',
  `md5` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件md5信息',
  `size` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '文件大小KB',
  `staff_id` int(11) NULL DEFAULT NULL COMMENT '文件上传者id',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件备注',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0未删除，1已删除，默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_docs
-- ----------------------------
INSERT INTO `sys_docs` VALUES (1, '321ed1773f4ab3883e73.jpg', 'jpg', 'p7.jpg', '04989f48db70d5be991081da9207cc8d', 664, 1, '用户头像！', '2022-03-31 19:23:31', '2023-01-14 20:43:59', 0);
INSERT INTO `sys_docs` VALUES (2, '1837fd34d247d79facff.jpg', 'jpg', 'p8.jpg', '65e9462e351242ecf79a99237d528008', 463, 2, NULL, '2022-03-31 19:49:24', '2023-01-14 20:44:02', 0);
INSERT INTO `sys_docs` VALUES (3, '321ed1773f4ab3883e73.jpg', 'jpg', 'p7.jpg', '04989f48db70d5be991081da9207cc8d', 664, 3, NULL, '2022-05-06 15:53:48', '2023-01-14 20:44:04', 1);
INSERT INTO `sys_docs` VALUES (4, '246e3ac2454a6e999e4d.jpg', 'jpg', 'p4.jpg', 'd181f02527a7100ad940edb7d238f3a6', 366, 4, NULL, '2022-05-06 17:14:20', '2023-01-14 20:44:06', 1);
INSERT INTO `sys_docs` VALUES (5, '246e3ac2454a6e999e4d.jpg', 'jpg', 'p4.jpg', 'd181f02527a7100ad940edb7d238f3a6', 366, 5, NULL, '2022-05-06 17:14:57', '2023-01-14 20:44:08', 0);
INSERT INTO `sys_docs` VALUES (6, '246e3ac2454a6e999e4d.jpg', 'jpg', 'p4.jpg', 'd181f02527a7100ad940edb7d238f3a6', 366, 7, NULL, '2022-05-06 17:18:11', '2023-01-14 20:44:11', 1);
INSERT INTO `sys_docs` VALUES (7, 'f86049588a426787050c.jpg', 'jpg', 'p16.jpg', '14a7858c87be310c48a5429577d63371', 706, 1, NULL, '2022-05-06 17:20:00', '2023-01-14 20:44:13', 0);
INSERT INTO `sys_docs` VALUES (8, '549625fc3a4d79b823d4.xlsx', 'xlsx', '部门数据.xlsx', '25b47f6a70f4c4f2bc14aecacef6a05b', 9, 1, '部门考勤时间表', '2022-05-06 17:21:06', '2023-01-14 20:44:15', 0);
INSERT INTO `sys_docs` VALUES (9, 'a9d818afca4b93a05047.xlsx', 'xlsx', '七月考勤机数据.xlsx', '2a5582c8f2edd6b3f19e4529952df622', 9, 1, '七月考勤数据', '2022-05-12 20:40:15', '2023-01-14 20:44:18', 0);
INSERT INTO `sys_docs` VALUES (10, '9ee44e0dc945e5a41828.jpg', 'jpg', 'p19.jpg', '176b8a51e4f96c3dcd6806bbdf9de678', 5, 1, NULL, '2022-05-13 08:41:51', '2023-01-14 20:44:19', 0);
INSERT INTO `sys_docs` VALUES (11, '1de345e365444686d351.jpg', 'jpg', 'p14.jpg', 'd5e7f1b67e63ede94533476864a35009', 673, 1, NULL, '2022-05-14 19:05:20', '2023-01-14 20:44:22', 0);
INSERT INTO `sys_docs` VALUES (12, '1de345e365444686d351.jpg', 'jpg', 'p14.jpg', 'd5e7f1b67e63ede94533476864a35009', 673, 1, NULL, '2022-05-14 19:06:03', '2023-01-14 20:44:25', 1);
INSERT INTO `sys_docs` VALUES (13, '321ed1773f4ab3883e73.jpg', 'jpg', 'p7.jpg', '04989f48db70d5be991081da9207cc8d', 664, 1, NULL, '2022-05-14 19:08:21', '2023-01-14 20:44:26', 1);
INSERT INTO `sys_docs` VALUES (14, '1de345e365444686d351.jpg', 'jpg', 'p14.jpg', 'd5e7f1b67e63ede94533476864a35009', 673, 1, NULL, '2022-05-14 19:09:06', '2023-01-14 20:44:29', 1);
INSERT INTO `sys_docs` VALUES (15, '1de345e365444686d351.jpg', 'jpg', 'p14.jpg', 'd5e7f1b67e63ede94533476864a35009', 673, 1, NULL, '2022-05-14 19:10:07', '2023-01-14 20:44:34', 1);
INSERT INTO `sys_docs` VALUES (16, '1de345e365444686d351.jpg', 'jpg', 'p14.jpg', 'd5e7f1b67e63ede94533476864a35009', 673, 3, NULL, '2022-05-14 19:10:26', '2023-01-14 20:44:36', 1);
INSERT INTO `sys_docs` VALUES (17, '9ee44e0dc945e5a41828.jpg', 'jpg', 'p19.jpg', '176b8a51e4f96c3dcd6806bbdf9de678', 5, 4, NULL, '2023-01-12 21:58:46', '2023-01-14 20:44:39', 0);
INSERT INTO `sys_docs` VALUES (18, 'd24549d1ec4625b8985b.jpg', 'jpg', 'p21.jpg', 'b3db091864202253467dfdcde6e686ae', 428, 1, NULL, '2023-01-12 23:06:18', '2023-01-14 20:44:42', 0);
INSERT INTO `sys_docs` VALUES (19, '679faa1f07427f9eb408.jpg', 'jpg', 'p1.jpg', 'e5384b8b89b47e3d0d12c98919e9fbd3', 368, 3, NULL, '2023-01-13 20:39:41', '2023-01-14 20:44:46', 0);
INSERT INTO `sys_docs` VALUES (20, 'ea278b7591476992a89f.jpg', 'jpg', 'p2.jpg', '47479bb6ee1859b2a4bac82f2b48f7b3', 553, 4, NULL, '2023-01-13 20:45:44', '2023-01-14 20:44:50', 0);
INSERT INTO `sys_docs` VALUES (21, '367decaff941e98ae727.jpg', 'jpg', 'p24.jpg', '48dba2b6d3f625db3d71a8aeafaad146', 314, 5, NULL, '2023-01-13 20:57:11', '2023-01-14 20:44:53', 0);
INSERT INTO `sys_docs` VALUES (22, '7af58033ce4a4cafce49.jpg', 'jpg', 'p11.jpg', 'f29eab97e6c04bc8a359cc7325ccdafe', 56, 6, NULL, '2023-01-13 21:34:18', '2023-01-14 20:44:54', 0);
INSERT INTO `sys_docs` VALUES (23, '9ee44e0dc945e5a41828.jpg', 'jpg', 'p19.jpg', '176b8a51e4f96c3dcd6806bbdf9de678', 5, 7, NULL, '2023-01-13 21:36:50', '2023-01-14 20:44:58', 0);
INSERT INTO `sys_docs` VALUES (24, '2d9822743d437d995588.jpg', 'jpg', 'p23.jpg', '92c34b1357757bd99a6030963e7eca16', 343, 8, NULL, '2023-01-13 21:37:39', '2023-01-14 20:45:02', 0);
INSERT INTO `sys_docs` VALUES (25, '1de345e365444686d351.jpg', 'jpg', 'p14.jpg', 'd5e7f1b67e63ede94533476864a35009', 673, 1, NULL, '2023-01-13 21:38:34', '2023-01-14 20:45:06', 0);
INSERT INTO `sys_docs` VALUES (26, '9ee44e0dc945e5a41828.jpg', 'jpg', 'p19.jpg', '176b8a51e4f96c3dcd6806bbdf9de678', 5, 1, NULL, '2023-01-13 21:38:56', '2023-01-14 20:45:08', 0);
INSERT INTO `sys_docs` VALUES (27, 'f86049588a426787050c.jpg', 'jpg', 'p16.jpg', '14a7858c87be310c48a5429577d63371', 706, 1, NULL, '2023-01-13 21:51:17', '2023-01-14 20:45:11', 0);
INSERT INTO `sys_docs` VALUES (28, '9ee44e0dc945e5a41828.jpg', 'jpg', 'p19.jpg', '176b8a51e4f96c3dcd6806bbdf9de678', 5, 1, NULL, '2023-01-13 22:05:11', '2023-01-14 20:45:13', 0);
INSERT INTO `sys_docs` VALUES (29, 'fdafbb9d8e486f8173bc.png', 'png', 'bike-riding.png', '8ee3e6d8ff326944177ada97ac0eddcd', 244, 1, NULL, '2023-01-13 22:16:55', '2023-01-14 20:45:15', 0);
INSERT INTO `sys_docs` VALUES (30, '9a3483096a4fbfbc9ddd.jfif', 'jfif', 'p18.jfif', '6c7a6dde84a2ef5bc1f865676a6d1e1a', 14, 1, NULL, '2023-01-13 22:27:45', '2023-01-14 20:45:17', 0);
INSERT INTO `sys_docs` VALUES (31, '9ee44e0dc945e5a41828.jpg', 'jpg', 'p19.jpg', '176b8a51e4f96c3dcd6806bbdf9de678', 5, 2, NULL, '2023-01-13 22:28:26', '2023-01-14 20:45:21', 0);
INSERT INTO `sys_docs` VALUES (32, 'd0447f06f44ffc855176.jfif', 'jfif', '桥.jfif', '8937c895a6ba22b846e36bf483711514', 11, 2, NULL, '2023-01-13 23:07:39', '2023-01-14 20:45:26', 0);
INSERT INTO `sys_docs` VALUES (33, '9ee44e0dc945e5a41828.jpg', 'jpg', 'p19.jpg', '176b8a51e4f96c3dcd6806bbdf9de678', 5, 2, NULL, '2023-01-13 23:13:29', '2023-01-14 20:45:28', 0);
INSERT INTO `sys_docs` VALUES (34, '7af58033ce4a4cafce49.jpg', 'jpg', 'p11.jpg', 'f29eab97e6c04bc8a359cc7325ccdafe', 56, 2, NULL, '2023-01-13 23:25:46', '2023-01-14 20:45:32', 0);
INSERT INTO `sys_docs` VALUES (35, '7b2be351244c07a73c17.png', 'png', '13283136664411027.png', '562fe80ad04680c07a21905cd76bfaa6', 335, 1, '打卡记录', '2023-01-18 22:13:16', '2023-01-18 22:13:16', 0);
INSERT INTO `sys_docs` VALUES (36, 'f73f03365e46559e3be9.png', 'png', 'aliyun.png', '2b2ac5f2166cf0da5de168f82e6a51d4', 4, 1, NULL, '2023-01-18 22:23:50', '2023-01-18 22:23:50', 0);
INSERT INTO `sys_docs` VALUES (37, 'b6288dc6084cb699385c.png', 'png', '微信图片_20210908091611.png', '3272a84fefdd5ccca3083fb2c39e3291', 99, 1, NULL, '2023-01-18 22:25:05', '2023-01-18 22:25:05', 0);
INSERT INTO `sys_docs` VALUES (38, '9ee44e0dc945e5a41828.jpg', 'jpg', 'p19.jpg', '176b8a51e4f96c3dcd6806bbdf9de678', 5, 1, NULL, '2023-01-18 22:34:20', '2023-01-18 22:34:20', 0);
INSERT INTO `sys_docs` VALUES (39, '91d5bfc50e4a84957389.md', 'md', '2020.09.29.md', '702741908915a942f115d26f7ee37dd6', 0, 1, NULL, '2023-01-30 21:05:41', '2023-01-30 21:08:18', 1);
INSERT INTO `sys_docs` VALUES (40, '6f4b8d87af4fa6abed20.md', 'md', '2020.09.29.md', '702741908915a942f115d26f7ee37dd6', 0, 1, NULL, '2023-01-30 21:08:55', '2023-01-30 21:08:55', 0);
INSERT INTO `sys_docs` VALUES (41, 'e168193b9b478fada3a8.jpg', 'jpg', 'avatar.jpg', '14a7a57de1e33443c21a2b383959b5fb', 524, 1, NULL, '2023-01-30 21:15:07', '2023-01-30 21:15:07', 0);
INSERT INTO `sys_docs` VALUES (42, '9ee44e0dc945e5a41828.jpg', 'jpg', 'p19.jpg', '176b8a51e4f96c3dcd6806bbdf9de678', 5, 1, NULL, '2023-01-30 21:25:12', '2023-01-30 21:25:12', 0);
INSERT INTO `sys_docs` VALUES (43, 'd55fc716c641b58b90ec.png', 'png', 'shop.png', 'd4bb42a03dee0ff3f0fab44bc758f23c', 8, 1, NULL, '2023-01-30 21:39:15', '2023-01-30 21:39:15', 0);
INSERT INTO `sys_docs` VALUES (44, '9ee44e0dc945e5a41828.jpg', 'jpg', 'p19.jpg', '176b8a51e4f96c3dcd6806bbdf9de678', 5, 1, NULL, '2023-01-30 21:52:30', '2023-01-30 21:52:30', 0);
INSERT INTO `sys_docs` VALUES (45, '846edf4ee54082ab74fb.png', 'png', 'centos.png', 'ef846128702e81d2db5ec2de0f39d752', 4, 1, NULL, '2023-01-30 21:53:26', '2023-01-30 21:53:26', 0);
INSERT INTO `sys_docs` VALUES (46, '1de345e365444686d351.jpg', 'jpg', 'p14.jpg', 'd5e7f1b67e63ede94533476864a35009', 673, 1, NULL, '2023-02-02 00:44:39', '2023-02-02 00:44:39', 0);
INSERT INTO `sys_docs` VALUES (47, '9ee44e0dc945e5a41828.jpg', 'jpg', 'p19.jpg', '176b8a51e4f96c3dcd6806bbdf9de678', 5, 1, NULL, '2023-02-14 12:09:14', '2023-02-14 12:09:14', 0);
INSERT INTO `sys_docs` VALUES (48, 'b6288dc6084cb699385c.png', 'png', '微信图片_20210908091611.png', '3272a84fefdd5ccca3083fb2c39e3291', 99, 1, NULL, '2023-02-14 21:29:54', '2023-02-14 21:29:54', 0);
INSERT INTO `sys_docs` VALUES (49, '7fa8f6cff14e978f6ce6.jpg', 'jpg', '微信图片_20210908091756.jpg', '5ee74edb84709e570a7653f8c3d278cb', 104, 1, NULL, '2023-02-14 21:38:09', '2023-02-14 21:38:09', 0);
INSERT INTO `sys_docs` VALUES (50, 'b6288dc6084cb699385c.png', 'png', '微信图片_20210908091611.png', '3272a84fefdd5ccca3083fb2c39e3291', 99, 1, NULL, '2023-02-14 21:41:19', '2023-02-14 21:41:19', 0);
INSERT INTO `sys_docs` VALUES (51, '9ee44e0dc945e5a41828.jpg', 'jpg', 'p19.jpg', '176b8a51e4f96c3dcd6806bbdf9de678', 5, 1, NULL, '2023-02-14 21:52:36', '2023-02-14 21:52:36', 0);

-- ----------------------------
-- Table structure for sys_staff
-- ----------------------------
DROP TABLE IF EXISTS `sys_staff`;
CREATE TABLE `sys_staff`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '员工编码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '员工姓名',
  `gender` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '性别，0男，1女，默认0',
  `pwd` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工密码',
  `avatar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工头像',
  `birthday` date NULL DEFAULT NULL COMMENT '员工生日',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工电话',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工备注',
  `dept_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '部门id',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '员工状态，0异常，1正常',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除，0未删除，1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_staff
-- ----------------------------
INSERT INTO `sys_staff` VALUES (1, 'admin', '邱杰', 0, '202CB7007152D234B962AC59075B964B', '9ee44e0dc945e5a41828.jpg', '2000-12-05', '13991849313', '上海', '海归', 12, 1, '2022-01-22 19:46:27', '2023-02-14 21:52:36', 0);
INSERT INTO `sys_staff` VALUES (2, 'staff_2', 'lucy', 1, '202CB7007152D234B962AC59075B964B', '', '1998-04-17', '', '长沙', NULL, 5, 1, '2022-02-22 19:47:58', '2023-02-03 07:56:30', 0);
INSERT INTO `sys_staff` VALUES (3, 'staff_3', '清河', 0, '202CB7007152D234B962AC59075B964B', '', '1996-12-14', '15808425011', '南京', NULL, 9, 1, '2022-12-22 19:48:47', '2023-02-03 09:14:01', 0);
INSERT INTO `sys_staff` VALUES (4, 'staff_4', 'john', 0, '202CB7007152D234B962AC59075B964B', '', '1996-12-05', NULL, NULL, '博士', 3, 0, '2022-10-22 19:49:42', '2023-02-03 09:14:03', 0);
INSERT INTO `sys_staff` VALUES (5, 'staff_5', 'joy', 0, '202CB7007152D234B962AC59075B964B', '', '1997-01-01', NULL, NULL, NULL, 17, 0, '2022-01-27 14:32:37', '2023-02-03 09:14:05', 0);
INSERT INTO `sys_staff` VALUES (6, 'staff_6', 'harden', 0, '202CB7007152D234B962AC59075B964B', '', '1996-06-01', NULL, NULL, '硕士', 17, 1, '2022-01-27 14:36:17', '2023-02-03 09:14:10', 0);
INSERT INTO `sys_staff` VALUES (7, 'staff_7', 'alice', 1, '202CB7007152D234B962AC59075B964B', 'avatar.png', NULL, NULL, NULL, NULL, 5, 1, '2022-11-20 18:00:21', '2023-02-03 07:56:47', 0);
INSERT INTO `sys_staff` VALUES (8, 'staff_8', '温婉', 1, '202CB7007152D234B962AC59075B964B', 'avatar.png', '2000-10-19', NULL, '南充', NULL, 12, 1, '2022-02-20 18:00:54', '2023-02-03 07:56:51', 0);
INSERT INTO `sys_staff` VALUES (9, 'staff_9', '司藤', 1, '827CE7BA16891F84CB0EEA8A706C4C34', '9ee44e0dc945e5a41828.jpg', NULL, NULL, '达那', NULL, 17, 1, '2022-03-20 18:01:04', '2022-05-13 08:41:54', 0);
INSERT INTO `sys_staff` VALUES (10, 'staff_10', '秦放', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, NULL, NULL, NULL, 5, 1, '2022-10-20 18:02:17', '2022-05-06 18:04:40', 0);
INSERT INTO `sys_staff` VALUES (11, 'staff_11', '小雨', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, NULL, NULL, NULL, 3, 0, '2022-02-20 20:06:01', '2023-01-02 22:20:11', 0);
INSERT INTO `sys_staff` VALUES (12, 'staff_12', '小明', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', NULL, '南充', NULL, 12, 1, '2022-05-21 12:51:18', '2022-05-13 08:53:32', 0);
INSERT INTO `sys_staff` VALUES (13, 'staff_13', '梧桐', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', NULL, '北京', NULL, 3, 1, '2022-09-21 12:59:00', '2022-05-06 17:49:34', 0);
INSERT INTO `sys_staff` VALUES (14, 'staff_14', '福瑞', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1997-02-13', NULL, '苍城山', NULL, 10, 1, '2022-02-21 13:02:59', '2022-05-06 17:49:59', 0);
INSERT INTO `sys_staff` VALUES (15, 'staff_15', '瓦房', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '2011-06-08', NULL, '苍城山', NULL, 8, 1, '2022-07-21 13:13:37', '2022-05-06 17:51:27', 0);
INSERT INTO `sys_staff` VALUES (16, 'staff_16', '白金', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1999-06-25', NULL, '金陵', NULL, 3, 0, '2022-04-21 13:30:49', '2023-01-08 22:00:18', 0);
INSERT INTO `sys_staff` VALUES (17, 'staff_17', '小王', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', NULL, '上海', NULL, 13, 1, '2022-12-21 14:19:38', '2022-05-06 16:31:48', 0);
INSERT INTO `sys_staff` VALUES (18, 'staff_18', '白英', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13991849316', '申海', '邵严宽的二太太', 8, 1, '2022-03-21 23:55:31', '2022-05-06 18:00:15', 0);
INSERT INTO `sys_staff` VALUES (19, 'staff_19', '西竹', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13991849316', '禹航', '富豪', 5, 1, '2022-02-22 11:31:00', '2022-05-06 18:00:32', 0);
INSERT INTO `sys_staff` VALUES (20, 'staff_20', '跳跳', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13991849316', '北京', '大学', 3, 1, '2022-06-22 11:53:28', '2022-05-06 18:00:35', 0);
INSERT INTO `sys_staff` VALUES (21, 'staff_21', '何呵', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13991849316', '杭州', '', 9, 1, '2022-03-22 19:46:27', '2022-05-06 18:00:38', 0);
INSERT INTO `sys_staff` VALUES (22, 'staff_22', '秋冬', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13991849316', '成都', '', 10, 1, '2022-01-22 19:46:27', '2022-05-06 18:00:41', 0);
INSERT INTO `sys_staff` VALUES (23, 'staff_23', '林拜', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, NULL, NULL, NULL, 3, 1, '2022-02-22 13:48:13', '2022-03-23 13:49:09', 0);
INSERT INTO `sys_staff` VALUES (24, 'staff_24', '老板', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, NULL, NULL, NULL, 2, 1, '2022-08-23 20:00:41', '2023-02-15 09:56:39', 0);
INSERT INTO `sys_staff` VALUES (25, 'staff_25', '林致', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13991849316', '武汉', '', 5, 1, '2022-01-22 19:46:27', '2022-05-06 18:00:44', 0);
INSERT INTO `sys_staff` VALUES (26, 'staff_26', '柱子', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13991849316', '武汉', '', 13, 1, '2022-08-25 16:52:55', '2022-05-12 20:09:46', 0);
INSERT INTO `sys_staff` VALUES (27, 'staff_27', '秋天', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13991849316', '武汉', '', 9, 1, '2022-02-26 09:34:31', '2022-05-06 18:00:50', 0);
INSERT INTO `sys_staff` VALUES (28, 'staff_28', '李振', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '', '北京', '富豪', 10, 1, '2022-03-26 15:54:50', '2022-05-06 16:34:36', 0);
INSERT INTO `sys_staff` VALUES (29, 'staff_29', '擎天', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, NULL, NULL, NULL, 10, 0, '2022-02-26 15:58:19', '2023-01-08 22:00:42', 0);
INSERT INTO `sys_staff` VALUES (30, 'staff_30', '秦汉', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', NULL, NULL, NULL, 9, 1, '2022-03-20 11:33:05', '2022-05-02 21:32:04', 0);
INSERT INTO `sys_staff` VALUES (31, 'staff_31', '林玥', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1997-03-13', NULL, NULL, NULL, 5, 1, '2022-03-20 11:43:40', '2022-03-23 13:49:09', 0);
INSERT INTO `sys_staff` VALUES (32, 'staff_32', 'jooo', 0, '202CB7007152D234B962AC59075B964B', 'avatar.png', '1998-03-16', NULL, NULL, NULL, 12, 1, '2022-03-20 16:37:07', '2022-04-10 18:34:15', 0);
INSERT INTO `sys_staff` VALUES (33, 'staff_33', '张三', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, '13991849316', '天津', NULL, 2, 1, '2022-03-20 16:57:01', '2022-05-06 18:00:53', 0);
INSERT INTO `sys_staff` VALUES (34, 'staff_34', '李四', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, '13991849316', '北京', NULL, 2, 1, '2022-03-20 16:57:01', '2022-05-06 18:00:57', 0);
INSERT INTO `sys_staff` VALUES (35, 'staff_35', '王五', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, '13991849316', '上海', NULL, 5, 1, '2022-03-20 16:57:01', '2022-05-06 18:01:02', 0);
INSERT INTO `sys_staff` VALUES (36, 'staff_36', 'harden', 0, '202CB7007152D234B962AC59075B964B', 'avatar.png', NULL, NULL, NULL, NULL, 13, 1, '2022-12-28 21:18:12', '2023-01-09 23:04:33', 0);
INSERT INTO `sys_staff` VALUES (37, 'staff_37', '李云龙', 0, '202CB7007152D234B962AC59075B964B', 'avatar.png', '1989-07-12', '13990839927', '平安县', '独立团团长', 19, 1, '2023-01-09 22:58:36', '2023-02-15 09:55:00', 0);

SET FOREIGN_KEY_CHECKS = 1;
