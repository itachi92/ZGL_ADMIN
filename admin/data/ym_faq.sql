-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- 主机: 192.168.1.12:3306
-- 生成日期: 2015 年 09 月 23 日 17:27
-- 服务器版本: 5.6.4-m7-log
-- PHP 版本: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `zgl`
--

-- --------------------------------------------------------

--
-- 表的结构 `ym_faq`
--

CREATE TABLE IF NOT EXISTS `ym_faq` (
  `ym_fid` int(10) NOT NULL AUTO_INCREMENT,
  `ym_user_id` int(10) NOT NULL COMMENT '用户id',
  `ym_admin_id` int(10) NOT NULL DEFAULT '1' COMMENT '对问题进行回复的管理员',
  `ym_title` varchar(100) NOT NULL COMMENT '问题标题',
  `ym_faq` varchar(1000) NOT NULL COMMENT '用户问题',
  `ym_reply` varchar(1000) DEFAULT NULL COMMENT 'ZGL答复',
  `ym_faq_type` tinyint(3) NOT NULL COMMENT '问题类型',
  `ym_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '问题状态: 0: 处理中, 1: 已回复',
  `ym_parentid` int(11) NOT NULL DEFAULT '0' COMMENT '问题父级编号',
  `ym_add_time` int(10) NOT NULL DEFAULT '0' COMMENT '问题添加时间',
  `ym_reply_time` int(10) NOT NULL DEFAULT '0' COMMENT '问题回复时间',
  PRIMARY KEY (`ym_fid`),
  KEY `ym_parent` (`ym_parentid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户支持表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ym_faq`
--

INSERT INTO `ym_faq` (`ym_fid`, `ym_user_id`, `ym_admin_id`, `ym_title`, `ym_faq`, `ym_reply`, `ym_faq_type`, `ym_status`, `ym_parentid`, `ym_add_time`, `ym_reply_time`) VALUES
(1, 4, 4, '怎样快速开店', '快速开店要怎样进行？', '可以参照“帮助中心->快速开店”相关文档', 1, 1, 0, 0, 0),
(2, 4, 4, '怎样收费', '如果在贵平台进行开店的话，是怎样的一个收费标准', '收费和很合理的！', 1, 2, 0, 0, 0),
(3, 4, 4, '商店后台应该怎样进行配置', '你好，我已经购买了模板，进入后台后不知道怎样配置？', '可以先在帮助中心中寻找答案，如果没有找到答案的话，可以联系客服，谢谢！', 1, 2, 0, 0, 0),
(4, 4, 4, '商店支付不了', 'paypal方式支付不了', '怎么支付不了呢？', 1, 1, 0, 0, 0),
(5, 4, 1, '网页加载过于缓慢', '网页加载过于缓慢，用户体验很差，影响销售业绩！', '', 1, 0, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
