-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: food-delivery
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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Phones` varchar(100) NOT NULL,
  `Website` varchar(50) DEFAULT NULL,
  `Address` varchar(120) DEFAULT NULL,
  `Logo` varchar(1000) NOT NULL,
  `Rate` float unsigned NOT NULL DEFAULT '0',
  `Likes` int(10) unsigned NOT NULL DEFAULT '0',
  `Dislikes` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Сушия','Суши и пицца','+380996555654/+380996278731/+380504569874','Sushia.com','Харьков, центр','нет пока',4.5,185,11),(2,'Тануки','Суши','+380504125687/+380502135498','Tanuki.com','Харьков','нет',3.2,45,29),(3,'Пивобар','Свежее пиво','+380996541235','pivobar.com','Харьков','нет',4.9,587,452),(9,'Новая компания','Описание новой компании','+380996541235','new-company.kh.com.ua','Харьков','нет',0,10,13);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companycomments`
--

DROP TABLE IF EXISTS `companycomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companycomments` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AuthorId` int(10) unsigned NOT NULL,
  `Text` varchar(1000) NOT NULL,
  `Rate` smallint(5) unsigned NOT NULL,
  `Datetime` datetime NOT NULL,
  `CompanyId` int(10) unsigned NOT NULL,
  `IsRecomended` tinyint(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  KEY `author_company_comment_idx` (`AuthorId`),
  KEY `company_comment_idx` (`CompanyId`),
  CONSTRAINT `author_company_comment` FOREIGN KEY (`AuthorId`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `company_comment` FOREIGN KEY (`CompanyId`) REFERENCES `companies` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companycomments`
--

