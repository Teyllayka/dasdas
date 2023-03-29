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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table motoshop.detalizeti: ~4 rows (approximately)
/*!40000 ALTER TABLE `detalizeti` DISABLE KEYS */;
INSERT INTO `detalizeti` (`prece`, `pasutijums`, `daudums`, `id`) VALUES
	(1, 1, 10, 1),
	(2, 2, 20, 2),
	(1, 2, 20, 3),
	(2, 3, 30, 4);
/*!40000 ALTER TABLE `detalizeti` ENABLE KEYS */;

-- Dumping structure for table motoshop.lietotaji
CREATE TABLE IF NOT EXISTS `lietotaji` (
  `kods` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `vards_uzvards` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `dzimsanas_diena` date DEFAULT NULL,
  `lietotaja_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`lietotaja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table motoshop.lietotaji: ~3 rows (approximately)
/*!40000 ALTER TABLE `lietotaji` DISABLE KEYS */;
INSERT INTO `lietotaji` (`kods`, `vards_uzvards`, `dzimsanas_diena`, `lietotaja_id`) VALUES
	('1000', 'dasdasdasd', '2005-10-10', 1),
	('1032100', 'dadasdasdasdasdasd', '2025-10-10', 2),
	('43242342', 'hdfhgfdhfd', '2015-10-10', 3);
/*!40000 ALTER TABLE `lietotaji` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table motoshop.pasutijumi: ~4 rows (approximately)
/*!40000 ALTER TABLE `pasutijumi` DISABLE KEYS */;
INSERT INTO `pasutijumi` (`pasutijumu_id`, `datums`, `pasutijuma status`, `Klienta_id`, `summa`) VALUES
	(1, '1923-10-10', 'hz', 1, 10),
	(2, '1924-10-10', 'hadasdz', 2, 2),
	(3, '1923-12-10', 'dsadahz', 1, 5),
	(5, '1923-10-12', 'hdasdasz', 2, 54);
/*!40000 ALTER TABLE `pasutijumi` ENABLE KEYS */;

-- Dumping structure for table motoshop.preces
CREATE TABLE IF NOT EXISTS `preces` (
  `nosaukums` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `apraksts` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `cena` float DEFAULT NULL,
  `Preces_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Preces_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table motoshop.preces: ~4 rows (approximately)
/*!40000 ALTER TABLE `preces` DISABLE KEYS */;
INSERT INTO `preces` (`nosaukums`, `apraksts`, `cena`, `Preces_ID`) VALUES
	('aadsadasd', 'ggdfgdsg', 10.1, 1),
	('hdgfhdf', 'ghdgfhdfdhg', 3.1, 2),
	('hdfgghfdsd', 'dasdasg', 5.1, 3),
	('a53453453564654fsgdsg', 'dfgdfg', 12.1, 4);
/*!40000 ALTER TABLE `preces` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
