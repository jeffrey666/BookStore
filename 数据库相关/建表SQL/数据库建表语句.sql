/*
SQLyog Ultimate v8.32 
MySQL - 5.5.27 : Database - jieshu
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jieshu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jieshu`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `book_id` VARCHAR(40) NOT NULL COMMENT '书id',
  `book_name` VARCHAR(20) DEFAULT NULL COMMENT '书名',
  `state` INT(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`book_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

/*Table structure for table `book_info` */

DROP TABLE IF EXISTS `book_info`;

CREATE TABLE `book_info` (
  `book_info_id` VARCHAR(40) NOT NULL COMMENT '图书id',
  `author` VARCHAR(40) DEFAULT NULL COMMENT '作者',
  `update_time` DATE DEFAULT NULL COMMENT '上传日期',
  `borrow_date` DATE DEFAULT NULL COMMENT '借出日期',
  `return_date` DATE DEFAULT NULL COMMENT '归还期限',
  `search_volume` INT(11) DEFAULT NULL COMMENT '搜索量',
  `borrow_count` INT(11) DEFAULT NULL COMMENT '借阅量',
  `book_pub` VARCHAR(40) DEFAULT NULL COMMENT '出版社',
  `pub_date` VARCHAR(40) DEFAULT NULL COMMENT '出版日期',
  `category` INT(11) DEFAULT NULL COMMENT '类别',
  `imgurl` VARCHAR(100) DEFAULT NULL COMMENT '图书存放地址',
  PRIMARY KEY (`book_info_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `book_info` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `state` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*Table structure for table `user_book_borrower` */

DROP TABLE IF EXISTS `user_book_borrower`;

CREATE TABLE `user_book_borrower` (
  `book_id` VARCHAR(40) DEFAULT NULL COMMENT '图书id',
  `user_id` VARCHAR(40) DEFAULT NULL COMMENT '图书拥有者id',
  `borrower_id` VARCHAR(40) DEFAULT NULL COMMENT '借阅人id'
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `user_book_borrower` */

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `user_info_id` VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nickname` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `email` VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `address` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `card_no` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证号',
  `score` INT(11) DEFAULT NULL COMMENT '积分',
  `telephone` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` VARCHAR(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_info_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
