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

 Date: 13/04/2022 18:39:13
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
  `attendance_date` date NULL DEFAULT NULL COMMENT '考勤日期',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '0正常，1迟到，2早退，3旷工，4休假',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工考勤表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of att_attendance
-- ----------------------------
INSERT INTO `att_attendance` VALUES (1, 1, '08:00:08', '11:00:00', '13:01:55', '16:00:16', '2022-02-17', 0, NULL, '2022-03-25 12:05:37', '2022-04-06 11:13:38', 0);
INSERT INTO `att_attendance` VALUES (2, 2, '08:49:43', '11:50:01', '16:03:07', '18:00:01', '2022-02-17', 0, NULL, '2022-03-25 12:05:45', '2022-04-06 11:13:40', 0);
INSERT INTO `att_attendance` VALUES (3, 3, '07:49:49', '12:50:06', '13:03:40', '17:03:52', '2022-02-17', 0, NULL, '2022-03-25 12:05:54', '2022-04-06 11:13:41', 0);
INSERT INTO `att_attendance` VALUES (4, 4, '10:18:00', '12:15:00', '01:12:00', '05:20:00', '2022-02-17', 0, NULL, '2022-03-30 15:58:29', '2022-04-06 11:13:44', 0);
INSERT INTO `att_attendance` VALUES (5, 5, '09:10:00', '12:11:00', '02:00:00', '07:20:00', '2022-02-17', 0, NULL, '2022-03-30 15:58:30', '2022-04-06 11:13:45', 0);
INSERT INTO `att_attendance` VALUES (6, 6, '08:20:00', '12:00:00', '01:30:00', '08:00:00', '2022-02-17', 0, NULL, '2022-03-30 15:58:30', '2022-04-06 11:13:47', 0);
INSERT INTO `att_attendance` VALUES (7, 7, '10:18:00', '12:15:00', '01:12:00', '05:20:00', '2022-03-17', 0, NULL, '2022-03-30 16:16:58', '2022-04-06 11:13:49', 0);
INSERT INTO `att_attendance` VALUES (8, 8, '09:10:00', '12:11:00', '02:00:00', '07:20:00', '2022-03-25', 0, NULL, '2022-03-30 16:16:58', '2022-04-06 11:13:53', 0);
INSERT INTO `att_attendance` VALUES (9, 9, '08:20:00', '12:00:00', '01:30:00', '08:00:00', '2022-03-31', 0, NULL, '2022-03-30 16:16:58', '2022-04-06 11:13:57', 0);
INSERT INTO `att_attendance` VALUES (10, 10, '08:00:08', '11:00:00', '12:56:12', '16:00:16', '2022-03-24', 1, NULL, '2022-03-31 10:07:37', '2022-03-31 16:39:49', 0);
INSERT INTO `att_attendance` VALUES (11, 11, '08:49:43', '11:50:01', '16:03:07', '18:00:01', '2022-03-24', 3, NULL, '2022-03-31 10:07:38', '2022-03-31 16:39:51', 0);
INSERT INTO `att_attendance` VALUES (12, 12, '07:49:49', '12:50:06', '13:03:40', '17:03:52', '2022-03-31', 1, NULL, '2022-03-31 10:07:38', '2022-03-31 16:39:55', 0);
INSERT INTO `att_attendance` VALUES (13, 13, '10:18:00', '12:15:00', '01:12:00', '05:20:00', '2022-03-24', 3, NULL, '2022-03-31 10:07:38', '2022-03-31 16:39:57', 0);
INSERT INTO `att_attendance` VALUES (14, 14, '09:10:00', '12:11:00', '02:00:00', '07:20:00', '2022-03-24', 1, NULL, '2022-03-31 10:07:38', '2022-03-31 16:39:59', 0);
INSERT INTO `att_attendance` VALUES (15, 15, '08:20:00', '12:00:00', '01:30:00', '08:00:00', '2022-03-31', 1, NULL, '2022-03-31 10:07:38', '2022-03-31 16:40:02', 0);
INSERT INTO `att_attendance` VALUES (16, 16, '10:18:00', '12:15:00', '01:12:00', '05:20:00', '2022-03-31', 3, NULL, '2022-03-31 10:07:38', '2022-03-31 16:40:09', 0);
INSERT INTO `att_attendance` VALUES (17, 17, '09:10:00', '12:11:00', '02:00:00', '07:20:00', '2022-03-31', 3, NULL, '2022-03-31 10:07:38', '2022-03-31 16:40:12', 0);
INSERT INTO `att_attendance` VALUES (18, 18, '08:20:00', '12:00:00', '01:30:00', '08:00:00', '2022-03-24', 1, NULL, '2022-03-31 10:07:38', '2022-03-31 16:40:14', 0);
INSERT INTO `att_attendance` VALUES (19, 10, '05:00:00', '11:00:00', '13:01:55', '16:00:16', '2022-03-23', 0, NULL, '2022-03-31 13:01:44', '2022-03-31 13:01:44', 0);
INSERT INTO `att_attendance` VALUES (20, 11, '05:00:00', '11:30:00', '13:30:00', '18:00:00', '2022-03-23', 2, NULL, '2022-03-31 13:01:44', '2022-03-31 13:01:44', 0);
INSERT INTO `att_attendance` VALUES (21, 12, '05:10:00', '12:00:00', '14:01:55', '17:00:16', '2022-03-23', 0, NULL, '2022-03-31 13:01:44', '2022-03-31 13:01:44', 0);
INSERT INTO `att_attendance` VALUES (22, 13, '05:00:00', '11:00:00', '13:01:55', '16:00:16', '2022-03-23', 2, NULL, '2022-03-31 13:01:44', '2022-03-31 13:01:44', 0);
INSERT INTO `att_attendance` VALUES (23, 14, '06:00:00', '11:40:00', '13:10:55', '16:30:16', '2022-03-23', 0, NULL, '2022-03-31 13:01:44', '2022-03-31 13:01:44', 0);
INSERT INTO `att_attendance` VALUES (24, 15, '07:00:00', '12:35:00', '13:12:55', '19:20:16', '2022-03-23', 1, NULL, '2022-03-31 13:01:44', '2022-03-31 13:01:44', 0);
INSERT INTO `att_attendance` VALUES (25, 16, '03:40:00', '13:00:00', '14:09:55', '18:10:16', '2022-03-23', 0, NULL, '2022-03-31 13:01:44', '2022-03-31 13:01:44', 0);
INSERT INTO `att_attendance` VALUES (26, 17, '08:17:00', '12:23:00', '13:01:55', '16:49:16', '2022-03-23', 3, NULL, '2022-03-31 13:01:44', '2022-03-31 13:01:44', 0);
INSERT INTO `att_attendance` VALUES (27, 18, '06:34:00', '12:10:00', '15:11:55', '21:00:16', '2022-03-23', 1, NULL, '2022-03-31 13:01:44', '2022-03-31 13:01:44', 0);
INSERT INTO `att_attendance` VALUES (28, 2, NULL, NULL, NULL, NULL, '2022-04-13', 0, NULL, '2022-04-06 12:06:45', '2022-04-06 12:06:45', 0);
INSERT INTO `att_attendance` VALUES (29, 2, NULL, NULL, NULL, NULL, '2022-04-14', 0, NULL, '2022-04-06 12:06:45', '2022-04-06 12:06:45', 0);
INSERT INTO `att_attendance` VALUES (30, 2, NULL, NULL, NULL, NULL, '2022-04-15', 0, NULL, '2022-04-06 12:06:45', '2022-04-06 12:06:45', 0);
INSERT INTO `att_attendance` VALUES (31, 1, NULL, NULL, NULL, NULL, '2022-04-06', 0, NULL, '2022-04-06 12:06:57', '2022-04-06 12:06:57', 0);
INSERT INTO `att_attendance` VALUES (32, 1, NULL, NULL, NULL, NULL, '2022-04-07', 0, NULL, '2022-04-06 12:06:58', '2022-04-06 12:06:58', 0);
INSERT INTO `att_attendance` VALUES (33, 1, '06:00:00', '12:00:00', '13:00:55', '18:00:16', '2022-04-08', 0, NULL, '2022-04-06 12:06:58', '2022-04-13 09:54:04', 0);
INSERT INTO `att_attendance` VALUES (34, 1, NULL, NULL, NULL, NULL, '2022-04-09', 4, NULL, '2022-04-06 12:06:58', '2022-04-06 12:06:58', 0);
INSERT INTO `att_attendance` VALUES (35, 1, NULL, NULL, NULL, NULL, '2022-04-27', 4, NULL, '2022-04-07 11:43:11', '2022-04-07 11:43:11', 0);
INSERT INTO `att_attendance` VALUES (36, 1, NULL, NULL, NULL, NULL, '2022-04-28', 4, NULL, '2022-04-07 11:43:11', '2022-04-07 11:43:11', 0);
INSERT INTO `att_attendance` VALUES (37, 1, NULL, NULL, NULL, NULL, '2022-04-01', 3, NULL, '2022-04-07 12:59:14', '2022-04-07 12:59:14', 0);
INSERT INTO `att_attendance` VALUES (38, 3, NULL, NULL, NULL, NULL, '2022-07-01', 3, NULL, '2022-04-07 13:17:52', '2022-04-07 13:17:52', 0);
INSERT INTO `att_attendance` VALUES (39, 4, NULL, NULL, NULL, NULL, '2022-07-04', 2, NULL, '2022-04-07 13:17:58', '2022-04-07 13:17:58', 0);
INSERT INTO `att_attendance` VALUES (40, 3, NULL, NULL, NULL, NULL, '2022-07-07', 3, NULL, '2022-04-07 13:18:17', '2022-04-07 13:18:17', 0);
INSERT INTO `att_attendance` VALUES (41, 1, NULL, NULL, NULL, NULL, '2022-04-20', 4, NULL, '2022-04-07 19:20:06', '2022-04-12 17:40:22', 0);
INSERT INTO `att_attendance` VALUES (42, 1, NULL, NULL, NULL, NULL, '2022-04-21', 0, NULL, '2022-04-07 19:20:07', '2022-04-07 19:20:07', 0);
INSERT INTO `att_attendance` VALUES (43, 1, NULL, NULL, NULL, NULL, '2022-04-22', 0, NULL, '2022-04-07 19:20:07', '2022-04-07 19:20:07', 0);
INSERT INTO `att_attendance` VALUES (44, 2, NULL, NULL, NULL, NULL, '2022-04-04', 2, NULL, '2022-04-07 21:00:15', '2022-04-07 21:00:15', 0);
INSERT INTO `att_attendance` VALUES (45, 4, NULL, NULL, NULL, NULL, '2022-04-06', 1, NULL, '2022-04-07 21:00:22', '2022-04-07 21:00:22', 0);
INSERT INTO `att_attendance` VALUES (46, 4, NULL, NULL, NULL, NULL, '2022-04-05', 2, NULL, '2022-04-07 21:00:27', '2022-04-07 21:00:27', 0);
INSERT INTO `att_attendance` VALUES (47, 4, NULL, NULL, NULL, NULL, '2022-04-13', 1, NULL, '2022-04-07 21:08:22', '2022-04-07 21:08:22', 0);
INSERT INTO `att_attendance` VALUES (48, 5, NULL, NULL, NULL, NULL, '2022-04-13', 1, NULL, '2022-04-07 21:08:27', '2022-04-07 21:08:27', 0);
INSERT INTO `att_attendance` VALUES (49, 5, NULL, NULL, NULL, NULL, '2022-04-14', 3, NULL, '2022-04-07 21:08:43', '2022-04-07 21:08:43', 0);
INSERT INTO `att_attendance` VALUES (50, 6, NULL, NULL, NULL, NULL, '2022-04-07', 2, NULL, '2022-04-07 21:08:54', '2022-04-07 21:08:54', 0);
INSERT INTO `att_attendance` VALUES (51, 2, NULL, NULL, NULL, NULL, '2022-03-03', 0, NULL, '2022-04-07 21:10:41', '2022-04-07 21:10:41', 0);
INSERT INTO `att_attendance` VALUES (52, 1, NULL, NULL, NULL, NULL, '2022-04-10', 4, NULL, '2022-04-07 23:42:51', '2022-04-07 23:42:51', 0);
INSERT INTO `att_attendance` VALUES (53, 1, '05:00:00', '11:00:00', '13:01:55', '16:00:16', '2021-07-16', 3, NULL, '2022-04-08 19:02:10', '2022-04-08 19:02:10', 0);
INSERT INTO `att_attendance` VALUES (54, 1, '05:10:00', '12:00:00', '14:01:55', '17:00:16', '2022-07-18', 3, NULL, '2022-04-08 19:02:10', '2022-04-08 19:02:10', 0);
INSERT INTO `att_attendance` VALUES (55, 1, '05:00:00', '11:00:00', '13:01:55', '16:00:16', '2022-07-19', 3, NULL, '2022-04-08 19:02:10', '2022-04-08 19:02:10', 0);
INSERT INTO `att_attendance` VALUES (56, 2, '06:00:00', '11:40:00', '13:10:55', '16:30:16', '2021-07-16', 3, NULL, '2022-04-08 19:02:10', '2022-04-08 19:02:10', 0);
INSERT INTO `att_attendance` VALUES (57, 2, '03:40:00', '13:00:00', '14:09:55', '18:10:16', '2022-07-18', 1, NULL, '2022-04-08 19:02:10', '2022-04-08 19:02:10', 0);
INSERT INTO `att_attendance` VALUES (58, 2, '08:17:00', '12:23:00', '13:01:55', '16:49:16', '2022-07-19', 3, NULL, '2022-04-08 19:02:10', '2022-04-08 19:02:10', 0);
INSERT INTO `att_attendance` VALUES (59, 3, '06:34:00', '12:10:00', '15:11:55', '21:00:16', '2021-07-16', 1, NULL, '2022-04-08 19:02:10', '2022-04-08 19:02:10', 0);
INSERT INTO `att_attendance` VALUES (60, 3, '05:00:00', '11:30:00', '13:30:00', '18:00:00', '2022-07-18', 1, NULL, '2022-04-08 19:02:10', '2022-04-08 19:02:10', 0);
INSERT INTO `att_attendance` VALUES (61, 3, '05:10:00', '12:00:00', '14:01:55', '17:00:16', '2022-07-19', 1, NULL, '2022-04-08 19:02:10', '2022-04-08 19:02:10', 0);
INSERT INTO `att_attendance` VALUES (62, 4, '05:00:00', '11:00:00', '13:01:55', '16:00:16', '2021-07-16', 2, NULL, '2022-04-08 19:02:10', '2022-04-08 19:02:10', 0);
INSERT INTO `att_attendance` VALUES (63, 4, '07:00:00', '12:35:00', '13:12:55', '19:20:16', '2022-07-18', 1, NULL, '2022-04-08 19:02:10', '2022-04-08 19:02:10', 0);
INSERT INTO `att_attendance` VALUES (64, 4, '03:40:00', '13:00:00', '14:09:55', '18:10:16', '2022-07-19', 1, NULL, '2022-04-08 19:02:10', '2022-04-08 19:02:10', 0);
INSERT INTO `att_attendance` VALUES (65, 10, '05:00:00', '11:00:00', '13:01:55', '16:00:16', '2021-07-16', 3, NULL, '2022-04-08 19:04:25', '2022-04-08 19:11:32', 0);
INSERT INTO `att_attendance` VALUES (66, 1, '05:00:00', '11:00:00', '13:01:55', '16:00:16', '2021-07-19', 3, NULL, '2022-04-08 19:04:25', '2022-04-08 19:04:25', 0);
INSERT INTO `att_attendance` VALUES (67, 11, '06:00:00', '11:40:00', '13:10:55', '16:30:16', '2021-07-16', 3, NULL, '2022-04-08 19:04:25', '2022-04-08 19:20:25', 0);
INSERT INTO `att_attendance` VALUES (68, 2, '08:17:00', '12:23:00', '13:01:55', '16:49:16', '2021-07-19', 3, NULL, '2022-04-08 19:04:25', '2022-04-08 19:04:25', 0);
INSERT INTO `att_attendance` VALUES (69, 12, '06:34:00', '12:10:00', '15:11:55', '21:00:16', '2021-07-16', 1, NULL, '2022-04-08 19:04:25', '2022-04-08 19:20:40', 0);
INSERT INTO `att_attendance` VALUES (70, 3, '05:10:00', '12:00:00', '14:01:55', '17:00:16', '2021-07-19', 1, NULL, '2022-04-08 19:04:25', '2022-04-08 19:04:25', 0);
INSERT INTO `att_attendance` VALUES (71, 13, '05:00:00', '11:00:00', '13:01:55', '16:00:16', '2021-07-16', 2, NULL, '2022-04-08 19:04:26', '2022-04-08 19:20:43', 0);
INSERT INTO `att_attendance` VALUES (72, 4, '03:40:00', '13:00:00', '14:09:55', '18:10:16', '2021-07-19', 1, NULL, '2022-04-08 19:04:26', '2022-04-08 19:04:26', 0);
INSERT INTO `att_attendance` VALUES (73, 1, '08:00:00', '11:00:00', '13:01:55', '16:00:16', '2021-08-16', 3, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (74, 1, '07:30:00', '11:30:00', '13:30:00', '18:00:00', '2021-08-17', 3, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (75, 1, '06:50:00', '12:00:00', '14:01:55', '17:00:16', '2021-08-18', 3, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (76, 1, '09:00:00', '10:30:00', '13:01:55', '16:00:16', '2021-08-19', 3, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (77, 2, '06:45:00', '11:40:00', '13:10:55', '16:30:16', '2021-08-16', 3, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (78, 2, '07:00:00', '12:35:00', '13:12:55', '19:20:16', '2021-08-17', 1, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (79, 2, '08:40:00', '13:00:00', '14:09:55', '18:10:16', '2021-08-18', 1, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (80, 2, '08:17:00', '12:23:00', '13:01:55', '16:49:16', '2021-08-19', 3, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (81, 3, '07:34:00', '12:10:00', '15:11:55', '21:00:16', '2021-08-16', 1, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (82, 3, '06:12:00', '11:00:00', '13:01:55', '16:00:16', '2021-08-17', 2, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (83, 3, '07:00:00', '11:30:00', '13:30:00', '18:00:00', '2021-08-18', 3, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (84, 3, '07:20:00', '12:00:00', '14:01:55', '17:00:16', '2021-08-19', 3, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (85, 4, '08:00:00', '11:00:00', '13:01:55', '16:00:16', '2021-08-16', 3, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (86, 4, '09:30:00', '10:40:00', '13:10:55', '16:30:16', '2021-08-17', 3, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (87, 4, '08:30:00', '12:35:00', '13:12:55', '19:20:16', '2021-08-18', 1, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (88, 4, '06:40:00', '13:00:00', '14:09:55', '18:10:16', '2021-08-19', 1, NULL, '2022-04-08 19:38:17', '2022-04-08 19:38:17', 0);
INSERT INTO `att_attendance` VALUES (89, 1, '08:00:00', '11:00:00', '13:01:55', '16:00:16', '2021-09-16', 3, NULL, '2022-04-08 20:02:26', '2022-04-08 20:02:26', 0);
INSERT INTO `att_attendance` VALUES (90, 1, '07:30:00', '11:30:00', '13:30:00', '18:00:00', '2021-09-17', 1, NULL, '2022-04-08 20:02:26', '2022-04-08 20:02:26', 0);
INSERT INTO `att_attendance` VALUES (91, 2, '06:45:00', '11:40:00', '13:10:55', '16:30:16', '2021-09-16', 3, NULL, '2022-04-08 20:02:26', '2022-04-08 20:02:26', 0);
INSERT INTO `att_attendance` VALUES (92, 2, '07:00:00', '12:35:00', '13:12:55', '19:20:16', '2021-09-17', 1, NULL, '2022-04-08 20:02:26', '2022-04-08 20:02:26', 0);
INSERT INTO `att_attendance` VALUES (93, 3, '07:34:00', '12:10:00', '15:11:55', '21:00:16', '2021-09-16', 1, NULL, '2022-04-08 20:02:26', '2022-04-08 20:02:26', 0);
INSERT INTO `att_attendance` VALUES (94, 3, '06:12:00', '11:00:00', '13:01:55', '16:00:16', '2021-09-17', 2, NULL, '2022-04-08 20:02:26', '2022-04-08 20:02:26', 0);
INSERT INTO `att_attendance` VALUES (95, 4, '08:00:00', '11:00:00', '13:01:55', '16:00:16', '2021-09-16', 3, NULL, '2022-04-08 20:02:26', '2022-04-08 20:02:26', 0);
INSERT INTO `att_attendance` VALUES (96, 4, '09:30:00', '10:40:00', '13:10:55', '16:30:16', '2021-09-17', 3, NULL, '2022-04-08 20:02:26', '2022-04-08 20:02:26', 0);
INSERT INTO `att_attendance` VALUES (97, 2, NULL, NULL, NULL, NULL, '2022-04-26', 0, NULL, '2022-04-08 20:28:22', '2022-04-08 20:28:22', 0);
INSERT INTO `att_attendance` VALUES (98, 2, NULL, NULL, NULL, NULL, '2022-04-27', 0, NULL, '2022-04-08 20:28:23', '2022-04-08 20:28:23', 0);
INSERT INTO `att_attendance` VALUES (99, 2, NULL, NULL, NULL, NULL, '2022-04-28', 0, NULL, '2022-04-08 20:28:23', '2022-04-08 20:28:23', 0);
INSERT INTO `att_attendance` VALUES (100, 1, '06:00:00', '12:00:00', '13:00:55', '18:00:16', '2022-08-16', 0, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (101, 1, '07:30:00', '11:30:00', '13:30:00', '18:00:00', '2022-08-17', 1, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (102, 1, '06:50:00', '12:00:00', '13:00:00', '17:00:16', '2022-08-18', 0, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (103, 1, '09:00:00', '10:30:00', '13:01:00', '16:00:00', '2022-08-19', 1, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (104, 2, '06:45:00', '11:40:00', '13:10:55', '16:30:16', '2022-08-16', 3, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (105, 2, '07:00:00', '12:35:00', '13:12:55', '19:20:16', '2022-08-17', 1, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (106, 2, '08:40:00', '13:00:00', '14:09:55', '18:10:16', '2022-08-18', 1, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (107, 2, '08:17:00', '12:23:00', '13:01:55', '16:49:16', '2022-08-19', 3, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (108, 3, '07:34:00', '12:10:00', '15:11:55', '21:00:16', '2022-08-16', 1, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (109, 3, '06:12:00', '11:00:00', '13:01:55', '16:00:16', '2022-08-17', 2, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (110, 3, '07:00:00', '11:30:00', '13:30:00', '18:00:00', '2022-08-18', 3, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (111, 3, '07:20:00', '12:00:00', '14:01:55', '17:00:16', '2022-08-19', 3, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (112, 4, '08:00:00', '11:00:00', '13:01:55', '16:00:16', '2022-08-16', 3, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (113, 4, '09:30:00', '10:40:00', '13:10:55', '16:30:16', '2022-08-17', 3, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (114, 4, '08:30:00', '12:35:00', '13:12:55', '19:20:16', '2022-08-18', 1, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (115, 4, '06:40:00', '13:00:00', '14:09:55', '18:10:16', '2022-08-19', 1, NULL, '2022-04-08 20:30:21', '2022-04-08 20:30:21', 0);
INSERT INTO `att_attendance` VALUES (116, 2, NULL, NULL, NULL, NULL, '2022-04-29', 0, NULL, '2022-04-08 20:41:48', '2022-04-08 20:41:48', 0);
INSERT INTO `att_attendance` VALUES (117, 2, NULL, NULL, NULL, NULL, '2022-05-02', 4, NULL, '2022-04-08 20:41:48', '2022-04-08 20:41:48', 0);
INSERT INTO `att_attendance` VALUES (118, 1, '06:00:00', '12:00:00', '13:00:55', '18:00:16', '2022-05-16', 0, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (119, 1, '07:30:00', '11:30:00', '13:30:00', '18:00:00', '2022-05-17', 1, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (120, 1, '06:50:00', '12:00:00', '13:00:00', '17:00:16', '2022-05-18', 0, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (121, 1, '09:00:00', '10:30:00', '13:01:00', '16:00:00', '2022-05-19', 0, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (122, 2, '06:45:00', '11:40:00', '13:10:55', '16:30:16', '2022-05-16', 3, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (123, 2, '07:00:00', '12:35:00', '13:12:55', '19:20:16', '2022-05-17', 1, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (124, 2, '08:40:00', '13:00:00', '14:09:55', '18:10:16', '2022-05-18', 1, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (125, 2, '08:17:00', '12:23:00', '13:01:55', '16:49:16', '2022-05-19', 3, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (126, 3, '07:34:00', '12:10:00', '15:11:55', '21:00:16', '2022-05-16', 1, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (127, 3, '06:12:00', '11:00:00', '13:01:55', '16:00:16', '2022-05-17', 2, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (128, 3, '07:00:00', '11:30:00', '13:30:00', '18:00:00', '2022-05-18', 3, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (129, 3, '07:20:00', '12:00:00', '14:01:55', '17:00:16', '2022-05-19', 3, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (130, 4, '08:00:00', '11:00:00', '13:01:55', '16:00:16', '2022-05-16', 3, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (131, 4, '09:30:00', '10:40:00', '13:10:55', '16:30:16', '2022-05-17', 3, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (132, 4, '08:30:00', '12:35:00', '13:12:55', '19:20:16', '2022-05-18', 1, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (133, 4, '06:40:00', '13:00:00', '14:09:55', '18:10:16', '2022-05-19', 1, NULL, '2022-04-08 20:43:52', '2022-04-08 20:43:52', 0);
INSERT INTO `att_attendance` VALUES (134, 2, NULL, NULL, NULL, NULL, '2022-04-21', 4, NULL, '2022-04-08 20:54:28', '2022-04-08 20:54:28', 0);
INSERT INTO `att_attendance` VALUES (135, 2, NULL, NULL, NULL, NULL, '2022-04-22', 0, NULL, '2022-04-08 20:54:28', '2022-04-08 20:54:28', 0);
INSERT INTO `att_attendance` VALUES (136, 1, '07:30:00', '11:30:00', '13:30:00', '18:00:00', '2022-10-17', 1, NULL, '2022-04-08 20:55:52', '2022-04-08 20:55:52', 0);
INSERT INTO `att_attendance` VALUES (137, 1, '06:50:00', '12:00:00', '13:00:00', '17:00:16', '2022-10-18', 0, NULL, '2022-04-08 20:55:52', '2022-04-08 20:55:52', 0);
INSERT INTO `att_attendance` VALUES (138, 1, '09:00:00', '10:30:00', '13:01:00', '16:00:00', '2022-10-19', 2, NULL, '2022-04-08 20:55:52', '2022-04-08 20:55:52', 0);
INSERT INTO `att_attendance` VALUES (139, 2, '07:00:00', '12:35:00', '13:12:55', '19:20:16', '2022-10-17', 1, NULL, '2022-04-08 20:55:52', '2022-04-08 20:55:52', 0);
INSERT INTO `att_attendance` VALUES (140, 2, '08:40:00', '13:00:00', '14:09:55', '18:10:16', '2022-10-18', 1, NULL, '2022-04-08 20:55:52', '2022-04-08 20:55:52', 0);
INSERT INTO `att_attendance` VALUES (141, 2, '08:17:00', '12:23:00', '13:01:55', '16:49:16', '2022-10-19', 3, NULL, '2022-04-08 20:55:52', '2022-04-08 20:55:52', 0);
INSERT INTO `att_attendance` VALUES (142, 3, '06:12:00', '11:00:00', '13:01:55', '16:00:16', '2022-10-17', 2, NULL, '2022-04-08 20:55:52', '2022-04-08 20:55:52', 0);
INSERT INTO `att_attendance` VALUES (143, 3, '07:00:00', '11:30:00', '13:30:00', '18:00:00', '2022-10-18', 3, NULL, '2022-04-08 20:55:52', '2022-04-08 20:55:52', 0);
INSERT INTO `att_attendance` VALUES (144, 3, '07:20:00', '12:00:00', '14:01:55', '17:00:16', '2022-10-19', 3, NULL, '2022-04-08 20:55:53', '2022-04-08 20:55:53', 0);
INSERT INTO `att_attendance` VALUES (145, 4, '09:30:00', '10:40:00', '13:10:55', '16:30:16', '2022-10-17', 3, NULL, '2022-04-08 20:55:53', '2022-04-08 20:55:53', 0);
INSERT INTO `att_attendance` VALUES (146, 4, '08:30:00', '12:35:00', '13:12:55', '19:20:16', '2022-10-18', 1, NULL, '2022-04-08 20:55:53', '2022-04-08 20:55:53', 0);
INSERT INTO `att_attendance` VALUES (147, 4, '06:40:00', '13:00:00', '14:09:55', '18:10:16', '2022-10-19', 1, NULL, '2022-04-08 20:55:53', '2022-04-08 20:55:53', 0);
INSERT INTO `att_attendance` VALUES (148, 1, NULL, NULL, NULL, NULL, '2022-10-20', 1, NULL, '2022-04-08 20:56:18', '2022-04-08 20:56:18', 0);
INSERT INTO `att_attendance` VALUES (149, 1, NULL, NULL, NULL, NULL, '2022-05-04', 4, NULL, '2022-04-08 23:14:54', '2022-04-08 23:14:54', 0);
INSERT INTO `att_attendance` VALUES (150, 1, NULL, NULL, NULL, NULL, '2022-05-05', 4, NULL, '2022-04-08 23:14:55', '2022-04-08 23:14:55', 0);
INSERT INTO `att_attendance` VALUES (151, 1, NULL, NULL, NULL, NULL, '2022-04-05', 0, NULL, '2022-04-09 16:41:50', '2022-04-09 16:41:50', 0);
INSERT INTO `att_attendance` VALUES (152, 1, NULL, NULL, NULL, NULL, '2022-04-12', 0, NULL, '2022-04-09 16:43:53', '2022-04-09 16:43:53', 0);
INSERT INTO `att_attendance` VALUES (153, 1, NULL, NULL, NULL, NULL, '2022-04-13', 1, NULL, '2022-04-09 16:43:58', '2022-04-09 16:43:58', 0);
INSERT INTO `att_attendance` VALUES (154, 3, NULL, NULL, NULL, NULL, '2022-04-06', 3, NULL, '2022-04-09 17:04:50', '2022-04-09 17:04:50', 0);
INSERT INTO `att_attendance` VALUES (155, 3, NULL, NULL, NULL, NULL, '2022-04-13', 1, NULL, '2022-04-09 17:06:25', '2022-04-09 17:06:25', 0);
INSERT INTO `att_attendance` VALUES (156, 6, NULL, NULL, NULL, NULL, '2022-04-11', 2, NULL, '2022-04-11 21:08:03', '2022-04-11 21:08:03', 0);
INSERT INTO `att_attendance` VALUES (157, 4, '06:40:00', '13:00:00', '14:09:55', '18:10:16', '2022-04-11', 1, NULL, '2022-04-11 21:08:15', '2022-04-13 09:54:04', 0);
INSERT INTO `att_attendance` VALUES (158, 9, NULL, NULL, NULL, NULL, '2022-04-11', 3, NULL, '2022-04-11 21:08:21', '2022-04-11 21:08:21', 0);
INSERT INTO `att_attendance` VALUES (159, 15, NULL, NULL, NULL, NULL, '2022-04-11', 1, NULL, '2022-04-11 21:08:42', '2022-04-11 21:08:42', 0);
INSERT INTO `att_attendance` VALUES (160, 1, NULL, NULL, NULL, NULL, '2022-04-19', 4, NULL, '2022-04-12 17:40:22', '2022-04-12 17:40:22', 0);
INSERT INTO `att_attendance` VALUES (161, 9, '06:00:00', '12:00:00', '13:00:55', '18:00:16', '2022-04-08', 0, NULL, '2022-04-12 22:25:07', '2022-04-13 09:16:11', 0);
INSERT INTO `att_attendance` VALUES (162, 14, '09:00:00', '10:30:00', '13:01:55', '16:00:16', '2022-04-11', 3, NULL, '2022-04-12 22:25:07', '2022-04-13 09:40:54', 0);
INSERT INTO `att_attendance` VALUES (163, 2, '06:45:00', '11:40:00', '13:10:55', '16:30:16', '2022-04-08', 3, NULL, '2022-04-12 22:25:07', '2022-04-12 22:25:07', 0);
INSERT INTO `att_attendance` VALUES (164, 2, '08:17:00', '12:23:00', '13:01:55', '16:49:16', '2022-04-11', 3, NULL, '2022-04-12 22:25:07', '2022-04-12 22:25:07', 0);
INSERT INTO `att_attendance` VALUES (165, 3, '07:34:00', '12:10:00', '15:11:55', '21:00:16', '2022-04-08', 1, NULL, '2022-04-12 22:25:07', '2022-04-12 22:25:07', 0);
INSERT INTO `att_attendance` VALUES (166, 3, '07:20:00', '12:00:00', '14:01:55', '17:00:16', '2022-04-11', 3, NULL, '2022-04-12 22:25:07', '2022-04-12 22:25:07', 0);
INSERT INTO `att_attendance` VALUES (167, 4, '08:00:00', '11:00:00', '13:01:55', '16:00:16', '2022-04-08', 3, NULL, '2022-04-12 22:25:07', '2022-04-12 22:25:07', 0);
INSERT INTO `att_attendance` VALUES (168, 19, '06:40:00', '13:00:00', '14:09:55', '18:10:16', '2022-04-11', 1, NULL, '2022-04-12 22:25:07', '2022-04-13 09:21:07', 0);
INSERT INTO `att_attendance` VALUES (169, 18, '06:00:00', '12:00:00', '13:00:55', '18:00:16', '2022-04-08', 0, NULL, '2022-04-13 09:37:02', '2022-04-13 09:40:06', 0);
INSERT INTO `att_attendance` VALUES (170, 1, '09:00:00', '10:30:00', '13:01:55', '16:00:16', '2022-04-11', 3, NULL, '2022-04-13 09:37:02', '2022-04-13 09:37:02', 0);
INSERT INTO `att_attendance` VALUES (171, 7, '06:45:00', '11:40:00', '13:10:55', '16:30:16', '2022-04-08', 3, NULL, '2022-04-13 09:37:02', '2022-04-13 09:41:52', 0);
INSERT INTO `att_attendance` VALUES (172, 8, '08:17:00', '12:23:00', '13:01:55', '16:49:16', '2022-04-11', 3, NULL, '2022-04-13 09:37:02', '2022-04-13 09:42:02', 0);
INSERT INTO `att_attendance` VALUES (173, 13, '07:34:00', '12:10:00', '15:11:55', '21:00:16', '2022-04-08', 1, NULL, '2022-04-13 09:37:02', '2022-04-13 09:42:56', 0);
INSERT INTO `att_attendance` VALUES (174, 10, '07:20:00', '12:00:00', '14:01:55', '17:00:16', '2022-04-11', 3, NULL, '2022-04-13 09:37:02', '2022-04-13 09:42:08', 0);
INSERT INTO `att_attendance` VALUES (175, 11, '08:00:00', '11:00:00', '13:01:55', '16:00:16', '2022-04-08', 3, NULL, '2022-04-13 09:37:02', '2022-04-13 09:42:11', 0);
INSERT INTO `att_attendance` VALUES (176, 12, '06:40:00', '13:00:00', '14:09:55', '18:10:16', '2022-04-11', 1, NULL, '2022-04-13 09:37:02', '2022-04-13 09:42:13', 0);
INSERT INTO `att_attendance` VALUES (177, 21, '06:00:00', '12:00:00', '13:00:55', '18:00:16', '2022-04-08', 0, NULL, '2022-04-13 09:44:37', '2022-04-13 09:52:17', 0);
INSERT INTO `att_attendance` VALUES (178, 22, '09:00:00', '10:30:00', '13:01:55', '16:00:16', '2022-04-11', 3, NULL, '2022-04-13 09:44:37', '2022-04-13 09:52:19', 0);
INSERT INTO `att_attendance` VALUES (179, 23, '06:45:00', '11:40:00', '13:10:55', '16:30:16', '2022-04-08', 3, NULL, '2022-04-13 09:44:37', '2022-04-13 09:52:23', 0);
INSERT INTO `att_attendance` VALUES (180, 24, '08:17:00', '12:23:00', '13:01:55', '16:49:16', '2022-04-11', 3, NULL, '2022-04-13 09:44:37', '2022-04-13 09:52:27', 0);
INSERT INTO `att_attendance` VALUES (181, 25, '07:34:00', '12:10:00', '15:11:55', '21:00:16', '2022-04-08', 1, NULL, '2022-04-13 09:44:37', '2022-04-13 09:52:29', 0);
INSERT INTO `att_attendance` VALUES (182, 26, '07:20:00', '12:00:00', '14:01:55', '17:00:16', '2022-04-11', 3, NULL, '2022-04-13 09:44:37', '2022-04-13 09:52:32', 0);
INSERT INTO `att_attendance` VALUES (183, 27, '08:00:00', '11:00:00', '13:01:55', '16:00:16', '2022-04-08', 3, NULL, '2022-04-13 09:44:37', '2022-04-13 09:52:35', 0);
INSERT INTO `att_attendance` VALUES (184, 28, '06:40:00', '13:00:00', '14:09:55', '18:10:16', '2022-04-11', 1, NULL, '2022-04-13 09:44:37', '2022-04-13 09:52:38', 0);
INSERT INTO `att_attendance` VALUES (185, 1, '07:30:00', '11:30:00', '13:30:00', '18:00:00', '2022-05-09', 1, NULL, '2022-04-13 10:12:07', '2022-04-13 10:12:07', 0);
INSERT INTO `att_attendance` VALUES (186, 1, '06:50:00', '12:00:00', '13:00:00', '17:00:16', '2022-05-10', 0, NULL, '2022-04-13 10:12:07', '2022-04-13 10:12:07', 0);
INSERT INTO `att_attendance` VALUES (187, 1, '09:00:00', '10:30:00', '13:01:55', '16:00:16', '2022-05-11', 3, NULL, '2022-04-13 10:12:07', '2022-04-13 10:12:07', 0);
INSERT INTO `att_attendance` VALUES (188, 2, '07:00:00', '12:35:00', '13:12:55', '19:20:16', '2022-05-09', 1, NULL, '2022-04-13 10:12:07', '2022-04-13 10:12:07', 0);
INSERT INTO `att_attendance` VALUES (189, 2, '07:40:00', '12:20:00', '13:09:55', '18:10:16', '2022-05-10', 0, NULL, '2022-04-13 10:12:07', '2022-04-13 10:40:08', 0);
INSERT INTO `att_attendance` VALUES (190, 2, '07:40:00', '12:30:00', '13:01:55', '18:49:16', '2022-05-11', 3, NULL, '2022-04-13 10:12:07', '2022-04-13 10:40:08', 0);
INSERT INTO `att_attendance` VALUES (191, 3, '06:12:00', '11:00:00', '13:01:55', '16:00:16', '2022-05-09', 2, NULL, '2022-04-13 10:12:07', '2022-04-13 10:12:07', 0);
INSERT INTO `att_attendance` VALUES (192, 3, '07:00:00', '11:30:00', '13:30:00', '18:00:00', '2022-05-10', 3, NULL, '2022-04-13 10:12:07', '2022-04-13 10:12:07', 0);
INSERT INTO `att_attendance` VALUES (193, 3, '07:20:00', '12:30:00', '13:00:00', '18:00:16', '2022-05-11', 0, NULL, '2022-04-13 10:12:07', '2022-04-13 10:33:00', 0);
INSERT INTO `att_attendance` VALUES (194, 4, '09:30:00', '10:40:00', '13:10:55', '16:30:16', '2022-05-09', 3, NULL, '2022-04-13 10:12:07', '2022-04-13 10:12:07', 0);
INSERT INTO `att_attendance` VALUES (195, 4, '05:00:00', '12:35:00', '13:00:55', '19:20:16', '2022-05-10', 0, NULL, '2022-04-13 10:12:07', '2022-04-13 10:33:00', 0);
INSERT INTO `att_attendance` VALUES (196, 4, '05:40:00', '13:00:00', '13:00:55', '18:10:16', '2022-05-11', 0, NULL, '2022-04-13 10:12:07', '2022-04-13 10:33:00', 0);

-- ----------------------------
-- Table structure for att_leave
-- ----------------------------
DROP TABLE IF EXISTS `att_leave`;
CREATE TABLE `att_leave`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '休假类型id',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `days` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '休假天数',
  `status` tinyint(4) UNSIGNED NULL DEFAULT 1 COMMENT '0禁用，1正常，默认1',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '请假表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of att_leave
-- ----------------------------
INSERT INTO `att_leave` VALUES (1, 1, 2, 30, 1, NULL, '2022-03-26 11:53:04', '2022-03-26 11:53:46', 0);
INSERT INTO `att_leave` VALUES (2, 2, 2, 4, 1, NULL, '2022-03-26 12:00:32', '2022-03-26 12:00:32', 0);
INSERT INTO `att_leave` VALUES (3, 1, 3, NULL, 1, NULL, '2022-03-27 08:58:39', '2022-03-27 08:58:39', 0);
INSERT INTO `att_leave` VALUES (4, 4, 3, NULL, 1, NULL, '2022-03-27 08:58:46', '2022-03-27 08:58:46', 0);
INSERT INTO `att_leave` VALUES (5, 5, 3, NULL, 1, NULL, '2022-03-27 08:58:58', '2022-03-27 08:58:58', 0);
INSERT INTO `att_leave` VALUES (6, 4, 2, 3, 1, NULL, '2022-03-27 12:03:52', '2022-03-27 12:03:52', 0);
INSERT INTO `att_leave` VALUES (7, 6, 2, 10, 1, NULL, '2022-03-27 12:05:14', '2022-03-27 12:05:14', 0);
INSERT INTO `att_leave` VALUES (8, 3, 2, 4, 0, NULL, '2022-03-27 13:50:04', '2022-03-27 13:50:04', 0);
INSERT INTO `att_leave` VALUES (9, 2, 5, 10, 1, NULL, '2022-04-08 20:22:36', '2022-04-08 20:22:36', 0);
INSERT INTO `att_leave` VALUES (10, 4, 5, 10, 1, NULL, '2022-04-08 20:22:49', '2022-04-08 20:22:49', 0);
INSERT INTO `att_leave` VALUES (11, 6, 5, 10, 1, NULL, '2022-04-08 20:23:01', '2022-04-08 20:23:01', 0);

-- ----------------------------
-- Table structure for att_leave_type
-- ----------------------------
DROP TABLE IF EXISTS `att_leave_type`;
CREATE TABLE `att_leave_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '假期名称',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '请假类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of att_leave_type
-- ----------------------------
INSERT INTO `att_leave_type` VALUES (1, 'maternity_leave', '产假', '2022-03-26 08:19:45', '2022-03-28 20:08:35', 0, 1);
INSERT INTO `att_leave_type` VALUES (2, 'sick_leave', '病假', '2022-03-26 08:20:26', '2022-03-28 20:09:45', 0, 1);
INSERT INTO `att_leave_type` VALUES (3, 'marriage_leave', '婚假', '2022-03-26 08:22:59', '2022-03-28 20:10:15', 0, 1);
INSERT INTO `att_leave_type` VALUES (4, 'home_leave', '探亲假', '2022-03-26 08:23:12', '2022-03-28 20:10:57', 0, 1);
INSERT INTO `att_leave_type` VALUES (5, 'paternity_leave', '陪产假', '2022-03-26 08:24:26', '2022-03-28 20:12:31', 0, 1);
INSERT INTO `att_leave_type` VALUES (6, 'personal_leave', '事假', '2022-03-26 08:26:17', '2022-03-28 20:13:19', 0, 1);

-- ----------------------------
-- Table structure for att_overtime
-- ----------------------------
DROP TABLE IF EXISTS `att_overtime`;
CREATE TABLE `att_overtime`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `salary_multiple` decimal(5, 2) NULL DEFAULT NULL COMMENT '工资倍数，如按照小时计算，就是员工平均小时工资乘以倍数',
  `bonus` decimal(10, 3) NULL DEFAULT NULL COMMENT '加班奖金',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '加班类型',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `count_type` tinyint(4) NULL DEFAULT NULL COMMENT '0小时，1天，默认0，计数加班工资的类型',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1启用，0禁用，默认1',
  `is_time_off` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '0不补休，1补休，默认0',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '加班表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of att_overtime
-- ----------------------------
INSERT INTO `att_overtime` VALUES (1, 1.60, 200.000, 1, 2, 1, NULL, 1, 0, '2022-03-28 19:16:06', '2022-03-28 19:16:06', 0);
INSERT INTO `att_overtime` VALUES (2, 0.00, 0.000, 3, 15, 0, NULL, 1, 1, '2022-03-28 22:00:05', '2022-03-28 22:00:05', 0);
INSERT INTO `att_overtime` VALUES (3, 0.10, NULL, 1, 5, 0, NULL, 1, 0, '2022-03-28 22:24:08', '2022-03-28 22:24:08', 0);
INSERT INTO `att_overtime` VALUES (4, 0.30, NULL, 2, 5, 1, NULL, 1, 0, '2022-03-28 22:26:03', '2022-03-28 22:26:03', 0);
INSERT INTO `att_overtime` VALUES (5, 0.30, NULL, 2, 2, 0, NULL, 1, 0, '2022-03-28 22:28:01', '2022-03-28 22:28:01', 0);
INSERT INTO `att_overtime` VALUES (6, 0.00, 0.000, 3, 2, 0, NULL, 1, 1, '2022-03-31 20:00:21', '2022-03-31 20:00:21', 0);

-- ----------------------------
-- Table structure for att_overtime_type
-- ----------------------------
DROP TABLE IF EXISTS `att_overtime_type`;
CREATE TABLE `att_overtime_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0禁用，1启用，默认1',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `lower_limit` decimal(5, 2) NULL DEFAULT NULL COMMENT '工资倍数下限',
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '加班类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of att_overtime_type
-- ----------------------------
INSERT INTO `att_overtime_type` VALUES (1, 'workday_overtime', '工作日加班', 1, '2022-03-28 10:02:10', '2022-03-28 20:30:12', 1.50, 0);
INSERT INTO `att_overtime_type` VALUES (2, 'holiday_overtime', '节假日加班', 1, '2022-03-28 10:02:35', '2022-03-28 20:34:34', 3.00, 0);
INSERT INTO `att_overtime_type` VALUES (3, 'day_off_overtime', '休息日加班', 1, '2022-03-28 10:02:45', '2022-03-28 20:31:39', 2.00, 0);

-- ----------------------------
-- Table structure for att_staff_leave
-- ----------------------------
DROP TABLE IF EXISTS `att_staff_leave`;
CREATE TABLE `att_staff_leave`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NULL DEFAULT NULL COMMENT '员工id',
  `days` int(11) NULL DEFAULT NULL COMMENT '请假的天数',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '请假类型id',
  `start_date` date NULL DEFAULT NULL COMMENT '请假的开始日期',
  `status` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '0未审核，1审核通过，2驳回，3撤销',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工请假表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of att_staff_leave
-- ----------------------------
INSERT INTO `att_staff_leave` VALUES (1, 2, 3, 6, '2022-04-13', 1, '回家一趟', '2022-04-05 12:29:53', '2022-04-08 20:39:33', 1);
INSERT INTO `att_staff_leave` VALUES (2, 1, 4, 4, '2022-04-13', 2, '回老家喔', '2022-04-05 12:30:00', '2022-04-07 23:15:57', 0);
INSERT INTO `att_staff_leave` VALUES (3, 1, 4, 2, '2022-04-06', 1, '感冒了，需要回家休息', '2022-04-05 12:30:04', '2022-04-07 23:16:03', 0);
INSERT INTO `att_staff_leave` VALUES (4, 1, 3, 4, '2022-04-20', 1, NULL, '2022-04-06 14:04:22', '2022-04-07 19:20:07', 0);
INSERT INTO `att_staff_leave` VALUES (5, 1, 3, 2, '2022-04-13', 3, NULL, '2022-04-07 09:02:13', '2022-04-07 23:16:05', 0);
INSERT INTO `att_staff_leave` VALUES (6, 1, 2, 6, '2022-04-27', 1, NULL, '2022-04-07 11:42:43', '2022-04-07 11:43:11', 0);
INSERT INTO `att_staff_leave` VALUES (7, 1, 3, 4, '2022-04-30', 3, NULL, '2022-04-07 14:17:04', '2022-04-07 19:21:34', 0);
INSERT INTO `att_staff_leave` VALUES (8, 1, 8, 6, '2022-04-27', 3, '回家办点事情！', '2022-04-07 18:26:25', '2022-04-07 19:44:50', 0);
INSERT INTO `att_staff_leave` VALUES (9, 2, 3, 4, '2022-04-22', 3, '回家', '2022-04-08 20:26:35', '2022-04-08 20:26:56', 0);
INSERT INTO `att_staff_leave` VALUES (10, 2, 3, 6, '2022-04-26', 1, '', '2022-04-08 20:27:12', '2022-04-08 20:52:52', 1);
INSERT INTO `att_staff_leave` VALUES (11, 2, 3, 4, '2022-04-30', 3, '回老家哦', '2022-04-08 20:40:02', '2022-04-08 20:40:20', 0);
INSERT INTO `att_staff_leave` VALUES (12, 2, 5, 6, '2022-04-28', 1, '回老家', '2022-04-08 20:40:49', '2022-04-08 20:41:48', 0);
INSERT INTO `att_staff_leave` VALUES (13, 2, 4, 6, '2022-04-21', 1, '回', '2022-04-08 20:53:35', '2022-04-08 20:54:28', 0);
INSERT INTO `att_staff_leave` VALUES (14, 1, 2, 6, '2022-05-04', 1, NULL, '2022-04-08 23:14:09', '2022-04-08 23:14:55', 0);
INSERT INTO `att_staff_leave` VALUES (15, 1, 2, 4, '2022-04-19', 1, NULL, '2022-04-12 17:40:03', '2022-04-12 17:40:22', 0);

-- ----------------------------
-- Table structure for att_work_time
-- ----------------------------
DROP TABLE IF EXISTS `att_work_time`;
CREATE TABLE `att_work_time`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `mor_start_time` time(0) NULL DEFAULT NULL COMMENT '上午上班时间',
  `mor_end_time` time(0) NULL DEFAULT NULL COMMENT '上午下班时间',
  `aft_start_time` time(0) NULL DEFAULT NULL COMMENT '下午上班时间',
  `aft_end_time` time(0) NULL DEFAULT NULL COMMENT '下午下班时间',
  `total_work_time` decimal(3, 1) NULL DEFAULT NULL COMMENT '员工总工作时长',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作时间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of att_work_time
-- ----------------------------
INSERT INTO `att_work_time` VALUES (1, 2, '07:00:00', '11:20:00', '13:40:00', '17:00:00', 7.7, NULL, NULL, NULL, 0);
INSERT INTO `att_work_time` VALUES (2, 3, '07:30:00', '12:20:00', '13:30:00', '16:30:00', 7.8, NULL, NULL, NULL, 0);
INSERT INTO `att_work_time` VALUES (3, 15, '08:00:00', '12:00:00', '13:10:00', '16:40:00', 7.5, NULL, NULL, NULL, 0);
INSERT INTO `att_work_time` VALUES (4, 5, '08:00:00', '11:50:00', '13:10:00', '16:50:00', 7.5, NULL, NULL, NULL, 0);
INSERT INTO `att_work_time` VALUES (5, 6, '08:20:00', '12:00:00', '13:30:00', '17:00:00', 7.2, NULL, NULL, NULL, 0);
INSERT INTO `att_work_time` VALUES (6, 8, '08:10:00', '11:40:00', '13:20:00', '16:50:00', 7.0, NULL, NULL, NULL, 0);
INSERT INTO `att_work_time` VALUES (7, 9, '07:50:00', '12:10:00', '13:20:00', '17:00:00', 8.0, NULL, NULL, NULL, 0);
INSERT INTO `att_work_time` VALUES (8, 10, '09:00:00', '11:50:00', '13:10:00', '16:50:00', 6.5, NULL, NULL, NULL, 0);
INSERT INTO `att_work_time` VALUES (9, 14, '06:10:00', '10:30:00', '13:20:00', '17:00:00', 8.0, NULL, NULL, NULL, 0);
INSERT INTO `att_work_time` VALUES (10, 12, '07:30:00', '11:50:00', '13:20:00', '17:00:00', 8.0, NULL, NULL, NULL, 0);
INSERT INTO `att_work_time` VALUES (11, 13, '08:10:00', '12:00:00', '13:10:00', '17:00:00', 7.7, NULL, NULL, NULL, 0);
INSERT INTO `att_work_time` VALUES (12, 17, '06:10:00', '10:20:00', '13:20:00', '16:50:00', 7.7, NULL, NULL, NULL, 0);

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
INSERT INTO `per_menu` VALUES (16, 'salary', '工资管理', 'data-line', '/salary', 17, NULL, '2022-03-21 23:34:56', '2022-03-22 11:44:00', 0);
INSERT INTO `per_menu` VALUES (17, 'money', '薪资管理', 's-finance\r\n', '/money', 0, NULL, '2022-03-22 11:42:06', '2022-04-08 13:30:40', 0);
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
INSERT INTO `per_role` VALUES (1, 'admin', '管理员', '拥有最高权限', '2022-01-22 19:46:27', '2022-04-08 12:32:56', 0);
INSERT INTO `per_role` VALUES (2, 'manager', '经理', '管理部门', '2022-02-22 19:47:58', '2022-04-08 13:27:28', 0);
INSERT INTO `per_role` VALUES (3, 'ceo', '首席执行官', '重大事务决策者', '2022-02-28 17:08:48', '2022-04-08 14:50:36', 0);
INSERT INTO `per_role` VALUES (4, 'director_of_sales', '销售总监', '全权处理销售事务', '2022-03-01 21:57:42', '2022-04-08 14:14:55', 0);
INSERT INTO `per_role` VALUES (5, 'cto', '首席技术官', NULL, '2022-03-01 21:58:39', '2022-04-08 13:27:30', 0);
INSERT INTO `per_role` VALUES (6, 'publicity_director', '宣传部长', NULL, '2022-03-01 21:58:54', '2022-04-08 14:14:58', 0);
INSERT INTO `per_role` VALUES (7, 'hr', '人事经理', NULL, '2022-03-01 21:59:30', '2022-04-08 14:15:00', 0);
INSERT INTO `per_role` VALUES (8, 'director_of_planning', '企划部总监', NULL, '2022-03-01 21:59:47', '2022-03-28 20:14:00', 0);
INSERT INTO `per_role` VALUES (9, 'finance_minister', '财务部部长', NULL, '2022-03-01 22:00:05', '2022-03-28 20:14:05', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色菜单关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of per_role_menu
-- ----------------------------
INSERT INTO `per_role_menu` VALUES (1, 1, 2, 1, '2022-03-02 16:14:31', '2022-03-22 14:15:36', 0);
INSERT INTO `per_role_menu` VALUES (2, 1, 5, 1, '2022-03-02 16:18:01', '2022-03-22 14:15:39', 0);
INSERT INTO `per_role_menu` VALUES (3, 1, 6, 1, '2022-03-02 16:56:04', '2022-03-22 14:15:40', 0);
INSERT INTO `per_role_menu` VALUES (5, 1, 3, 1, '2022-03-02 17:01:42', '2022-03-22 14:15:41', 0);
INSERT INTO `per_role_menu` VALUES (6, 1, 4, 1, '2022-03-02 17:01:42', '2022-03-22 14:15:43', 0);
INSERT INTO `per_role_menu` VALUES (7, 1, 1, 1, '2022-03-02 17:01:57', '2022-03-22 14:15:44', 0);
INSERT INTO `per_role_menu` VALUES (9, 2, 3, 1, '2022-03-04 15:12:09', '2022-03-20 12:21:24', 0);
INSERT INTO `per_role_menu` VALUES (10, 2, 4, 1, '2022-03-04 15:12:09', '2022-03-20 12:21:30', 0);
INSERT INTO `per_role_menu` VALUES (11, 2, 6, 1, '2022-03-04 15:12:09', '2022-03-20 12:21:34', 0);
INSERT INTO `per_role_menu` VALUES (13, 3, 1, 1, '2022-03-04 15:54:00', NULL, 0);
INSERT INTO `per_role_menu` VALUES (14, 3, 5, 1, '2022-03-04 15:54:00', NULL, 0);
INSERT INTO `per_role_menu` VALUES (16, 2, 1, 1, '2022-03-05 21:47:35', NULL, 0);
INSERT INTO `per_role_menu` VALUES (17, 2, 5, 1, '2022-03-05 21:47:36', NULL, 0);
INSERT INTO `per_role_menu` VALUES (18, 1, 13, 1, '2022-03-07 16:20:03', '2022-03-22 14:15:47', 0);
INSERT INTO `per_role_menu` VALUES (19, 9, 13, 0, '2022-03-20 12:04:34', '2022-04-10 21:30:22', 0);
INSERT INTO `per_role_menu` VALUES (20, 9, 5, 0, '2022-03-20 12:04:35', '2022-04-10 21:30:22', 0);
INSERT INTO `per_role_menu` VALUES (21, 7, 1, 1, '2022-03-20 16:58:10', NULL, 0);
INSERT INTO `per_role_menu` VALUES (22, 7, 13, 1, '2022-03-20 16:58:10', NULL, 0);
INSERT INTO `per_role_menu` VALUES (23, 7, 5, 1, '2022-03-20 16:58:10', NULL, 0);
INSERT INTO `per_role_menu` VALUES (24, 1, 15, 1, '2022-03-22 13:57:49', '2022-03-31 19:51:18', 0);
INSERT INTO `per_role_menu` VALUES (25, 1, 17, 1, '2022-03-22 13:57:49', '2022-03-31 19:51:18', 0);
INSERT INTO `per_role_menu` VALUES (26, 1, 18, 1, '2022-03-22 22:09:01', '2022-03-31 19:51:18', 0);
INSERT INTO `per_role_menu` VALUES (27, 1, 14, 1, '2022-03-25 11:08:03', '2022-03-26 15:54:13', 0);
INSERT INTO `per_role_menu` VALUES (28, 1, 19, 1, '2022-03-26 12:30:24', '2022-03-26 15:54:14', 0);
INSERT INTO `per_role_menu` VALUES (29, 1, 20, 1, '2022-03-29 13:10:20', NULL, 0);
INSERT INTO `per_role_menu` VALUES (30, 1, 16, 1, '2022-04-06 15:20:14', NULL, 0);
INSERT INTO `per_role_menu` VALUES (31, 9, 17, 1, '2022-04-10 21:30:22', NULL, 0);
INSERT INTO `per_role_menu` VALUES (32, 9, 15, 1, '2022-04-10 21:30:23', NULL, 0);
INSERT INTO `per_role_menu` VALUES (33, 9, 16, 1, '2022-04-10 21:30:23', NULL, 0);
INSERT INTO `per_role_menu` VALUES (34, 9, 18, 1, '2022-04-10 21:30:23', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of per_staff_role
-- ----------------------------
INSERT INTO `per_staff_role` VALUES (1, 1, 1, 1, '2022-03-02 16:13:59', '2022-03-20 12:56:12', 0);
INSERT INTO `per_staff_role` VALUES (2, 29, 2, 1, '2022-03-04 15:11:38', '2022-03-20 12:21:47', 0);
INSERT INTO `per_staff_role` VALUES (3, 29, 3, 1, '2022-03-04 15:11:39', '2022-03-20 12:21:51', 0);
INSERT INTO `per_staff_role` VALUES (4, 3, 3, 1, '2022-03-11 11:03:43', NULL, 0);
INSERT INTO `per_staff_role` VALUES (5, 3, 9, 1, '2022-03-11 11:03:44', '2022-03-20 12:21:55', 0);
INSERT INTO `per_staff_role` VALUES (6, 3, 5, 1, '2022-03-11 11:51:41', NULL, 0);
INSERT INTO `per_staff_role` VALUES (7, 31, 9, 1, '2022-03-20 12:04:56', NULL, 0);
INSERT INTO `per_staff_role` VALUES (8, 1, 9, 1, '2022-03-20 12:32:45', '2022-03-22 14:08:02', 0);
INSERT INTO `per_staff_role` VALUES (9, 6, 9, 1, '2022-03-20 16:41:12', NULL, 0);
INSERT INTO `per_staff_role` VALUES (10, 6, 2, 1, '2022-03-20 16:41:12', NULL, 0);
INSERT INTO `per_staff_role` VALUES (11, 9, 7, 1, '2022-03-20 16:58:40', NULL, 0);
INSERT INTO `per_staff_role` VALUES (12, 2, 9, 1, '2022-04-10 21:29:21', NULL, 0);

-- ----------------------------
-- Table structure for sal_deduct_type
-- ----------------------------
DROP TABLE IF EXISTS `sal_deduct_type`;
CREATE TABLE `sal_deduct_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扣款名称',
  `status` tinyint(4) NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '扣款类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sal_deduct_type
-- ----------------------------
INSERT INTO `sal_deduct_type` VALUES (1, 'late', '迟到', NULL, '2022-03-26 08:53:34', '2022-04-08 15:50:01', 0);
INSERT INTO `sal_deduct_type` VALUES (2, 'leave_early', '早退', NULL, '2022-03-26 08:53:41', '2022-04-08 15:49:14', 0);
INSERT INTO `sal_deduct_type` VALUES (3, 'absenteeism', '旷工', NULL, '2022-03-26 08:52:58', '2022-04-08 15:49:18', 0);
INSERT INTO `sal_deduct_type` VALUES (4, 'leave', '休假', NULL, '2022-04-08 15:51:57', '2022-04-08 15:52:05', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工工资表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sal_salary
-- ----------------------------
INSERT INTO `sal_salary` VALUES (1, 1, 7000.000, NULL, 400.000, 200.000, 5595.000, 0.000, 640.000, 0.000, 100.000, '202204', 'jack的工资明细', '2022-04-06 14:40:36', '2022-04-09 15:15:56', 0);
INSERT INTO `sal_salary` VALUES (2, 1, 6800.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '202205', NULL, '2022-04-06 14:44:54', '2022-04-09 16:02:49', 0);
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

-- ----------------------------
-- Table structure for sal_salary_deduct
-- ----------------------------
DROP TABLE IF EXISTS `sal_salary_deduct`;
CREATE TABLE `sal_salary_deduct`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '部门id',
  `type_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '扣款类型id',
  `time_limit` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '时间界限',
  `lt_times_limit` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '当小于时间界限时的次数界限',
  `ll_deduct` decimal(10, 3) UNSIGNED NULL DEFAULT NULL COMMENT '当小于时间界限且小于次数界限时的罚款',
  `lg_deduct` decimal(10, 3) NULL DEFAULT NULL COMMENT '当小于时间界限且大于次数界限时的罚款',
  `gt_times_limit` int(11) NULL DEFAULT NULL COMMENT '当大于时间界限时的次数界限',
  `gl_deduct` decimal(10, 3) NULL DEFAULT NULL COMMENT '当大于时间界限且大于次数界限时的罚款',
  `gg_deduct` decimal(10, 3) NULL DEFAULT NULL COMMENT '当大于时间界限且大于次数界限时的罚款',
  `count_type` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0分钟，1小时，2天，默认0，统计的类型，如根据天计算、小时计算、分钟计算',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1启用，0禁用，默认1',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工资扣除表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sal_salary_deduct
-- ----------------------------
INSERT INTO `sal_salary_deduct` VALUES (1, 2, 2, 20, 3, 50.000, 100.000, 2, 200.000, 500.000, 0, 1, NULL, '2022-03-27 22:55:07', '2022-03-27 22:58:08', 0);
INSERT INTO `sal_salary_deduct` VALUES (2, 2, 1, 2, 3, 100.000, 120.000, 2, 150.000, 180.000, 1, 1, NULL, '2022-03-28 07:20:50', '2022-03-28 07:20:50', 0);
INSERT INTO `sal_salary_deduct` VALUES (3, 2, 3, 3, 3, 200.000, 300.000, 5, 400.000, 500.000, 2, 1, NULL, '2022-03-31 19:57:56', '2022-03-31 19:57:56', 0);

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
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(4) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参保城市表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soc_city
-- ----------------------------
INSERT INTO `soc_city` VALUES (1, '成都', 10000.000, 3000.000, 30000.000, 6000.000, 30000.000, 3000.000, 0.080, 0.160, 0.020, 0.090, 0.007, 0.006, 0.010, '2022-03-22 15:53:53', '2022-03-24 23:05:28', 0);
INSERT INTO `soc_city` VALUES (2, '重庆', 8000.000, 3000.000, 24000.000, 4800.000, 24000.000, 3000.000, 0.100, 0.160, 0.020, 0.085, 0.005, 0.009, 0.028, '2022-03-22 16:28:43', '2022-03-23 16:28:51', 0);
INSERT INTO `soc_city` VALUES (3, '北京', 12000.000, 4000.000, 36000.000, 7200.000, 36000.000, 4000.000, 0.080, 0.160, 0.020, 0.090, 0.011, 0.005, 0.008, '2022-03-23 22:33:51', '2022-03-23 22:33:51', 0);
INSERT INTO `soc_city` VALUES (4, '上海', 1000.000, 800.000, 3000.000, 600.000, 3000.000, 800.000, 0.076, 0.022, 0.010, 0.020, 0.100, 0.120, 0.090, '2022-03-23 23:29:22', '2022-04-13 11:12:38', 0);
INSERT INTO `soc_city` VALUES (5, '武汉', 5000.000, 3400.000, 15000.000, 3000.000, 15000.000, 3400.000, 0.100, 0.300, 0.100, 0.130, 0.140, 0.021, 0.025, '2022-03-31 20:02:30', '2022-04-12 17:58:51', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工五险一金表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soc_insurance
-- ----------------------------
INSERT INTO `soc_insurance` VALUES (1, 2, 1, 4000.000, 0.080, 320.000, 0.050, 200.000, 9000.000, 2430.000, 945.000, 0.005, '社保个人缴纳936元', '公积金个人缴纳320元', 0, '2022-03-25 00:40:24', '2022-03-25 00:40:24', 0);
INSERT INTO `soc_insurance` VALUES (2, 3, 2, 5000.000, 0.080, 400.000, 0.080, 400.000, 8000.000, 2224.000, 840.000, 0.015, NULL, NULL, 0, '2022-04-06 20:38:41', '2022-04-06 20:38:41', 0);
INSERT INTO `soc_insurance` VALUES (3, 4, 3, 3000.000, 0.120, 360.000, 0.120, 360.000, 3000.000, 813.000, 558.000, 0.019, NULL, NULL, 0, '2022-04-06 20:39:47', '2022-04-06 20:39:47', 0);
INSERT INTO `soc_insurance` VALUES (4, 3, 4, 5000.000, 0.050, 250.000, 0.050, 250.000, 8000.000, 2256.000, 840.000, 0.019, NULL, NULL, 0, '2022-04-07 10:42:09', '2022-04-07 10:42:09', 0);
INSERT INTO `soc_insurance` VALUES (5, 5, 5, 3400.000, 0.080, 272.000, 0.080, 272.000, 4000.000, 1916.000, 1360.000, 0.003, NULL, NULL, 0, '2022-04-07 10:43:13', '2022-04-07 10:43:13', 0);
INSERT INTO `soc_insurance` VALUES (6, 5, 6, 5000.000, 0.050, 250.000, 0.050, 250.000, 4000.000, 1916.000, 1360.000, 0.003, NULL, NULL, 0, '2022-04-07 10:44:26', '2022-04-07 10:44:26', 0);
INSERT INTO `soc_insurance` VALUES (7, 3, 7, 4500.000, 0.100, 450.000, 0.100, 450.000, 8000.000, 2120.000, 840.000, 0.002, NULL, NULL, 0, '2022-04-08 18:38:15', '2022-04-08 18:38:15', 0);
INSERT INTO `soc_insurance` VALUES (8, 5, 8, 10000.000, 0.050, 500.000, 0.050, 500.000, 10000.000, 4910.000, 3400.000, 0.015, NULL, NULL, 0, '2022-04-08 20:38:15', '2022-04-08 20:38:15', 0);
INSERT INTO `soc_insurance` VALUES (9, 2, 9, 4000.000, 0.050, 200.000, 0.050, 200.000, 5000.000, 1375.000, 525.000, 0.010, NULL, NULL, 0, '2022-04-08 20:50:13', '2022-04-08 20:50:13', 0);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门编码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门备注',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级部门id，0根部门',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, NULL, '运维部门', NULL, 0, '2022-03-07 16:15:57', '2022-04-08 12:09:04', 0);
INSERT INTO `sys_dept` VALUES (2, NULL, '运维1部', '运维部门中的核心部门', 1, '2022-03-07 16:16:11', '2022-04-08 13:27:05', 0);
INSERT INTO `sys_dept` VALUES (3, NULL, '运维2部', NULL, 1, '2022-03-07 16:16:30', '2022-03-26 17:10:27', 0);
INSERT INTO `sys_dept` VALUES (4, NULL, '营销部门', NULL, 0, '2022-03-07 16:16:46', '2022-04-08 14:14:18', 0);
INSERT INTO `sys_dept` VALUES (5, NULL, '营销1部', NULL, 4, '2022-03-07 16:16:57', '2022-04-08 13:27:08', 0);
INSERT INTO `sys_dept` VALUES (6, NULL, '营销2部', NULL, 4, '2022-03-07 16:17:10', '2022-04-08 13:27:10', 0);
INSERT INTO `sys_dept` VALUES (7, NULL, '财务部门', NULL, 0, '2022-03-07 16:17:40', '2022-04-08 14:14:20', 0);
INSERT INTO `sys_dept` VALUES (8, NULL, '财务1部', NULL, 7, '2022-03-07 16:17:49', '2022-03-07 16:18:11', 0);
INSERT INTO `sys_dept` VALUES (9, NULL, '财务2部', NULL, 7, '2022-03-07 16:18:02', '2022-03-07 16:18:14', 0);
INSERT INTO `sys_dept` VALUES (10, NULL, '财务3部', NULL, 7, '2022-03-07 16:18:32', '2022-03-07 16:18:32', 0);
INSERT INTO `sys_dept` VALUES (11, NULL, '开发部门', NULL, 0, '2022-03-07 16:18:41', '2022-03-07 16:18:41', 0);
INSERT INTO `sys_dept` VALUES (12, NULL, '开发1部', NULL, 11, '2022-03-07 16:19:00', '2022-03-07 16:19:10', 0);
INSERT INTO `sys_dept` VALUES (13, NULL, '开发2部', NULL, 11, '2022-03-07 22:21:39', '2022-03-07 22:21:39', 0);
INSERT INTO `sys_dept` VALUES (14, NULL, '财务4部', NULL, 7, '2022-03-20 12:08:16', '2022-03-20 12:08:16', 0);
INSERT INTO `sys_dept` VALUES (15, NULL, '运维3部', NULL, 1, '2022-03-26 17:09:55', '2022-03-26 17:09:55', 0);
INSERT INTO `sys_dept` VALUES (16, NULL, '人事部门', '对人力资源进行管理', 0, '2022-03-26 17:13:01', '2022-03-26 17:13:01', 0);
INSERT INTO `sys_dept` VALUES (17, NULL, '人事1部', NULL, 16, '2022-03-26 17:17:26', '2022-04-08 12:51:21', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_docs
-- ----------------------------
INSERT INTO `sys_docs` VALUES (1, '321ed1773f4ab3883e73.jpg', 'jpg', 'p7.jpg', '04989f48db70d5be991081da9207cc8d', 664, NULL, '用户头像！', '2022-03-31 19:23:31', '2022-04-08 11:01:49', 0);
INSERT INTO `sys_docs` VALUES (2, '1837fd34d247d79facff.jpg', 'jpg', 'p8.jpg', '65e9462e351242ecf79a99237d528008', 463, NULL, NULL, '2022-03-31 19:49:24', '2022-04-08 13:26:57', 0);

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
  `avatar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'avatar.png' COMMENT '员工头像，设置默认头像',
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
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_staff
-- ----------------------------
INSERT INTO `sys_staff` VALUES (1, 'admin', 'jack', 0, '202CB7007152D234B962AC59075B964B', '1837fd34d247d79facff.jpg', '2000-12-07', '13990849315', '北京', NULL, 2, 1, '2022-01-22 19:46:27', '2022-04-10 19:20:58', 0);
INSERT INTO `sys_staff` VALUES (2, 'staff_2', 'lucy', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', NULL, NULL, NULL, 5, 0, '2022-02-22 19:47:58', '2022-04-12 17:57:11', 0);
INSERT INTO `sys_staff` VALUES (3, 'staff_3', 'james', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '15808425010', NULL, NULL, 9, 1, '2022-12-22 19:48:47', '2022-04-12 17:51:19', 0);
INSERT INTO `sys_staff` VALUES (4, 'staff_4', 'john', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', NULL, NULL, '博士', 3, 0, '2022-10-22 19:49:42', '2022-04-13 15:03:07', 0);
INSERT INTO `sys_staff` VALUES (5, 'staff_5', 'joy', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1997-01-01', NULL, NULL, NULL, 17, 1, '2022-01-27 14:32:37', '2022-04-12 17:51:21', 0);
INSERT INTO `sys_staff` VALUES (6, 'staff_6', 'harden', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-06-01', NULL, NULL, '硕士', 17, 1, '2022-01-27 14:36:17', '2022-04-12 17:51:21', 0);
INSERT INTO `sys_staff` VALUES (7, 'staff_7', 'alice', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, NULL, NULL, NULL, 5, 0, '2022-11-20 18:00:21', '2022-04-13 09:19:10', 0);
INSERT INTO `sys_staff` VALUES (8, 'staff_8', '邱杰', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '2000-10-19', NULL, '四川南充', NULL, 12, 1, '2022-02-20 18:00:54', '2022-03-23 13:49:09', 0);
INSERT INTO `sys_staff` VALUES (9, 'staff_9', '司藤', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, NULL, NULL, NULL, 6, 0, '2022-03-20 18:01:04', '2022-04-13 09:19:11', 0);
INSERT INTO `sys_staff` VALUES (10, 'staff_10', '秦放', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, NULL, NULL, NULL, 5, 0, '2022-10-20 18:02:17', '2022-04-13 09:19:12', 0);
INSERT INTO `sys_staff` VALUES (11, 'staff_11', '心悦', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, NULL, NULL, NULL, 3, 1, '2022-02-20 20:06:01', '2022-03-23 13:49:09', 0);
INSERT INTO `sys_staff` VALUES (12, 'staff_12', '邱圣', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', NULL, '四川南充', NULL, 12, 1, '2022-05-21 12:51:18', '2022-04-10 18:31:31', 0);
INSERT INTO `sys_staff` VALUES (13, 'staff_13', '梧桐', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', NULL, '北京', NULL, 3, 1, '2022-09-21 12:59:00', '2022-04-10 18:31:27', 0);
INSERT INTO `sys_staff` VALUES (14, 'staff_14', '福瑞', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', NULL, '苍城山', NULL, 10, 1, '2022-02-21 13:02:59', '2022-04-10 18:31:23', 0);
INSERT INTO `sys_staff` VALUES (15, 'staff_15', '瓦房', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', NULL, '苍城山', NULL, 8, 1, '2022-07-21 13:13:37', '2022-04-10 18:31:19', 0);
INSERT INTO `sys_staff` VALUES (16, 'staff_16', '白金', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', NULL, '金陵', NULL, 3, 1, '2022-04-21 13:30:49', '2022-04-12 17:51:49', 0);
INSERT INTO `sys_staff` VALUES (17, 'staff_17', '世真', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', NULL, '上海', NULL, 3, 1, '2022-12-21 14:19:38', '2022-04-12 17:51:50', 0);
INSERT INTO `sys_staff` VALUES (18, 'staff_18', '白英', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13990849315', '申海', '邵严宽的二太太', 8, 1, '2022-03-21 23:55:31', '2022-04-10 18:31:07', 0);
INSERT INTO `sys_staff` VALUES (19, 'staff_19', '西竹', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13990849315', '禹航', '富豪', 5, 1, '2022-02-22 11:31:00', '2022-04-12 17:51:50', 0);
INSERT INTO `sys_staff` VALUES (20, 'staff_20', '跳跳', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13990849315', '北京', '大学', 3, 1, '2022-06-22 11:53:28', '2022-04-10 18:31:01', 0);
INSERT INTO `sys_staff` VALUES (21, 'staff_21', '伊人', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13990849315', '杭州', '', 9, 1, '2022-03-22 19:46:27', '2022-04-12 17:51:51', 0);
INSERT INTO `sys_staff` VALUES (22, 'staff_22', '秋冬', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13990849315', '成都', '', 10, 1, '2022-01-22 19:46:27', '2022-04-10 18:30:51', 0);
INSERT INTO `sys_staff` VALUES (23, 'staff_23', '林拜', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, NULL, NULL, NULL, 3, 1, '2022-02-22 13:48:13', '2022-03-23 13:49:09', 0);
INSERT INTO `sys_staff` VALUES (24, 'boss', '老板', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, NULL, NULL, NULL, 2, 1, '2022-08-23 20:00:41', '2022-04-06 20:09:36', 0);
INSERT INTO `sys_staff` VALUES (25, 'staff_25', '秋雅', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13990849315', '武汉', '', 5, 1, '2022-01-22 19:46:27', '2022-04-10 18:30:41', 0);
INSERT INTO `sys_staff` VALUES (26, 'staff_26', '秋水', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13990849315', '武汉', '', 13, 1, '2022-08-25 16:52:55', '2022-04-10 18:30:37', 0);
INSERT INTO `sys_staff` VALUES (27, 'staff_27', '秋天', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '13990849315', '武汉', '', 9, 1, '2022-02-26 09:34:31', '2022-04-10 18:30:34', 0);
INSERT INTO `sys_staff` VALUES (28, 'staff_28', '邱飞', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1996-12-05', '123', '北京', '富豪', 3, 1, '2022-03-26 15:54:50', '2022-04-10 18:30:30', 0);
INSERT INTO `sys_staff` VALUES (29, 'teacher', '小天', 0, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', NULL, NULL, NULL, NULL, 10, 1, '2022-02-26 15:58:19', '2022-03-23 13:49:09', 0);
INSERT INTO `sys_staff` VALUES (30, 'staff_30', '秦汉', 0, NULL, 'avatar.png', '1996-12-05', NULL, NULL, NULL, 9, 1, '2022-03-20 11:33:05', '2022-03-23 13:49:09', 0);
INSERT INTO `sys_staff` VALUES (31, 'staff_31', '林玥', 1, '827CE7BA16891F84CB0EEA8A706C4C34', 'avatar.png', '1997-03-13', NULL, NULL, NULL, 5, 1, '2022-03-20 11:43:40', '2022-03-23 13:49:09', 0);
INSERT INTO `sys_staff` VALUES (32, 'staff_32', 'jooo', 0, '202CB7007152D234B962AC59075B964B', 'avatar.png', '1998-03-16', NULL, NULL, NULL, 12, 1, '2022-03-20 16:37:07', '2022-04-10 18:34:15', 0);
INSERT INTO `sys_staff` VALUES (33, 'staff_33', '张三', 0, NULL, 'avatar.png', NULL, '13910849315', '天津', NULL, 2, 1, '2022-03-20 16:57:01', '2022-04-08 07:18:49', 0);
INSERT INTO `sys_staff` VALUES (34, 'staff_34', '李四', 0, NULL, 'avatar.png', NULL, '13990849325', '北京', NULL, 2, 1, '2022-03-20 16:57:01', '2022-04-08 07:18:56', 0);
INSERT INTO `sys_staff` VALUES (35, 'staff_35', '王五', 0, NULL, 'avatar.png', NULL, '13991849315', '上海', NULL, 5, 1, '2022-03-20 16:57:01', '2022-04-08 07:19:02', 0);

SET FOREIGN_KEY_CHECKS = 1;
