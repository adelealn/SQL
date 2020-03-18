CREATE DATABASE tp2

CREATE TABLE `langue` (
  `id_langue` int NOT NULL AUTO_INCREMENT,
  `nom_langue` varchar(45) NOT NULL,
  PRIMARY KEY (`id_langue`),
  UNIQUE KEY `id_langue_UNIQUE` (`id_langue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `langue_parlee` (
  `id_langue` int NOT NULL,
  `id_pays` int NOT NULL,
  KEY `id_langue_idx` (`id_langue`),
  KEY `id_pays_idx` (`id_pays`),
  CONSTRAINT `fk_langueparlee_langue` FOREIGN KEY (`id_langue`) REFERENCES `langue` (`id_langue`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_langueparlee_pays` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ville` (
  `id_ville` int NOT NULL AUTO_INCREMENT,
  `nom_ville` varchar(45) DEFAULT NULL,
  `id_pays` int DEFAULT NULL,
  PRIMARY KEY (`id_ville`),
  UNIQUE KEY `id_ville_UNIQUE` (`id_ville`),
  KEY `id_pays_idx` (`id_pays`),
  CONSTRAINT `fk_ville_pays` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pays` (
  `id_pays` int NOT NULL AUTO_INCREMENT,
  `nom_pays` varchar(45) NOT NULL,
  PRIMARY KEY (`id_pays`),
  UNIQUE KEY `id_pays_UNIQUE` (`id_pays`),
  UNIQUE KEY `nom_pays_UNIQUE` (`nom_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

SELECT nom_pays FROM pays 
	INNER JOIN langue_parlee ON pays.id_pays = langue_parlee.id_pays
    LEFT JOIN langue ON langue_parlee.id_langue = langue.id_langue
    WHERE langue.nom_langue = "anglais";
    
