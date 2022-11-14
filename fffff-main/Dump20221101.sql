-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: practicaverholashin
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id_author` int NOT NULL AUTO_INCREMENT,
  `name_author` varchar(45) NOT NULL,
  `birthday_author` date DEFAULT NULL,
  PRIMARY KEY (`id_author`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Соколов М. М.','1993-04-05'),(2,'Крюкова П. А.','2005-12-24'),(3,'Золотова М. И.','2001-02-08');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id_book` int NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `kolvo` int NOT NULL,
  `id_ganre` int DEFAULT NULL,
  `id_author` int DEFAULT NULL,
  PRIMARY KEY (`id_book`),
  KEY `id_ganre` (`id_ganre`),
  KEY `id_author` (`id_author`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`id_ganre`) REFERENCES `ganres` (`id_ganre`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`id_author`) REFERENCES `authors` (`id_author`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Баллада о казаке',12,1,1),(2,'Шут и пес',12,3,2),(3,'Басня о плуте',20,2,2),(4,'Дочки и сыновья',10,3,3);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ganres`
--

DROP TABLE IF EXISTS `ganres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ganres` (
  `id_ganre` int NOT NULL AUTO_INCREMENT,
  `opisanie` varchar(45) DEFAULT NULL,
  `name_ganre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_ganre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ganres`
--

LOCK TABLES `ganres` WRITE;
/*!40000 ALTER TABLE `ganres` DISABLE KEYS */;
INSERT INTO `ganres` VALUES (1,'Лиро-эпическое произведение','Баллада'),(2,'Стихотворное литературное произведение','Басня'),(3,'Отображает все смешное и несуразное','Комедия');
/*!40000 ALTER TABLE `ganres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historymovebooks`
--

DROP TABLE IF EXISTS `historymovebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historymovebooks` (
  `id_move` int NOT NULL AUTO_INCREMENT,
  `id_book` int DEFAULT NULL,
  `id_reader` int DEFAULT NULL,
  `amount` int NOT NULL,
  `date_out` date DEFAULT NULL,
  `date_in` date DEFAULT NULL,
  PRIMARY KEY (`id_move`),
  KEY `id_reader` (`id_reader`),
  KEY `id_book` (`id_book`),
  CONSTRAINT `historymovebooks_ibfk_1` FOREIGN KEY (`id_reader`) REFERENCES `readers` (`id_reader`),
  CONSTRAINT `historymovebooks_ibfk_2` FOREIGN KEY (`id_book`) REFERENCES `books` (`id_book`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historymovebooks`
--

LOCK TABLES `historymovebooks` WRITE;
/*!40000 ALTER TABLE `historymovebooks` DISABLE KEYS */;
INSERT INTO `historymovebooks` VALUES (1,3,3,1,'2021-01-01','2021-01-01'),(2,2,1,0,'2021-01-01','2021-01-01');
/*!40000 ALTER TABLE `historymovebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readers`
--

DROP TABLE IF EXISTS `readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readers` (
  `id_reader` int NOT NULL AUTO_INCREMENT,
  `fio` varchar(60) NOT NULL,
  `adres` varchar(60) DEFAULT NULL,
  `passport` bigint DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_reader`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readers`
--

LOCK TABLES `readers` WRITE;
/*!40000 ALTER TABLE `readers` DISABLE KEYS */;
INSERT INTO `readers` VALUES (1,'Добрынина В. Е.','г.Серебряные Пруды,пер.Гагарина,84',4320675302,'8-627-053-89-82'),(2,'Королев Д. А.','г.Клин,проезд Сталина, 10',4390310633,'8-495-248-25-91'),(3,'Агапова К. И.','г.Ступино,пр.1905 года,51',4218170894,'8-495-092-39-04'),(4,'Соболев А. Д.','г.Солнечногорск,наб.Ладыгина,02',4891146055,'8-495-715-79-31'),(5,'Яницкий Ф.М.','г.Москва',2353478903,'89206162003'),(6,'Яницкий П.В.','г.Калуга',2353478903,'89206162003');
/*!40000 ALTER TABLE `readers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-01 13:07:21
