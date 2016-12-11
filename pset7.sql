-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: pset7
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `History`
--

DROP TABLE IF EXISTS `History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `History` (
  `id` int(10) unsigned NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `buy_symbol` varchar(65) DEFAULT NULL,
  `buy_share` int(10) unsigned DEFAULT NULL,
  `sell_symbol` varchar(65) DEFAULT NULL,
  `sell_share` int(10) unsigned DEFAULT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `History`
--

LOCK TABLES `History` WRITE;
/*!40000 ALTER TABLE `History` DISABLE KEYS */;
INSERT INTO `History` VALUES (119,NULL,'FB',1,NULL,NULL,0),(119,NULL,'FB',5,NULL,NULL,0),(119,NULL,'FB',1,NULL,NULL,0),(119,NULL,'FB',1,NULL,NULL,0),(119,NULL,'FB',1,NULL,NULL,117.43),(119,'2016-12-06 13:39:42','YHOO',1,NULL,NULL,40.2),(119,'2016-12-06 13:49:45','YHOO',1,NULL,NULL,40.2),(119,'2016-12-07 05:32:56','YHOO',1,NULL,NULL,39.97),(119,'2016-12-07 05:50:44','YHOO',1,NULL,NULL,39.97),(119,'2016-12-07 05:51:05','YHOO',1,NULL,NULL,39.97),(119,'2016-12-07 06:06:31','YHOO',1,NULL,NULL,39.97),(119,'2016-12-07 06:07:34',NULL,NULL,'YHOO',1,0),(119,'2016-12-07 06:12:17','YHOO',10,NULL,NULL,399.7),(119,'2016-12-07 06:12:25',NULL,NULL,'YHOO',10,399.7),(119,'2016-12-07 06:15:56','FB',10,NULL,NULL,1173.1),(119,'2016-12-07 06:16:48',NULL,NULL,'YHOO',10,399.7),(119,'2016-12-07 06:17:30','FB',1,NULL,NULL,117.31),(119,'2016-12-07 06:17:50',NULL,NULL,'YHOO',1,39.97),(119,'2016-12-07 06:18:05','FB',1,NULL,NULL,117.31),(119,'2016-12-07 06:18:19','YHOO',1,NULL,NULL,39.97),(119,'2016-12-07 06:18:36',NULL,NULL,'FB',2,234.62),(119,'2016-12-07 06:22:39','FB',1,NULL,NULL,117.31),(119,'2016-12-07 06:22:48','YHOO',1,NULL,NULL,39.97),(119,'2016-12-07 06:23:18','FB',2,NULL,NULL,234.62),(119,'2016-12-07 06:23:42',NULL,NULL,'FB',3,351.93),(119,'2016-12-07 06:38:44',NULL,NULL,'YHOO',1,39.97),(119,'2016-12-07 06:58:35','FB',15,NULL,NULL,1759.65),(119,'2016-12-07 06:59:20',NULL,NULL,'FB',15,1759.65),(119,'2016-12-07 13:34:51','FB',100,NULL,NULL,11731),(119,'2016-12-07 13:35:15',NULL,NULL,'FB',100,11731);
/*!40000 ALTER TABLE `History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio`
--

DROP TABLE IF EXISTS `portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `symbol` varchar(11) NOT NULL,
  `shares` int(11) unsigned NOT NULL,
  PRIMARY KEY (`symbol`),
  UNIQUE KEY `user_id` (`user_id`,`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio`
--

LOCK TABLES `portfolio` WRITE;
/*!40000 ALTER TABLE `portfolio` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `cash` decimal(65,4) unsigned DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (100,'andi','$2y$10$c.e4DK7pVyLT.stmHxgAleWq4yViMmkwKz3x8XCo4b/u3r8g5OTnS',0.0000),(101,'caesar','$2y$10$0p2dlmu6HnhzEMf9UaUIfuaQP7tFVDMxgFcVs0irhGqhOxt6hJFaa',0.0000),(102,'eli','$2y$10$COO6EnTVrCPCEddZyWeEJeH9qPCwPkCS0jJpusNiru.XpRN6Jf7HW',0.0000),(103,'hdan','$2y$10$o9a4ZoHqVkVHSno6j.k34.wC.qzgeQTBHiwa3rpnLq7j2PlPJHo1G',0.0000),(104,'jason','$2y$10$ci2zwcWLJmSSqyhCnHKUF.AjoysFMvlIb1w4zfmCS7/WaOrmBnLNe',0.0000),(105,'john','$2y$10$dy.LVhWgoxIQHAgfCStWietGdJCPjnNrxKNRs5twGcMrQvAPPIxSy',0.0000),(106,'levatich','$2y$10$fBfk7L/QFiplffZdo6etM.096pt4Oyz2imLSp5s8HUAykdLXaz6MK',0.0000),(107,'rob','$2y$10$3pRWcBbGdAdzdDiVVybKSeFq6C50g80zyPRAxcsh2t5UnwAkG.I.2',0.0000),(108,'skroob','$2y$10$395b7wODm.o2N7W5UZSXXuXwrC0OtFB17w4VjPnCIn/nvv9e4XUQK',0.0000),(109,'zamyla','$2y$10$UOaRF0LGOaeHG4oaEkfO4O7vfI34B1W23WqHr9zCpXL68hfQsS3/e',0.0000),(118,'anand','$2y$10$3DfFXOSsg0OxEsuVtGBwhe2rng6HM9tFoXpoU40Sf4fryjSN7i/rG',0.0000),(119,'paresh','$2y$10$rpRUsmFqroMKOiCyh4WTSuE2H2JWYZHvieuCHFRk5wt2/bceyl/y.',17834.5600);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-07 14:00:19
