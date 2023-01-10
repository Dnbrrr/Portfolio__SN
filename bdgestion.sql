-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mar 10 Janvier 2023 à 14:26
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `bdgestion_des_commandes`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `num_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(20) NOT NULL,
  `cat_reference` int(11) NOT NULL,
  `cat_remise` int(11) NOT NULL,
  PRIMARY KEY (`num_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`num_categorie`, `nom_categorie`, `cat_reference`, `cat_remise`) VALUES
(123456666, 'Réalité Virtuelle', 12345, 20),
(123456777, 'Audio', 1234, 5),
(123456788, 'Informatique', 122, 10),
(123456789, 'Vidéo', 123, 15);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `client_id` int(11) NOT NULL,
  `client_civilite` varchar(2) NOT NULL,
  `client_nom` varchar(20) NOT NULL,
  `client_prenom` varchar(20) NOT NULL,
  `client_dep` int(11) NOT NULL,
  `client_ville` varchar(20) NOT NULL,
  `client_tel` int(11) NOT NULL,
  `com_num` int(11) NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `com_num` (`com_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`client_id`, `client_civilite`, `client_nom`, `client_prenom`, `client_dep`, `client_ville`, `client_tel`, `com_num`) VALUES
(248687, 'F', 'GERARD', 'MARGAUX', 44240, 'NANTES', 645374756, 834576),
(345678, 'F', 'LIOU', 'MATHILDE', 75018, 'PARIS', 756789876, 5799587),
(8342576, 'M', 'MARTIN', 'PAUL', 75017, 'PARIS', 776158237, 3827546),
(8437256, 'M', 'AUDITORE', 'EZIO', 13015, 'MARSEILLE', 765453423, 3874562);

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE IF NOT EXISTS `commandes` (
  `com_num` int(11) NOT NULL,
  `com_client` varchar(30) NOT NULL,
  `com_date` date NOT NULL,
  `com_montant` int(11) NOT NULL,
  `produit_ref` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`com_num`),
  KEY `produit_ref` (`produit_ref`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`com_num`, `com_client`, `com_date`, `com_montant`, `produit_ref`, `client_id`) VALUES
(834576, 'Enceinte', '2019-04-23', 300, 7348526, 8437256),
(3827546, 'Casque Vr', '2021-11-17', 500, 83962378, 8342576),
(3874562, 'Ordi', '2019-04-23', 1700, 5467435, 345678),
(5799587, 'Télévision', '2023-01-02', 600, 456756, 248687);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE IF NOT EXISTS `produits` (
  `produit_ref` int(11) NOT NULL,
  `produit_nom` varchar(20) NOT NULL,
  `produit_prix` float NOT NULL,
  `produit_poids` float NOT NULL,
  `produit_vues` int(11) NOT NULL,
  `produit_stock` int(11) NOT NULL,
  `produit_code` int(11) NOT NULL,
  `num_categorie` int(11) NOT NULL,
  PRIMARY KEY (`produit_ref`),
  KEY `num_categorie` (`num_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produits`
--

INSERT INTO `produits` (`produit_ref`, `produit_nom`, `produit_prix`, `produit_poids`, `produit_vues`, `produit_stock`, `produit_code`, `num_categorie`) VALUES
(456756, 'Television', 600, 14, 4000, 150, 987654321, 123456789),
(5467435, 'Oridnateur Gaming', 1700, 2, 3000, 160, 2147483647, 123456788),
(7348526, 'Enceinte', 300, 10, 6770, 532, 987654433, 123456777),
(83962378, 'Casque VR', 500, 1, 4289, 345, 98765555, 123456666);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`produit_ref`) REFERENCES `produits` (`produit_ref`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`num_categorie`) REFERENCES `categorie` (`num_categorie`) ON DELETE CASCADE ON UPDATE CASCADE;
