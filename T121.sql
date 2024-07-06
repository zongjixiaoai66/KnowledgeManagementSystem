/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t121`;
CREATE DATABASE IF NOT EXISTS `t121` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t121`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, 'picture1', 'http://localhost:8080/springbootuaaa4/upload/picture1.jpg'),
	(2, 'picture2', 'http://localhost:8080/springbootuaaa4/upload/picture2.jpg'),
	(3, 'picture3', 'http://localhost:8080/springbootuaaa4/upload/picture3.jpg'),
	(6, 'homepage', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png');

DROP TABLE IF EXISTS `discusszhishixinxi`;
CREATE TABLE IF NOT EXISTS `discusszhishixinxi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint NOT NULL COMMENT '关联表id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COMMENT='知识信息评论表';

DELETE FROM `discusszhishixinxi`;
INSERT INTO `discusszhishixinxi` (`id`, `addtime`, `refid`, `userid`, `nickname`, `content`, `reply`) VALUES
	(51, '2021-05-16 13:27:59', 1, 1, '用户名1', '评论内容1', '回复内容1'),
	(52, '2021-05-16 13:27:59', 2, 2, '用户名2', '评论内容2', '回复内容2'),
	(53, '2021-05-16 13:27:59', 3, 3, '用户名3', '评论内容3', '回复内容3'),
	(54, '2021-05-16 13:27:59', 4, 4, '用户名4', '评论内容4', '回复内容4'),
	(55, '2021-05-16 13:27:59', 5, 5, '用户名5', '评论内容5', '回复内容5'),
	(56, '2021-05-16 13:27:59', 6, 6, '用户名6', '评论内容6', '回复内容6');

DROP TABLE IF EXISTS `storeup`;
CREATE TABLE IF NOT EXISTS `storeup` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `refid` bigint DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1712449411893 DEFAULT CHARSET=utf8mb3 COMMENT='收藏表';

DELETE FROM `storeup`;
INSERT INTO `storeup` (`id`, `addtime`, `userid`, `refid`, `tablename`, `name`, `picture`) VALUES
	(1712449213072, '2024-04-07 00:20:12', 11, 35, 'zhishixinxi', '知识标题5', 'http://localhost:8080/springbootuaaa4/upload/zhishixinxi_fengmiantu5.jpg'),
	(1712449404328, '2024-04-07 00:23:23', 11, 34, 'zhishixinxi', '知识标题4', 'http://localhost:8080/springbootuaaa4/upload/zhishixinxi_fengmiantu4.jpg'),
	(1712449411892, '2024-04-07 00:23:31', 11, 31, 'zhishixinxi', '知识标题1', 'http://localhost:8080/springbootuaaa4/upload/zhishixinxi_fengmiantu1.jpg');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(2, 1, 'admin', 'users', '管理员', 'anf4ex51v68az6vkii6susddv1fwlyjc', '2024-04-07 00:19:14', '2024-04-07 01:22:17'),
	(3, 11, '用户1', 'yonghu', '用户', 'a1jk5b9h174d14eblehohxgmhsqw4qd0', '2024-04-07 00:20:10', '2024-04-07 01:23:16');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2021-05-16 13:27:59');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuming` varchar(200) NOT NULL COMMENT '用户名',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuming` (`yonghuming`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `addtime`, `yonghuming`, `mima`, `xingming`, `touxiang`, `xingbie`, `shouji`) VALUES
	(11, '2021-05-16 13:27:59', '用户1', '123456', '姓名1', 'http://localhost:8080/springbootuaaa4/upload/yonghu_touxiang1.jpg', '男', '13823888881'),
	(12, '2021-05-16 13:27:59', '用户2', '123456', '姓名2', 'http://localhost:8080/springbootuaaa4/upload/yonghu_touxiang2.jpg', '男', '13823888882'),
	(13, '2021-05-16 13:27:59', '用户3', '123456', '姓名3', 'http://localhost:8080/springbootuaaa4/upload/yonghu_touxiang3.jpg', '男', '13823888883'),
	(14, '2021-05-16 13:27:59', '用户4', '123456', '姓名4', 'http://localhost:8080/springbootuaaa4/upload/yonghu_touxiang4.jpg', '男', '13823888884'),
	(15, '2021-05-16 13:27:59', '用户5', '123456', '姓名5', 'http://localhost:8080/springbootuaaa4/upload/yonghu_touxiang5.jpg', '男', '13823888885'),
	(16, '2021-05-16 13:27:59', '用户6', '123456', '姓名6', 'http://localhost:8080/springbootuaaa4/upload/yonghu_touxiang6.jpg', '男', '13823888886');

DROP TABLE IF EXISTS `zhishifenlei`;
CREATE TABLE IF NOT EXISTS `zhishifenlei` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhishifenlei` varchar(200) NOT NULL COMMENT '知识分类',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhishifenlei` (`zhishifenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COMMENT='知识分类';

DELETE FROM `zhishifenlei`;
INSERT INTO `zhishifenlei` (`id`, `addtime`, `zhishifenlei`) VALUES
	(21, '2021-05-16 13:27:59', '知识分类1'),
	(22, '2021-05-16 13:27:59', '知识分类2'),
	(23, '2021-05-16 13:27:59', '知识分类3'),
	(24, '2021-05-16 13:27:59', '知识分类4'),
	(25, '2021-05-16 13:27:59', '知识分类5'),
	(26, '2021-05-16 13:27:59', '知识分类6');

DROP TABLE IF EXISTS `zhishixinxi`;
CREATE TABLE IF NOT EXISTS `zhishixinxi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhishibiaoti` varchar(200) NOT NULL COMMENT '知识标题',
  `zhishifenlei` varchar(200) NOT NULL COMMENT '知识分类',
  `biaoqian` varchar(200) NOT NULL COMMENT '标签',
  `fengmiantu` varchar(200) NOT NULL COMMENT '封面图',
  `zhishijianjie` longtext COMMENT '知识简介',
  `zhishishipin` varchar(200) DEFAULT NULL COMMENT '知识视频',
  `zhishifujian` varchar(200) DEFAULT NULL COMMENT '知识附件',
  `zhishineirong` longtext COMMENT '知识内容',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COMMENT='知识信息';

DELETE FROM `zhishixinxi`;
INSERT INTO `zhishixinxi` (`id`, `addtime`, `zhishibiaoti`, `zhishifenlei`, `biaoqian`, `fengmiantu`, `zhishijianjie`, `zhishishipin`, `zhishifujian`, `zhishineirong`, `faburiqi`, `clicktime`, `clicknum`) VALUES
	(31, '2021-05-16 13:27:59', '知识标题1', '知识分类1', '标签1', 'http://localhost:8080/springbootuaaa4/upload/zhishixinxi_fengmiantu1.jpg', '知识简介1', '', '', '知识内容1', '2021-05-16', '2024-04-07 08:23:33', 5),
	(32, '2021-05-16 13:27:59', '知识标题2', '知识分类2', '标签2', 'http://localhost:8080/springbootuaaa4/upload/zhishixinxi_fengmiantu2.jpg', '知识简介2', '', '', '知识内容2', '2021-05-16', '2024-04-07 08:22:46', 3),
	(33, '2021-05-16 13:27:59', '知识标题3', '知识分类3', '标签3', 'http://localhost:8080/springbootuaaa4/upload/zhishixinxi_fengmiantu3.jpg', '知识简介3', '', '', '知识内容3', '2021-05-16', '2024-04-07 08:22:42', 4),
	(34, '2021-05-16 13:27:59', '知识标题4', '知识分类4', '标签4', 'http://localhost:8080/springbootuaaa4/upload/zhishixinxi_fengmiantu4.jpg', '知识简介4', '', '', '知识内容4', '2021-05-16', '2024-04-07 08:23:22', 5),
	(35, '2021-05-16 13:27:59', '知识标题5', '知识分类5', '标签5', 'http://localhost:8080/springbootuaaa4/upload/zhishixinxi_fengmiantu5.jpg', '知识简介5', '', '', '知识内容5', '2021-05-16', '2024-04-07 08:23:38', 9),
	(36, '2021-05-16 13:27:59', '知识标题6', '知识分类6', '标签6', 'http://localhost:8080/springbootuaaa4/upload/zhishixinxi_fengmiantu6.jpg', '知识简介6', '', '', '知识内容6', '2021-05-16', '2021-05-16 21:27:59', 6);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
