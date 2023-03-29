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


-- Dumping database structure for izgl
CREATE DATABASE IF NOT EXISTS `izgl` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `izgl`;

-- Dumping structure for table izgl.audzekni
CREATE TABLE IF NOT EXISTS `audzekni` (
  `kods` varchar(12) NOT NULL,
  `vards` varchar(20) DEFAULT NULL,
  `uzvards` varchar(20) DEFAULT NULL,
  `talrunis` varchar(11) DEFAULT NULL,
  `vecums` int(11) DEFAULT NULL,
  `dzdiena` date DEFAULT NULL,
  `grupa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`kods`),
  KEY `grupa` (`grupa`),
  CONSTRAINT `audzekni_ibfk_1` FOREIGN KEY (`grupa`) REFERENCES `grupas` (`nosaukums`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table izgl.audzekni: ~0 rows (approximately)
/*!40000 ALTER TABLE `audzekni` DISABLE KEYS */;
INSERT INTO `audzekni` (`kods`, `vards`, `uzvards`, `talrunis`, `vecums`, `dzdiena`, `grupa`) VALUES
	('32131321', 'bvxcbxcv', 'fdsfdsfds', '55345353', 14, '2023-04-02', 'ps'),
	('42142123', 'dasdsad', 'bcvbcvxb', '53454353', 10, '2023-03-29', 'ds'),
	('423432', 'dsadasdas', 'bxcvbxcbxcv', '534534534', 11, '2023-03-25', 'ps'),
	('54232352', 'bvcxbxbv', 'bvbxcvbvxcvbxc', '53453543', 13, '2023-03-24', 'ps'),
	('6546464', 'dasdasd', 'gsdfgfds', 'gdfsgds', 15, '2023-04-02', 'ds');
/*!40000 ALTER TABLE `audzekni` ENABLE KEYS */;

-- Dumping structure for table izgl.audzinataji
CREATE TABLE IF NOT EXISTS `audzinataji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vards` varchar(30) DEFAULT NULL,
  `uzvards` varchar(30) DEFAULT NULL,
  `stazs` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table izgl.audzinataji: ~0 rows (approximately)
/*!40000 ALTER TABLE `audzinataji` DISABLE KEYS */;
INSERT INTO `audzinataji` (`id`, `vards`, `uzvards`, `stazs`) VALUES
	(1, 'dasdsa', 'dasdsa', 2),
	(2, 'dsa', 'dsa', 4);
/*!40000 ALTER TABLE `audzinataji` ENABLE KEYS */;

-- Dumping structure for table izgl.grupas
CREATE TABLE IF NOT EXISTS `grupas` (
  `nosaukums` varchar(10) NOT NULL,
  `specialitate` int(11) DEFAULT NULL,
  `audz` int(11) DEFAULT NULL,
  PRIMARY KEY (`nosaukums`),
  KEY `audz` (`audz`),
  KEY `specialitate` (`specialitate`),
  CONSTRAINT `grupas_ibfk_1` FOREIGN KEY (`audz`) REFERENCES `audzinataji` (`id`),
  CONSTRAINT `grupas_ibfk_2` FOREIGN KEY (`specialitate`) REFERENCES `specialitates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table izgl.grupas: ~0 rows (approximately)
/*!40000 ALTER TABLE `grupas` DISABLE KEYS */;
INSERT INTO `grupas` (`nosaukums`, `specialitate`, `audz`) VALUES
	('ds', 2, 2),
	('ps', 1, 1);
/*!40000 ALTER TABLE `grupas` ENABLE KEYS */;

-- Dumping structure for table izgl.komisija
CREATE TABLE IF NOT EXISTS `komisija` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nosaukums` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33484012 DEFAULT CHARSET=latin1;

-- Dumping data for table izgl.komisija: ~0 rows (approximately)
/*!40000 ALTER TABLE `komisija` DISABLE KEYS */;
INSERT INTO `komisija` (`id`, `nosaukums`) VALUES
	(1, 'ikt'),
	(2, 'mf');
/*!40000 ALTER TABLE `komisija` ENABLE KEYS */;

-- Dumping structure for table izgl.mac
CREATE TABLE IF NOT EXISTS `mac` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semestris` int(11) DEFAULT NULL,
  `stundu` int(11) DEFAULT NULL,
  `praktisk` int(11) DEFAULT NULL,
  `skolotajs` int(11) DEFAULT NULL,
  `prieksmets` int(11) DEFAULT NULL,
  `grupa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `skolotajs` (`skolotajs`),
  KEY `prieksmets` (`prieksmets`),
  KEY `grupa` (`grupa`),
  CONSTRAINT `mac_ibfk_1` FOREIGN KEY (`skolotajs`) REFERENCES `skolotaji` (`id`),
  CONSTRAINT `mac_ibfk_2` FOREIGN KEY (`prieksmets`) REFERENCES `prieksmeti` (`id`),
  CONSTRAINT `mac_ibfk_3` FOREIGN KEY (`grupa`) REFERENCES `grupas` (`nosaukums`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table izgl.mac: ~0 rows (approximately)
/*!40000 ALTER TABLE `mac` DISABLE KEYS */;
INSERT INTO `mac` (`id`, `semestris`, `stundu`, `praktisk`, `skolotajs`, `prieksmets`, `grupa`) VALUES
	(1, 1, 10, 0, 1, 1, 'ds'),
	(2, 2, 20, 0, 4, 2, 'ps'),
	(3, 1, 0, 10, 5, 3, 'ds'),
	(4, 1, 0, 20, 4, 4, 'ps'),
	(5, 1, 10, 10, 3, 2, 'ds');
/*!40000 ALTER TABLE `mac` ENABLE KEYS */;

-- Dumping structure for table izgl.prieksmeti
CREATE TABLE IF NOT EXISTS `prieksmeti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nosaukums` varchar(30) DEFAULT NULL,
  `stundu` int(11) DEFAULT NULL,
  `praktisks` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table izgl.prieksmeti: ~0 rows (approximately)
/*!40000 ALTER TABLE `prieksmeti` DISABLE KEYS */;
INSERT INTO `prieksmeti` (`id`, `nosaukums`, `stundu`, `praktisks`) VALUES
	(1, 'dfgsgdsf', 10, 0),
	(2, 'gdfsgds', 20, 0),
	(3, 'gfhgdfshds', 0, 20),
	(4, 'dasdasda', 0, 30);
/*!40000 ALTER TABLE `prieksmeti` ENABLE KEYS */;

-- Dumping structure for table izgl.skolotaji
CREATE TABLE IF NOT EXISTS `skolotaji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vards` varchar(20) DEFAULT NULL,
  `uzvards` varchar(20) DEFAULT NULL,
  `talrunis` varchar(11) DEFAULT NULL,
  `stazs` int(11) DEFAULT NULL,
  `komisija` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `komisija` (`komisija`),
  CONSTRAINT `skolotaji_ibfk_1` FOREIGN KEY (`komisija`) REFERENCES `komisija` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table izgl.skolotaji: ~0 rows (approximately)
/*!40000 ALTER TABLE `skolotaji` DISABLE KEYS */;
INSERT INTO `skolotaji` (`id`, `vards`, `uzvards`, `talrunis`, `stazs`, `komisija`) VALUES
	(1, 'dasdad', 'dffdfsfds', '6456346654', 4, 1),
	(2, 'hdgfdfhd', 'dncbvnbcvds', '64634634654', 2, 1),
	(3, 'dasdsaasdxvzx', 'ncvbncvncvs', '423232354', 3, 2),
	(4, 'dbxcvbxc', 'dcxzczxcds', '663456454', 5, 2),
	(5, 'djghjhgd', 'djghjgds', '63212314', 6, 1);
/*!40000 ALTER TABLE `skolotaji` ENABLE KEYS */;

-- Dumping structure for table izgl.specialitates
CREATE TABLE IF NOT EXISTS `specialitates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kods` varchar(20) DEFAULT NULL,
  `nosaukums` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table izgl.specialitates: ~0 rows (approximately)
/*!40000 ALTER TABLE `specialitates` DISABLE KEYS */;
INSERT INTO `specialitates` (`id`, `kods`, `nosaukums`) VALUES
	(1, '33484011', 'ps'),
	(2, '33483011', 'ds');
/*!40000 ALTER TABLE `specialitates` ENABLE KEYS */;

-- Dumping structure for table izgl.vertejumi
CREATE TABLE IF NOT EXISTS `vertejumi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vertejums` int(11) DEFAULT NULL,
  `audzeknis` varchar(12) DEFAULT NULL,
  `prieksmets` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audzeknis` (`audzeknis`),
  KEY `prieksmets` (`prieksmets`),
  CONSTRAINT `vertejumi_ibfk_1` FOREIGN KEY (`audzeknis`) REFERENCES `audzekni` (`kods`),
  CONSTRAINT `vertejumi_ibfk_2` FOREIGN KEY (`prieksmets`) REFERENCES `prieksmeti` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Dumping data for table izgl.vertejumi: ~0 rows (approximately)
/*!40000 ALTER TABLE `vertejumi` DISABLE KEYS */;
INSERT INTO `vertejumi` (`id`, `vertejums`, `audzeknis`, `prieksmets`) VALUES
	(1, 10, '54232352', 1),
	(2, 9, '54232352', 2),
	(3, 5, '54232352', 3),
	(4, 7, '54232352', 4),
	(5, 8, '32131321', 1),
	(6, 2, '32131321', 2),
	(7, 3, '32131321', 3),
	(8, 2, '32131321', 4),
	(9, 4, '6546464', 1),
	(10, 1, '6546464', 2),
	(11, 3, '42142123', 3),
	(12, 2, '42142123', 4),
	(13, 4, '423432', 1),
	(14, 6, '423432', 2),
	(15, 5, '423432', 4),
	(16, 2, '6546464', 3),
	(17, 8, '6546464', 4),
	(18, 3, '42142123', 1),
	(19, 9, '42142123', 2),
	(20, 1, '423432', 3);
/*!40000 ALTER TABLE `vertejumi` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
