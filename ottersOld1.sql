-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 15 nov. 2024 à 08:42
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
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` text,
  `enclos` int DEFAULT NULL,
  `biome` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `animaux`
--

INSERT INTO `animaux` (`id`, `nom`, `enclos`, `biome`) VALUES
(1, 'Les Guépards', 1, 'Le Belvédère'),
(2, 'Les Gazelles', 2, 'Le Belvédère'),
(3, 'Les Autruches', 2, 'Le Belvédère'),
(4, 'Les Gnous', 3, 'Le Belvédère'),
(5, 'Les Oryx Beisa', 3, 'Le Belvédère'),
(6, 'Les Rhinocéross', 3, 'Le Belvédère'),
(7, 'Les Suricates', 4, 'Le Belvédère'),
(8, 'Les Fennecs', 5, 'Le Belvédère'),
(9, 'Les Coatis', 6, 'Le Belvédère'),
(10, 'Les Saïmiris', 6, 'Le Belvédère'),
(11, 'Les Tapirs', 7, 'Le Belvédère'),
(12, 'Les Casoars', 8, 'Le Belvédère'),
(13, 'Les Crocodiles nains', 9, 'Le Belvédère'),
(14, 'Les Pythons', 1, 'La bergerie des reptiles'),
(15, 'Les Tortues', 1, 'La bergerie des reptiles'),
(16, 'Les Iguanes', 1, 'La bergerie des reptiles'),
(17, 'Les Aras', 1, 'Le Vallon des Cascades'),
(18, 'Les Grands Hoccos', 2, 'Le Vallon des Cascades'),
(19, 'Les Panthères', 3, 'Le Vallon des Cascades'),
(20, 'Les Pandas Roux', 4, 'Le Vallon des Cascades'),
(21, 'Les Lémuriens', 5, 'Le Vallon des Cascades'),
(22, 'Les Tortues', 6, 'Le Vallon des Cascades'),
(23, 'Les Mouflons', 7, 'Le Vallon des Cascades'),
(24, 'Les Binturongs', 8, 'Le Vallon des Cascades'),
(25, 'Les Loutres', 8, 'Le Vallon des Cascades'),
(26, 'Les Cerfs', 1, 'Le Bois des pins'),
(27, 'Les Macaques crabier', 2, 'Le Bois des pins'),
(28, 'Les Vautours', 3, 'Le Bois des pins'),
(29, 'Les Loups d\'Europe', 4, 'Le Bois des pins'),
(30, 'Les Daims', 5, 'Le Bois des pins'),
(31, 'Les Antilopes', 5, 'Le Bois des pins'),
(32, 'Les Nilgauts', 5, 'Le Bois des pins'),
(33, 'Les Marabouts', 1, 'Les Clairières'),
(34, 'Les Cigognes', 1, 'Les Clairières'),
(35, 'Les Oryx Algazelle', 2, 'Les Clairières'),
(36, 'Les Watusi', 2, 'Les Clairières'),
(37, 'Les Âne de Somalie', 2, 'Les Clairières'),
(38, 'Les Yacks', 3, 'Les Clairières'),
(39, 'Les Moutons noir', 3, 'Les Clairières'),
(40, 'Les Ibis', 4, 'Les Clairières'),
(41, 'Les Tortues', 4, 'Les Clairières'),
(42, 'Les Pécaris', 5, 'Les Clairières'),
(43, 'Les Tamanoirs', 6, 'Les Clairières'),
(44, 'Les Flamants roses', 6, 'Les Clairières'),
(45, 'Les Nandous', 6, 'Les Clairières'),
(46, 'Les Émeux', 7, 'Les Clairières'),
(47, 'Les Wallaby', 7, 'Les Clairières'),
(48, 'Les Porcs-épics', 8, 'Les Clairières'),
(49, 'Les Bisons', 9, 'Les Clairières'),
(50, 'Les Ânes de Provence', 10, 'Les Clairières'),
(51, 'Les Dromadaires', 10, 'Les Clairières'),
(52, 'Les Lynx', 11, 'Les Clairières'),
(53, 'Les Servals', 12, 'Les Clairières'),
(54, 'Les Chiens des buissons', 13, 'Les Clairières'),
(55, 'Les Tigres', 14, 'Les Clairières'),
(56, 'Les Lions', 1, 'Le Plateau'),
(57, 'Les Hippopotames', 2, 'Le Plateau'),
(58, 'Les Zèbres', 3, 'Le Plateau'),
(59, 'Les Hyènes', 4, 'Le Plateau'),
(60, 'Les Loups à crinière', 5, 'Le Plateau'),
(61, 'Les Girafes', 6, 'Le Plateau'),
(62, 'Les Grivets Cercopithèques', 7, 'Le Plateau'),
(63, 'Les Varans de Komodo', 8, 'Le Plateau'),
(64, 'Les Éléphants', 9, 'Le Plateau'),
(65, 'Les Tamarins', 10, 'Le Plateau'),
(66, 'Les Capucins', 11, 'Le Plateau'),
(67, 'Les Ouistitis', 12, 'Le Plateau'),
(68, 'Les Gibbons', 13, 'Le Plateau');

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
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`Id`, `NOM`, `PRENOM`, `DATE`, `PSEUDO`, `MAIL`, `MDP`, `NL`) VALUES
(9, 'Aran', 'Samus', '18/11/1928', 'damus', 'sam@federation.com', 'metro1de', 1),
(10, 'Mouse', 'Mickey', '18/11/1928', 'Miska', 'mickey.mouse@gmail.com', 'sjfozef78', 0),
(11, 'Maccari', 'Loic', '2003', 'Merlu', 'merlu@gmail.com', '1234', 0),
(12, 'Admin', ' ', '13/11/2024', 'admin', 'admin@gmail.com', 'adm1n', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
