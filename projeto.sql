CREATE DATABASE  IF NOT EXISTS `project_spotify` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project_spotify`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: project_spotify
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `ID_Artista` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Data_Nascimento` date NOT NULL,
  PRIMARY KEY (`ID_Artista`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (15,'Lisa Landry','1971-07-23'),(16,'April Ruiz','1981-11-12'),(17,'Kimberly Ramos','1980-12-26'),(18,'Ashley Vasquez','1991-05-20'),(19,'April Armstrong','1991-09-08'),(20,'Katherine Howe','1996-02-10'),(21,'Stephanie Kim','1979-11-30'),(22,'Michelle Washington','1998-06-24'),(23,'Jordan Smith','1965-11-28'),(24,'Jane Combs','1983-12-24');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disco`
--

DROP TABLE IF EXISTS `disco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disco` (
  `ID_Disco` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) NOT NULL,
  `Data_Lancamento` date NOT NULL,
  `ID_Artista` int DEFAULT NULL,
  PRIMARY KEY (`ID_Disco`),
  KEY `ID_Artista` (`ID_Artista`),
  CONSTRAINT `disco_ibfk_1` FOREIGN KEY (`ID_Artista`) REFERENCES `artista` (`ID_Artista`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disco`
--

LOCK TABLES `disco` WRITE;
/*!40000 ALTER TABLE `disco` DISABLE KEYS */;
INSERT INTO `disco` VALUES (16,'Hospital important.','2021-12-13',20),(17,'Real mind go.','2020-01-16',20),(18,'Account.','2020-07-10',22),(19,'First adult model.','2024-07-14',24),(20,'Material green.','2023-08-15',20),(21,'Suggest south all.','2022-06-28',15),(22,'Deal various.','2023-04-16',17),(23,'Billion.','2020-03-20',23),(24,'Radio quite sport.','2022-09-21',20),(25,'Himself.','2020-01-14',15);
/*!40000 ALTER TABLE `disco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musica`
--

DROP TABLE IF EXISTS `musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musica` (
  `ID_Musica` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) NOT NULL,
  `Duracao` varchar(255) NOT NULL,
  `ID_Disco` int DEFAULT NULL,
  PRIMARY KEY (`ID_Musica`),
  KEY `ID_Disco` (`ID_Disco`),
  CONSTRAINT `musica_ibfk_1` FOREIGN KEY (`ID_Disco`) REFERENCES `disco` (`ID_Disco`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musica`
--

LOCK TABLES `musica` WRITE;
/*!40000 ALTER TABLE `musica` DISABLE KEYS */;
INSERT INTO `musica` VALUES (44,'Win effort.','3:09',16),(45,'Possible.','4:49',21),(46,'Six identify.','5:22',25),(47,'Finally.','3:14',19),(48,'Certain.','3:17',21),(49,'Happen.','4:43',24),(50,'Run time.','2:24',23),(51,'Pick.','5:31',20),(52,'Consider.','3:48',25),(53,'Home.','3:57',20),(54,'Win.','4:00',21),(55,'Stuff he.','4:36',25),(56,'Those home.','5:40',20),(57,'Among me.','5:26',21),(58,'Health.','2:31',24),(59,'Whatever.','5:03',21),(60,'Employee difference.','3:55',25),(61,'Senior avoid.','3:31',24),(62,'Outside.','2:36',20),(63,'What network.','5:07',17);
/*!40000 ALTER TABLE `musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musica_artista`
--

DROP TABLE IF EXISTS `musica_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musica_artista` (
  `ID_Musica` int DEFAULT NULL,
  `ID_Artista` int DEFAULT NULL,
  KEY `ID_Musica` (`ID_Musica`),
  KEY `ID_Artista` (`ID_Artista`),
  CONSTRAINT `musica_artista_ibfk_1` FOREIGN KEY (`ID_Musica`) REFERENCES `musica` (`ID_Musica`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `musica_artista_ibfk_2` FOREIGN KEY (`ID_Artista`) REFERENCES `artista` (`ID_Artista`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musica_artista`
--

LOCK TABLES `musica_artista` WRITE;
/*!40000 ALTER TABLE `musica_artista` DISABLE KEYS */;
INSERT INTO `musica_artista` VALUES (59,17),(63,15),(59,17),(47,22),(48,17),(56,18),(52,19),(51,15),(56,17),(53,18),(60,16),(55,20),(52,20),(61,22),(54,17),(62,23),(53,20),(49,17),(57,24),(49,24),(52,23),(47,19),(60,24),(56,18),(49,24),(45,21),(52,15),(48,18),(63,22),(44,15);
/*!40000 ALTER TABLE `musica_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musica_playlist`
--

DROP TABLE IF EXISTS `musica_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musica_playlist` (
  `ID_Musica` int NOT NULL,
  `ID_Playlist` int NOT NULL,
  PRIMARY KEY (`ID_Playlist`,`ID_Musica`),
  KEY `ID_Musica` (`ID_Musica`),
  CONSTRAINT `musica_playlist_ibfk_1` FOREIGN KEY (`ID_Musica`) REFERENCES `musica` (`ID_Musica`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `musica_playlist_ibfk_2` FOREIGN KEY (`ID_Playlist`) REFERENCES `playlist` (`ID_Playlist`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musica_playlist`
--

LOCK TABLES `musica_playlist` WRITE;
/*!40000 ALTER TABLE `musica_playlist` DISABLE KEYS */;
INSERT INTO `musica_playlist` VALUES (44,19),(44,22),(45,23),(46,17),(46,20),(47,23),(48,19),(48,21),(49,16),(50,21),(50,23),(51,17),(51,18),(52,18),(52,19),(52,23),(53,19),(53,23),(53,25),(55,21),(55,23),(56,22),(56,25),(57,16),(58,18),(60,18),(60,24),(61,21),(62,19),(62,23);
/*!40000 ALTER TABLE `musica_playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `ID_Playlist` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) NOT NULL,
  `ID_Usuario` int DEFAULT NULL,
  PRIMARY KEY (`ID_Playlist`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (16,'Phone hotel.',13),(17,'Describe its son.',14),(18,'Source fish present.',14),(19,'City produce.',13),(20,'View eat.',13),(21,'Sometimes.',13),(22,'Air discover bring.',13),(23,'Great tough.',11),(24,'Car manager day.',10),(25,'Effort throw.',14);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Data_Registro` date NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (10,'Norma Singleton','anna80@example.net','2024-06-17'),(11,'Kim Peters','qjohnson@example.com','2024-09-02'),(12,'Robin Hurley','ebuchanan@example.net','2024-09-01'),(13,'Melissa Lopez','sabrina56@example.com','2024-03-17'),(14,'Travis Hawkins','tanthony@example.com','2024-06-14');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-16 14:46:07
