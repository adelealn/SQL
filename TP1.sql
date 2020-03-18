CREATE TABLE `visite` (
  `id_visiteur` int NOT NULL AUTO_INCREMENT,
  `adresse_ip` varchar(45) NOT NULL,
  `date_premiere_visite` date DEFAULT NULL,
  `date_derniere_visite` date DEFAULT NULL,
  `nombre_visite` int DEFAULT NULL,
  PRIMARY KEY (`id_visiteur`),
  UNIQUE KEY `id_visiteur_UNIQUE` (`id_visiteur`),
  UNIQUE KEY `adresse_ip_UNIQUE` (`adresse_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


SELECT sum(nombre_visite) FROM visite;

