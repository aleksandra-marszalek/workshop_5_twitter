-- MySQL dump 10.13  Distrib 5.7.21, for osx10.12 (x86_64)
--
-- Host: localhost    Database: workshop5
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `text` varchar(60) NOT NULL,
  `tweet_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcc5n08r8pndrkekxtc05q69e4` (`tweet_id`),
  KEY `FKhlbnnmiua9xpvfq8y1u1a15ie` (`user_id`),
  CONSTRAINT `FKcc5n08r8pndrkekxtc05q69e4` FOREIGN KEY (`tweet_id`) REFERENCES `Tweet` (`id`),
  CONSTRAINT `FKhlbnnmiua9xpvfq8y1u1a15ie` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES (1,'2018-05-13 01:36:33','nice tweet',19,26),(2,'2018-05-13 03:09:30','fuj',2,NULL),(3,'2018-05-13 02:26:02','najlepszy tweet!',NULL,1),(4,'2018-05-13 02:27:19','najlepszy tweet',NULL,1),(5,'2018-05-13 02:28:45','beznadzieja',NULL,1),(6,'2018-05-13 02:30:35','hahahah',NULL,1),(7,'2018-05-13 02:32:19','hahahaha',19,1),(8,'2018-05-13 02:32:42','to dopiero tweecik',18,1),(9,'2018-05-13 03:09:40','dziwny ten tweet',18,NULL),(10,'2018-05-21 12:12:38','nice',25,1);
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tweet`
--

DROP TABLE IF EXISTS `Tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tweet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `text` varchar(160) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtjo83phj1ffkewrkbxqmfvw36` (`user_id`),
  CONSTRAINT `FKtjo83phj1ffkewrkbxqmfvw36` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tweet`
--

