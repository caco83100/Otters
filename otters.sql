-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 12 nov. 2024 à 16:16
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `animaux`
--

INSERT INTO `animaux` (`id`, `nom`, `enclos`, `biome`) VALUES
(1, 'Guépard', 1, 'Le Belvédère'),
(2, 'Gazelle', 2, 'Le Belvédère'),
(3, 'Autruche', 2, 'Le Belvédère'),
(4, 'Gnou', 3, 'Le Belvédère'),
(5, 'Oryx Beisa', 3, 'Le Belvédère'),
(6, 'Rhinocéros', 3, 'Le Belvédère'),
(7, 'Suricate', 4, 'Le Belvédère'),
(8, 'Fennec', 5, 'Le Belvédère'),
(9, 'Coati', 6, 'Le Belvédère'),
(10, 'Saïmiri', 6, 'Le Belvédère'),
(11, 'Tapir', 7, 'Le Belvédère'),
(12, 'Cosoar', 8, 'Le Belvédère'),
(13, 'Crocodile nain', 9, 'Le Belvédère');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`Id`, `NOM`, `PRENOM`, `DATE`, `PSEUDO`, `MAIL`, `MDP`, `NL`) VALUES
(9, 'Aran', 'Samus', '18/11/1928', 'damus', 'sam@federation.com', 'metro1de', 1),
(10, 'Mouse', 'Mickey', '18/11/1928', 'Miska', 'mickey.mouse@gmail.com', 'sjfozef78', 0),
(11, 'Maccari', 'Loic', '2003', 'Merlu', 'merlu@gmail.com', '1234', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
