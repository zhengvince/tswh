/*
 Navicat Premium Data Transfer

 Source Server         : mac
 Source Server Type    : MySQL
 Source Server Version : 50710
 Source Host           : localhost
 Source Database       : tsw

 Target Server Type    : MySQL
 Target Server Version : 50710
 File Encoding         : utf-8

 Date: 05/19/2016 16:28:09 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `gc_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `gc_dictionary`;
CREATE TABLE `gc_dictionary` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT '名称，最多100个字节＝33个汉字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述，最多255个字节',
  `parent_id` varchar(100) DEFAULT NULL COMMENT '用于层级查询，和修复树结构',
  `tree_path` varchar(400) DEFAULT '，' COMMENT '所有父级节点id，也称路径, 最多9层目录，逗号分隔',
  `sequence` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者id',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '被删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sys_dictionary_all` (`name`,`parent_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gc_element`
-- ----------------------------
DROP TABLE IF EXISTS `gc_element`;
CREATE TABLE `gc_element` (
  `id` varchar(36) NOT NULL,
  `permission_id` varchar(36) DEFAULT NULL,
  `is_show` tinyint(1) DEFAULT '1',
  `name` varchar(64) NOT NULL COMMENT '名称，最多100个字节＝33个汉字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述，最多255个字节',
  `parent_id` varchar(100) DEFAULT NULL COMMENT '用于层级查询，和修复树结构',
  `tree_path` varchar(400) DEFAULT '，' COMMENT '所有父级节点id，也称路径, 最多9层目录，逗号分隔',
  `sequence` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者id',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '被删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gc_file`
-- ----------------------------
DROP TABLE IF EXISTS `gc_file`;
CREATE TABLE `gc_file` (
  `id` varchar(36) NOT NULL,
  `permission_id` varchar(36) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT '名称，最多100个字节＝33个汉字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述，最多255个字节',
  `parent_id` varchar(100) DEFAULT NULL COMMENT '用于层级查询，和修复树结构',
  `tree_path` varchar(400) DEFAULT '，' COMMENT '所有父级节点id，也称路径, 最多9层目录，逗号分隔',
  `sequence` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者id',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '被删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sys_file_name` (`file_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件';

-- ----------------------------
--  Table structure for `gc_group`
-- ----------------------------
DROP TABLE IF EXISTS `gc_group`;
CREATE TABLE `gc_group` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT '名称，最多100个字节＝33个汉字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述，最多255个字节',
  `parent_id` varchar(100) DEFAULT NULL COMMENT '用于层级查询，和修复树结构',
  `tree_path` varchar(400) DEFAULT '，' COMMENT '所有父级节点id，也称路径, 最多9层目录，逗号分隔',
  `sequence` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者id',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '被删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sys_group_all` (`name`,`parent_id`,`sequence`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `gc_group`
-- ----------------------------
BEGIN;
INSERT INTO `gc_group` VALUES ('star', 'star小组', '', 'zb', 'id-1,zb', null, null, null, null, null, '0'), ('dd', '督导组', '', 'zb', 'id-1,zb', null, null, null, null, null, '0'), ('zb', '总部人员', null, 'id-1', 'id-1', null, null, null, null, null, '0'), ('zmgj', '正面管教种子', null, 'yx', 'id-1,yx', null, null, null, null, null, null), ('id-1', '群组', '根目录', null, '', null, null, null, null, null, '0'), ('yx', '园校人员', null, 'id-1', 'id-1', null, null, null, null, null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `gc_log`
-- ----------------------------
DROP TABLE IF EXISTS `gc_log`;
CREATE TABLE `gc_log` (
  `id` varchar(36) NOT NULL,
  `log_type` char(20) DEFAULT '1' COMMENT '日志类型（1：接入日志；2：异常日志）',
  `title` varchar(500) DEFAULT NULL,
  `create_by` varchar(36) DEFAULT NULL COMMENT '创建者id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(20) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `uri` varchar(255) DEFAULT NULL COMMENT '请求uri',
  `method` varchar(5) DEFAULT NULL COMMENT '请求方法',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
--  Table structure for `gc_menu`
-- ----------------------------
DROP TABLE IF EXISTS `gc_menu`;
CREATE TABLE `gc_menu` (
  `id` varchar(36) NOT NULL,
  `permission_id` varchar(36) DEFAULT NULL,
  `url` varchar(2083) DEFAULT NULL,
  `is_show` tinyint(1) DEFAULT '1',
  `icon` varchar(100) DEFAULT NULL,
  `show_in` varchar(30) DEFAULT NULL COMMENT 'target ＝（mainframe、 _blank、_self、_parent、_top）',
  `name` varchar(64) NOT NULL COMMENT '名称，最多100个字节＝33个汉字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述，最多255个字节',
  `parent_id` varchar(100) DEFAULT NULL COMMENT '用于层级查询，和修复树结构',
  `tree_path` varchar(400) DEFAULT '，' COMMENT '所有父级节点id，也称路径, 最多9层目录，逗号分隔',
  `sequence` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者id',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '被删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sys_menu_tree` (`parent_id`,`sequence`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gc_module`
-- ----------------------------
DROP TABLE IF EXISTS `gc_module`;
CREATE TABLE `gc_module` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT '名称，最多100个字节＝33个汉字',
  `permission_id` varchar(36) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT '描述，最多255个字节',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者id',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '被删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sys_module_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gc_org`
-- ----------------------------
DROP TABLE IF EXISTS `gc_org`;
CREATE TABLE `gc_org` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT '名称，最多100个字节＝33个汉字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述，最多255个字节',
  `parent_id` varchar(100) DEFAULT NULL COMMENT '用于层级查询，和修复树结构',
  `tree_path` varchar(400) DEFAULT '，' COMMENT '所有父级节点id，也称路径, 最多9层目录，逗号分隔',
  `sequence` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者id',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '被删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sys_org_tree` (`parent_id`,`sequence`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `gc_org`
-- ----------------------------
BEGIN;
INSERT INTO `gc_org` VALUES ('jyjy', '建业教育', null, null, null, null, null, null, null, null, '0'), ('zgs', '总公司', null, 'jyjy', 'jyjy', null, null, null, null, null, '0'), ('zcb', '总裁办', null, 'zgs', 'jyjy,zgs', null, null, null, null, null, '0'), ('zy', '郑州一公司', null, 'jyjy', 'jyjy', null, null, null, null, null, '0'), ('ppb', '品牌部', null, 'zgs', 'jyjy,zgs', null, null, null, null, null, '0'), ('bybj', '保育保健', null, 'zgs', 'jyjy,zgs', null, null, null, null, null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `gc_permission`
-- ----------------------------
DROP TABLE IF EXISTS `gc_permission`;
CREATE TABLE `gc_permission` (
  `id` varchar(36) NOT NULL,
  `code` varchar(100) NOT NULL COMMENT '权限口令， role可以拥有， menu可以需要',
  `validity_at` datetime DEFAULT NULL COMMENT '为空将一直有效',
  `name` varchar(64) NOT NULL COMMENT '名称，最多100个字节＝33个汉字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述，最多255个字节',
  `parent_id` varchar(100) DEFAULT NULL COMMENT '用于层级查询，和修复树结构',
  `tree_path` varchar(400) DEFAULT '，' COMMENT '所有父级节点id，也称路径, 最多9层目录，逗号分隔',
  `sequence` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者id',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '被删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sys_permission_type` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gc_position`
-- ----------------------------
DROP TABLE IF EXISTS `gc_position`;
CREATE TABLE `gc_position` (
  `id` varchar(36) NOT NULL,
  `org_id` varchar(36) DEFAULT NULL,
  `name` varchar(64) NOT NULL COMMENT '名称，最多100个字节＝33个汉字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述，最多255个字节',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者id',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '被删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sys_position_name` (`org_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `gc_position`
-- ----------------------------
BEGIN;
INSERT INTO `gc_position` VALUES ('xxzy', 'zcb', '信息专员', null, null, null, null, null, '0'), ('bgszr', 'zcb', '办公室主任', null, null, null, null, null, '0'), ('zyjl', 'zy', '郑一经理', null, null, null, null, null, '0'), ('ppbz', 'ppb', '品牌部部长', null, null, null, null, null, '0'), ('ppbzy', 'ppb', '品牌部专员', null, null, null, null, null, '0'), ('bybjbz', 'bybj', '保育保健部长', null, null, null, null, null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `gc_role`
-- ----------------------------
DROP TABLE IF EXISTS `gc_role`;
CREATE TABLE `gc_role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT '名称，最多100个字节＝33个汉字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述，最多255个字节',
  `parent_id` varchar(100) DEFAULT NULL COMMENT '用于层级查询，和修复树结构',
  `tree_path` varchar(400) DEFAULT '，' COMMENT '所有父级节点id，也称路径, 最多9层目录，逗号分隔',
  `sequence` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者id',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '被删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sys_role_tree` (`parent_id`,`name`,`sequence`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `gc_role`
-- ----------------------------
BEGIN;
INSERT INTO `gc_role` VALUES ('leader', '领导', null, null, null, null, null, null, null, null, '0'), ('staff', '员工', null, null, null, null, null, null, null, null, '0'), ('teacher', '老师', null, null, null, null, null, null, null, null, '0'), ('admin', '管理员', null, null, null, null, null, null, null, null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `gc_role_group`
-- ----------------------------
DROP TABLE IF EXISTS `gc_role_group`;
CREATE TABLE `gc_role_group` (
  `role_id` varchar(36) NOT NULL,
  `group_id` varchar(36) NOT NULL,
  UNIQUE KEY `role_id` (`role_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gc_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `gc_role_permission`;
CREATE TABLE `gc_role_permission` (
  `role_id` varchar(36) NOT NULL,
  `permission_id` varchar(36) NOT NULL,
  UNIQUE KEY `role_id` (`role_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gc_role_position`
-- ----------------------------
DROP TABLE IF EXISTS `gc_role_position`;
CREATE TABLE `gc_role_position` (
  `position_id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  UNIQUE KEY `position_id` (`position_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `gc_role_position`
-- ----------------------------
BEGIN;
INSERT INTO `gc_role_position` VALUES ('bgszr', 'admin'), ('xxzy', 'admin');
COMMIT;

-- ----------------------------
--  Table structure for `gc_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `gc_role_user`;
CREATE TABLE `gc_role_user` (
  `user_id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `gc_role_user`
-- ----------------------------
BEGIN;
INSERT INTO `gc_role_user` VALUES ('star_dd_lihuimin', 'leader'), ('star_dd_lihuimin', 'staff'), ('star_liuyimeng', 'staff'), ('star_liuyimeng', 'teacher'), ('star_liyi', 'staff'), ('star_liyi', 'teacher'), ('zb_dd_liuyun', 'admin'), ('zb_dd_liuyun', 'leader'), ('zb_dd_liuyun', 'staff'), ('zb_star_dd_wangjianjun', 'leader'), ('zb_star_dd_wangjianjun', 'staff'), ('zb_star_dd_wangjianjun', 'teacher'), ('zb_zhengwei', 'admin'), ('zb_zhengwei', 'staff');
COMMIT;

-- ----------------------------
--  Table structure for `gc_user`
-- ----------------------------
DROP TABLE IF EXISTS `gc_user`;
CREATE TABLE `gc_user` (
  `id` varchar(36) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `real_name` varchar(36) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL COMMENT '人为设定的编号，不可重复，最多36位',
  `pinyin_name` varchar(36) DEFAULT NULL,
  `cellphone` varchar(18) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL COMMENT 'staff=员工,\nstudent=学生,\nparent=文件,',
  `login_ip` varchar(20) DEFAULT NULL,
  `login_at` datetime DEFAULT NULL,
  `status_str` varchar(20) DEFAULT NULL,
  `salt` varchar(60) DEFAULT NULL,
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者id',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者id',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '被删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `code` (`code`),
  KEY `sys_user_name` (`username`,`password`,`salt`,`user_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `gc_user`
-- ----------------------------
BEGIN;
INSERT INTO `gc_user` VALUES ('id1', 'zw', 'password', '管理员', 'lhk003001', 'guanliyuan', '13888888888', 'webster13@163.com', 'staff', '127.0.0.1', '2016-05-12 23:09:37', '可用', 'salt-123', 'id1', '2016-05-13 23:10:27', 'id1', '2016-05-13 23:10:40', '0'), ('zb_dd_liuyun', 'liuyun', 'password', '刘云', 'lhk003002', 'liuyun', '13888888888', 'webster13@163.com', 'staff', '127.0.0.1', '2016-05-12 23:09:37', '可用', 'salt-123', 'id1', '2016-05-13 23:10:27', 'id1', '2016-05-13 23:10:40', '0'), ('zb_zhengwei', 'zhengwei', 'password', '郑巍', 'lhk003003', 'zhengwei', '13888888888', 'webster13@163.com', 'staff', '127.0.0.1', '2016-05-12 23:09:37', '可用', 'salt-123', 'id1', '2016-05-13 23:10:27', 'id1', '2016-05-13 23:10:40', '0'), ('star_liyi', 'liyi', 'password', '栗怡', 'lhk003021', 'liyi', '13888888888', 'webster13@163.com', 'staff', '127.0.0.1', '2016-05-12 23:09:37', '可用', 'salt-123', 'id1', '2016-05-13 23:10:27', 'id1', '2016-05-13 23:10:40', '0'), ('zb_star_dd_wangjianjun', 'wjj', 'password', '王建军', 'lhk001001', 'wangjianjun', '13888888888', 'webster13@163.com', 'staff', '127.0.0.1', '2016-05-12 23:09:37', '可用', 'salt-123', 'id1', '2016-05-13 23:10:27', 'id1', '2016-05-13 23:10:40', '0'), ('star_liuyimeng', 'lym', 'password', '刘伊梦', 'lhk003031', 'liuyimeng', '13888888888', 'webster13@163.com', 'staff', '127.0.0.1', '2016-05-12 23:09:37', '可用', 'salt-123', 'id1', '2016-05-13 23:10:27', 'id1', '2016-05-13 23:10:40', '0'), ('star_dd_lihuimin', 'lhm', 'password', '李慧敏', 'lhk003051', 'lihuimin', '13888888888', 'webster13@163.com', 'staff', '127.0.0.1', '2016-05-12 23:09:37', '可用', 'salt-123', 'id1', '2016-05-13 23:10:27', 'id1', '2016-05-13 23:10:40', '0'), ('42fda6b4-64ef-4cc4-8c7a-86ddb348a47f', 'webster', 'password', null, null, null, null, null, null, null, null, null, 'qqq', 'one', null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `gc_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `gc_user_group`;
CREATE TABLE `gc_user_group` (
  `user_id` varchar(36) NOT NULL,
  `group_id` varchar(36) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `gc_user_group`
-- ----------------------------
BEGIN;
INSERT INTO `gc_user_group` VALUES ('star_dd_lihuimin', 'dd'), ('star_dd_lihuimin', 'star'), ('star_liuyimeng', 'star'), ('star_liyi', 'star'), ('zb_dd_liuyun', 'dd'), ('zb_dd_liuyun', 'zb'), ('zb_star_dd_wangjianjun', 'dd'), ('zb_star_dd_wangjianjun', 'star'), ('zb_star_dd_wangjianjun', 'zb'), ('zb_zhengwei', 'zb');
COMMIT;

-- ----------------------------
--  Table structure for `gc_user_position`
-- ----------------------------
DROP TABLE IF EXISTS `gc_user_position`;
CREATE TABLE `gc_user_position` (
  `user_id` varchar(36) NOT NULL,
  `position_id` varchar(36) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`position_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `gc_user_position`
-- ----------------------------
BEGIN;
INSERT INTO `gc_user_position` VALUES ('star_dd_lihuimin', 'bybjbz'), ('star_liuyimeng', 'ppbzy'), ('star_liyi', 'ppbzy'), ('zb_dd_liuyun', 'bgszr'), ('zb_dd_liuyun', 'ppbbz'), ('zb_star_dd_wangjianjun', 'ppbbz'), ('zb_star_dd_wangjianjun', 'zyjl'), ('zb_zhengwei', 'xxzy');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
