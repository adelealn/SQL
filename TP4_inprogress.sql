CREATE DATABASE ecommerce

CREATE TABLE `utilisateur` (
  `id_utilisateur` int NOT NULL AUTO_INCREMENT,
  `email_utilisateur` varchar(250) NOT NULL,
  `password_utilisateur` varchar(500) NOT NULL,
  `id_historique` INT,
  PRIMARY KEY (`id_utilisateur`),
  UNIQUE KEY `id_utilisateur_UNIQUE` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `historique_achat` (
  `id_historique` int NOT NULL AUTO_INCREMENT,
  `id_panier` int NOT NULL,
  PRIMARY KEY (`id_historique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `panier` (
  `id_panier` int NOT NULL,
  `montant_panier` int DEFAULT NULL,
  `id_produit` int DEFAULT NULL,
  `quantite` int DEFAULT NULL,
  PRIMARY KEY (`id_panier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
