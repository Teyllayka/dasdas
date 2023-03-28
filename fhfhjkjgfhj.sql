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


-- Dumping database structure for namu parvaldnieks
CREATE DATABASE IF NOT EXISTS `namu parvaldnieks` /*!40100 DEFAULT CHARACTER SET ucs2 COLLATE ucs2_latvian_ci */;
USE `namu parvaldnieks`;

-- Dumping structure for table namu parvaldnieks.dzivokli
CREATE TABLE IF NOT EXISTS `dzivokli` (
  `dzivokla_numurs` int(99) DEFAULT NULL,
  `Ipas` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Eka` int(99) DEFAULT NULL,
  `platiba` int(11) DEFAULT NULL,
  `stava_numurs` int(3) DEFAULT NULL,
  `ID` int(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_dzivokli_ekas` (`Eka`),
  KEY `FK_dzivokli_ipasnieki` (`Ipas`),
  CONSTRAINT `FK_dzivokli_ekas` FOREIGN KEY (`Eka`) REFERENCES `ekas` (`ID`),
  CONSTRAINT `FK_dzivokli_ipasnieki` FOREIGN KEY (`Ipas`) REFERENCES `ipasnieki` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table namu parvaldnieks.dzivokli: ~0 rows (approximately)
/*!40000 ALTER TABLE `dzivokli` DISABLE KEYS */;
INSERT INTO `dzivokli` (`dzivokla_numurs`, `Ipas`, `Eka`, `platiba`, `stava_numurs`, `ID`) VALUES
	(32132, '3', 215, 321, 321, 1),
	(321, '2', 55, 321233, 3212313, 3232),
	(1, '1', 5, 3213213, 53453453, 423423);
/*!40000 ALTER TABLE `dzivokli` ENABLE KEYS */;

-- Dumping structure for table namu parvaldnieks.ekas
CREATE TABLE IF NOT EXISTS `ekas` (
  `ekas_num` int(11) DEFAULT NULL,
  `iela` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `stavu_skaits` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `platiba` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table namu parvaldnieks.ekas: ~0 rows (approximately)
/*!40000 ALTER TABLE `ekas` DISABLE KEYS */;
INSERT INTO `ekas` (`ekas_num`, `iela`, `stavu_skaits`, `ID`, `platiba`) VALUES
	(1, 'gg', 3, 5, 100),
	(5, 'gag', 13, 55, 1300),
	(51, 'bcgg', 73, 215, 174500);
/*!40000 ALTER TABLE `ekas` ENABLE KEYS */;

-- Dumping structure for table namu parvaldnieks.ipasnieki
CREATE TABLE IF NOT EXISTS `ipasnieki` (
  `ID` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  `kods` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  `vards_uzvards` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  `vecums` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table namu parvaldnieks.ipasnieki: ~0 rows (approximately)
/*!40000 ALTER TABLE `ipasnieki` DISABLE KEYS */;
INSERT INTO `ipasnieki` (`ID`, `kods`, `vards_uzvards`, `vecums`) VALUES
	('1', '2332', 'daniels sprogis', 11),
	('2', '534543', 'roberts salajevs', 12),
	('3', '423432', 'denis slujevs', 13);
/*!40000 ALTER TABLE `ipasnieki` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
