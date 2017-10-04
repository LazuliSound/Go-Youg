-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: go-young
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver` (
  `username` varchar(15) NOT NULL,
  `status` binary(1) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  CONSTRAINT `username_foreign_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES ('ahlfaith','1');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('cimohay'),('dago');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferred_location`
--

DROP TABLE IF EXISTS `preferred_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferred_location` (
  `username` varchar(15) NOT NULL,
  `location` varchar(50) NOT NULL,
  PRIMARY KEY (`username`,`location`),
  KEY `location_foreign_location_idx` (`location`),
  CONSTRAINT `location_foreign_location` FOREIGN KEY (`location`) REFERENCES `location` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `username_foreign_driver` FOREIGN KEY (`username`) REFERENCES `driver` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferred_location`
--

LOCK TABLES `preferred_location` WRITE;
/*!40000 ALTER TABLE `preferred_location` DISABLE KEYS */;
INSERT INTO `preferred_location` VALUES ('ahlfaith','cimohay'),('ahlfaith','dago');
/*!40000 ALTER TABLE `preferred_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `driver_name` varchar(15) NOT NULL,
  `id` int(11) NOT NULL,
  `user_name` varchar(15) DEFAULT NULL,
  `picking_point` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `comment` mediumtext,
  `rating` int(11) DEFAULT NULL,
  `user_hide` binary(1) DEFAULT NULL,
  `driver_hide` binary(1) DEFAULT NULL,
  PRIMARY KEY (`driver_name`,`id`),
  KEY `name_foreign_user_idx` (`user_name`),
  KEY `picking_foreign_location_idx` (`picking_point`),
  KEY `destination_foreign_location_idx` (`destination`),
  CONSTRAINT `destination_foreign_location` FOREIGN KEY (`destination`) REFERENCES `location` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `name_foreign_driver` FOREIGN KEY (`driver_name`) REFERENCES `driver` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `name_foreign_user` FOREIGN KEY (`user_name`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `picking_foreign_location` FOREIGN KEY (`picking_point`) REFERENCES `location` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES ('ahlfaith',1,'matthewrichard','dago','cimohay','2017-10-04','mantap nih mbak-mbaknya. ngebut banget',5,'0','0');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(15) NOT NULL,
  `email` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `profile_pict` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('ahlfaith','tipehtipeh@google.com','Lathifah Nurrahmah','ewewew','0899999999','wow'),('kucing','sayamaung@google.com','Sebastian Loki','yuyuyu','081208120812','wow'),('lazuardilazu','lazuardifirdaus369@yahoo.com','Lazuardi Firdaus','mamayugero','08567718483','wow'),('matthewrichard','mattrich34@yahoo.com','Richard Matthew','uwouwo','08179222323','wow');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-04 18:27:51
