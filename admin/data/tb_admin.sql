/*
Navicat MySQL Data Transfer

Source Server         : openz
Source Server Version : 50617
Source Host           : 192.168.1.24:3306
Source Database       : h34

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-08-29 10:00:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_admin_passwd`
-- ----------------------------
DROP TABLE IF EXISTS `ym_admin_passwd`;
CREATE TABLE `ym_admin_passwd` (
  `pw_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户->学生id',
  `password` char(32) NOT NULL COMMENT '登陆密码（md5）',
  `authstr` char(6) NOT NULL COMMENT '验证码串 （6位字符串）',
  PRIMARY KEY (`pw_id`),
  UNIQUE KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户密码表';

-- ----------------------------
-- Records of tb_admin_passwd
-- ----------------------------
INSERT INTO `ym_admin_passwd` VALUES ('2', '2', 'a9d74db721e1bb19b7ad6fbc3b653f2a', 'hjqftt');

-- ----------------------------
-- Table structure for `tb_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `ym_admin_user`;
CREATE TABLE `ym_admin_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `nickname` char(30) DEFAULT NULL COMMENT '昵称',
  `email` char(30) NOT NULL COMMENT '电子邮箱',
  `realname` char(10) DEFAULT NULL COMMENT '真实姓名',
  `group_type` tinyint(1) DEFAULT NULL COMMENT '用户所在组类别; 1.超级管理员 2.管理员',
  `add_time` int(10) NOT NULL COMMENT '创建时间',
  `avatar` varchar(20) DEFAULT NULL COMMENT '头像, logo ',
  `login_time` int(10) DEFAULT NULL COMMENT '最后登陆时间',
  `login_ip` char(15) DEFAULT NULL COMMENT '最后登录IP',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0:正常,1:停用）',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `nickname` (`nickname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tb_admin_user
-- ----------------------------
INSERT INTO `ym_admin_user` VALUES ('2', 'spense', 'spense@abc.cn', 'hejiayang', '1', '1405568924', '6ko7zp3gx0k0.jpg', null, null, '0');
