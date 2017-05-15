-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.1.19-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_votaciones.candidato: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
REPLACE INTO `candidato` (`ID_CANDIDATO`, `NOMBRE`, `PARTIDO`, `ORDEN`, `ESCANO`) VALUES
	(1, 'Anita Gonzalez', 1, 1, 'N'),
	(2, 'Damián López', 1, 2, 'N'),
	(3, 'Armando Gerra', 2, 1, 'N'),
	(4, 'Gerardo Gómez', 2, 2, 'N'),
	(5, 'Casiopea Fernandez', 3, 1, 'N'),
	(6, 'Irene Piqueras', 3, 2, 'N'),
	(7, 'Bruno Díaz', 1, 3, 'N'),
	(8, 'Escarlata Ramirez', 1, 4, 'N'),
	(9, 'Alberto Piqueras', 2, 3, 'N'),
	(10, 'Gerardo Diego', 2, 4, 'N'),
	(11, 'Aurora Ballesteros', 3, 3, 'N'),
	(12, 'Juan Valderrama', 3, 4, 'N'),
	(13, 'Teresa Monteagudo', 4, 1, 'N'),
	(14, 'Pablo Paniagua', 4, 2, 'N'),
	(15, 'Pablo Panduro', 4, 3, 'N'),
	(16, 'Sandra Bravo', 4, 4, 'N'),
	(17, 'Wilfredo Casanova', 5, 1, 'N'),
	(18, 'Ferdinando Pacheco', 5, 2, 'N'),
	(19, 'Wenceslao Muñoz', 5, 3, 'N'),
	(20, 'Sandalio Garrido', 5, 4, 'N'),
	(21, 'Carmen García', 6, 1, 'N'),
	(22, 'Fátima Córtes', 6, 2, 'N'),
	(23, 'Sancho Sánchez', 6, 3, 'N'),
	(25, 'Fulgencia Sevilla', 6, 4, 'N');
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
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
REPLACE INTO `partido` (`ID_PARTIDO`, `NOMBRE`, `LOGO`, `NUM_VOTOS`) VALUES
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
/*!40000 ALTER TABLE `votante` DISABLE KEYS */;
REPLACE INTO `votante` (`ID_VOTANTE`, `NIF`, `PASS`, `VOTADO`) VALUES
	(1, '11111111Q', '81dc9bdb52d04dc20036dbd8313ed055', 'S'),
	(2, '22222222W', '81dc9bdb52d04dc20036dbd8313ed055', 'S'),
	(3, '33333333E', '81dc9bdb52d04dc20036dbd8313ed055', 'S'),
	(4, '44444444R', '81dc9bdb52d04dc20036dbd8313ed055', 'N'),
	(5, '55555555T', '81dc9bdb52d04dc20036dbd8313ed055', 'S'),
	(6, '66666666Y', '81dc9bdb52d04dc20036dbd8313ed055', 'S');
/*!40000 ALTER TABLE `votante` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