LOCK TABLES `companycomments` WRITE;
/*!40000 ALTER TABLE `companycomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `companycomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companydishtypes`
--

DROP TABLE IF EXISTS `companydishtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companydishtypes` (
  `CompanyId` int(10) unsigned NOT NULL,
  `DishTypeId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`CompanyId`,`DishTypeId`),
  KEY `CompanyDishTypes_DishTypeId_idx` (`DishTypeId`),
  KEY `CompanyDishTypes_CompanyId_idx` (`CompanyId`),
  CONSTRAINT `CompanyDishTypes_CompanyId` FOREIGN KEY (`CompanyId`) REFERENCES `companies` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CompanyDishTypes_DishTypeId` FOREIGN KEY (`DishTypeId`) REFERENCES `dishtypes` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companydishtypes`
--

LOCK TABLES `companydishtypes` WRITE;
/*!40000 ALTER TABLE `companydishtypes` DISABLE KEYS */;
INSERT INTO `companydishtypes` VALUES (1,1),(2,1),(1,2),(3,2),(1,3),(3,3);
/*!40000 ALTER TABLE `companydishtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishcomments`
--

DROP TABLE IF EXISTS `dishcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dishcomments` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AuthorId` int(10) unsigned NOT NULL,
  `Text` varchar(1000) NOT NULL,
  `Rate` smallint(5) unsigned NOT NULL,
  `Datetime` datetime NOT NULL,
  `DishId` int(10) unsigned NOT NULL,
  `IsRecomended` tinyint(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  KEY `author_idx` (`AuthorId`),
  KEY `dish_comment_idx` (`DishId`),
  CONSTRAINT `author_comment` FOREIGN KEY (`AuthorId`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishcomments`
--

LOCK TABLES `dishcomments` WRITE;
/*!40000 ALTER TABLE `dishcomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `dishcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dishes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Weight` varchar(50) NOT NULL,
  `Structure` varchar(1000) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `Price` float unsigned NOT NULL,
  `Availability` tinyint(4) NOT NULL DEFAULT '1',
  `DishTypeId` int(10) unsigned NOT NULL,
  `Picture` varchar(1000) DEFAULT NULL,
  `CompanyId` int(10) unsigned NOT NULL,
  `Rate` float unsigned NOT NULL DEFAULT '0',
  `Likes` int(10) unsigned NOT NULL DEFAULT '0',
  `Dislikes` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  UNIQUE KEY `id_company_id_UNIQUE` (`Name`,`DishTypeId`,`CompanyId`),
  KEY `company_idx` (`CompanyId`),
  KEY `dishtype_idx` (`DishTypeId`),
  CONSTRAINT `company` FOREIGN KEY (`CompanyId`) REFERENCES `companies` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dishtype` FOREIGN KEY (`DishTypeId`) REFERENCES `dishtypes` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` VALUES (1,'Суши1','1750','Состав 1','Описание 1',1000,1,1,'нет',1,3.5,16,10),(2,'Суши2','400','Состав 2','Описание 2',700,1,1,'нет',1,3.3,0,0),(3,'Суши3','120','Состав 3','Описание 3',450,1,1,'нет',1,4.9,0,0),(4,'Суши4','850','Состав 4','Описание 4',2500,1,1,'нет',2,5,0,0),(5,'Суши5','630','Состав 5','Описание 5',1400,1,1,'нет',2,5,0,0),(6,'Пицца1','100','Состав 1','Описание 6',700,1,2,'нет',1,2.8,0,0),(7,'Пицца2','500','Состав 2','Описание 7',400,1,2,'нет',1,1.9,0,0),(8,'Пицца3','700','Состав 3','Описание 9',420,1,2,'нет',3,3.9,0,0),(9,'Пиво1','840','Состав 5','Описание 10',500,1,3,'нет',1,4.3,0,0),(10,'Пиво2','100','Состав 6','Описание 11',100,1,3,'нет',3,5,0,0),(11,'Пиво 3','200','Состав 7','описание 12',630,1,3,'нет',3,4.1,0,0),(12,'Пиво 4','450','Состав 8','Описание 13',478,1,3,'нет',3,4.7,0,0),(13,'Пиво 5','120','Состав 9','Описание 14',100,1,3,'нет',3,4.7,0,0),(14,'Новое блюдо (пицца)','999','Состав нового блюда','Описание нового блюда',999,1,2,'Шикарное фото',1,0,0,0);
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishtypes`
--

DROP TABLE IF EXISTS `dishtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dishtypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Picture` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishtypes`
--

LOCK TABLES `dishtypes` WRITE;
/*!40000 ALTER TABLE `dishtypes` DISABLE KEYS */;
INSERT INTO `dishtypes` VALUES (1,'Суши','Японское блюдо','Нет'),(2,'Пицца','Итальянское блюдо','нет'),(3,'Пиво','Немецкий напиток','нет');
/*!40000 ALTER TABLE `dishtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Username` varchar(40) NOT NULL,
  `Password` varchar(1024) NOT NULL,
  `Roles` varchar(50) NOT NULL,
  `FirstName` varchar(40) NOT NULL,
  `LastName` varchar(40) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `IsEmailConfirmed` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `PhoneNumber` varchar(20) NOT NULL,
  `IsPhoneNumberConfirmed` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `Birthday` date DEFAULT NULL,
  `IsActivated` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `IsBlocked` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `id_UNIQUE` (`Id`),
  UNIQUE KEY `PhoneNumber_UNIQUE` (`PhoneNumber`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (29,'Yevhen.Stienin','$2a$10$bEIQv1Y5v3OQ6ZfogjJWIejNjRtpUR1AoYqimnIyd4RC2I713x03C','user,admin','Yevhen','Stienin','Yevhen.Stienin@outlook.com',0,'+380505617727',0,'1994-05-28',1,0,0),(30,'Nadiia.Shkabura','$2a$10$bEIQv1Y5v3OQ6ZfogjJWIejNjRtpUR1AoYqimnIyd4RC2I713x03C','user','Nadiia','Shkabura','Nadiia.Shkabura@outlook.com',0,'+380996278731',0,'1987-04-18',1,0,0),(31,'Viktor.Bylbas','$2a$10$bEIQv1Y5v3OQ6ZfogjJWIejNjRtpUR1AoYqimnIyd4RC2I713x03C','user','Viktor','Bylbas','Viktor.Bylbas@outlook.com',0,'+3809184607',0,'1994-06-12',1,0,0),(66,'Alexander.Mayhurov','$2a$10$uv4X/7KbIPj85uHPhcUZoeUNiyDo9NWVRYPdWrNCCIOYJEA9qnM12','user','Alexander','Mayhurov','Alexander.Mayhurov@gmail.com',0,'+380995478596',0,'1993-09-19',1,0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'food-delivery'
--

--
-- Dumping routines for database 'food-delivery'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-04 18:11:11
