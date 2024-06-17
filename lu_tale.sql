/*
 Navicat Premium Data Transfer

 Source Server         : AC_DEV_ENV
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : 10.10.10.9:3306
 Source Schema         : lu_tale

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 17/06/2024 08:13:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_attach
-- ----------------------------
DROP TABLE IF EXISTS `t_attach`;
CREATE TABLE `t_attach` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `ftype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '',
  `fkey` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `authorId` int DEFAULT NULL,
  `created` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_attach
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_comments
-- ----------------------------
DROP TABLE IF EXISTS `t_comments`;
CREATE TABLE `t_comments` (
  `coid` int unsigned NOT NULL AUTO_INCREMENT,
  `cid` int unsigned DEFAULT '0',
  `created` int unsigned DEFAULT '0',
  `author` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `authorId` int unsigned DEFAULT '0',
  `ownerId` int unsigned DEFAULT '0',
  `mail` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `agent` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `type` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'comment',
  `status` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'approved',
  `parent` int unsigned DEFAULT '0',
  PRIMARY KEY (`coid`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_comments
-- ----------------------------
BEGIN;
INSERT INTO `t_comments` (`coid`, `cid`, `created`, `author`, `authorId`, `ownerId`, `mail`, `url`, `ip`, `agent`, `content`, `type`, `status`, `parent`) VALUES (4, 34, 1717671637, 'a', NULL, NULL, '123@gmail.com', 'https://www.google.com.vn/', '10.233.66.92', NULL, 'rat hay', NULL, 'approved', NULL);
INSERT INTO `t_comments` (`coid`, `cid`, `created`, `author`, `authorId`, `ownerId`, `mail`, `url`, `ip`, `agent`, `content`, `type`, `status`, `parent`) VALUES (5, 34, 1717688048, 'b', NULL, NULL, 'b@gmail.com', 'https://www.youtube.com/', '10.233.66.92', NULL, 'tuyet voi', NULL, 'approved', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_contents
-- ----------------------------
DROP TABLE IF EXISTS `t_contents`;
CREATE TABLE `t_contents` (
  `cid` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `titlePic` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created` int unsigned DEFAULT '0',
  `modified` int unsigned DEFAULT '0',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '内容文字',
  `authorId` int unsigned DEFAULT '0',
  `type` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'post',
  `status` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'publish',
  `tags` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `categories` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `hits` int unsigned DEFAULT '0',
  `commentsNum` int unsigned DEFAULT '0',
  `allowComment` tinyint(1) DEFAULT '1',
  `allowPing` tinyint(1) DEFAULT '1',
  `allowFeed` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`cid`) USING BTREE,
  UNIQUE KEY `slug` (`slug`) USING BTREE,
  KEY `created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_contents
-- ----------------------------
BEGIN;
INSERT INTO `t_contents` (`cid`, `title`, `titlePic`, `slug`, `created`, `modified`, `content`, `authorId`, `type`, `status`, `tags`, `categories`, `hits`, `commentsNum`, `allowComment`, `allowPing`, `allowFeed`) VALUES (34, 'A', NULL, NULL, 1717670713, 1718276297, 'asf', NULL, 'post', 'publish', 'as', 'ab', 11, 2, 1, NULL, NULL);
INSERT INTO `t_contents` (`cid`, `title`, `titlePic`, `slug`, `created`, `modified`, `content`, `authorId`, `type`, `status`, `tags`, `categories`, `hits`, `commentsNum`, `allowComment`, `allowPing`, `allowFeed`) VALUES (36, 'b', NULL, NULL, 1717688973, 1718276254, 'b', NULL, 'post', 'publish', 'b', 'ab', 11, 0, 1, NULL, NULL);
INSERT INTO `t_contents` (`cid`, `title`, `titlePic`, `slug`, `created`, `modified`, `content`, `authorId`, `type`, `status`, `tags`, `categories`, `hits`, `commentsNum`, `allowComment`, `allowPing`, `allowFeed`) VALUES (39, 'c', NULL, NULL, 1718276242, 0, 'c', NULL, 'post', 'publish', 'c', 'ab', 1, 0, 1, NULL, NULL);
INSERT INTO `t_contents` (`cid`, `title`, `titlePic`, `slug`, `created`, `modified`, `content`, `authorId`, `type`, `status`, `tags`, `categories`, `hits`, `commentsNum`, `allowComment`, `allowPing`, `allowFeed`) VALUES (40, 'g', NULL, NULL, 1718277312, 1718277368, 'g', NULL, 'post', 'publish', 'g', 'ab', 1, 0, 1, NULL, NULL);
INSERT INTO `t_contents` (`cid`, `title`, `titlePic`, `slug`, `created`, `modified`, `content`, `authorId`, `type`, `status`, `tags`, `categories`, `hits`, `commentsNum`, `allowComment`, `allowPing`, `allowFeed`) VALUES (41, 'n', NULL, NULL, 1718277357, 0, 'n', NULL, 'post', 'publish', 'n', 'ab', 1, 0, 1, NULL, NULL);
INSERT INTO `t_contents` (`cid`, `title`, `titlePic`, `slug`, `created`, `modified`, `content`, `authorId`, `type`, `status`, `tags`, `categories`, `hits`, `commentsNum`, `allowComment`, `allowPing`, `allowFeed`) VALUES (42, 'k', NULL, NULL, 1718277395, 1718343239, 'k', NULL, 'post', 'publish', '', 'Danh mục Mặc định', 1, 0, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_logs`;
CREATE TABLE `t_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `action` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '事件',
  `data` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '数据',
  `authorId` int DEFAULT NULL COMMENT '作者编号',
  `ip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'ip地址',
  `created` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_logs
-- ----------------------------
BEGIN;
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (184, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717062585);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (185, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717465424);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (186, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717465605);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (187, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717465915);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (188, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717466116);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (189, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717466486);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (190, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717467070);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (191, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717467571);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (192, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717468051);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (193, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717468198);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (194, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717468376);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (195, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717508491);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (196, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717508917);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (197, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717509434);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (198, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717509533);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (199, '登录后台', 'admin用户', 1, '0:0:0:0:0:0:0:1', 1717509787);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (200, '登录后台', 'admin用户', 1, '10.233.66.92', 1717556476);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (201, '登录后台', 'admin用户', 1, '10.233.66.92', 1717556641);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (202, '登录后台', 'admin用户', 1, '10.233.66.92', 1717556667);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (203, '登录后台', 'admin用户', 1, '10.233.66.92', 1717556673);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (204, '登录后台', 'admin用户', 1, '10.233.66.92', 1717556678);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (205, '登录后台', 'admin用户', 1, '10.233.66.92', 1717556758);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (206, '登录后台', 'admin用户', 1, '10.233.66.92', 1717557049);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (207, '登录后台', 'admin用户', 1, '10.233.66.92', 1717557176);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (208, '保存系统设置', '{\"site_record\":\"UTC\",\"google_site_verification\":\"UTC\",\"site_description\":\"UTC\",\"baidu_site_verification\":\"UTC\",\"site_title\":\"UTC\",\"allow_install\":\"\"}', 1, '10.233.66.92', 1717557208);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (209, '登录后台', 'admin用户', 1, '10.233.66.92', 1717557242);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (210, '登录后台', 'admin用户', 1, '10.233.66.92', 1717557715);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (211, '登录后台', 'admin用户', 1, '10.233.66.92', 1717557715);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (212, '登录后台', 'admin用户', 1, '10.233.66.92', 1717570903);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (213, '登录后台', 'admin用户', 1, '10.233.66.92', 1717571132);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (214, '登录后台', 'admin用户', 1, '10.233.66.92', 1717572398);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (215, '登录后台', 'admin用户', 1, '10.233.66.92', 1717572404);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (216, '登录后台', 'admin用户', 1, '10.233.66.92', 1717653469);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (217, '登录后台', 'admin用户', 1, '10.233.66.92', 1717670474);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (218, '删除文章', '35', 1, '10.233.66.92', 1717671348);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (219, '登录后台', 'admin用户', 1, '10.233.66.92', 1717686951);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (220, '保存系统设置', '{\"social_zhihu\":\"UTC\",\"social_resume\":\"UTC\",\"social_jianshu\":\"UTC\",\"social_github\":\"UTC\",\"social_twitter\":\"UTC\",\"social_csdn\":\"utc\",\"social_weibo\":\"UTC\"}', 1, '10.233.66.92', 1717687265);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (221, '保存系统设置', '{\"social_zhihu\":\"UTC\",\"social_resume\":\"UTC\",\"social_jianshu\":\"UTC\",\"social_github\":\"UTC\",\"social_twitter\":\"UTC\",\"social_csdn\":\"UTC\",\"social_weibo\":\"UTC\"}', 1, '10.233.66.92', 1717687269);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (222, '删除文章', '37', 1, '10.233.66.92', 1717689161);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (223, '删除文章', '38', 1, '10.233.66.92', 1717689165);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (224, '登录后台', 'admin用户', 1, '10.233.66.92', 1717744818);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (225, '登录后台', 'admin用户', 1, '10.233.66.92', 1717749498);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (226, '登录后台', 'admin用户', 1, '10.233.66.92', 1717988982);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (227, '登录后台', 'admin用户', 1, '10.233.66.92', 1717989157);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (228, '登录后台', 'admin用户', 1, '10.233.66.92', 1718247774);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (229, 'Đăng nhập vào nền', 'admin用户', 1, '127.0.0.1', 1718260325);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (230, 'Đăng nhập vào nền', 'admin用户', 1, '10.233.66.92', 1718276203);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (231, 'Lưu cài đặt hệ thống', '{\"site_record\":\"UTC\",\"google_site_verification\":\"UTC\",\"site_description\":\"UTC\",\"baidu_site_verification\":\"UTC\",\"site_title\":\"UTC\",\"allow_install\":\"\"}', 1, '10.233.66.92', 1718276404);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (232, 'Đăng nhập vào nền', 'admin用户', 1, '127.0.0.1', 1718300463);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (233, 'Đăng nhập vào nền', 'admin用户', 1, '10.233.66.92', 1718300557);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (234, 'Đăng nhập vào nền', 'admin用户', 1, '10.233.66.92', 1718343140);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (235, 'Đăng nhập vào nền', 'admin用户', 1, '10.233.66.92', 1718499892);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (236, 'Đăng nhập vào nền', 'admin用户', 1, '10.233.66.92', 1718528175);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (237, 'Đăng nhập vào nền', 'admin用户', 1, '10.233.66.92', 1718547523);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (238, 'Đăng nhập vào nền', 'admin用户', 1, '10.233.66.92', 1718547543);
INSERT INTO `t_logs` (`id`, `action`, `data`, `authorId`, `ip`, `created`) VALUES (239, 'Đăng nhập vào nền', 'admin用户', 1, '10.233.66.92', 1718550331);
COMMIT;

-- ----------------------------
-- Table structure for t_metas
-- ----------------------------
DROP TABLE IF EXISTS `t_metas`;
CREATE TABLE `t_metas` (
  `mid` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `contentType` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `sort` int unsigned DEFAULT '0',
  `parent` int unsigned DEFAULT '0',
  PRIMARY KEY (`mid`) USING BTREE,
  KEY `slug` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_metas
-- ----------------------------
BEGIN;
INSERT INTO `t_metas` (`mid`, `name`, `slug`, `type`, `contentType`, `description`, `sort`, `parent`) VALUES (49, 'a', 'a', 'tag', NULL, NULL, NULL, NULL);
INSERT INTO `t_metas` (`mid`, `name`, `slug`, `type`, `contentType`, `description`, `sort`, `parent`) VALUES (51, 'as', 'as', 'tag', NULL, NULL, NULL, NULL);
INSERT INTO `t_metas` (`mid`, `name`, `slug`, `type`, `contentType`, `description`, `sort`, `parent`) VALUES (54, 'a', 'https://www.google.com.vn/', 'link', NULL, 'https://www.freepik.com/free-vector/geometric-logo-collection_1219513', 2, NULL);
INSERT INTO `t_metas` (`mid`, `name`, `slug`, `type`, `contentType`, `description`, `sort`, `parent`) VALUES (56, 'ab', NULL, 'category', NULL, NULL, NULL, NULL);
INSERT INTO `t_metas` (`mid`, `name`, `slug`, `type`, `contentType`, `description`, `sort`, `parent`) VALUES (57, 'b', 'b', 'tag', NULL, NULL, NULL, NULL);
INSERT INTO `t_metas` (`mid`, `name`, `slug`, `type`, `contentType`, `description`, `sort`, `parent`) VALUES (58, 'c', 'c', 'tag', NULL, NULL, NULL, NULL);
INSERT INTO `t_metas` (`mid`, `name`, `slug`, `type`, `contentType`, `description`, `sort`, `parent`) VALUES (59, 'd', 'd', 'tag', NULL, NULL, NULL, NULL);
INSERT INTO `t_metas` (`mid`, `name`, `slug`, `type`, `contentType`, `description`, `sort`, `parent`) VALUES (60, 'g', 'g', 'tag', NULL, NULL, NULL, NULL);
INSERT INTO `t_metas` (`mid`, `name`, `slug`, `type`, `contentType`, `description`, `sort`, `parent`) VALUES (62, 'n', 'n', 'tag', NULL, NULL, NULL, NULL);
INSERT INTO `t_metas` (`mid`, `name`, `slug`, `type`, `contentType`, `description`, `sort`, `parent`) VALUES (63, 'Danh mục Mặc định', 'Danh mục Mặc định', 'category', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_options
-- ----------------------------
DROP TABLE IF EXISTS `t_options`;
CREATE TABLE `t_options` (
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `value` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '',
  `description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_options
-- ----------------------------
BEGIN;
INSERT INTO `t_options` (`name`, `value`, `description`) VALUES ('baidu_site_verification', 'UTC', 'UTC');
INSERT INTO `t_options` (`name`, `value`, `description`) VALUES ('google_site_verification', 'UTC', 'UTC');
INSERT INTO `t_options` (`name`, `value`, `description`) VALUES ('site_description', 'UTC', 'UTC');
INSERT INTO `t_options` (`name`, `value`, `description`) VALUES ('site_record', 'UTC', 'UTC');
INSERT INTO `t_options` (`name`, `value`, `description`) VALUES ('site_title', 'UTC', 'UTC');
INSERT INTO `t_options` (`name`, `value`, `description`) VALUES ('social_csdn', 'UTC', 'UTC');
INSERT INTO `t_options` (`name`, `value`, `description`) VALUES ('social_github', 'UTC', 'UTC');
INSERT INTO `t_options` (`name`, `value`, `description`) VALUES ('social_jianshu', 'UTC', 'UTC');
INSERT INTO `t_options` (`name`, `value`, `description`) VALUES ('social_resume', 'UTC', 'UTC');
INSERT INTO `t_options` (`name`, `value`, `description`) VALUES ('social_twitter', 'UTC', 'UTC');
INSERT INTO `t_options` (`name`, `value`, `description`) VALUES ('social_weibo', 'UTC', 'UTC');
INSERT INTO `t_options` (`name`, `value`, `description`) VALUES ('social_zhihu', 'UTC', 'UTC');
COMMIT;

-- ----------------------------
-- Table structure for t_relationships
-- ----------------------------
DROP TABLE IF EXISTS `t_relationships`;
CREATE TABLE `t_relationships` (
  `cid` int unsigned NOT NULL,
  `mid` int unsigned NOT NULL,
  PRIMARY KEY (`cid`,`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_relationships
-- ----------------------------
BEGIN;
INSERT INTO `t_relationships` (`cid`, `mid`) VALUES (34, 51);
INSERT INTO `t_relationships` (`cid`, `mid`) VALUES (34, 56);
INSERT INTO `t_relationships` (`cid`, `mid`) VALUES (36, 56);
INSERT INTO `t_relationships` (`cid`, `mid`) VALUES (36, 57);
INSERT INTO `t_relationships` (`cid`, `mid`) VALUES (39, 56);
INSERT INTO `t_relationships` (`cid`, `mid`) VALUES (39, 58);
INSERT INTO `t_relationships` (`cid`, `mid`) VALUES (40, 56);
INSERT INTO `t_relationships` (`cid`, `mid`) VALUES (40, 60);
INSERT INTO `t_relationships` (`cid`, `mid`) VALUES (41, 56);
INSERT INTO `t_relationships` (`cid`, `mid`) VALUES (41, 62);
INSERT INTO `t_relationships` (`cid`, `mid`) VALUES (42, 63);
COMMIT;

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `homeUrl` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `screenName` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created` int unsigned DEFAULT '0',
  `activated` int unsigned DEFAULT '0',
  `logged` int unsigned DEFAULT '0',
  `groupName` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'visitor',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `name` (`username`) USING BTREE,
  UNIQUE KEY `mail` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_users
-- ----------------------------
BEGIN;
INSERT INTO `t_users` (`uid`, `username`, `password`, `email`, `homeUrl`, `screenName`, `created`, `activated`, `logged`, `groupName`) VALUES (1, 'admin', 'a66abb5684c45962d887564f08346e8d', '864655735@qq.com', NULL, 'admin', 1490756162, 0, 0, 'visitor');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
