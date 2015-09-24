-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- 主机: 192.168.1.12:3306
-- 生成日期: 2015 年 09 月 24 日 18:14
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
-- 表的结构 `ym_admin_passwd`
--

CREATE TABLE IF NOT EXISTS `ym_admin_passwd` (
  `pw_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户->学生id',
  `password` char(32) NOT NULL COMMENT '登陆密码（md5）',
  `authstr` char(6) NOT NULL DEFAULT '' COMMENT '验证码串 （6位字符串）',
  PRIMARY KEY (`pw_id`),
  UNIQUE KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户密码表' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ym_admin_passwd`
--

INSERT INTO `ym_admin_passwd` (`pw_id`, `user_id`, `password`, `authstr`) VALUES
(2, 2, 'a9d74db721e1bb19b7ad6fbc3b653f2a', 'hjqftt'),
(3, 4, '80a5e0c8d9b2c85b0f3fba41449544ab', ''),
(4, 5, '80a5e0c8d9b2c85b0f3fba41449544ab', ''),
(5, 6, '80a5e0c8d9b2c85b0f3fba41449544ab', ''),
(6, 7, '80a5e0c8d9b2c85b0f3fba41449544ab', '');

-- --------------------------------------------------------

--
-- 表的结构 `ym_admin_user`
--

CREATE TABLE IF NOT EXISTS `ym_admin_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `nickname` char(30) DEFAULT NULL COMMENT '昵称',
  `email` char(30) NOT NULL COMMENT '电子邮箱',
  `phone` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户注册手机号',
  `realname` char(10) DEFAULT NULL COMMENT '真实姓名',
  `group_type` tinyint(1) DEFAULT NULL COMMENT '用户所在组类别; 1.超级管理员 2.管理员',
  `add_time` int(10) NOT NULL COMMENT '创建时间',
  `avatar` varchar(20) DEFAULT NULL COMMENT '头像, logo ',
  `login_time` int(10) DEFAULT NULL COMMENT '最后登陆时间',
  `login_ip` char(15) DEFAULT NULL COMMENT '最后登录IP',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0:正常,1:停用）',
  `error_login_try_time` tinyint(1) NOT NULL DEFAULT '5' COMMENT '默认允许用户进行5次错误登录，错误登录尝试次数',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `nickname` (`nickname`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ym_admin_user`
--

INSERT INTO `ym_admin_user` (`user_id`, `nickname`, `email`, `phone`, `realname`, `group_type`, `add_time`, `avatar`, `login_time`, `login_ip`, `status`, `error_login_try_time`) VALUES
(2, 'spense', 'spense@abc.cn', 0, 'hejiayang', 1, 1405568924, '6ko7zp3gx0k0.jpg', NULL, NULL, 0, 5),
(4, NULL, '18721109740@zgl.com', 18721109740, NULL, NULL, 1442373663, NULL, NULL, NULL, 0, 5),
(5, NULL, '18696283855@zgl.com', 18696283855, NULL, NULL, 1442380050, NULL, NULL, NULL, 0, 5),
(6, NULL, '123456789@zgl.com', 123456789, NULL, NULL, 1442383611, NULL, NULL, NULL, 0, 5),
(7, NULL, '120@zgl.com', 120, NULL, NULL, 1442396080, NULL, NULL, NULL, 0, 5);

-- --------------------------------------------------------

--
-- 表的结构 `ym_colour`
--

CREATE TABLE IF NOT EXISTS `ym_colour` (
  `ym_id` int(3) NOT NULL AUTO_INCREMENT,
  `ym_colour_name` varchar(10) NOT NULL DEFAULT '0' COMMENT '颜色名',
  PRIMARY KEY (`ym_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='模板颜色表' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `ym_colour`
--

INSERT INTO `ym_colour` (`ym_id`, `ym_colour_name`) VALUES
(1, '红色'),
(2, '橙色'),
(3, '黄色'),
(4, '绿色'),
(5, '洋绿'),
(6, '蓝色'),
(7, '紫色'),
(8, '粉色'),
(9, '白色'),
(10, '灰色'),
(11, '黑色'),
(12, '褐色');

-- --------------------------------------------------------

--
-- 表的结构 `ym_co_affiliate`
--

CREATE TABLE IF NOT EXISTS `ym_co_affiliate` (
  `ym_co_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ym_user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户uid,默认值0 非注册用户',
  `ym_name` varchar(30) NOT NULL COMMENT '姓名',
  `ym_phone` bigint(19) NOT NULL COMMENT '联系电话',
  `ym_qq` bigint(19) NOT NULL,
  `ym_mail` varchar(50) DEFAULT NULL COMMENT '联系邮箱',
  `ym_business_scope` varchar(300) DEFAULT NULL COMMENT '业务范围',
  `ym_address` varchar(30) NOT NULL COMMENT '联系地址',
  `ym_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '加盟类型: 1:经销商, 2:设计师, 3:开发者, 4:培训师',
  PRIMARY KEY (`ym_co_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='合作加盟表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ym_co_affiliate`
--

INSERT INTO `ym_co_affiliate` (`ym_co_id`, `ym_user_id`, `ym_name`, `ym_phone`, `ym_qq`, `ym_mail`, `ym_business_scope`, `ym_address`, `ym_type`) VALUES
(4, 0, 'hejian', 13928427059, 1026322, 'test@test.com', '跨境电商', 'fujian', 1);

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
  `ym_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '问题状态: 0: 待解决, 1: 待反馈，2：新反馈，3：已解决',
  `ym_parentid` int(11) NOT NULL DEFAULT '0' COMMENT '问题父级编号',
  `ym_add_time` int(10) NOT NULL DEFAULT '0' COMMENT '问题添加时间',
  `ym_reply_time` int(10) NOT NULL DEFAULT '0' COMMENT '问题回复时间',
  PRIMARY KEY (`ym_fid`),
  KEY `ym_parent` (`ym_parentid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户支持表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `ym_faq`
--

INSERT INTO `ym_faq` (`ym_fid`, `ym_user_id`, `ym_admin_id`, `ym_title`, `ym_faq`, `ym_reply`, `ym_faq_type`, `ym_status`, `ym_parentid`, `ym_add_time`, `ym_reply_time`) VALUES
(1, 4, 4, '怎样快速开店', '快速开店要怎样进行？', '可以参照“帮助中心->快速开店”相关文档', 1, 1, 0, 0, 0),
(2, 4, 4, '怎样快速开店', '谢谢，问题已得到解决', '', 1, 2, 1, 0, 0),
(3, 4, 4, 'paypal支付不了', '在商店购买商品后，不能使用paypal进行支付', '支付操作的时候页面是否有报错呢', 1, 1, 0, 0, 0),
(4, 4, 4, 'paypal支付不了', '页面没有报错', '请联系客服，会有专门的技术人员为你解答！', 1, 1, 3, 0, 0),
(5, 4, 4, 'paypal支付不了', '问题已得到完美解决，谢谢！', '^_^', 1, 2, 4, 0, 0),
(6, 4, 1, '网页加载缓慢', '网页打开总是很慢', '', 1, 0, 0, 0, 0),
(7, 4, 4, '运费设置问题', '运费怎样进行设置', '可以参照文档', 1, 1, 0, 0, 0),
(8, 4, 1, '站点风格', '怎样自定义站点风格?', '', 1, 0, 0, 0, 0),
(9, 4, 4, '后台设置', '怎样进行后台设置?', '很简单的啊o(-"-)o', 1, 1, 0, 0, 0),
(10, 4, 4, '后台设置', 'test', 'so easy!', 1, 1, 9, 0, 1443087043),
(11, 4, 4, '后台设置', 'test', 'too easy└(^o^)┘', 1, 1, 10, 0, 1443088078);

-- --------------------------------------------------------

--
-- 表的结构 `ym_faq_type`
--

CREATE TABLE IF NOT EXISTS `ym_faq_type` (
  `ym_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `ym_faq_type` tinyint(3) NOT NULL COMMENT '问题类型id',
  `ym_faq_tag` char(6) NOT NULL COMMENT '问题标签',
  PRIMARY KEY (`ym_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='问题类型表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ym_faq_type`
--

INSERT INTO `ym_faq_type` (`ym_id`, `ym_faq_type`, `ym_faq_tag`) VALUES
(1, 1, '商城问题'),
(2, 2, '后台问题'),
(3, 3, '营销优化'),
(4, 4, '建议反馈'),
(5, 5, '其他');

-- --------------------------------------------------------

--
-- 表的结构 `ym_label`
--

CREATE TABLE IF NOT EXISTS `ym_label` (
  `ym_id` int(3) NOT NULL AUTO_INCREMENT,
  `ym_label_name` varchar(15) NOT NULL DEFAULT '0' COMMENT '标签名',
  PRIMARY KEY (`ym_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='标签表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ym_label`
--

INSERT INTO `ym_label` (`ym_id`, `ym_label_name`) VALUES
(1, '响应式'),
(2, '时尚'),
(3, '酷炫'),
(4, '清爽');

-- --------------------------------------------------------

--
-- 表的结构 `ym_template`
--

CREATE TABLE IF NOT EXISTS `ym_template` (
  `ym_id` int(6) NOT NULL AUTO_INCREMENT,
  `ym_name` varchar(30) DEFAULT NULL COMMENT '用来显示域名',
  `ym_url` varchar(100) NOT NULL DEFAULT '0' COMMENT '预览路径',
  `ym_img` varchar(100) NOT NULL DEFAULT '0' COMMENT '首页大图片的url',
  `ym_big_img` varchar(100) NOT NULL DEFAULT '0' COMMENT '快速开店的模板图片',
  `ym_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为删除',
  `ym_home` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为首页显示',
  `ym_num` int(5) NOT NULL DEFAULT '0' COMMENT '使用次数',
  `ym_modelname` varchar(100) NOT NULL,
  `ym_description` varchar(255) NOT NULL,
  `ym_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '模板添加时间',
  PRIMARY KEY (`ym_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='模板表' AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `ym_template`
--

INSERT INTO `ym_template` (`ym_id`, `ym_name`, `ym_url`, `ym_img`, `ym_big_img`, `ym_type`, `ym_home`, `ym_num`, `ym_modelname`, `ym_description`, `ym_date`) VALUES
(1, 'demo1', 'http://120.55.125.64:8091', 'assets/tplimg/thumbnail_0001.jpg', 'assets/tplimg/main_0001.jpg', 0, 1, 2, '服装模板', '服装模版，时尚简约，页面分段加载，清晰简洁，设计感强，适用于服装，鞋帽，箱包类外贸商城制作。支持多种语言，字体，颜色。', '0000-00-00 00:00:00.000000'),
(2, 'demo2', 'http://120.55.125.64:8191', 'assets/tplimg/thumbnail_0002.jpg', 'assets/tplimg/main_0002.jpg', 0, 1, 3, '鞋帽模板', '鞋帽模版, 紧凑稳重，美观大气，户外产品类生产与销售公司的企业商城制作。支持多种方式支付，支持快速设置会员促销活动。', '2015-09-23 08:16:48.893633'),
(3, 'demo3', 'http://120.55.125.64:8192', 'assets/tplimg/thumbnail_0003.jpg', 'assets/tplimg/main_0003.jpg', 0, 0, 0, '鞋帽模板', '鞋帽模版，风格时尚，简约精致，适用于适用于服装，鞋帽，箱包类商城制作。', '0000-00-00 00:00:00.000000'),
(4, 'demo4', 'http://120.55.125.64:8193', 'assets/tplimg/thumbnail_0004.jpg', 'assets/tplimg/main_0004.jpg', 0, 0, 0, '鞋帽模板', '鞋帽模版, 紧凑稳重，设计精美，适用于运动，鞋，箱包类产品生产与销售公司的企业商城制作。背景可随意设置，支持物流流转信息同步。', '0000-00-00 00:00:00.000000'),
(5, 'demo5', 'http://120.55.125.64:8194', 'assets/tplimg/thumbnail_0005.jpg', 'assets/tplimg/main_0005.jpg', 0, 0, 5, '服装模板', '服装模版, 设计时尚，界面美观，适用于服装，鞋类箱包类产品生产与销售公司的企业商城制作。', '2015-09-23 08:16:54.479811'),
(6, 'demo6', 'http://120.55.125.64:8195', 'assets/tplimg/thumbnail_0006.jpg', 'assets/tplimg/main_0006.jpg', 0, 0, 0, '服装模板', '服装模版，结构清晰，设计紧凑，适用于服装，箱包类产品生产与销售公司的企业商城制作。交互效果符合国外用户，提升购买欲。', '0000-00-00 00:00:00.000000'),
(7, 'demo7', 'http://120.55.125.64:8196', 'assets/tplimg/thumbnail_0007.jpg', 'assets/tplimg/main_0007.jpg', 0, 0, 0, '服装模板', '服装模版，大气沉稳，结构清晰，适用于服装，箱包类产品生产与销售公司的企业商城制作。', '0000-00-00 00:00:00.000000'),
(8, 'demo8', 'http://120.55.125.64:8197', 'assets/tplimg/thumbnail_0008.jpg', 'assets/tplimg/main_0008.jpg', 0, 0, 10, '鞋帽模板', '鞋帽模版，风格朴实，美观大气，适用于户外箱包，鞋帽，汽车配件类产品生产与销售公司的企业商城制作。主题颜色可定制，灵活百变。', '2015-09-23 08:26:44.488500'),
(9, 'demo9', 'http://120.55.125.64:8198', 'assets/tplimg/thumbnail_0009.jpg', 'assets/tplimg/main_0009.jpg', 0, 0, 0, '服装时尚模板', '鞋帽模版，风格稳重，结构清晰，适用于户外箱包，鞋帽类产品生产与销售公司的企业商城制作。', '0000-00-00 00:00:00.000000'),
(10, 'demo10', 'http://120.55.125.64:8199', 'assets/tplimg/thumbnail_0010.jpg', 'assets/tplimg/main_0010.jpg', 0, 0, 0, '食品模板', '食品保健品模版，结构简洁，设计感强，适用于制作食品、保健品、家居、家具、装饰类外贸商城建设。', '0000-00-00 00:00:00.000000'),
(11, 'demo11', 'http://120.55.125.64:8190', 'assets/tplimg/thumbnail_0011.jpg', 'assets/tplimg/main_0011.jpg', 0, 0, 0, '服装模板', '服装模版，风格美观，结构清晰，适用于服装，3C电子类产品生产与销售公司的企业商城制作', '0000-00-00 00:00:00.000000'),
(12, 'demo12', 'http://120.55.125.64:8192', 'assets/tplimg/thumbnail_0012.jpg', 'assets/tplimg/main_0012.jpg', 0, 0, 0, '服装模版', '服装模板，设计精美，适用于服装厂，服装类生产公司，服装设计等企业商城制作。', '0000-00-00 00:00:00.000000'),
(13, 'demo13', 'http://120.55.125.64:8291', 'assets/tplimg/thumbnail_0013.jpg', 'assets/tplimg/main_0013.jpg', 0, 0, 0, '家居园艺模板', '黑白色风格的家具园艺模版，简约设计，典雅大气，适用于制作家居，家具，装饰类外贸商城建设。模板自动匹配多种分辨率，提升用户体验。', '0000-00-00 00:00:00.000000'),
(14, 'demo14', 'http://120.55.125.64:8292', 'assets/tplimg/thumbnail_0014.jpg', 'assets/tplimg/main_0014.jpg', 0, 0, 0, '家居模板', '黑白色风格的家具园艺模板，简约不失大气，适合于制作家居，家具，装饰类外贸商城建设。', '0000-00-00 00:00:00.000000'),
(15, 'demo15', 'http://120.55.125.64:8293', 'assets/tplimg/thumbnail_0015.jpg', 'assets/tplimg/main_0015.jpg', 0, 0, 0, '家居模版', '灰白色风格的家具园艺模板，结构简洁，风格清晰，设计感强，适合家具、家居用品公司的外贸商城制作。全屏界面适配多少分辨率，加载速度快。', '0000-00-00 00:00:00.000000'),
(16, 'demo16', 'http://120.55.125.64:8294', 'assets/tplimg/thumbnail_0016.jpg', 'assets/tplimg/main_0016.jpg', 0, 0, 0, '家居模版', '模板主要以用户体验为核心的设计理念，打造美观的页面和优质的购物体验。简洁方便的购买程序、安全智能的支付方式，让每个购物的用户感受到舒适与周到。', '0000-00-00 00:00:00.000000'),
(17, 'demo17', 'http://120.55.125.64:8810', 'assets/tplimg/thumbnail_0017.jpg', 'assets/tplimg/main_0017.jpg', 0, 0, 0, '3C电子模板', '此模板主要用于电子产品类网站，随心选择搭配套餐，根据商家不同需求搭配不同的套餐来更方便商家定出更好的战略需求', '0000-00-00 00:00:00.000000'),
(18, 'demo18', 'http://120.55.125.64:8802', 'assets/tplimg/thumbnail_0018.jpg', 'assets/tplimg/main_0018.jpg', 0, 0, 0, '服装模板', '此模板主要用于服装类网站，强大的多店合一功能，实现多店订单、会员、商品数据完美同步；传统电商+移动电商双管齐下布局生意，实现销量翻番！', '0000-00-00 00:00:00.000000'),
(19, 'demo19', 'http://120.55.125.64:8803', 'assets/tplimg/thumbnail_0019.jpg', 'assets/tplimg/main_0019.jpg', 0, 0, 0, '家居模板', '此模板主要用于家居类网站，精美设计的网站界面，简洁方便的购买程序、安全智能的支付方式，充分考虑到用户体验。多种定制，服装鞋帽箱包类均可使用。', '0000-00-00 00:00:00.000000'),
(20, 'demo20', 'http://120.55.125.64:8804', 'assets/tplimg/thumbnail_0020.jpg', 'assets/tplimg/main_0020.jpg', 0, 0, 0, '家居模板', '此模板主要用于家居类网站，精美设计的网站界面，简洁方便的购买程序、安全智能的支付方式，让每个购物的用户感受到舒适与周到。', '0000-00-00 00:00:00.000000'),
(21, 'demo21', 'http://120.55.125.64:8805', 'assets/tplimg/thumbnail_0021.jpg', 'assets/tplimg/main_0021.jpg', 0, 0, 0, '家居模板', '此模板支持快速下单、支持物流跟踪、支持paypal支付，售后一览无余，让每个购物的用户感受到非常的舒适。商城结构清晰，页面简洁，适合多种行业使用。', '0000-00-00 00:00:00.000000'),
(22, 'demo22', 'http://120.55.125.64:8806', 'assets/tplimg/thumbnail_0022.jpg', 'assets/tplimg/main_0022.jpg', 0, 0, 0, '家居模板', '此模板实现了手机、电脑、ipad数据信息全同步，传统电商+移动电商双管齐下布局生意，实现销量翻番。界面逻辑流畅，同样适合箱包、3C电子、计算机、珠宝首饰类建立商城', '0000-00-00 00:00:00.000000'),
(23, 'demo23', 'http://120.55.125.64:8807', 'assets/tplimg/thumbnail_0023.jpg', 'assets/tplimg/main_0023.jpg', 0, 0, 0, '3C电子模板', '这是一款时尚大气的综合通用类模板，整站宽窄自适应，多幅轮播广告图切换，帮您轻松应对各种专题页', '0000-00-00 00:00:00.000000'),
(24, 'demo24', 'http://120.55.125.64:8808', 'assets/tplimg/thumbnail_0024.jpg', 'assets/tplimg/main_0024.jpg', 0, 0, 0, '服装模板', '此模板主要用于服装类网站，当鼠标滑过下拉、悬浮式导航栏等特效让您的网站更具时尚感，让每个购物的用户感受到舒适与周到。', '0000-00-00 00:00:00.000000'),
(25, 'demo25', 'http://120.55.125.64:8801', 'assets/tplimg/thumbnail_0025.jpg', 'assets/tplimg/main_0025.jpg', 0, 0, 0, '服装模板', '此模板主要用于服装类网站，模板左右布局很整齐给人信任之感，整站的布局也符合服装行业特色，里页的细节优化也非常不错，把握住每一个模板小的细节，充分考虑到用户体验。', '0000-00-00 00:00:00.000000'),
(26, 'demo26', 'http://www.auto-repair-tools.com/', 'assets/tplimg/thumbnail_0026.jpg', 'assets/tplimg/main_0026.jpg', 0, 0, 0, '汽车配件模板', '此模板主要用于电子产品类网站，支持快速下单、支持物流跟踪、支持paypal支付，一目了然购物流程，非常强大的一款模板。', '0000-00-00 00:00:00.000000'),
(27, 'demo27', 'http://www.atsfly.com/', 'assets/tplimg/thumbnail_0027.jpg', 'assets/tplimg/main_0027.jpg', 0, 0, 0, '汽车配件模板', '此模板主要用于电子产品类网站，这是一款经典的家电电子模板，首页超大的轮播广告，和下面精致的分栏效果都是该模板的特点，然后是里页面的设计也非常符合电子类产品行业特点。', '0000-00-00 00:00:00.000000'),
(28, 'demo28', 'http://www.oobbdd.com/', 'assets/tplimg/thumbnail_0028.jpg', 'assets/tplimg/main_0028.jpg', 0, 0, 0, '汽车配件模板', '此模板主要用于电子产品类网站，采用DIV+CSS布局，并优化了很多代码，使模板打开速度更快，更利于SEO搜索引擎优化。', '0000-00-00 00:00:00.000000'),
(29, 'demo29', 'http://www.obd2shop.com/', 'assets/tplimg/thumbnail_0029.jpg', 'assets/tplimg/main_0029.jpg', 0, 0, 0, '汽车配件模板', '此模板主要用于电子产品类网站，这款模板最大的特点是层次分明，以不同的色彩来区划层次，显得温馨大方，尤其适合电子产品商家使用。', '0000-00-00 00:00:00.000000'),
(30, 'demo30', 'http://www.atobd.com/', 'assets/tplimg/thumbnail_0030.jpg', 'assets/tplimg/main_0030.jpg', 0, 0, 0, '汽车配件模板', '此模板主要用于电子产品类网站，首页分类区域切换可以自动读取子分类实现切换，色调也为非常干净的白色，产品标题有突出彩色作为点缀。', '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- 表的结构 `ym_template_relate`
--

CREATE TABLE IF NOT EXISTS `ym_template_relate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagsid` int(11) NOT NULL,
  `templateid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ym_template_relate`
--

INSERT INTO `ym_template_relate` (`id`, `tagsid`, `templateid`) VALUES
(1, 1, 9),
(2, 1, 5),
(3, 7, 2);

-- --------------------------------------------------------

--
-- 表的结构 `ym_template_tags`
--

CREATE TABLE IF NOT EXISTS `ym_template_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('颜色','行业','标签') NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `ym_template_tags`
--

INSERT INTO `ym_template_tags` (`id`, `type`, `title`) VALUES
(1, '行业', '服装'),
(2, '行业', '鞋帽'),
(3, '行业', '箱包'),
(4, '行业', '3C电子'),
(5, '行业', '计算机及配件'),
(6, '行业', '家居园艺'),
(7, '行业', '珠宝首饰'),
(8, '行业', '汽配设备'),
(9, '标签', '响应式'),
(10, '标签', '时尚'),
(11, '标签', '酷炫'),
(12, '标签', '清爽'),
(13, '颜色', '红色'),
(14, '颜色', '橙色'),
(15, '颜色', '黄色'),
(16, '颜色', '绿色'),
(17, '颜色', '洋绿'),
(18, '颜色', '蓝色'),
(19, '颜色', '紫色'),
(20, '颜色', '粉色'),
(21, '颜色', '白色'),
(22, '颜色', '灰色'),
(23, '颜色', '黑色'),
(24, '颜色', '褐色');

-- --------------------------------------------------------

--
-- 表的结构 `ym_tmpl_queue`
--

CREATE TABLE IF NOT EXISTS `ym_tmpl_queue` (
  `ym_qid` int(10) NOT NULL AUTO_INCREMENT COMMENT '队列自增id',
  `ym_mall_id` int(10) NOT NULL COMMENT '用户模板商城id',
  `ym_tpl_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '模板id',
  `ym_tpl_install` tinyint(1) NOT NULL DEFAULT '0' COMMENT '模板安装, 0: 未安装，1: 安装中,  2:已安装',
  `ym_create_time` int(10) NOT NULL DEFAULT '0' COMMENT '模板安装时间',
  PRIMARY KEY (`ym_qid`),
  UNIQUE KEY `mall_tpl` (`ym_mall_id`,`ym_tpl_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='模板安装队列表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ym_tmpl_queue`
--

INSERT INTO `ym_tmpl_queue` (`ym_qid`, `ym_mall_id`, `ym_tpl_id`, `ym_tpl_install`, `ym_create_time`) VALUES
(1, 4, 4, 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ym_trade`
--

CREATE TABLE IF NOT EXISTS `ym_trade` (
  `ym_id` int(3) NOT NULL AUTO_INCREMENT,
  `ym_trade_name` varchar(21) NOT NULL DEFAULT '0' COMMENT '行业名',
  PRIMARY KEY (`ym_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='行业表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ym_trade`
--

INSERT INTO `ym_trade` (`ym_id`, `ym_trade_name`) VALUES
(1, '服装'),
(2, '鞋帽'),
(3, '箱包'),
(4, '3C电子'),
(5, '计算机及配件'),
(6, '家居园艺'),
(7, '珠宝首饰'),
(8, '汽配设备');

-- --------------------------------------------------------

--
-- 表的结构 `ym_user`
--

CREATE TABLE IF NOT EXISTS `ym_user` (
  `ym_id` int(8) NOT NULL AUTO_INCREMENT,
  `ym_phone` bigint(11) NOT NULL DEFAULT '0' COMMENT '手机号码',
  `ym_password` varchar(32) NOT NULL DEFAULT '0' COMMENT '密码',
  `ym_name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `ym_mail` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `ym_qq` bigint(11) DEFAULT NULL COMMENT '用户的QQ',
  `ym_address` varchar(50) DEFAULT NULL COMMENT '用户地址',
  `ym_time` bigint(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  PRIMARY KEY (`ym_id`),
  KEY `phone` (`ym_phone`),
  KEY `password` (`ym_password`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户信息表' AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `ym_user`
--

INSERT INTO `ym_user` (`ym_id`, `ym_phone`, `ym_password`, `ym_name`, `ym_mail`, `ym_qq`, `ym_address`, `ym_time`) VALUES
(4, 13928427059, '8932979ebf92cd2fd815e1daba9ef152', 'hejiayang', 'heji@sina.com', 1026332, 'shanghai', 1441268682),
(18, 15021974352, '8932979ebf92cd2fd815e1daba9ef152', NULL, NULL, NULL, NULL, 1441591164),
(19, 18721109740, '8932979ebf92cd2fd815e1daba9ef152', NULL, NULL, NULL, NULL, 1441591256),
(20, 13127897235, '8932979ebf92cd2fd815e1daba9ef152', NULL, NULL, NULL, NULL, 1441591665),
(21, 15151374163, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1442992455),
(22, 0, 'd41d8cd98f00b204e9800998ecf8427e', NULL, NULL, NULL, NULL, 1442999293);

-- --------------------------------------------------------

--
-- 表的结构 `ym_user_mall`
--

CREATE TABLE IF NOT EXISTS `ym_user_mall` (
  `ym_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户模板商城id',
  `ym_user_id` int(10) NOT NULL COMMENT '用户id',
  `ym_tpl_id` smallint(5) NOT NULL COMMENT '模板id',
  `ym_tpl_url` varchar(100) NOT NULL COMMENT '模板商城的url domain',
  `ym_ad_url` varchar(100) NOT NULL COMMENT '模板商城后台管理url',
  `ym_admin_user` varchar(30) NOT NULL DEFAULT 'admin' COMMENT '后台管理账号',
  `ym_admin_pwd` varchar(42) DEFAULT NULL COMMENT '后台管理账号密码',
  `ym_admin_salt` char(9) DEFAULT NULL COMMENT '后台登录账号的密码盐',
  `ym_admin_table_prefix` char(3) DEFAULT 'oc_' COMMENT '后台表前缀',
  `ym_store_name` varchar(30) DEFAULT NULL COMMENT '店名',
  `ym_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户模板商城： 0 正常 ， 1： 删除',
  PRIMARY KEY (`ym_id`),
  UNIQUE KEY `user_tpl` (`ym_user_id`,`ym_tpl_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户模板商城表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ym_user_mall`
--

INSERT INTO `ym_user_mall` (`ym_id`, `ym_user_id`, `ym_tpl_id`, `ym_tpl_url`, `ym_ad_url`, `ym_admin_user`, `ym_admin_pwd`, `ym_admin_salt`, `ym_admin_table_prefix`, `ym_store_name`, `ym_status`) VALUES
(2, 4, 2, '456456.zgl.com', 'admin.xxx.com', '', NULL, NULL, 'oc', NULL, 0),
(3, 4, 1, '4564856.zgl.com', 'admin.xxx.com', '', NULL, NULL, 'oc', NULL, 0),
(4, 4, 4, 'carstool.shop.zgl.com', 'cartool.shop.zgl.com/adsto', 'admin', NULL, NULL, 'oc_', 'car tool', 0);

-- --------------------------------------------------------

--
-- 表的结构 `_ym_template`
--

CREATE TABLE IF NOT EXISTS `_ym_template` (
  `ym_id` int(6) NOT NULL AUTO_INCREMENT,
  `ym_name` varchar(30) DEFAULT NULL COMMENT '模板名称',
  `ym_url` varchar(100) NOT NULL DEFAULT '0' COMMENT '预览路径',
  `ym_img` varchar(100) NOT NULL DEFAULT '0' COMMENT '首页大图片的url',
  `ym_big_img` varchar(100) NOT NULL DEFAULT '0' COMMENT '快速开店的模板图片',
  `ym_colour_id` int(3) NOT NULL DEFAULT '0' COMMENT '颜色的id',
  `ym_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为删除',
  `ym_home` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为首页显示',
  `ym_num` int(5) NOT NULL DEFAULT '0' COMMENT '使用次数',
  PRIMARY KEY (`ym_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='模板表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `_ym_template`
--

INSERT INTO `_ym_template` (`ym_id`, `ym_name`, `ym_url`, `ym_img`, `ym_big_img`, `ym_colour_id`, `ym_type`, `ym_home`, `ym_num`) VALUES
(1, '', 'http://120.55.125.64:8091', 'www/url/1.jpg', '0', 2, 0, 1, 2),
(2, 'demo', 'http://120.55.125.64:8191', 'www/url/2.jpg', '0', 2, 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `_ym_template_related`
--

CREATE TABLE IF NOT EXISTS `_ym_template_related` (
  `ym_id` int(6) NOT NULL AUTO_INCREMENT,
  `ym_template_id` int(6) NOT NULL DEFAULT '0' COMMENT '对应的模板id',
  `ym_template_trade` int(6) NOT NULL DEFAULT '0' COMMENT '对应行业的id',
  `ym_template_label` int(6) NOT NULL DEFAULT '0' COMMENT '对应标签',
  PRIMARY KEY (`ym_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='模板和标签的关联表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `_ym_template_related`
--

INSERT INTO `_ym_template_related` (`ym_id`, `ym_template_id`, `ym_template_trade`, `ym_template_label`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
