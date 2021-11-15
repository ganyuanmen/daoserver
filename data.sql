/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.25 : Database - dao_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dao_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dao_db`;

/*Table structure for table `a_dao` */

DROP TABLE IF EXISTS `a_dao`;

CREATE TABLE `a_dao` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `daf_address` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `eth_index` int DEFAULT NULL,
  `max_index` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `aux_bt` */

DROP TABLE IF EXISTS `aux_bt`;

CREATE TABLE `aux_bt` (
  `d` varchar(50) NOT NULL,
  `t` varchar(2000) DEFAULT NULL,
  `f` varchar(500) DEFAULT NULL,
  `s` varchar(2000) DEFAULT NULL,
  `w` varchar(500) DEFAULT NULL,
  `rt` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`d`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `aux_menu` */

DROP TABLE IF EXISTS `aux_menu`;

CREATE TABLE `aux_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT '0',
  `text` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `expand` tinyint DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `index` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `aux_tree` */

DROP TABLE IF EXISTS `aux_tree`;

CREATE TABLE `aux_tree` (
  `id` varchar(20) NOT NULL,
  `sqls` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `t_changelogo` */

DROP TABLE IF EXISTS `t_changelogo`;

CREATE TABLE `t_changelogo` (
  `dao_id` int NOT NULL COMMENT 'dao id',
  `block_num` bigint NOT NULL COMMENT '区块号',
  `dao_time` int DEFAULT NULL COMMENT '时间戳',
  `dao_logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'svg logo',
  `_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dao_id`),
  UNIQUE KEY `block_num` (`block_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `t_dao` */

DROP TABLE IF EXISTS `t_dao`;

CREATE TABLE `t_dao` (
  `dao_id` int NOT NULL COMMENT 'dao ID',
  `block_num` bigint DEFAULT NULL COMMENT '区块号',
  `dao_name` varchar(2000) DEFAULT NULL COMMENT '名称',
  `dao_symbol` varchar(2000) DEFAULT NULL COMMENT 'DAO 符号',
  `dao_dsc` varchar(4000) DEFAULT NULL COMMENT '描述',
  `dao_time` int DEFAULT NULL COMMENT '时间戳',
  `dao_manager` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '管理员地址',
  `dao_logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'svg logo',
  `_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `utoken_cost` decimal(18,4) DEFAULT NULL COMMENT '币值',
  `dao_index` int DEFAULT NULL COMMENT '排名',
  PRIMARY KEY (`dao_id`),
  UNIQUE KEY `block_num` (`block_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `t_os` */

DROP TABLE IF EXISTS `t_os`;

CREATE TABLE `t_os` (
  `dao_id` int NOT NULL COMMENT 'dao id',
  `block_num` bigint NOT NULL COMMENT '区块号',
  `os_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'os 地址',
  `_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dao_id`),
  UNIQUE KEY `block_num` (`block_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `t_setlogo` */

DROP TABLE IF EXISTS `t_setlogo`;

CREATE TABLE `t_setlogo` (
  `dao_id` int NOT NULL COMMENT 'dao id',
  `block_num` bigint NOT NULL COMMENT '区块号',
  `dao_time` int DEFAULT NULL COMMENT '时间戳',
  `dao_logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'svg图片',
  `_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dao_id`),
  UNIQUE KEY `block_num` (`block_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `t_t2t` */

DROP TABLE IF EXISTS `t_t2t`;

CREATE TABLE `t_t2t` (
  `block_num` bigint NOT NULL,
  `from_token_id` int DEFAULT NULL,
  `to_token_id` int DEFAULT NULL,
  `_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `from_utoken_cost` decimal(18,4) DEFAULT NULL,
  `to_utoken_cost` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`block_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `t_t2u` */

DROP TABLE IF EXISTS `t_t2u`;

CREATE TABLE `t_t2u` (
  `block_num` bigint NOT NULL,
  `from_token_id` int DEFAULT NULL,
  `_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `utoken_cost` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`block_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `t_token` */

DROP TABLE IF EXISTS `t_token`;

CREATE TABLE `t_token` (
  `dao_id` int NOT NULL COMMENT 'dao Id',
  `block_num` bigint NOT NULL COMMENT '区块号',
  `dao_time` int DEFAULT NULL COMMENT '时间戳',
  `token_id` int DEFAULT NULL COMMENT 'token ID',
  `_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dao_id`),
  UNIQUE KEY `block_num` (`block_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `t_u2t` */

DROP TABLE IF EXISTS `t_u2t`;

CREATE TABLE `t_u2t` (
  `block_num` bigint NOT NULL,
  `to_token_id` int DEFAULT NULL,
  `_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `utoken_cost` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`block_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/* Trigger structure for table `t_changelogo` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `changeLogotrigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `changeLogotrigger` AFTER INSERT ON `t_changelogo` FOR EACH ROW BEGIN
	update t_dao set dao_logo=new.dao_logo where dao_id=new.dao_id;
    END */$$


DELIMITER ;

/* Trigger structure for table `t_setlogo` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `setLogotrigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `setLogotrigger` AFTER INSERT ON `t_setlogo` FOR EACH ROW BEGIN
	update t_dao set dao_logo=new.dao_logo where dao_id=new.dao_id;
    END */$$


DELIMITER ;

/* Trigger structure for table `t_t2t` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `t2t_regisster` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `t2t_regisster` AFTER INSERT ON `t_t2t` FOR EACH ROW BEGIN
	UPDATE t_dao SET utoken_cost=new.from_utoken_cost WHERE dao_id in(select dao_id from t_token where token_id=new.from_token_id);
	UPDATE t_dao SET utoken_cost=new.to_utoken_cost WHERE dao_id IN(SELECT dao_id FROM t_token WHERE token_id=new.to_token_id);
    END */$$


DELIMITER ;

/* Trigger structure for table `t_t2u` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `t2u_regisster` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `t2u_regisster` AFTER INSERT ON `t_t2u` FOR EACH ROW BEGIN
	UPDATE t_dao SET utoken_cost=new.utoken_cost WHERE dao_id in(select dao_id from t_token where token_id=new.from_token_id);
    END */$$


DELIMITER ;

/* Trigger structure for table `t_u2t` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `u2t_regisster` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `u2t_regisster` AFTER INSERT ON `t_u2t` FOR EACH ROW BEGIN
	UPDATE t_dao SET utoken_cost=new.utoken_cost WHERE dao_id in(select dao_id from t_token where token_id=new.to_token_id);
    END */$$


DELIMITER ;

/* Procedure structure for procedure `excuteOs` */

/*!50003 DROP PROCEDURE IF EXISTS  `excuteOs` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `excuteOs`($blockNum Bigint, $daoId int,$osAddress varchar(50))
BEGIN
	if exists(select * from t_os where dao_id=$daoId) then 
		update t_os set block_num=$blockNum,os_address=$osAddress where dao_id=$daoId;
	else
		insert into t_os(dao_id,os_address,block_num) values($daoId,$osAddress,$blockNum) ;
	end if;
	
    END */$$
DELIMITER ;

/*Table structure for table `v_dao` */

DROP TABLE IF EXISTS `v_dao`;

/*!50001 DROP VIEW IF EXISTS `v_dao` */;
/*!50001 DROP TABLE IF EXISTS `v_dao` */;

/*!50001 CREATE TABLE  `v_dao`(
 `dao_id` int ,
 `block_num` bigint ,
 `dao_name` varchar(2000) ,
 `dao_symbol` varchar(2000) ,
 `dao_dsc` varchar(4000) ,
 `dao_time` varchar(10) ,
 `dao_manager` varchar(128) ,
 `dao_logo` text ,
 `_time` timestamp ,
 `utoken_cost` decimal(18,4) ,
 `dao_index` int ,
 `logodao_id` int ,
 `os_address` varchar(128) ,
 `token_id` int 
)*/;

/*View structure for view v_dao */

/*!50001 DROP TABLE IF EXISTS `v_dao` */;
/*!50001 DROP VIEW IF EXISTS `v_dao` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dao` AS select `a`.`dao_id` AS `dao_id`,`a`.`block_num` AS `block_num`,`a`.`dao_name` AS `dao_name`,`a`.`dao_symbol` AS `dao_symbol`,`a`.`dao_dsc` AS `dao_dsc`,date_format(from_unixtime(`a`.`dao_time`),'%Y-%m-%d') AS `dao_time`,`a`.`dao_manager` AS `dao_manager`,`a`.`dao_logo` AS `dao_logo`,`a`.`_time` AS `_time`,`a`.`utoken_cost` AS `utoken_cost`,`a`.`dao_index` AS `dao_index`,`d`.`dao_id` AS `logodao_id`,`b`.`os_address` AS `os_address`,`c`.`token_id` AS `token_id` from (((`t_dao` `a` left join `t_os` `b` on((`a`.`dao_id` = `b`.`dao_id`))) left join `t_token` `c` on((`a`.`dao_id` = `c`.`dao_id`))) left join `t_setlogo` `d` on((`a`.`dao_id` = `d`.`dao_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
