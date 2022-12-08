-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 08 Décembre 2022 à 15:16
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `location_voitre`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `code_client` varchar(2) NOT NULL,
  `nom_prenom` varchar(20) NOT NULL,
  `date_naissance` date NOT NULL,
  `adresse` text NOT NULL,
  `ville` varchar(10) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `date_permis` date NOT NULL,
  `code_postale` int(5) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`code_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`code_client`, `nom_prenom`, `date_naissance`, `adresse`, `ville`, `telephone`, `date_permis`, `code_postale`, `email`) VALUES
('10', 'Remy Lap', '1980-10-10', '2 Allée Jean - Renard', 'Paris', '0606060606', '2022-12-06', 75005, 'Remylap@outlook.fr'),
('11', 'Jean-Ties', '1960-11-11', '5 Avenue grand charles', 'Paris ', '0607070707', '2016-12-06', 75006, 'Jeanties@hotmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id_location` int(11) NOT NULL AUTO_INCREMENT,
  `date_location` date NOT NULL,
  `duree` int(11) NOT NULL,
  `code_client` varchar(10) NOT NULL,
  `immatriculation` varchar(20) NOT NULL,
  `prix_jour` int(11) NOT NULL,
  PRIMARY KEY (`id_location`),
  KEY `code_client` (`code_client`,`immatriculation`),
  KEY `immatriculation` (`immatriculation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `locations`
--

INSERT INTO `locations` (`id_location`, `date_location`, `duree`, `code_client`, `immatriculation`, `prix_jour`) VALUES
(10, '2020-10-10', 5, '10', '16 FV 2965', 75),
(11, '2020-10-11', 4, '11', '16 FV 2965', 75);

-- --------------------------------------------------------

--
-- Structure de la table `reparations`
--

CREATE TABLE IF NOT EXISTS `reparations` (
  `num_reparation` int(11) NOT NULL,
  `date_reparation` date NOT NULL,
  `duree_reparation` varchar(100) NOT NULL,
  `cout_reparation` varchar(255) NOT NULL,
  `responsable_rep` varchar(255) NOT NULL,
  `immatriculation` varchar(255) NOT NULL,
  KEY `immatriculation` (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `reparations`
--


-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

CREATE TABLE IF NOT EXISTS `voiture` (
  `immatriculation` varchar(20) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `couleur` varchar(10) NOT NULL,
  `année_circulation` date NOT NULL,
  `marque` varchar(10) NOT NULL,
  `modèle` int(10) NOT NULL,
  PRIMARY KEY (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `voiture`
--

INSERT INTO `voiture` (`immatriculation`, `kilometrage`, `couleur`, `année_circulation`, `marque`, `modèle`) VALUES
('12 VP 500X', 2500, 'Rouge', '2011-10-10', 'Mercedes-B', 0),
('16 FV 2965', 80251, 'Gris', '2008-10-10', 'Audi', 0);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`immatriculation`) REFERENCES `voiture` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`code_client`) REFERENCES `clients` (`code_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reparations`
--
ALTER TABLE `reparations`
  ADD CONSTRAINT `reparations_ibfk_1` FOREIGN KEY (`immatriculation`) REFERENCES `voiture` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE;
