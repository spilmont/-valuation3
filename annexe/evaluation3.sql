-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 08 avr. 2019 à 16:37
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `evaluation3`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `title`, `description`, `date`, `image`, `contenu`) VALUES
(1, 'Cartman vs Bart', 'Quelle est le plus cancre', '04/04/2019 à 07:45:59', 'https://vignette.wikia.nocookie.net/deathbattlefanon/images/3/3e/Eric_Cartman_vs_Bart_Simpson.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices eu ante id tempor. Vestibulum sem quam, ultrices sit amet orci id, cursus vestibulum sapien. Curabitur condimentum lorem a leo tempor elementum. Vestibulum ut fringilla velit. Duis elementum eu nulla a efficitur. Morbi eu justo in dui porttitor cursus vel a magna. Nulla convallis libero varius nulla eleifend, sed ullamcorper erat ornare. Donec sagittis ipsum ut magna lobortis tincidunt vestibulum id risus. Sed convallis sapien ipsum, id aliquam lectus bibendum non. Donec vel erat nec nunc lobortis dignissim eget semper lacus. Suspendisse ac odio consectetur, ornare est eu, vehicula tortor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris iaculis mattis aliquam. Ut sed aliquet leo, eu rhoncus ex.'),
(2, 'Coca vs Pepsi', 'Quelle est votre préferé?', '04/04/2019 à 08:46:44', 'https://www.newsmax.com/Newsmax/files/99/99072f51-cead-4f82-bda0-dcef2911d45d.jpg', 'Phasellus nibh ante, facilisis ut volutpat sed, placerat vitae libero. Nulla malesuada nisi eu ligula pellentesque, ut finibus velit suscipit. Quisque augue tellus, tincidunt mollis velit ac, pharetra accumsan dolor. Cras aliquam et metus ut iaculis. Mauris ultricies sagittis interdum. Vivamus id risus tempor augue malesuada gravida. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce pulvinar dui in lacus luctus elementum. In sit amet est eu libero eleifend tincidunt. Suspendisse quis urna velit. Vestibulum dignissim quam et eleifend lacinia. Sed placerat nunc lacus, in sagittis leo dictum id. Morbi ultrices quam nisi, ut laoreet nunc auctor a. Sed molestie ipsum nec odio sodales, sit amet dignissim ex dignissim.'),
(3, 'Fredy vs halloween', 'quelle est votre films horreur préfèré', '04/04/2019 à 14:00:20', 'https://i.ytimg.com/vi/OWxy8a8YboE/hqdefault.jpg', 'Curabitur maximus lacus nec justo fermentum, eu ornare nibh efficitur. Aliquam vehicula orci faucibus diam sagittis, nec tristique est ultricies. Ut eleifend lacus ac arcu varius facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam gravida elit at elit tempus luctus. Nunc nec ornare tortor. Nulla viverra, eros eu vulputate posuere, nisi purus volutpat arcu, et pulvinar dui mauris quis sapien. Curabitur sit amet lorem eu justo viverra mollis.');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `article_id`, `comment`, `date`) VALUES
(1, 1, 1, 'Cool CARTMAN', '04/04/2019 à 07:47:27'),
(3, 2, 2, 'coca', '04/04/2019 à 10:12:42'),
(4, 1, 2, 'pepsi', '04/04/2019 à 10:13:04'),
(5, 1, 1, 'ggg', '05/04/2019 à 08:25:51'),
(9, 1, 2, 'david', '08/04/2019 à 11:25:41'),
(11, 2, 2, 'kjhjhjh', '08/04/2019 à 13:38:36');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190404073229', '2019-04-04 07:32:46');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `id_role`) VALUES
(1, 'onatouvus', 'spilmont', 'fake@email.fr', 1),
(2, 'almalrich', 'bouret', 'gpas@demail.com', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5F9E962AA76ED395` (`user_id`),
  ADD KEY `IDX_5F9E962A7294869C` (`article_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_5F9E962A7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FK_5F9E962AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
