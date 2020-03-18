CREATE DATABASE tp3

CREATE TABLE `article` (
  `id_article` int NOT NULL AUTO_INCREMENT,
  `titre_article` varchar(100) NOT NULL,
  `contenu_article` longtext,
  `id_auteur` int DEFAULT NULL,
  PRIMARY KEY (`id_article`),
  UNIQUE KEY `id_article_UNIQUE` (`id_article`),
  KEY `fk_article_utilisateur_idx` (`id_auteur`),
  CONSTRAINT `fk_article_utilisateur` FOREIGN KEY (`id_auteur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `article_a_commentaire` (
  `id_article` int NOT NULL,
  `id_commentaire` int NOT NULL,
  KEY `fk_articleacommentaire_article_idx` (`id_article`),
  KEY `fk_articleacommentaire_commentaire_idx` (`id_commentaire`),
  CONSTRAINT `fk_articleacommentaire_article` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_articleacommentaire_commentaire` FOREIGN KEY (`id_commentaire`) REFERENCES `commentaire` (`id_commentaire`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `article_a_tag` (
  `id_tag` int NOT NULL,
  `id_article` int NOT NULL,
  KEY `fk_articleatag_article_idx` (`id_article`),
  KEY `fk_articleatag_tag_idx` (`id_tag`),
  CONSTRAINT `fk_articleatag_article` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_articleatag_tag` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id_tag`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `commentaire` (
  `id_commentaire` int NOT NULL AUTO_INCREMENT,
  `contenu_commentaire` mediumtext,
  `id_auteur` int DEFAULT NULL,
  `id_salon` int DEFAULT NULL,
  PRIMARY KEY (`id_commentaire`),
  UNIQUE KEY `id_commentaire_UNIQUE` (`id_commentaire`),
  KEY `fk_commentaire_utilisateur_idx` (`id_auteur`),
  KEY `fk_commentaire_salon_idx` (`id_salon`),
  CONSTRAINT `fk_commentaire_salon` FOREIGN KEY (`id_salon`) REFERENCES `salon` (`id_salon`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_commentaire_utilisateur` FOREIGN KEY (`id_auteur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salon` (
  `id_salon` int NOT NULL AUTO_INCREMENT,
  `nom_salon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_salon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tag` (
  `id_tag` int NOT NULL AUTO_INCREMENT,
  `nom_tag` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `utilisateur` (
  `id_utilisateur` int NOT NULL AUTO_INCREMENT,
  `pseudo_utilisateur` varchar(45) NOT NULL,
  `email_utilisateur` varchar(45) NOT NULL,
  PRIMARY KEY (`id_utilisateur`),
  UNIQUE KEY `id_utilisateur_UNIQUE` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