LOCK TABLES `Tweet` WRITE;
/*!40000 ALTER TABLE `Tweet` DISABLE KEYS */;
INSERT INTO `Tweet` VALUES (1,'2018-05-12 20:26:05','tweetText',1),(2,'2018-05-12 20:37:04','new text',1),(3,'2018-05-12 20:38:58','aaa',2),(4,'2018-05-12 21:00:58','aaaa',1),(5,'2018-05-12 21:24:08','new twet',2),(6,'2018-05-12 21:33:21','new Tweet',1),(7,'2018-05-12 21:38:36','new tweet by aaaa',1),(8,'2018-05-12 21:40:45','aaaaaaa',1),(9,'2018-05-12 21:42:26','wpis Jana',3),(10,'2018-05-12 21:44:34','adsada',2),(15,'2018-05-12 23:43:01','aaa',NULL),(16,'2018-05-13 00:21:00','asdads',1),(17,'2018-05-13 00:34:14','text',1),(18,'2018-05-13 00:48:49','my new tweet',2),(19,'2018-05-13 01:12:22','Tweet tweet.',26),(20,'2018-05-13 03:20:51','new twweeeet',21),(21,'2018-05-13 03:20:57','heyaaa',21),(22,'2018-05-13 03:33:52','kot',27),(23,'2018-05-13 03:33:58','kot kot',27),(24,'2018-05-21 12:06:37','new tweet',1),(25,'2018-05-21 12:12:20','',1),(26,'2018-05-21 12:12:43','',1),(27,'2018-05-21 12:20:43','new tweet by anna',28);
/*!40000 ALTER TABLE `Tweet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'aaa@aa.pl','','$2a$10$9EE2UI2TAKiNTS/4duf56.jVrhjGIFitIxHmlmXtiKUuVQTlTg7mW','aaaa'),(2,'olka.m@hotmail.com','\0','$2a$10$6Hqprf6yIjojfA7qdH9wqODFxCEcfYSc8N6zX3h6Z31xCg07x2BJe','olunia123'),(3,'jm@gmail.com','\0','$2a$10$/d2N4lbkMlyG1MrmzsUVYeQ7I0pw1Uxy8ZiniCHYzZAcMWeTRzfkC','jan madej'),(4,'antek123@op.pl','\0','$2a$10$GEf8irClkqFy/66cbY2yEOx5lInidc0UTollgr5IgQ8F2nGCICbw.','antoni'),(5,'anka@jantar.pl','\0','$2a$10$hqx5h2eeHGbphhO/7NykJueLEtG0v19LXUGx3tVflUGvqk11cAi5G','anka'),(6,'emka@thompson.com','\0','$2a$10$DGR6YK5HhTdRap0JCMkjIuPNnC3ldxF8mcZPa3vZITZMnX2ICq1Q.','ewelina'),(7,'aaan@op.pl','\0','$2a$10$SJCZojPo.jHyahNrhWGKbuqNRlojJ7brOVgqaFlnGm3jx/50XW6lu','aaaaaa'),(8,'op@op.pl','\0','$2a$10$8Taiyd7LQl6ABZN/sna8GukipsPSvgN4388qbjRSj7K9x5Xd2ipaq','op'),(9,'aaannnaa@op.pl','\0','$2a$10$SoRsStNQvIxhvcetTNVLw.vVoI/j7SF6oKloLBkUtOkHJ6GX3OlPG','Anulka'),(10,'JK@JK.pl','','$2a$10$FYpJkBWKPdBD6m7Si4SRUu026ILvKU4.uXW8qSwHo7Ub.Tv.yRAfu','JK'),(11,'bb@bb.bb','\0','$2a$10$j3tLl4.1zPBFAbdcLPqWFuBjVrgwFudSiEinXLUDZT1AIVFC1pru2','bb'),(12,'dasda@dasdas.pl','\0','$2a$10$KTqJTxMm0Kg4yg4egYJakunjoPfjNn614GagGjaSdgIQnrQhGCgbu','sadasd'),(13,'aaleksandra.mmarszalek@gmail.com','\0','$2a$10$R0NczjhNaKyzntcbJ15KN.LjJK0rQNQRSJtkxgSoyPJph44tN5cpa','aldi'),(15,'am@op.pl','\0','$2a$10$M.uGju1ySeQ967KAUZLDQ.HyOuTVVBaf9zKDacknJbBCmIsdVhfia','AM'),(16,'aaaaa@aa.pl','\0','$2a$10$eNyA937wuPBu/2taSonaXuy4VjjyBeGeCN8Wtw1suVXDh4hc3p/dK','aaaaaa'),(17,'fhgghjK@gmail.com','\0','$2a$10$DNFdKF17tnigVGJN3uztoeBsreSM0uodJwVC3uiWtpVd/bVnLkcC.','fghjk'),(18,'tk@gmail.com','\0','$2a$10$yywcFtKfhcA9fmU2wmAP/uAfciHz7KUhgzg5ZhTd6vXeAbUe6pg1G','Tomasz Knapik'),(19,'kkk@kowalski.pl','\0','$2a$10$6RLBDjLHVfvfR1P7KJ/g3.eV0EjjPXXH0IAbqZSQtRNtxS65W0rLq','Jan Kowal'),(21,'ssa@ssa.ss','','$2a$10$2I/0kHnKlosg4Nm7n3Al1uT5XlT9fdvhN/j1eQ9SDEZVdjwuuQ/MO','ssss'),(22,'jj@jj.jj','\0','$2a$10$Ulxxu3oQUdZQK/9O.bT0reVcQGpeHK5FCTr0HnazvgvBuDt1VsfLa','jjjj'),(23,'tt@tt.tt','\0','$2a$10$HrTpkMtF9KibCma2pLwDYekmfclV1V4UZIDPic8z3R8XQYV5v3vYe','tt'),(25,'niceUser@a.com','','$2a$10$h0xebfgXM697Xz6inN5yeuUn1g3FjugWdCrnR5vE04TwMPXtTEDl6','niceUser'),(26,'janmadej@madej.com','','$2a$10$GChRIa1zJARs28WB3zbpHuo/4qYeUXsaMYpkbxuS/uQib1OW9VqXW','jan madej'),(27,'kot123@kot.pl','','$2a$10$c6hdDXeh3L6kPHO/SASmWO7B02ZEGtY/cTSZ8TwoZwWBCb0NxF1OO','kot123'),(28,'anna@op.pl','','$2a$10$10qcFYcCoB7AWLyIRmqqvulecS5ps4PEyofhLV2yq4qg2iO9w4U9K','anna123'),(29,'ewa@ewa.pl','','$2a$10$EgrErivdYrPqi97fMSf6ouo9d205KrVRaBqQGoOlEfUQrdzxDcSmm','ewa123');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-21 14:45:04
