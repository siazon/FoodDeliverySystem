 -- mysql
 DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_email` varchar(64)  NOT NULL,
  `user_password` varchar(6) DEFAULT NULL,
  `user_role` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_email`)
) ;

DROP TABLE IF EXISTS `tb_user_address`;
CREATE TABLE `tb_user_address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(64) DEFAULT NULL,
  `county` varchar(64) DEFAULT NULL,
  `street` varchar(64) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ;
alter table tb_user_address add foreign key useraddress_ibfk2(user_email) references tb_user(user_email);


