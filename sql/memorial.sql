/*
 Navicat Premium Data Transfer

 Source Server         : 39.97.107.218
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 39.97.107.218:3306
 Source Schema         : memorial

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 01/05/2020 15:18:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for things
-- ----------------------------
DROP TABLE IF EXISTS `things`;
CREATE TABLE `things`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NULL DEFAULT NULL,
  `thing_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `thing_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `state` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of things
-- ----------------------------
INSERT INTO `things` VALUES (3, 1, '明天起来干啥啥', '明天起来干啥啥', NULL, '2020-04-28 04:05:03', 4);
INSERT INTO `things` VALUES (4, 1, '123', '123', '2020-04-30 00:00:00', '2020-04-30 00:00:00', 4);
INSERT INTO `things` VALUES (5, 1, '123', '123', NULL, '2020-04-30 00:00:00', 4);
INSERT INTO `things` VALUES (6, 1, 'test', 'test', NULL, '2020-05-31 00:00:00', 4);
INSERT INTO `things` VALUES (7, 1, 'fdsafdsf', 'asdfasdf', NULL, '2020-05-01 00:00:00', 4);
INSERT INTO `things` VALUES (8, 1, '12321', 'fghfghf', NULL, '2020-05-21 00:00:00', 4);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123', '123');

SET FOREIGN_KEY_CHECKS = 1;
