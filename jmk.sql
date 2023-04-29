-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: jmk
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `admin_for` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Super Admin','Superadmin@gmail.com','7387374125','Pass@123','Superadmin','JMK',0,'2022-10-24 06:08:07','2022-10-24 06:08:07'),(2,'Ilyas Dabholkar','ilyasdabholkar76@gmail.com','8878765432','Pass@123','Admin','JMK',0,'2022-10-27 05:58:03','2022-10-27 05:58:03');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `families`
--

DROP TABLE IF EXISTS `families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `families` (
  `id` int NOT NULL AUTO_INCREMENT,
  `family_id` varchar(255) DEFAULT NULL,
  `family_head` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `deletedOn` date DEFAULT NULL,
  `deletedBy` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `house_no` int DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house_no` (`house_no`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `families_ibfk_1` FOREIGN KEY (`house_no`) REFERENCES `houses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `families_ibfk_2` FOREIGN KEY (`added_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `families`
--

LOCK TABLES `families` WRITE;
/*!40000 ALTER TABLE `families` DISABLE KEYS */;
INSERT INTO `families` VALUES (1,'FH001Test','Ilyas Dabholkar',0,NULL,NULL,'2022-10-24 06:08:07','2022-10-24 06:08:07',1,1),(2,'FH002Test','Nahez Sakharkar',0,NULL,NULL,'2022-10-24 06:08:07','2022-10-24 06:08:07',2,1);
/*!40000 ALTER TABLE `families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `houses`
--

DROP TABLE IF EXISTS `houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `houses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `house_name` varchar(255) DEFAULT NULL,
  `panchayat_house_no` varchar(255) DEFAULT NULL,
  `house_no` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `deletedOn` date DEFAULT NULL,
  `deletedBy` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `added_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `house_no` (`house_no`),
  UNIQUE KEY `panchayat_house_no` (`panchayat_house_no`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `houses_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `houses`
--

LOCK TABLES `houses` WRITE;
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
INSERT INTO `houses` VALUES (1,'Dabholkar House','H00111','H00111',0,NULL,NULL,'2022-10-24 06:08:07','2022-10-24 06:08:07',1),(2,'Sakharkar House','H00112','H00112',0,NULL,NULL,'2022-10-24 06:08:07','2022-10-24 06:08:07',1);
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jmkpaymenthistories`
--

DROP TABLE IF EXISTS `jmkpaymenthistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jmkpaymenthistories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_status` varchar(255) NOT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `receipt_no` varchar(255) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `JmkYearId` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `receipt_no` (`receipt_no`),
  KEY `JmkYearId` (`JmkYearId`),
  KEY `member_id` (`member_id`),
  KEY `year` (`year`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `jmkpaymenthistories_ibfk_1` FOREIGN KEY (`JmkYearId`) REFERENCES `jmkyears` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `jmkpaymenthistories_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `jmkpaymenthistories_ibfk_3` FOREIGN KEY (`year`) REFERENCES `jmkyears` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `jmkpaymenthistories_ibfk_4` FOREIGN KEY (`added_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jmkpaymenthistories`
--

LOCK TABLES `jmkpaymenthistories` WRITE;
/*!40000 ALTER TABLE `jmkpaymenthistories` DISABLE KEYS */;
INSERT INTO `jmkpaymenthistories` VALUES (1,'paid','Cash','rc002','2022-08-16','Paid By Cash','2022-10-27 06:08:29','2022-10-27 06:24:20',3,1,3,1),(2,'due',NULL,NULL,NULL,NULL,'2022-10-27 06:09:10','2022-10-27 06:09:10',2,3,2,1),(3,'paid','Online','rc001','2023-02-12','Paid Online','2022-10-27 06:09:10','2022-10-27 06:23:30',3,3,3,1),(4,'due',NULL,NULL,NULL,NULL,'2023-03-27 15:13:59','2023-03-27 15:13:59',4,1,4,1),(5,'due',NULL,NULL,NULL,NULL,'2023-03-27 15:13:59','2023-03-27 15:13:59',4,2,4,1),(6,'due',NULL,NULL,NULL,NULL,'2023-03-27 15:13:59','2023-03-27 15:13:59',4,3,4,1);
/*!40000 ALTER TABLE `jmkpaymenthistories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jmkyears`
--

DROP TABLE IF EXISTS `jmkyears`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jmkyears` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_year` int NOT NULL,
  `end_year` int NOT NULL,
  `amount` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `added_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `start_year` (`start_year`),
  UNIQUE KEY `end_year` (`end_year`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `jmkyears_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jmkyears`
--

LOCK TABLES `jmkyears` WRITE;
/*!40000 ALTER TABLE `jmkyears` DISABLE KEYS */;
INSERT INTO `jmkyears` VALUES (1,2010,2011,420,'2022-10-27 05:45:12','2022-10-27 05:55:37',1),(2,2011,2012,445,'2022-10-27 05:48:55','2022-10-27 05:48:55',1),(3,2012,2013,475,'2022-10-27 05:55:21','2022-10-27 05:55:21',1),(4,2013,2014,600,'2023-03-27 15:13:59','2023-03-27 15:13:59',1);
/*!40000 ALTER TABLE `jmkyears` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_status` tinyint(1) NOT NULL,
  `active_from` date DEFAULT NULL,
  `head_of_family` tinyint(1) NOT NULL,
  `inactivity_reason` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `family_id` int DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `family_id` (`family_id`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `members_ibfk_2` FOREIGN KEY (`added_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Ilyas Dabholkar','ilyasdabholkar9@gmail.com','7387974128','e9yC72A1',1,'2012-10-12',1,NULL,0,'2022-10-24 06:08:07','2022-11-09 18:04:29',1,1),(2,'Nahez Sakharkar','nahezsakhakar9@gmail.com','7357274125','9uEQgCPs',1,'2013-05-16',1,NULL,0,'2022-10-24 06:08:07','2022-10-24 12:58:21',2,1),(3,'Zuhair Dabholkar','zuhairdabholkar9@gmail.com','7388874125','Pass@123',1,'2011-10-12',0,NULL,0,'2022-10-24 06:08:07','2022-10-27 06:09:10',1,1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-09 13:34:00
