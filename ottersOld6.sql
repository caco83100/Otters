-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 14 déc. 2024 à 23:55
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `otters`
--

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

DROP TABLE IF EXISTS `animaux`;
CREATE TABLE IF NOT EXISTS `animaux` (
  `id_animal` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id_animal`),
  UNIQUE KEY `id` (`id_animal`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `animaux`
--

INSERT INTO `animaux` (`id_animal`, `name`) VALUES
(1, 'Les Guépards'),
(2, 'Les Gazelles'),
(3, 'Les Autruches'),
(4, 'Les Gnous'),
(5, 'Les Oryx Beisa'),
(6, 'Les Rhinocéros'),
(7, 'Les Suricates'),
(8, 'Les Fennecs'),
(9, 'Les Coatis'),
(10, 'Les Saïmiris'),
(11, 'Les Tapirs'),
(12, 'Les Casoars'),
(13, 'Les Crocodiles nains'),
(14, 'Les Pythons'),
(15, 'Les Tortues'),
(16, 'Les Iguanes'),
(17, 'Les Aras'),
(18, 'Les Grands Hoccos'),
(19, 'Les Panthères'),
(20, 'Les Pandas Roux'),
(21, 'Les Lémuriens'),
(23, 'Les Mouflons'),
(24, 'Les Binturongs'),
(25, 'Les Loutres'),
(26, 'Les Cerfs'),
(27, 'Les Macaques crabier'),
(28, 'Les Vautours'),
(29, 'Les Loups d\'Europe'),
(30, 'Les Daims'),
(31, 'Les Antilopes'),
(32, 'Les Nilgauts'),
(33, 'Les Marabouts'),
(34, 'Les Cigognes'),
(35, 'Les Oryx Algazelle'),
(36, 'Les Watusis'),
(37, 'Les Ânes de Somalie'),
(38, 'Les Yacks'),
(39, 'Les Moutons noirs'),
(40, 'Les Ibis'),
(42, 'Les Pécaris'),
(43, 'Les Tamanoirs'),
(44, 'Les Flamants roses'),
(45, 'Les Nandous'),
(46, 'Les Émeux'),
(47, 'Les Wallabys'),
(48, 'Les Porcs-épics'),
(49, 'Les Bisons'),
(50, 'Les Ânes de Provence'),
(51, 'Les Dromadaires'),
(52, 'Les Lynx'),
(53, 'Les Servals'),
(54, 'Les Chiens des buissons'),
(55, 'Les Tigres'),
(56, 'Les Lions'),
(57, 'Les Hippopotames'),
(58, 'Les Zèbres'),
(59, 'Les Hyènes'),
(60, 'Les Loups à crinière'),
(61, 'Les Girafes'),
(62, 'Les Grivets Cercopithèques'),
(63, 'Les Varans de Komodo'),
(64, 'Les Éléphants'),
(65, 'Les Tamarins'),
(66, 'Les Capucins'),
(67, 'Les Ouistitis'),
(68, 'Les Gibbons'),
(69, 'Les Chèvres Naines');

-- --------------------------------------------------------

--
-- Structure de la table `biomes`
--

DROP TABLE IF EXISTS `biomes`;
CREATE TABLE IF NOT EXISTS `biomes` (
  `id_biome` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `color` text NOT NULL,
  PRIMARY KEY (`id_biome`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `biomes`
--

INSERT INTO `biomes` (`id_biome`, `name`, `color`) VALUES
(1, 'Le Belvédère', 'rgba(193,180,172,0.8)'),
(2, 'Le Plateau', 'rgba(218,175,161,0.8)'),
(3, 'Les Clairières', 'rgba(216,205,152,0.8)'),
(4, 'Le Bois des Pins', 'rgba(196,205,174,0.8)'),
(5, 'Le Vallon des Cascades', 'rgba(175,193,205,0.8)'),
(6, 'La Bergerie des Reptiles', 'rgba(179,209,197,0.8)');

-- --------------------------------------------------------

--
-- Structure de la table `enclosure`
--

DROP TABLE IF EXISTS `enclosure`;
CREATE TABLE IF NOT EXISTS `enclosure` (
  `id_enclosure` int NOT NULL AUTO_INCREMENT,
  `id_biome` int NOT NULL,
  `meal` int NOT NULL,
  `travaux` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_enclosure`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `enclosure`
--

INSERT INTO `enclosure` (`id_enclosure`, `id_biome`, `meal`, `travaux`) VALUES
(1, 5, 0, 0),
(2, 5, 0, 0),
(3, 5, 0, 0),
(4, 1, 0, 0),
(5, 1, 0, 0),
(6, 1, 0, 0),
(7, 1, 0, 0),
(8, 1, 0, 0),
(9, 1, 0, 0),
(10, 1, 0, 0),
(11, 1, 0, 0),
(12, 1, 0, 0),
(13, 2, 0, 0),
(14, 2, 0, 0),
(15, 2, 0, 0),
(16, 2, 0, 0),
(17, 2, 0, 0),
(18, 2, 0, 0),
(19, 2, 0, 0),
(20, 2, 0, 0),
(21, 2, 0, 0),
(22, 2, 0, 0),
(23, 2, 0, 0),
(24, 2, 0, 0),
(25, 2, 0, 0),
(26, 3, 0, 0),
(27, 3, 0, 0),
(28, 3, 0, 0),
(29, 3, 0, 0),
(30, 3, 0, 0),
(31, 3, 0, 0),
(32, 3, 0, 0),
(33, 3, 0, 0),
(34, 3, 0, 0),
(35, 3, 0, 0),
(36, 3, 0, 0),
(37, 3, 0, 0),
(38, 3, 0, 0),
(39, 3, 0, 0),
(40, 3, 0, 0),
(41, 4, 0, 0),
(42, 4, 0, 0),
(43, 4, 0, 0),
(44, 4, 0, 0),
(45, 4, 0, 0),
(46, 5, 0, 0),
(47, 5, 0, 0),
(48, 5, 0, 0),
(49, 5, 0, 0),
(50, 5, 0, 0),
(51, 5, 0, 0),
(52, 6, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `enclosure_animals`
--

DROP TABLE IF EXISTS `enclosure_animals`;
CREATE TABLE IF NOT EXISTS `enclosure_animals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_enclosure` int NOT NULL,
  `id_animal` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `enclosure_animals`
--

INSERT INTO `enclosure_animals` (`id`, `id_enclosure`, `id_animal`) VALUES
(1, 1, 17),
(2, 2, 18),
(3, 3, 19),
(4, 4, 4),
(5, 4, 5),
(6, 4, 6),
(7, 5, 2),
(8, 5, 3),
(9, 6, 1),
(10, 7, 13),
(11, 8, 12),
(12, 9, 11),
(13, 10, 9),
(14, 10, 10),
(15, 11, 8),
(16, 12, 7),
(17, 13, 65),
(18, 14, 66),
(19, 15, 67),
(20, 16, 68),
(21, 17, 63),
(22, 18, 62),
(23, 19, 64),
(24, 20, 61),
(25, 21, 59),
(26, 22, 60),
(27, 23, 58),
(28, 24, 57),
(29, 25, 56),
(30, 26, 33),
(31, 26, 34),
(32, 27, 35),
(33, 27, 36),
(34, 27, 37),
(35, 28, 38),
(36, 28, 39),
(37, 29, 0),
(38, 30, 15),
(39, 30, 40),
(40, 31, 42),
(41, 32, 43),
(42, 32, 44),
(43, 32, 45),
(44, 33, 46),
(45, 33, 47),
(46, 34, 48),
(47, 35, 52),
(48, 36, 53),
(49, 37, 54),
(50, 38, 55),
(51, 39, 49),
(52, 40, 50),
(53, 40, 51),
(54, 41, 29),
(55, 42, 30),
(56, 42, 31),
(57, 42, 32),
(58, 43, 28),
(59, 44, 26),
(60, 45, 27),
(61, 46, 24),
(62, 46, 25),
(63, 47, 23),
(64, 48, 15),
(65, 49, 21),
(66, 50, 69),
(67, 51, 20),
(68, 52, 14),
(69, 52, 15),
(70, 52, 16);

-- --------------------------------------------------------

--
-- Structure de la table `geo_animals`
--

DROP TABLE IF EXISTS `geo_animals`;
CREATE TABLE IF NOT EXISTS `geo_animals` (
  `animalId` bigint NOT NULL,
  `posX` int DEFAULT NULL,
  `posY` int DEFAULT NULL,
  `pathX` int DEFAULT NULL,
  `pathY` int DEFAULT NULL,
  PRIMARY KEY (`animalId`),
  KEY `geo_animals_posX_IDX` (`posX`,`posY`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `geo_path`
--

DROP TABLE IF EXISTS `geo_path`;
CREATE TABLE IF NOT EXISTS `geo_path` (
  `pathId` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `startX` int DEFAULT NULL,
  `startY` int DEFAULT NULL,
  `endX` int DEFAULT NULL,
  `endY` int DEFAULT NULL,
  `path` longtext,
  `length` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`pathId`),
  KEY `geo_path_startX_IDX` (`startX`,`startY`) USING BTREE,
  KEY `geo_path_endX_IDX` (`endX`,`endY`) USING BTREE,
  KEY `geo_path_length_IDX` (`length`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `geo_path`
--

INSERT INTO `geo_path` (`pathId`, `startX`, `startY`, `endX`, `endY`, `path`, `length`) VALUES
(4, 360, 1314, 765, 998, '[{\"x\":360,\"y\":1314},{\"x\":687,\"y\":1078},{\"x\":744,\"y\":1051},{\"x\":765,\"y\":998}]', 523),
(6, 765, 998, 720, 900, '[{\"x\":\"765\",\"y\":\"998\"},{\"x\":726,\"y\":938},{\"x\":722,\"y\":918},{\"x\":720,\"y\":900}]', 110),
(7, 765, 998, 844, 930, '[{\"x\":\"765\",\"y\":\"998\"},{\"x\":804,\"y\":969},{\"x\":844,\"y\":930}]', 104),
(9, 765, 998, 818, 1154, '[{\"x\":\"765\",\"y\":\"998\"},{\"x\":799,\"y\":1118},{\"x\":818,\"y\":1154}]', 165),
(14, 818, 1154, 1431, 1439, '[{\"x\":\"818\",\"y\":\"1154\"},{\"x\":853,\"y\":1169},{\"x\":890,\"y\":1204},{\"x\":922,\"y\":1225},{\"x\":983,\"y\":1248},{\"x\":1009,\"y\":1272},{\"x\":1061,\"y\":1296},{\"x\":1107,\"y\":1311},{\"x\":1154,\"y\":1334},{\"x\":1207,\"y\":1350},{\"x\":1277,\"y\":1380},{\"x\":1327,\"y\":1383},{\"x\":1349,\"y\":1389},{\"x\":1400,\"y\":1423},{\"x\":1431,\"y\":1439}]', 686),
(15, 1431, 1439, 1460, 1460, '[{\"x\":\"1431\",\"y\":\"1439\"},{\"x\":1460,\"y\":1460}]', 36),
(16, 818, 1154, 1397, 1512, '[{\"x\":\"818\",\"y\":\"1154\"},{\"x\":837,\"y\":1197},{\"x\":905,\"y\":1273},{\"x\":933,\"y\":1296},{\"x\":966,\"y\":1312},{\"x\":1029,\"y\":1336},{\"x\":1118,\"y\":1371},{\"x\":1200,\"y\":1401},{\"x\":1252,\"y\":1416},{\"x\":1294,\"y\":1427},{\"x\":1361,\"y\":1482},{\"x\":1397,\"y\":1512}]', 703),
(17, 1397, 1512, 1460, 1460, '[{\"x\":\"1397\",\"y\":\"1512\"},{\"x\":\"1460\",\"y\":\"1460\"}]', 82),
(18, 1460, 1460, 1496, 1478, '[{\"x\":\"1460\",\"y\":\"1460\"},{\"x\":1480,\"y\":1474},{\"x\":1496,\"y\":1478}]', 41),
(19, 1496, 1478, 1531, 1487, '[{\"x\":\"1496\",\"y\":\"1478\"},{\"x\":1531,\"y\":1487}]', 36),
(20, 1531, 1487, 1707, 1529, '[{\"x\":\"1531\",\"y\":\"1487\"},{\"x\":1548,\"y\":1492},{\"x\":1553,\"y\":1501},{\"x\":1564,\"y\":1511},{\"x\":1579,\"y\":1518},{\"x\":1688,\"y\":1533},{\"x\":1707,\"y\":1529}]', 189),
(21, 1707, 1529, 1728, 1521, '[{\"x\":\"1707\",\"y\":\"1529\"},{\"x\":1728,\"y\":1521}]', 22),
(22, 1397, 1512, 1689, 1637, '[{\"x\":\"1397\",\"y\":\"1512\"},{\"x\":1415,\"y\":1527},{\"x\":1432,\"y\":1549},{\"x\":1452,\"y\":1575},{\"x\":1491,\"y\":1609},{\"x\":1546,\"y\":1633},{\"x\":1613,\"y\":1640},{\"x\":1689,\"y\":1637}]', 339),
(23, 1689, 1637, 1728, 1521, '[{\"x\":\"1689\",\"y\":\"1637\"},{\"x\":1712,\"y\":1599},{\"x\":1723,\"y\":1573},{\"x\":1726,\"y\":1557},{\"x\":1728,\"y\":1536},{\"x\":\"1728\",\"y\":\"1521\"}]', 125),
(24, 1728, 1521, 1803, 1524, '[{\"x\":\"1728\",\"y\":\"1521\"},{\"x\":1744,\"y\":1515},{\"x\":1792,\"y\":1524},{\"x\":1803,\"y\":1524}]', 77),
(25, 1803, 1524, 1840, 1518, '[{\"x\":\"1803\",\"y\":\"1524\"},{\"x\":1827,\"y\":1522},{\"x\":1840,\"y\":1518}]', 38),
(26, 1689, 1637, 1852, 1591, '[{\"x\":\"1689\",\"y\":\"1637\"},{\"x\":1780,\"y\":1633},{\"x\":1852,\"y\":1591}]', 174),
(28, 1852, 1591, 1803, 1524, '[{\"x\":\"1852\",\"y\":\"1591\"},{\"x\":1849,\"y\":1585},{\"x\":1850,\"y\":1576},{\"x\":1835,\"y\":1575},{\"x\":1834,\"y\":1560},{\"x\":1819,\"y\":1559},{\"x\":1819,\"y\":1543},{\"x\":1803,\"y\":1542},{\"x\":\"1803\",\"y\":\"1524\"}]', 111),
(29, 1840, 1518, 2054, 1439, '[{\"x\":\"1840\",\"y\":\"1518\"},{\"x\":1875,\"y\":1506},{\"x\":1902,\"y\":1502},{\"x\":1927,\"y\":1490},{\"x\":1974,\"y\":1474},{\"x\":1992,\"y\":1467},{\"x\":2030,\"y\":1450},{\"x\":2054,\"y\":1439}]', 229),
(30, 1852, 1591, 2097, 1445, '[{\"x\":\"1852\",\"y\":\"1591\"},{\"x\":1904,\"y\":1560},{\"x\":1934,\"y\":1540},{\"x\":1973,\"y\":1515},{\"x\":2014,\"y\":1494},{\"x\":2050,\"y\":1476},{\"x\":2081,\"y\":1458},{\"x\":2097,\"y\":1445}]', 286),
(31, 2097, 1445, 2054, 1439, '[{\"x\":\"2097\",\"y\":\"1445\"},{\"x\":2088,\"y\":1441},{\"x\":2074,\"y\":1440},{\"x\":\"2054\",\"y\":\"1439\"}]', 44),
(32, 2054, 1439, 1937, 1339, '[{\"x\":\"2054\",\"y\":\"1439\"},{\"x\":2018,\"y\":1421},{\"x\":2010,\"y\":1416},{\"x\":1986,\"y\":1391},{\"x\":1947,\"y\":1351},{\"x\":1937,\"y\":1339}]', 156),
(34, 1937, 1339, 1815, 1290, '[{\"x\":\"1937\",\"y\":\"1339\"},{\"x\":1918,\"y\":1318},{\"x\":1833,\"y\":1294},{\"x\":1815,\"y\":1290}]', 135),
(35, 1815, 1290, 1688, 1224, '[{\"x\":\"1815\",\"y\":\"1290\"},{\"x\":1709,\"y\":1268},{\"x\":1699,\"y\":1264},{\"x\":1690,\"y\":1258},{\"x\":1686,\"y\":1252},{\"x\":1684,\"y\":1241},{\"x\":1686,\"y\":1228},{\"x\":1688,\"y\":1224}]', 166),
(36, 1688, 1224, 1821, 1154, '[{\"x\":\"1688\",\"y\":\"1224\"},{\"x\":1717,\"y\":1215},{\"x\":1736,\"y\":1211},{\"x\":1757,\"y\":1205},{\"x\":1767,\"y\":1201},{\"x\":1780,\"y\":1194},{\"x\":1796,\"y\":1183},{\"x\":1804,\"y\":1175},{\"x\":1811,\"y\":1167},{\"x\":1821,\"y\":1154}]', 155),
(37, 1821, 1154, 2091, 1294, '[{\"x\":\"1821\",\"y\":\"1154\"},{\"x\":1878,\"y\":1157},{\"x\":1931,\"y\":1177},{\"x\":1988,\"y\":1195},{\"x\":2018,\"y\":1216},{\"x\":2045,\"y\":1242},{\"x\":2089,\"y\":1293},{\"x\":2090,\"y\":1293},{\"x\":2091,\"y\":1294}]', 317);

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_service` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `NOM` text NOT NULL,
  `PRENOM` text NOT NULL,
  `DATE` text NOT NULL,
  `PSEUDO` text NOT NULL,
  `MAIL` text NOT NULL,
  `MDP` text NOT NULL,
  `NL` int NOT NULL,
  `PP` int NOT NULL DEFAULT '1',
  `role` varchar(50) DEFAULT 'user',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`Id`, `NOM`, `PRENOM`, `DATE`, `PSEUDO`, `MAIL`, `MDP`, `NL`, `PP`, `role`) VALUES
(15, 'zinvzs', 'visevnis', '20/02/2004', 'TEST', 'test@gmail.com', '$2y$10$n/QVm5cdToqdvuBYFKULn.K94jfW4ryOaACD.axjmU2.lEdm4/IGq', 0, 1, 'user'),
(17, 'MORATILLE', 'Marco', '20/02/2004', 'Caco', 'caco83100@gmail.com', '$2y$10$H9isn41WONtN6GKWv1VLZOPg8zyXFo4z6bXC6s8FAVlxQWMOWMtFu', 1, 1, 'admin'),
(18, 'RIBERO', 'Lucie', '00/00/0000', 'Lulu', 'lulu@gmail.com', '$2y$10$aypus.M43KUugd49C3uRYOohBc501xsmBCrAB0VIT7PBQ1WJhillW', 0, 1, 'admin');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
