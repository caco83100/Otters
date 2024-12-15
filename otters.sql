-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 15, 2024 at 10:17 PM
-- Server version: 8.3.0
-- PHP Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `otters`
--

-- --------------------------------------------------------

--
-- Table structure for table `animaux`
--

DROP TABLE IF EXISTS `animaux`;
CREATE TABLE IF NOT EXISTS `animaux` (
  `id_animal` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id_animal`),
  UNIQUE KEY `id` (`id_animal`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `animaux`
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
-- Table structure for table `biomes`
--

DROP TABLE IF EXISTS `biomes`;
CREATE TABLE IF NOT EXISTS `biomes` (
  `id_biome` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `color` text NOT NULL,
  PRIMARY KEY (`id_biome`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `biomes`
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
-- Table structure for table `enclosure`
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
-- Dumping data for table `enclosure`
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
-- Table structure for table `enclosure_animals`
--

DROP TABLE IF EXISTS `enclosure_animals`;
CREATE TABLE IF NOT EXISTS `enclosure_animals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_enclosure` int NOT NULL,
  `id_animal` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enclosure_animals`
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
-- Table structure for table `geo_animals`
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

--
-- Dumping data for table `geo_animals`
--

INSERT INTO `geo_animals` (`animalId`, `posX`, `posY`, `pathX`, `pathY`) VALUES
(1, 1523, 454, 1585, 424),
(2, 1393, 470, 1357, 428),
(3, 1306, 523, 1287, 480),
(4, 1169, 583, 1147, 544),
(5, 1036, 613, 984, 558),
(6, 947, 697, 861, 703),
(7, 1114, 803, 1137, 815),
(8, 1137, 736, 1163, 776),
(9, 1225, 745, 1221, 778),
(10, 1292, 772, 1294, 830),
(11, 1460, 748, 1482, 788),
(12, 1589, 652, 1556, 684),
(13, 1646, 541, 1575, 538),
(14, 200, 1246, 360, 1314),
(15, 298, 1254, 360, 1314),
(16, 255, 1314, 360, 1314),
(17, 675, 889, 720, 900),
(18, 744, 817, 720, 900),
(19, 872, 884, 844, 930),
(20, 1436, 1397, 1431, 1439),
(21, 1543, 1459, 1531, 1487),
(23, 1819, 1461, 1840, 1518),
(24, 1833, 1252, 1815, 1290),
(25, 1972, 1292, 1937, 1339),
(26, 2245, 1527, 2311, 1462),
(27, 2199, 1419, 2201, 1461),
(28, 2513, 1420, 2491, 1438),
(29, 3067, 1331, 3014, 1261),
(30, 2808, 1155, 2838, 1079),
(31, 2816, 1293, 2820, 1394),
(32, 2924, 1232, 2958, 1298),
(33, 2134, 837, 2087, 821),
(34, 2034, 932, 1988, 892),
(35, 2094, 1011, 2103, 1059),
(36, 2227, 977, 2221, 1040),
(37, 2345, 941, 2356, 1005),
(38, 2456, 897, 2510, 935),
(39, 2564, 851, 2580, 900),
(40, 2103, 1100, 2062, 1147),
(42, 2332, 1131, 2334, 1171),
(43, 2445, 1073, 2446, 1167),
(44, 2525, 981, 2481, 955),
(45, 2547, 1097, 2547, 1162),
(46, 2626, 1023, 2711, 1121),
(47, 2716, 1036, 2750, 1098),
(48, 2768, 915, 2806, 900),
(49, 2952, 933, 2911, 994),
(50, 3083, 984, 2958, 1029),
(51, 3052, 1062, 2990, 1105),
(52, 2172, 1266, 2172, 1304),
(53, 2270, 1265, 2272, 1305),
(54, 2435, 1195, 2410, 1170),
(55, 2544, 1296, 2540, 1373),
(56, 1725, 724, 1662, 759),
(57, 1908, 770, 1891, 809),
(58, 1884, 895, 1867, 950),
(59, 1718, 999, 1694, 1065),
(60, 1925, 1110, 1821, 1154),
(61, 1660, 1148, 1747, 1073),
(62, 1419, 1203, 1397, 1238),
(63, 1420, 1146, 1359, 1164),
(64, 1573, 1119, 1625, 1067),
(65, 1200, 1072, 1241, 1049),
(66, 1199, 1067, 1241, 1049),
(67, 1198, 1075, 1241, 1049),
(68, 1197, 1068, 1241, 1049),
(69, 1482, 1508, 1496, 1478);

-- --------------------------------------------------------

--
-- Table structure for table `geo_path`
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
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `geo_path`
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
(37, 1821, 1154, 2091, 1294, '[{\"x\":\"1821\",\"y\":\"1154\"},{\"x\":1878,\"y\":1157},{\"x\":1931,\"y\":1177},{\"x\":1988,\"y\":1195},{\"x\":2018,\"y\":1216},{\"x\":2045,\"y\":1242},{\"x\":2089,\"y\":1293},{\"x\":2090,\"y\":1293},{\"x\":2091,\"y\":1294}]', 317),
(38, 2091, 1294, 2172, 1304, '[{\"x\":\"2091\",\"y\":\"1294\"},{\"x\":2129,\"y\":1297},{\"x\":2144,\"y\":1303},{\"x\":2172,\"y\":1304}]', 82),
(39, 2172, 1304, 2272, 1305, '[{\"x\":\"2172\",\"y\":\"1304\"},{\"x\":2272,\"y\":1305}]', 100),
(40, 2272, 1305, 2540, 1373, '[{\"x\":\"2272\",\"y\":\"1305\"},{\"x\":2306,\"y\":1307},{\"x\":2372,\"y\":1324},{\"x\":2383,\"y\":1346},{\"x\":2388,\"y\":1355},{\"x\":2404,\"y\":1364},{\"x\":2479,\"y\":1357},{\"x\":2517,\"y\":1363},{\"x\":2540,\"y\":1373}]', 294),
(41, 2540, 1373, 2607, 1391, '[{\"x\":\"2540\",\"y\":\"1373\"},{\"x\":2572,\"y\":1389},{\"x\":2599,\"y\":1387},{\"x\":2607,\"y\":1391}]', 72),
(42, 2607, 1391, 2685, 1415, '[{\"x\":\"2607\",\"y\":\"1391\"},{\"x\":2641,\"y\":1395},{\"x\":2685,\"y\":1415}]', 83),
(43, 2685, 1415, 2491, 1438, '[{\"x\":\"2685\",\"y\":\"1415\"},{\"x\":2678,\"y\":1421},{\"x\":2583,\"y\":1426},{\"x\":2491,\"y\":1438}]', 197),
(44, 2491, 1438, 2311, 1462, '[{\"x\":\"2491\",\"y\":\"1438\"},{\"x\":2311,\"y\":1462}]', 182),
(45, 2311, 1462, 2201, 1461, '[{\"x\":\"2311\",\"y\":\"1462\"},{\"x\":2289,\"y\":1464},{\"x\":2289,\"y\":1464},{\"x\":2201,\"y\":1461}]', 110),
(46, 2201, 1461, 2097, 1445, '[{\"x\":\"2201\",\"y\":\"1461\"},{\"x\":2184,\"y\":1461},{\"x\":2150,\"y\":1456},{\"x\":2124,\"y\":1450},{\"x\":\"2097\",\"y\":\"1445\"}]', 106),
(47, 2685, 1415, 2820, 1394, '[{\"x\":\"2685\",\"y\":\"1415\"},{\"x\":2698,\"y\":1417},{\"x\":2820,\"y\":1394}]', 137),
(48, 2820, 1394, 2958, 1298, '[{\"x\":\"2820\",\"y\":\"1394\"},{\"x\":2905,\"y\":1380},{\"x\":2926,\"y\":1349},{\"x\":2927,\"y\":1335},{\"x\":2931,\"y\":1317},{\"x\":2958,\"y\":1298}]', 189),
(49, 2958, 1298, 3014, 1261, '[{\"x\":\"2958\",\"y\":\"1298\"},{\"x\":2997,\"y\":1282},{\"x\":3014,\"y\":1261}]', 69),
(50, 3014, 1261, 2990, 1105, '[{\"x\":\"3014\",\"y\":\"1261\"},{\"x\":3021,\"y\":1247},{\"x\":3027,\"y\":1224},{\"x\":3024,\"y\":1202},{\"x\":3008,\"y\":1169},{\"x\":2999,\"y\":1121},{\"x\":2990,\"y\":1105}]', 165),
(51, 2990, 1105, 2970, 1076, '[{\"x\":\"2990\",\"y\":\"1105\"},{\"x\":2970,\"y\":1076}]', 35),
(52, 2970, 1076, 2838, 1079, '[{\"x\":\"2970\",\"y\":\"1076\"},{\"x\":2950,\"y\":1084},{\"x\":2900,\"y\":1091},{\"x\":2875,\"y\":1091},{\"x\":2838,\"y\":1079}]', 136),
(53, 2838, 1079, 2750, 1098, '[{\"x\":\"2838\",\"y\":\"1079\"},{\"x\":2817,\"y\":1077},{\"x\":2763,\"y\":1092},{\"x\":2750,\"y\":1098}]', 91),
(54, 2750, 1098, 2711, 1121, '[{\"x\":\"2750\",\"y\":\"1098\"},{\"x\":2728,\"y\":1109},{\"x\":2711,\"y\":1121}]', 45),
(55, 2711, 1121, 2690, 1145, '[{\"x\":\"2711\",\"y\":\"1121\"},{\"x\":2690,\"y\":1145}]', 32),
(56, 2690, 1145, 2607, 1391, '[{\"x\":\"2690\",\"y\":\"1145\"},{\"x\":2693,\"y\":1152},{\"x\":2695,\"y\":1160},{\"x\":2699,\"y\":1179},{\"x\":2715,\"y\":1248},{\"x\":2716,\"y\":1260},{\"x\":2711,\"y\":1271},{\"x\":2679,\"y\":1330},{\"x\":2662,\"y\":1345},{\"x\":2648,\"y\":1359},{\"x\":2634,\"y\":1372},{\"x\":2625,\"y\":1380},{\"x\":2614,\"y\":1385},{\"x\":\"2607\",\"y\":\"1391\"}]', 292),
(57, 2690, 1145, 2547, 1162, '[{\"x\":\"2690\",\"y\":\"1145\"},{\"x\":2671,\"y\":1160},{\"x\":2645,\"y\":1172},{\"x\":2619,\"y\":1176},{\"x\":2547,\"y\":1162}]', 152),
(58, 2547, 1162, 2446, 1167, '[{\"x\":\"2547\",\"y\":\"1162\"},{\"x\":2532,\"y\":1161},{\"x\":2487,\"y\":1162},{\"x\":2446,\"y\":1167}]', 101),
(59, 2446, 1167, 2410, 1170, '[{\"x\":\"2446\",\"y\":\"1167\"},{\"x\":2410,\"y\":1170}]', 36),
(60, 2410, 1170, 2334, 1171, '[{\"x\":\"2410\",\"y\":\"1170\"},{\"x\":2385,\"y\":1171},{\"x\":2334,\"y\":1171}]', 76),
(61, 2334, 1171, 2207, 1168, '[{\"x\":\"2334\",\"y\":\"1171\"},{\"x\":2281,\"y\":1173},{\"x\":2207,\"y\":1168}]', 127),
(62, 2207, 1168, 2129, 1157, '[{\"x\":\"2207\",\"y\":\"1168\"},{\"x\":2177,\"y\":1168},{\"x\":2129,\"y\":1157}]', 79),
(63, 2129, 1157, 2091, 1294, '[{\"x\":\"2129\",\"y\":\"1157\"},{\"x\":2128,\"y\":1173},{\"x\":2128,\"y\":1186},{\"x\":2128,\"y\":1202},{\"x\":2126,\"y\":1217},{\"x\":2123,\"y\":1231},{\"x\":2117,\"y\":1247},{\"x\":2109,\"y\":1261},{\"x\":2102,\"y\":1275},{\"x\":\"2091\",\"y\":\"1294\"}]', 145),
(64, 2129, 1157, 2062, 1147, '[{\"x\":\"2129\",\"y\":\"1157\"},{\"x\":2100,\"y\":1155},{\"x\":2075,\"y\":1152},{\"x\":2062,\"y\":1147}]', 68),
(65, 2062, 1147, 1966, 987, '[{\"x\":\"2062\",\"y\":\"1147\"},{\"x\":2039,\"y\":1130},{\"x\":2023,\"y\":1114},{\"x\":2008,\"y\":1097},{\"x\":2001,\"y\":1085},{\"x\":1995,\"y\":1039},{\"x\":1974,\"y\":1006},{\"x\":1966,\"y\":987}]', 194),
(66, 1966, 987, 2103, 1059, '[{\"x\":\"1966\",\"y\":\"987\"},{\"x\":1986,\"y\":1012},{\"x\":2019,\"y\":1038},{\"x\":2035,\"y\":1043},{\"x\":2069,\"y\":1047},{\"x\":2103,\"y\":1059}]', 161),
(67, 2103, 1059, 2221, 1040, '[{\"x\":\"2103\",\"y\":\"1059\"},{\"x\":2122,\"y\":1060},{\"x\":2133,\"y\":1059},{\"x\":2145,\"y\":1053},{\"x\":2180,\"y\":1034},{\"x\":2194,\"y\":1031},{\"x\":2206,\"y\":1035},{\"x\":2221,\"y\":1040}]', 126),
(68, 2221, 1040, 2356, 1005, '[{\"x\":\"2221\",\"y\":\"1040\"},{\"x\":2236,\"y\":1039},{\"x\":2247,\"y\":1036},{\"x\":2255,\"y\":1030},{\"x\":2260,\"y\":1025},{\"x\":2272,\"y\":1020},{\"x\":2281,\"y\":1014},{\"x\":2290,\"y\":1007},{\"x\":2298,\"y\":999},{\"x\":2312,\"y\":993},{\"x\":2323,\"y\":994},{\"x\":2332,\"y\":1002},{\"x\":2342,\"y\":1006},{\"x\":2356,\"y\":1005}]', 153),
(69, 2356, 1005, 2481, 955, '[{\"x\":\"2356\",\"y\":\"1005\"},{\"x\":2377,\"y\":1003},{\"x\":2385,\"y\":1005},{\"x\":2402,\"y\":1002},{\"x\":2442,\"y\":987},{\"x\":2459,\"y\":978},{\"x\":2477,\"y\":960},{\"x\":2481,\"y\":955}]', 140),
(70, 2481, 955, 2510, 935, '[{\"x\":\"2481\",\"y\":\"955\"},{\"x\":2491,\"y\":941},{\"x\":2510,\"y\":935}]', 37),
(71, 2510, 935, 2580, 900, '[{\"x\":\"2510\",\"y\":\"935\"},{\"x\":2526,\"y\":930},{\"x\":2529,\"y\":925},{\"x\":2580,\"y\":900}]', 79),
(72, 2580, 900, 2806, 900, '[{\"x\":\"2580\",\"y\":\"900\"},{\"x\":2651,\"y\":907},{\"x\":2679,\"y\":904},{\"x\":2718,\"y\":875},{\"x\":2739,\"y\":868},{\"x\":2758,\"y\":867},{\"x\":2774,\"y\":875},{\"x\":2806,\"y\":900}]', 248),
(73, 2806, 900, 2911, 994, '[{\"x\":\"2806\",\"y\":\"900\"},{\"x\":2836,\"y\":925},{\"x\":2867,\"y\":954},{\"x\":2901,\"y\":988},{\"x\":2911,\"y\":994}]', 141),
(74, 2911, 994, 2958, 1029, '[{\"x\":\"2911\",\"y\":\"994\"},{\"x\":2949,\"y\":1018},{\"x\":2958,\"y\":1029}]', 59),
(76, 2958, 1029, 2970, 1076, '[{\"x\":\"2958\",\"y\":\"1029\"},{\"x\":2965,\"y\":1045},{\"x\":2968,\"y\":1058},{\"x\":\"2970\",\"y\":\"1076\"}]', 49),
(77, 1688, 1224, 1821, 1154, '[{\"x\":\"1688\",\"y\":\"1224\"},{\"x\":1708,\"y\":1217},{\"x\":1732,\"y\":1211},{\"x\":1754,\"y\":1205},{\"x\":1775,\"y\":1198},{\"x\":1788,\"y\":1189},{\"x\":1805,\"y\":1174},{\"x\":1815,\"y\":1163},{\"x\":\"1821\",\"y\":\"1154\"}]', 155),
(78, 1966, 987, 1965, 956, '[{\"x\":\"1966\",\"y\":\"987\"},{\"x\":1965,\"y\":956}]', 31),
(79, 1965, 956, 1988, 892, '[{\"x\":\"1965\",\"y\":\"956\"},{\"x\":1967,\"y\":924},{\"x\":1979,\"y\":903},{\"x\":1988,\"y\":892}]', 70),
(80, 1988, 892, 2029, 862, '[{\"x\":\"1988\",\"y\":\"892\"},{\"x\":2004,\"y\":874},{\"x\":2029,\"y\":862}]', 52),
(81, 2029, 862, 2087, 821, '[{\"x\":\"2029\",\"y\":\"862\"},{\"x\":2049,\"y\":853},{\"x\":2059,\"y\":851},{\"x\":2087,\"y\":821}]', 73),
(82, 2029, 862, 1891, 809, '[{\"x\":\"2029\",\"y\":\"862\"},{\"x\":2006,\"y\":849},{\"x\":1986,\"y\":839},{\"x\":1963,\"y\":833},{\"x\":1926,\"y\":823},{\"x\":1916,\"y\":820},{\"x\":1891,\"y\":809}]', 149),
(83, 1891, 809, 1712, 795, '[{\"x\":\"1891\",\"y\":\"809\"},{\"x\":1837,\"y\":795},{\"x\":1820,\"y\":795},{\"x\":1754,\"y\":797},{\"x\":1730,\"y\":799},{\"x\":1712,\"y\":795}]', 181),
(84, 1712, 795, 1662, 759, '[{\"x\":\"1712\",\"y\":\"795\"},{\"x\":1688,\"y\":785},{\"x\":1678,\"y\":781},{\"x\":1668,\"y\":765},{\"x\":1662,\"y\":759}]', 64),
(85, 1662, 759, 1603, 718, '[{\"x\":\"1662\",\"y\":\"759\"},{\"x\":1649,\"y\":750},{\"x\":1628,\"y\":742},{\"x\":1603,\"y\":718}]', 73),
(86, 1821, 1154, 1773, 1090, '[{\"x\":\"1821\",\"y\":\"1154\"},{\"x\":1802,\"y\":1124},{\"x\":1791,\"y\":1109},{\"x\":1773,\"y\":1090}]', 80),
(87, 1773, 1090, 1867, 950, '[{\"x\":\"1773\",\"y\":\"1090\"},{\"x\":1782,\"y\":1090},{\"x\":1792,\"y\":1090},{\"x\":1817,\"y\":1079},{\"x\":1850,\"y\":1051},{\"x\":1864,\"y\":1022},{\"x\":1867,\"y\":950}]', 194),
(88, 1867, 950, 1965, 956, '[{\"x\":\"1867\",\"y\":\"950\"},{\"x\":1908,\"y\":954},{\"x\":\"1965\",\"y\":\"956\"}]', 98),
(89, 1773, 1090, 1747, 1073, '[{\"x\":\"1773\",\"y\":\"1090\"},{\"x\":1747,\"y\":1073}]', 31),
(90, 1747, 1073, 1694, 1065, '[{\"x\":\"1747\",\"y\":\"1073\"},{\"x\":1718,\"y\":1066},{\"x\":1694,\"y\":1065}]', 54),
(91, 1694, 1065, 1625, 1067, '[{\"x\":\"1694\",\"y\":\"1065\"},{\"x\":1658,\"y\":1066},{\"x\":1640,\"y\":1067},{\"x\":1625,\"y\":1067}]', 69),
(92, 1625, 1067, 1574, 1026, '[{\"x\":\"1625\",\"y\":\"1067\"},{\"x\":1599,\"y\":1054},{\"x\":1579,\"y\":1032},{\"x\":1574,\"y\":1026}]', 67),
(93, 1574, 1026, 1712, 795, '[{\"x\":\"1574\",\"y\":\"1026\"},{\"x\":1624,\"y\":969},{\"x\":1645,\"y\":959},{\"x\":1652,\"y\":950},{\"x\":1665,\"y\":896},{\"x\":1682,\"y\":843},{\"x\":1704,\"y\":813},{\"x\":\"1712\",\"y\":\"795\"}]', 279),
(94, 1574, 1026, 1378, 1106, '[{\"x\":\"1574\",\"y\":\"1026\"},{\"x\":1549,\"y\":1036},{\"x\":1526,\"y\":1037},{\"x\":1488,\"y\":1034},{\"x\":1460,\"y\":1041},{\"x\":1427,\"y\":1056},{\"x\":1403,\"y\":1080},{\"x\":1378,\"y\":1106}]', 223),
(95, 1378, 1106, 1359, 1164, '[{\"x\":\"1378\",\"y\":\"1106\"},{\"x\":1363,\"y\":1135},{\"x\":1359,\"y\":1164}]', 62),
(96, 1359, 1164, 1397, 1238, '[{\"x\":\"1359\",\"y\":\"1164\"},{\"x\":1372,\"y\":1201},{\"x\":1381,\"y\":1217},{\"x\":1397,\"y\":1238}]', 84),
(97, 1397, 1238, 1688, 1224, '[{\"x\":\"1397\",\"y\":\"1238\"},{\"x\":1413,\"y\":1250},{\"x\":1444,\"y\":1269},{\"x\":1488,\"y\":1292},{\"x\":1494,\"y\":1293},{\"x\":1510,\"y\":1292},{\"x\":1541,\"y\":1290},{\"x\":1574,\"y\":1284},{\"x\":1610,\"y\":1276},{\"x\":1633,\"y\":1269},{\"x\":1655,\"y\":1250},{\"x\":1672,\"y\":1236},{\"x\":\"1688\",\"y\":\"1224\"}]', 325),
(98, 1378, 1106, 1241, 1049, '[{\"x\":\"1378\",\"y\":\"1106\"},{\"x\":1313,\"y\":1086},{\"x\":1286,\"y\":1074},{\"x\":1241,\"y\":1049}]', 149),
(99, 1241, 1049, 1136, 859, '[{\"x\":\"1241\",\"y\":\"1049\"},{\"x\":1230,\"y\":1040},{\"x\":1180,\"y\":959},{\"x\":1156,\"y\":915},{\"x\":1136,\"y\":859}]', 219),
(100, 1136, 859, 1134, 835, '[{\"x\":\"1136\",\"y\":\"859\"},{\"x\":1134,\"y\":835}]', 24),
(101, 1134, 835, 861, 703, '[{\"x\":\"1134\",\"y\":\"835\"},{\"x\":1091,\"y\":833},{\"x\":1073,\"y\":845},{\"x\":1013,\"y\":835},{\"x\":993,\"y\":824},{\"x\":949,\"y\":802},{\"x\":916,\"y\":781},{\"x\":896,\"y\":768},{\"x\":874,\"y\":758},{\"x\":865,\"y\":753},{\"x\":856,\"y\":743},{\"x\":851,\"y\":732},{\"x\":853,\"y\":720},{\"x\":861,\"y\":703}]', 351),
(102, 861, 703, 984, 558, '[{\"x\":\"861\",\"y\":\"703\"},{\"x\":892,\"y\":633},{\"x\":939,\"y\":589},{\"x\":984,\"y\":558}]', 196),
(103, 984, 558, 1147, 544, '[{\"x\":\"984\",\"y\":\"558\"},{\"x\":1016,\"y\":544},{\"x\":1093,\"y\":556},{\"x\":1114,\"y\":552},{\"x\":1147,\"y\":544}]', 168),
(104, 1147, 544, 1287, 480, '[{\"x\":\"1147\",\"y\":\"544\"},{\"x\":1171,\"y\":535},{\"x\":1200,\"y\":530},{\"x\":1219,\"y\":521},{\"x\":1249,\"y\":498},{\"x\":1287,\"y\":480}]', 156),
(105, 1287, 480, 1357, 428, '[{\"x\":\"1287\",\"y\":\"480\"},{\"x\":1309,\"y\":466},{\"x\":1357,\"y\":428}]', 87),
(106, 1357, 428, 1585, 424, '[{\"x\":\"1357\",\"y\":\"428\"},{\"x\":1390,\"y\":388},{\"x\":1455,\"y\":335},{\"x\":1484,\"y\":327},{\"x\":1500,\"y\":327},{\"x\":1520,\"y\":337},{\"x\":1585,\"y\":424}]', 313),
(107, 1585, 424, 1575, 538, '[{\"x\":\"1585\",\"y\":\"424\"},{\"x\":1609,\"y\":470},{\"x\":1608,\"y\":484},{\"x\":1601,\"y\":505},{\"x\":1575,\"y\":538}]', 130),
(108, 1575, 538, 1556, 684, '[{\"x\":\"1575\",\"y\":\"538\"},{\"x\":1551,\"y\":582},{\"x\":1545,\"y\":601},{\"x\":1532,\"y\":615},{\"x\":1508,\"y\":637},{\"x\":1500,\"y\":668},{\"x\":1556,\"y\":684}]', 212),
(109, 1556, 684, 1603, 718, '[{\"x\":\"1556\",\"y\":\"684\"},{\"x\":1576,\"y\":706},{\"x\":1586,\"y\":712},{\"x\":1594,\"y\":711},{\"x\":\"1603\",\"y\":\"718\"}]', 61),
(110, 1603, 718, 1482, 788, '[{\"x\":\"1603\",\"y\":\"718\"},{\"x\":1562,\"y\":754},{\"x\":1513,\"y\":780},{\"x\":1482,\"y\":788}]', 142),
(111, 1482, 788, 1294, 830, '[{\"x\":\"1482\",\"y\":\"788\"},{\"x\":1377,\"y\":810},{\"x\":1354,\"y\":821},{\"x\":1344,\"y\":835},{\"x\":1327,\"y\":837},{\"x\":1294,\"y\":830}]', 201),
(112, 1294, 830, 1221, 778, '[{\"x\":\"1294\",\"y\":\"830\"},{\"x\":1270,\"y\":822},{\"x\":1258,\"y\":811},{\"x\":1233,\"y\":783},{\"x\":1221,\"y\":778}]', 92),
(113, 1221, 778, 1163, 776, '[{\"x\":\"1221\",\"y\":\"778\"},{\"x\":1208,\"y\":773},{\"x\":1184,\"y\":771},{\"x\":1163,\"y\":776}]', 60),
(114, 1163, 776, 1137, 815, '[{\"x\":\"1163\",\"y\":\"776\"},{\"x\":1136,\"y\":793},{\"x\":1137,\"y\":815}]', 54),
(115, 1137, 815, 1134, 835, '[{\"x\":\"1137\",\"y\":\"815\"},{\"x\":\"1134\",\"y\":\"835\"}]', 20),
(116, 844, 930, 1136, 859, '[{\"x\":\"844\",\"y\":\"930\"},{\"x\":897,\"y\":953},{\"x\":910,\"y\":957},{\"x\":915,\"y\":944},{\"x\":929,\"y\":949},{\"x\":933,\"y\":937},{\"x\":948,\"y\":940},{\"x\":952,\"y\":929},{\"x\":967,\"y\":934},{\"x\":971,\"y\":921},{\"x\":986,\"y\":926},{\"x\":989,\"y\":912},{\"x\":1004,\"y\":917},{\"x\":1008,\"y\":904},{\"x\":1023,\"y\":910},{\"x\":1027,\"y\":897},{\"x\":1042,\"y\":901},{\"x\":1046,\"y\":888},{\"x\":1060,\"y\":892},{\"x\":1065,\"y\":880},{\"x\":1079,\"y\":885},{\"x\":1083,\"y\":873},{\"x\":1096,\"y\":878},{\"x\":1098,\"y\":876},{\"x\":1102,\"y\":865},{\"x\":1115,\"y\":869},{\"x\":1120,\"y\":856},{\"x\":1129,\"y\":859},{\"x\":\"1136\",\"y\":\"859\"}]', 415);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_service` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `NOM`, `PRENOM`, `DATE`, `PSEUDO`, `MAIL`, `MDP`, `NL`, `PP`, `role`) VALUES
(15, 'zinvzs', 'visevnis', '20/02/2004', 'TEST', 'test@gmail.com', '$2y$10$n/QVm5cdToqdvuBYFKULn.K94jfW4ryOaACD.axjmU2.lEdm4/IGq', 0, 1, 'user'),
(17, 'MORATILLE', 'Marco', '20/02/2004', 'Caco', 'caco83100@gmail.com', '$2y$10$H9isn41WONtN6GKWv1VLZOPg8zyXFo4z6bXC6s8FAVlxQWMOWMtFu', 1, 1, 'admin'),
(18, 'RIBERO', 'Lucie', '00/00/0000', 'Lulu', 'lulu@gmail.com', '$2y$10$aypus.M43KUugd49C3uRYOohBc501xsmBCrAB0VIT7PBQ1WJhillW', 0, 1, 'admin');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
