-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.16-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para bd_votaciones
CREATE DATABASE IF NOT EXISTS `bd_votaciones` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_votaciones`;


-- Volcando estructura para tabla bd_votaciones.candidato
CREATE TABLE IF NOT EXISTS `candidato` (
  `ID_CANDIDATO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(250) NOT NULL,
  `PARTIDO` int(11) NOT NULL,
  `ORDEN` int(11) NOT NULL,
  `ESCANO` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID_CANDIDATO`),
  KEY `FK_candidato_partido` (`PARTIDO`),
  CONSTRAINT `FK_candidato_partido` FOREIGN KEY (`PARTIDO`) REFERENCES `partido` (`ID_PARTIDO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_votaciones.candidato: ~0 rows (aproximadamente)
DELETE FROM `candidato`;
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
INSERT INTO `candidato` (`ID_CANDIDATO`, `NOMBRE`, `PARTIDO`, `ORDEN`, `ESCANO`) VALUES
	(1, 'Aaaaa Bbbbb Ccccc', 1, 1, 'N'),
	(2, 'Ddddd Eeeee Ffffff', 1, 2, 'N'),
	(3, 'Ggggg Hhhhh Iiiiii', 2, 1, 'N'),
	(4, 'Jjjjj Kkkkk Lllll', 2, 2, 'N'),
	(5, 'Mmmmm Nnnnn Ooooo', 3, 1, 'N'),
	(6, 'Ppppp Qqqqq Rrrrr', 3, 2, 'N');
/*!40000 ALTER TABLE `candidato` ENABLE KEYS */;


-- Volcando estructura para tabla bd_votaciones.partido
CREATE TABLE IF NOT EXISTS `partido` (
  `ID_PARTIDO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `LOGO` varchar(100) DEFAULT NULL,
  `NUM_VOTOS` int(11) DEFAULT '0',
  PRIMARY KEY (`ID_PARTIDO`),
  UNIQUE KEY `NOMBRE` (`NOMBRE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_votaciones.partido: ~6 rows (aproximadamente)
DELETE FROM `partido`;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` (`ID_PARTIDO`, `NOMBRE`, `LOGO`, `NUM_VOTOS`) VALUES
	(1, 'UNIDOS PODEMOS', '../Logos/logo_up.jpg', 2),
	(2, 'PP', '../Logos/logo_pp.png', 1),
	(3, 'PSOE', '../Logos/logo_psoe.jpg', 1),
	(4, 'C\'s', '../Logos/logo_ciudadanos.jpg', 1),
	(5, 'UPyD', '../Logos/logo_upyd.png', 0),
	(6, 'ERC', '../Logos/logo_erc.png', 0);
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;


-- Volcando estructura para tabla bd_votaciones.votante
CREATE TABLE IF NOT EXISTS `votante` (
  `ID_VOTANTE` int(11) NOT NULL AUTO_INCREMENT,
  `NIF` varchar(9) DEFAULT NULL,
  `PASS` varbinary(256) DEFAULT NULL,
  `VOTADO` enum('S','N') DEFAULT 'N',
  PRIMARY KEY (`ID_VOTANTE`),
  UNIQUE KEY `NIF` (`NIF`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_votaciones.votante: ~6 rows (aproximadamente)
DELETE FROM `votante`;
/*!40000 ALTER TABLE `votante` DISABLE KEYS */;
INSERT INTO `votante` (`ID_VOTANTE`, `NIF`, `PASS`, `VOTADO`) VALUES
	(1, '11111111Q', _binary 0x3831646339626462353264303464633230303336646264383331336564303535, 'S'),
	(2, '22222222W', _binary 0x3831646339626462353264303464633230303336646264383331336564303535, 'S'),
	(3, '33333333E', _binary 0x3831646339626462353264303464633230303336646264383331336564303535, 'S'),
	(5, '55555555T', _binary 0x3831646339626462353264303464633230303336646264383331336564303535, 'S'),
	(6, '66666666Y', _binary 0x3831646339626462353264303464633230303336646264383331336564303535, 'S');
/*!40000 ALTER TABLE `votante` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
