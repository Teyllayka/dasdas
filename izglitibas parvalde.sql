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


-- Dumping database structure for izglitibas parvalde
CREATE DATABASE IF NOT EXISTS `izglitibas parvalde` /*!40100 DEFAULT CHARACTER SET ucs2 COLLATE ucs2_latvian_ci */;
USE `izglitibas parvalde`;

-- Dumping structure for table izglitibas parvalde.audzekni
CREATE TABLE IF NOT EXISTS `audzekni` (
  `kods` int(11) NOT NULL,
  `grupas_nos` int(11) NOT NULL,
  `vards_uzvards` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  `talr_nr` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `dz_diena` date DEFAULT NULL,
  `vecums` int(11) DEFAULT NULL,
  PRIMARY KEY (`kods`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Data exporting was unselected.

-- Dumping structure for table izglitibas parvalde.audzinataji
CREATE TABLE IF NOT EXISTS `audzinataji` (
  `audzinataja_ID` int(11) NOT NULL,
  `vards_uzvards` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  `darba stazs` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`audzinataja_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Data exporting was unselected.

-- Dumping structure for table izglitibas parvalde.grupas
CREATE TABLE IF NOT EXISTS `grupas` (
  `grupas_nos` int(11) NOT NULL,
  `audzinataja_ID` int(11) NOT NULL,
  `specialitate` int(11) NOT NULL,
  PRIMARY KEY (`grupas_nos`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Data exporting was unselected.

-- Dumping structure for table izglitibas parvalde.macibu plani
CREATE TABLE IF NOT EXISTS `macibu plani` (
  `pr_nosaukums` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Plans` int(11) NOT NULL DEFAULT '0',
  `skolotaju_ID` int(11) NOT NULL DEFAULT '0',
  `Grupas_nos` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '0',
  `semestris` int(11) NOT NULL DEFAULT '0',
  `stundu_skaits` int(11) NOT NULL DEFAULT '0',
  `praktisko_nodarbibu_skaits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Plans`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Data exporting was unselected.

-- Dumping structure for table izglitibas parvalde.metodiska komisija
CREATE TABLE IF NOT EXISTS `metodiska komisija` (
  `nosaukums` int(11) NOT NULL,
  PRIMARY KEY (`nosaukums`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Data exporting was unselected.

-- Dumping structure for table izglitibas parvalde.prieksmeti
CREATE TABLE IF NOT EXISTS `prieksmeti` (
  `nosaukums` int(11) NOT NULL DEFAULT '0',
  `stundu_skaits` int(11) DEFAULT NULL,
  `praktisko_nodarbibu_skaits` int(11) DEFAULT NULL,
  PRIMARY KEY (`nosaukums`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Data exporting was unselected.

-- Dumping structure for table izglitibas parvalde.skolotaji
CREATE TABLE IF NOT EXISTS `skolotaji` (
  `skolotaja_ID` int(11) NOT NULL,
  `nosaukums` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  `vards_uzvards` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  `talr_nr` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  `darba stazs` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`skolotaja_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Data exporting was unselected.

-- Dumping structure for table izglitibas parvalde.specialitate
CREATE TABLE IF NOT EXISTS `specialitate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `programmas_nos` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `kods` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
