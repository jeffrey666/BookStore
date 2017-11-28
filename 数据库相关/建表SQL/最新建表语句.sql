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
  `book_id` varchar(40) NOT NULL COMMENT '书id',
  `book_name` varchar(20) DEFAULT NULL COMMENT '书名',
  `state` int(11) DEFAULT '0' COMMENT '状态（1借出，0未借出）',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */



/*Table structure for table `book_info` */

DROP TABLE IF EXISTS `book_info`;

CREATE TABLE `book_info` (
  `book_info_id` varchar(40) NOT NULL COMMENT '图书id',
  `author` varchar(40) DEFAULT NULL COMMENT '作者',
  `update_time` date DEFAULT NULL COMMENT '上传日期',
  `borrow_date` date DEFAULT NULL COMMENT '借出日期',
  `return_date` date DEFAULT NULL COMMENT '归还期限',
  `search_volume` int(11) DEFAULT '0' COMMENT '搜索量',
  `borrow_count` int(11) DEFAULT '0' COMMENT '借阅量',
  `book_pub` varchar(40) DEFAULT NULL COMMENT '出版社',
  `pub_date` date DEFAULT NULL COMMENT '出版日期',
  `category` varchar(50) DEFAULT NULL COMMENT '类别',
  `imgurl` varchar(100) DEFAULT NULL COMMENT '图书存放地址',
  `descripe` varchar(100) DEFAULT NULL COMMENT '图书简介',
  PRIMARY KEY (`book_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book_info` */



/*Table structure for table `history` */

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `history_id` varchar(40) NOT NULL COMMENT '记录id',
  `user_id` varchar(40) DEFAULT NULL COMMENT '借阅人id',
  `book_id` varchar(40) DEFAULT NULL COMMENT '借阅图书id',
  `borrow_date` date DEFAULT NULL COMMENT '借阅日期',
  `return_date` date DEFAULT NULL COMMENT '归还日期',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `history` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(40) NOT NULL,
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `state` int(11) DEFAULT '1' COMMENT '0停用1启用',
  `role` varchar(20) NOT NULL DEFAULT 'NormalUser' COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */



/*Table structure for table `user_book_borrower` */

DROP TABLE IF EXISTS `user_book_borrower`;

CREATE TABLE `user_book_borrower` (
  `book_id` varchar(40) DEFAULT NULL COMMENT '图书id',
  `user_id` varchar(40) DEFAULT NULL COMMENT '图书拥有者id',
  `borrower_id` varchar(40) DEFAULT NULL COMMENT '借阅人id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_book_borrower` */



/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `user_info_id` varchar(40) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(40) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `card_no` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `score` int(11) DEFAULT '100' COMMENT '积分',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `gender` varchar(5) DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`user_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
