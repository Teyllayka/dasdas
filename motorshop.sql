-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for motoshop
CREATE DATABASE IF NOT EXISTS `motoshop` /*!40100 DEFAULT CHARACTER SET ucs2 COLLATE ucs2_latvian_ci */;
USE `motoshop`;

-- Dumping structure for table motoshop.detalizeti
CREATE TABLE IF NOT EXISTS `detalizeti` (
  `prece` int(11) DEFAULT NULL,
  `pasutijums` int(11) DEFAULT NULL,
  `daudums` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK_detalizeti_pasutijumi` (`pasutijums`),
  KEY `FK_detalizeti_preces` (`prece`),
  CONSTRAINT `FK_detalizeti_pasutijumi` FOREIGN KEY (`pasutijums`) REFERENCES `pasutijumi` (`pasutijumu_id`),
  CONSTRAINT `FK_detalizeti_preces` FOREIGN KEY (`prece`) REFERENCES `preces` (`Preces_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Data exporting was unselected.

-- Dumping structure for table motoshop.lietotaji
CREATE TABLE IF NOT EXISTS `lietotaji` (
  `kods` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `vards_uzvards` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `dzimsanas_diena` date DEFAULT NULL,
  `lietotaja_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`lietotaja_id`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Data exporting was unselected.

-- Dumping structure for table motoshop.pasutijumi
CREATE TABLE IF NOT EXISTS `pasutijumi` (
  `pasutijumu_id` int(11) NOT NULL AUTO_INCREMENT,
  `datums` date DEFAULT NULL,
  `pasutijuma status` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Klienta_id` int(11) NOT NULL,
  `summa` float DEFAULT NULL,
  PRIMARY KEY (`pasutijumu_id`),
  KEY `FK_pasutijumi_lietotaji` (`Klienta_id`),
  CONSTRAINT `FK_pasutijumi_lietotaji` FOREIGN KEY (`Klienta_id`) REFERENCES `lietotaji` (`lietotaja_id`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Data exporting was unselected.

-- Dumping structure for table motoshop.preces
CREATE TABLE IF NOT EXISTS `preces` (
  `nosaukums` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `apraksts` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `cena` float DEFAULT NULL,
  `Preces_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Preces_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
