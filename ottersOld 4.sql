-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 09 déc. 2024 à 13:03
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
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`Id`, `NOM`, `PRENOM`, `DATE`, `PSEUDO`, `MAIL`, `MDP`, `NL`, `PP`) VALUES
(9, 'Aran', 'Samus', '18/11/1928', 'damus', 'sam@federation.com', 'metro1de', 1, 1),
(10, 'Mouse', 'Mickey', '18/11/1928', 'Miska', 'mickey.mouse@gmail.com', 'sjfozef78', 0, 1),
(11, 'Maccari', 'Loic', '2003', 'Merlu', 'merlu@gmail.com', '1234', 0, 1),
(12, 'Admin', ' ', '13/11/2024', 'admin', 'admin@gmail.com', 'adm1n', 0, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
