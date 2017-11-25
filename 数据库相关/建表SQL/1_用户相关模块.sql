/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.5.27 : Database - jeishu
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jeishu` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `jeishu`;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `user_info_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `card_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证号',
  `score` int(11) DEFAULT NULL COMMENT '积分',
  `telephone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_info` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
