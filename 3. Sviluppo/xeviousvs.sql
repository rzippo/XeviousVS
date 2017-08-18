CREATE DATABASE  IF NOT EXISTS `xeviousvs` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `xeviousvs`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: xeviousvs
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `giocatori_disponibili`
--

DROP TABLE IF EXISTS `giocatori_disponibili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giocatori_disponibili` (
  `username` varchar(50) NOT NULL,
  `indirizzo_ip` varchar(255) NOT NULL,
  `porta` int(11) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `statistiche_utenti` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giocatori_disponibili`
--

LOCK TABLES `giocatori_disponibili` WRITE;
/*!40000 ALTER TABLE `giocatori_disponibili` DISABLE KEYS */;
/*!40000 ALTER TABLE `giocatori_disponibili` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giocatori_in_attesa_recupero_partita`
--

DROP TABLE IF EXISTS `giocatori_in_attesa_recupero_partita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giocatori_in_attesa_recupero_partita` (
  `username` varchar(50) NOT NULL,
  `indirizzo_ip` varchar(255) NOT NULL,
  `porta` int(11) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `username2` FOREIGN KEY (`username`) REFERENCES `statistiche_utenti` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giocatori_in_attesa_recupero_partita`
--

LOCK TABLES `giocatori_in_attesa_recupero_partita` WRITE;
/*!40000 ALTER TABLE `giocatori_in_attesa_recupero_partita` DISABLE KEYS */;
/*!40000 ALTER TABLE `giocatori_in_attesa_recupero_partita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistiche_utenti`
--

DROP TABLE IF EXISTS `statistiche_utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistiche_utenti` (
  `username` varchar(50) NOT NULL,
  `partite_vinte` int(11) DEFAULT '0',
  `partite_perse` int(11) DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistiche_utenti`
--

LOCK TABLES `statistiche_utenti` WRITE;
/*!40000 ALTER TABLE `statistiche_utenti` DISABLE KEYS */;
INSERT INTO `statistiche_utenti` VALUES ('dario',6,7),('nick',8,10),('palla',2,2),('pinco',3,3),('raffa',8,5);
/*!40000 ALTER TABLE `statistiche_utenti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-30 13:45:03
