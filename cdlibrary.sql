-- MySQL dump 10.13  Distrib 5.7.44, for Win64 (x86_64)
--
-- Host: 193.204.40.146    Database: cdlibrary
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.48-MariaDB-0+deb9u2

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
-- Table structure for table `cd`
--

DROP TABLE IF EXISTS `cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd` (
  `cdid` int(11) NOT NULL,
  `cdlblid` varchar(10) DEFAULT NULL,
  `cdtitle` varchar(25) DEFAULT NULL,
  `cdyear` int(11) DEFAULT NULL,
  `lbltitle` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cdid`),
  KEY `fk_label` (`lbltitle`),
  CONSTRAINT `fk_label` FOREIGN KEY (`lbltitle`) REFERENCES `label` (`lbltitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd`
--

LOCK TABLES `cd` WRITE;
/*!40000 ALTER TABLE `cd` DISABLE KEYS */;
INSERT INTO `cd` VALUES (1,'A2 1311','Giant Steps',1960,'Atlantic'),(2,'83012-2','Swing',1977,'Atlantic');
/*!40000 ALTER TABLE `cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composition`
--

DROP TABLE IF EXISTS `composition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composition` (
  `compid` int(11) NOT NULL,
  `comptitle` varchar(35) NOT NULL,
  `compyear` int(11) DEFAULT NULL,
  PRIMARY KEY (`compid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composition`
--

LOCK TABLES `composition` WRITE;
/*!40000 ALTER TABLE `composition` DISABLE KEYS */;
INSERT INTO `composition` VALUES (1,'Giant Steps',NULL),(2,'Cousin Mary',NULL),(3,'Countdown',NULL),(4,'Spiral',NULL),(5,'Syeeda\'s Song Flute',NULL),(6,'Naima',NULL),(7,'Mr. P.C.',NULL),(8,'Stomp of King Porter',1924),(9,'Sing a Study in Brown',1937),(10,'Sing Moten\'s Swing',1997),(11,'A-Tisket, A-Tasket',1938),(12,'I Know Why',1941),(13,'Sing You Sinners',1930),(14,'Java Jive',1940),(15,'Down South Camp Meetin\'',1997),(16,'Topsy',1936),(17,'Clouds',NULL),(18,'Skyliner',1944),(19,'It\'s a Good Enough to Keep',NULL),(20,'Choo Choo Ch\' Boogie',1945);
/*!40000 ALTER TABLE `composition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_cd`
--

DROP TABLE IF EXISTS `group_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_cd` (
  `grpid` int(11) NOT NULL,
  `cdid` int(11) NOT NULL,
  `grpcdorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`grpid`,`cdid`),
  KEY `fk_cd_1` (`cdid`),
  CONSTRAINT `fk_cd_1` FOREIGN KEY (`cdid`) REFERENCES `cd` (`cdid`),
  CONSTRAINT `fk_group_1` FOREIGN KEY (`grpid`) REFERENCES `grp` (`grpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_cd`
--

LOCK TABLES `group_cd` WRITE;
/*!40000 ALTER TABLE `group_cd` DISABLE KEYS */;
INSERT INTO `group_cd` VALUES (1,2,1),(2,2,2);
/*!40000 ALTER TABLE `group_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_recording`
--

DROP TABLE IF EXISTS `group_recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_recording` (
  `grpid` int(11) NOT NULL,
  `rcdid` int(11) NOT NULL,
  `compid` int(11) NOT NULL,
  `grpcdrole` varchar(25) NOT NULL,
  PRIMARY KEY (`grpid`,`rcdid`,`compid`,`grpcdrole`),
  KEY `fk_recording_2` (`rcdid`,`compid`),
  CONSTRAINT `fk_group` FOREIGN KEY (`grpid`) REFERENCES `grp` (`grpid`),
  CONSTRAINT `fk_recording_2` FOREIGN KEY (`rcdid`, `compid`) REFERENCES `recording` (`rcdid`, `compid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_recording`
--

LOCK TABLES `group_recording` WRITE;
/*!40000 ALTER TABLE `group_recording` DISABLE KEYS */;
INSERT INTO `group_recording` VALUES (1,20,15,'vocals'),(1,21,16,'vocals'),(1,22,17,'vocals'),(1,23,18,'vocals'),(1,24,19,'vocals'),(1,25,20,'vocals'),(2,15,10,'music'),(2,16,11,'music'),(2,19,14,'music');
/*!40000 ALTER TABLE `group_recording` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp`
--

DROP TABLE IF EXISTS `grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grp` (
  `grpid` int(11) NOT NULL,
  `grpname` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`grpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp`
--

LOCK TABLES `grp` WRITE;
/*!40000 ALTER TABLE `grp` DISABLE KEYS */;
INSERT INTO `grp` VALUES (1,'Manhattan Transfer'),(2,'Asleep at the Wheel');
/*!40000 ALTER TABLE `grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `lbltitle` varchar(15) NOT NULL,
  `lblstreet` varchar(25) DEFAULT NULL,
  `lblcity` varchar(20) DEFAULT NULL,
  `lblstate` varchar(20) DEFAULT NULL,
  `lblpostcode` varchar(10) DEFAULT NULL,
  `lblnation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`lbltitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
INSERT INTO `label` VALUES ('Atlantic','75 Rockefeller Plaza','New York','NY','10019','USA');
/*!40000 ALTER TABLE `label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `psnid` int(11) NOT NULL,
  `psnfname` varchar(25) DEFAULT NULL,
  `psnlname` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`psnid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'John','Coltrane'),(2,'Tommy','Flanagan'),(3,'Paul','Chamber'),(4,'Art','Taylor'),(5,'Cheryl','Bentyne'),(6,'Janis','Siegel'),(7,'Tim','Hauser'),(8,'Alan','Paul');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_cd`
--

DROP TABLE IF EXISTS `person_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_cd` (
  `psnid` int(11) NOT NULL,
  `cdid` int(11) NOT NULL,
  `psncdorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`psnid`,`cdid`),
  KEY `fk_cd_2` (`cdid`),
  CONSTRAINT `fk_cd_2` FOREIGN KEY (`cdid`) REFERENCES `cd` (`cdid`),
  CONSTRAINT `fk_person_1` FOREIGN KEY (`psnid`) REFERENCES `person` (`psnid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_cd`
--

LOCK TABLES `person_cd` WRITE;
/*!40000 ALTER TABLE `person_cd` DISABLE KEYS */;
INSERT INTO `person_cd` VALUES (1,1,1);
/*!40000 ALTER TABLE `person_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_composition`
--

DROP TABLE IF EXISTS `person_composition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_composition` (
  `psnid` int(11) NOT NULL,
  `compid` int(11) NOT NULL,
  `psncomprole` varchar(25) DEFAULT NULL,
  `psncomporder` int(11) DEFAULT NULL,
  PRIMARY KEY (`psnid`,`compid`),
  KEY `fk_composition_1` (`compid`),
  CONSTRAINT `fk_composition_1` FOREIGN KEY (`compid`) REFERENCES `composition` (`compid`),
  CONSTRAINT `fk_person_2` FOREIGN KEY (`psnid`) REFERENCES `person` (`psnid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_composition`
--

LOCK TABLES `person_composition` WRITE;
/*!40000 ALTER TABLE `person_composition` DISABLE KEYS */;
INSERT INTO `person_composition` VALUES (1,1,'music',1),(1,2,'music',1),(1,3,'music',1),(1,4,'music',1),(1,5,'music',1),(1,6,'music',1),(1,7,'music',1),(2,4,'music',2),(3,6,'music',2),(4,1,'lyrics',2),(4,2,'lyrics',2),(4,8,'music',1),(7,6,'lyrics',3),(7,8,'lyrics',2);
/*!40000 ALTER TABLE `person_composition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_group`
--

DROP TABLE IF EXISTS `person_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_group` (
  `grpid` int(11) NOT NULL,
  `psnid` int(11) NOT NULL,
  PRIMARY KEY (`grpid`,`psnid`),
  KEY `fk_person_3` (`psnid`),
  CONSTRAINT `fk_group_3` FOREIGN KEY (`grpid`) REFERENCES `grp` (`grpid`),
  CONSTRAINT `fk_person_3` FOREIGN KEY (`psnid`) REFERENCES `person` (`psnid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_group`
--

LOCK TABLES `person_group` WRITE;
/*!40000 ALTER TABLE `person_group` DISABLE KEYS */;
INSERT INTO `person_group` VALUES (1,5),(1,6),(1,7),(1,8);
/*!40000 ALTER TABLE `person_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_recording`
--

DROP TABLE IF EXISTS `person_recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_recording` (
  `psnid` int(11) NOT NULL,
  `rcdid` int(11) NOT NULL,
  `compid` int(11) DEFAULT NULL,
  `psncdprole` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`psnid`,`rcdid`),
  KEY `fk_recording_1` (`rcdid`,`compid`),
  CONSTRAINT `fk_person_4` FOREIGN KEY (`psnid`) REFERENCES `person` (`psnid`),
  CONSTRAINT `fk_recording_1` FOREIGN KEY (`rcdid`, `compid`) REFERENCES `recording` (`rcdid`, `compid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_recording`
--

LOCK TABLES `person_recording` WRITE;
/*!40000 ALTER TABLE `person_recording` DISABLE KEYS */;
INSERT INTO `person_recording` VALUES (1,1,1,'tenor sax'),(2,1,1,'piano'),(3,1,1,'bass'),(4,1,1,'drums');
/*!40000 ALTER TABLE `person_recording` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recording`
--

DROP TABLE IF EXISTS `recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recording` (
  `rcdid` int(11) NOT NULL,
  `compid` int(11) NOT NULL,
  `rcdlength` decimal(5,2) DEFAULT NULL,
  `rcddate` date DEFAULT NULL,
  PRIMARY KEY (`rcdid`,`compid`),
  KEY `fk_composition_2` (`compid`),
  CONSTRAINT `fk_composition_2` FOREIGN KEY (`compid`) REFERENCES `composition` (`compid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording`
--

LOCK TABLES `recording` WRITE;
/*!40000 ALTER TABLE `recording` DISABLE KEYS */;
INSERT INTO `recording` VALUES (1,1,4.72,'1959-04-05'),(2,2,5.75,'1959-04-05'),(3,3,2.35,'1959-04-05'),(4,4,5.93,'1959-04-05'),(5,5,7.00,'1959-04-05'),(6,6,4.35,'1959-12-02'),(7,7,2.95,'1959-04-05'),(8,1,5.93,'1959-04-01'),(9,6,7.00,'1959-04-01'),(10,2,6.95,'1959-04-05'),(11,3,3.67,'1959-04-05'),(12,2,4.45,'1959-04-05'),(13,8,3.20,NULL),(14,9,2.85,NULL),(15,10,3.60,NULL),(16,11,2.95,NULL),(17,12,3.57,NULL),(18,13,2.75,NULL),(19,14,2.85,NULL),(20,15,3.25,NULL),(21,16,3.23,NULL),(22,17,7.20,NULL),(23,18,3.18,NULL),(24,19,3.18,NULL),(25,20,3.00,NULL);
/*!40000 ALTER TABLE `recording` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track`
--

DROP TABLE IF EXISTS `track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track` (
  `cdid` int(11) NOT NULL,
  `trkid` int(11) NOT NULL,
  `rcdid` int(11) NOT NULL,
  PRIMARY KEY (`cdid`,`trkid`,`rcdid`),
  CONSTRAINT `fk_cd_3` FOREIGN KEY (`cdid`) REFERENCES `cd` (`cdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track`
--

LOCK TABLES `track` WRITE;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
INSERT INTO `track` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),(1,6,6),(1,7,7),(1,8,1),(1,9,6),(1,10,2),(1,11,3),(1,12,5),(2,1,13),(2,2,14),(2,3,15),(2,4,16),(2,5,17),(2,6,18),(2,7,19),(2,8,20),(2,9,21),(2,10,22),(2,11,23),(2,12,24),(2,13,25);
/*!40000 ALTER TABLE `track` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-18 15:17:40
