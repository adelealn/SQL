SELECT nom_pays FROM pays 
	INNER JOIN langue_parlee ON pays.id_pays = langue_parlee.id_pays
    LEFT JOIN langue ON langue_parlee.id_langue = langue.id_langue
    WHERE langue.nom_langue = "anglais";
    