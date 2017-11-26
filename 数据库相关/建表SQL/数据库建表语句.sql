/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `book_id` VARCHAR(40) NOT NULL COMMENT '书id',
  `book_name` VARCHAR(20) DEFAULT NULL COMMENT '书名',
  `state` INT(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`book_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

INSERT  INTO `book`(`book_id`,`book_name`,`state`) VALUES ('1','小明',1),('2','小红',2),('3413b793-5819-4c45-bd79-558759270c54','12312',0),('3c8cc669-c568-43ca-8b66-4ad23d71f6cd','khk',0),('5e226c1d-2232-46fe-ab98-788ee9170b4f','ew',0),('78f9e74e-215d-4084-8947-fdda791699e0','三国演义',0),('8db378c3-a468-4242-a04c-de542e935584','13',0),('a43d4ee9-8a6f-44ed-a78a-cedcbcc2d258','1',0),('cf11cb0f-213a-4bc5-be32-c10d582ce93e','ew',0);

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

INSERT  INTO `book_info`(`book_info_id`,`author`,`update_time`,`borrow_date`,`return_date`,`search_volume`,`borrow_count`,`book_pub`,`pub_date`,`category`,`imgurl`) VALUES ('3413b793-5819-4c45-bd79-558759270c54','213',NULL,NULL,NULL,NULL,10,'123','2017-11-01',3,'F:\\eclipse\\jieshu Maven Webapp\\src\\main\\webapp\\upload\\f\\f\\0\\1\\3\\a\\f\\d执行过程.png'),('3c8cc669-c568-43ca-8b66-4ad23d71f6cd','kjk',NULL,NULL,NULL,NULL,9,'jkk','2017-10-31',3,'/upload\\f\\3\\1\\5\\e\\d\\a\\4'),('5e226c1d-2232-46fe-ab98-788ee9170b4f','q',NULL,NULL,NULL,NULL,20,'q','2017-11-07',1,'\\upload\\4\\e\\5\\f\\b\\3\\9\\4\\执行过程.png'),('78f9e74e-215d-4084-8947-fdda791699e0','罗贯中',NULL,NULL,NULL,NULL,NULL,'人名出版社','2017-11-09',4,'\\upload\\d\\8\\e\\f\\b\\7\\9\\3\\执行过程.png'),('8db378c3-a468-4242-a04c-de542e935584','1',NULL,NULL,NULL,NULL,19,'1313','0132-12-01',3,'\\7\\5\\0\\3\\e\\b\\f\\a'),('a43d4ee9-8a6f-44ed-a78a-cedcbcc2d258','123',NULL,NULL,NULL,NULL,8,'123','2017-11-06',3,'\\upload\\7\\9\\7\\5\\0\\7\\e\\8'),('cf11cb0f-213a-4bc5-be32-c10d582ce93e','ewqeew',NULL,NULL,NULL,NULL,11,'ewqe','2017-11-07',3,'\\upload\\6\\6\\9\\a\\2\\d\\0\\5执行过程.png');

/*Table structure for table `history` */

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `history_id` VARCHAR(40) NOT NULL COMMENT '记录id',
  `user_id` VARCHAR(40) DEFAULT NULL COMMENT '借阅人id',
  `book_id` VARCHAR(40) DEFAULT NULL COMMENT '借阅图书id',
  `borrow_date` DATE DEFAULT NULL COMMENT '借阅日期',
  `return_date` DATE DEFAULT NULL COMMENT '归还日期',
  PRIMARY KEY (`history_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `history` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` VARCHAR(40) NOT NULL,
  `username` VARCHAR(20) DEFAULT NULL COMMENT '用户名',
  `password` VARCHAR(50) DEFAULT NULL COMMENT '密码',
  `state` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

INSERT  INTO `user`(`id`,`username`,`password`,`state`) VALUES ('1','fd','fdf',0),('10','12','1221',4),('2','fd','fdfs',1),('207916a7-64e0-4c44-9218-ffd2963df503','messi','123',1),('3','fdf','fdf',1),('4','fdf','fdf',0),('5','ggf','gfg',1),('6','hghsfg','ggfgd',1),('7','dgfg','gfdg',1),('8','hghf','hgfh',0),('9','123','123321',0),('d8825577-60d1-46ec-af9c-df95aebae7d6','admin','123',1),('ec483e23-0409-4a57-9027-84593b52b760','yy','123',1);

/*Table structure for table `user_book_borrower` */

DROP TABLE IF EXISTS `user_book_borrower`;

CREATE TABLE `user_book_borrower` (
  `book_id` VARCHAR(40) DEFAULT NULL COMMENT '图书id',
  `user_id` VARCHAR(40) DEFAULT NULL COMMENT '图书拥有者id',
  `borrower_id` VARCHAR(40) DEFAULT NULL COMMENT '借阅人id'
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `user_book_borrower` */

INSERT  INTO `user_book_borrower`(`book_id`,`user_id`,`borrower_id`) VALUES ('1','2',NULL),('2','1',NULL),('3413b793-5819-4c45-bd79-558759270c54','d8825577-60d1-46ec-af9c-df95aebae7d6',NULL),('8db378c3-a468-4242-a04c-de542e935584','d8825577-60d1-46ec-af9c-df95aebae7d6',NULL),('3c8cc669-c568-43ca-8b66-4ad23d71f6cd','d8825577-60d1-46ec-af9c-df95aebae7d6',NULL),('a43d4ee9-8a6f-44ed-a78a-cedcbcc2d258','d8825577-60d1-46ec-af9c-df95aebae7d6',NULL),('cf11cb0f-213a-4bc5-be32-c10d582ce93e','d8825577-60d1-46ec-af9c-df95aebae7d6',NULL),('5e226c1d-2232-46fe-ab98-788ee9170b4f','d8825577-60d1-46ec-af9c-df95aebae7d6',NULL),('78f9e74e-215d-4084-8947-fdda791699e0','207916a7-64e0-4c44-9218-ffd2963df503',NULL);

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `user_info_id` VARCHAR(40) NOT NULL,
  `nickname` VARCHAR(20) DEFAULT NULL COMMENT '真实姓名',
  `email` VARCHAR(40) DEFAULT NULL COMMENT '邮箱',
  `address` VARCHAR(200) DEFAULT NULL COMMENT '地址',
  `card_no` VARCHAR(20) DEFAULT NULL COMMENT '身份证号',
  `score` INT(11) DEFAULT NULL COMMENT '积分',
  `telephone` VARCHAR(20) DEFAULT NULL,
  `gender` VARCHAR(5) DEFAULT NULL,
  PRIMARY KEY (`user_info_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */

INSERT  INTO `user_info`(`user_info_id`,`nickname`,`email`,`address`,`card_no`,`score`,`telephone`,`gender`) VALUES ('d8825577-60d1-46ec-af9c-df95aebae7d6',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
