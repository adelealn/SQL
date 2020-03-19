#Q1
#SELECT ticket.NUMERO_TICKET FROM ticket INNER JOIN ventes ON ventes.NUMERO_TICKET = ticket.NUMERO_TICKET WHERE ID_ARTICLE=500;
#Q2
#SELECT * FROM ticket WHERE DATE_VENTE = "2014/01/15";
#Q3
#SELECT * FROM ticket WHERE DATE_VENTE = "2014/01/15" OR DATE_VENTE ="2014/01/17";
#Q4
#SELECT article.ID_ARTICLE, article.NOM_ARTICLE, ventes.QUANTITE FROM article INNER JOIN ventes ON ventes.ID_ARTICLE = article.ID_ARTICLE WHERE QUANTITE>=50;
#Q5
#SELECT * FROM ticket WHERE DATE_VENTE BETWEEN "2014/03/01" AND "2014/03/31";
#Q6
#SELECT * FROM ticket WHERE DATE_VENTE BETWEEN "2014/03/01" AND "2014/04/30";
#Q7
#SELECT * FROM ticket WHERE ( DATE_VENTE BETWEEN "2014/03/01" AND "2014/03/31" ) OR (DATE_VENTE BETWEEN "2014/06/01" AND "2014/06/30");
#Q8
#SELECT ID_ARTICLE, NOM_ARTICLE, NOM_COULEUR FROM article INNER JOIN couleur ON couleur.ID_COULEUR=article.ID_COULEUR ORDER BY NOM_COULEUR;
#Q9
#SELECT ID_ARTICLE, NOM_ARTICLE FROM article WHERE ID_COULEUR IS NULL;
#Q10
#SELECT SUM(QUANTITE) as total FROM ventes GROUP BY NUMERO_TICKET order by total desc;
#Q11
#SELECT ticket.ANNEE, ticket.NUMERO_TICKET, ticket.DATE_VENTE, SUM(QUANTITE) as TOTAL FROM ticket INNER JOIN ventes ON ticket.NUMERO_TICKET=ventes.NUMERO_TICKET AND ticket.ANNEE=ventes.ANNEE GROUP BY ticket.NUMERO_TICKET HAVING TOTAL>500 ORDER BY TOTAL DESC;
#Q12
#SELECT ticket.ANNEE, ticket.NUMERO_TICKET, ticket.DATE_VENTE, SUM(QUANTITE) as TOTAL FROM ticket INNER JOIN ventes ON ticket.NUMERO_TICKET=ventes.NUMERO_TICKET AND ticket.ANNEE=ventes.ANNEE WHERE QUANTITE<=50 GROUP BY ticket.NUMERO_TICKET HAVING TOTAL>500 ORDER BY TOTAL DESC;
#Q13
#SELECT ID_ARTICLE, NOM_ARTICLE, VOLUME, TITRAGE FROM article INNER JOIN type ON article.ID_TYPE = type.ID_TYPE WHERE NOM_TYPE="Trappiste";
#Q14
#SELECT * FROM marque INNER JOIN pays ON marque.ID_PAYS = pays.ID_pays INNER JOIN continent ON pays.ID_CONTINENT = continent.ID_CONTINENT WHERE NOM_CONTINENT = "Afrique";
#Q15
#SELECT ID_ARTICLE, NOM_ARTICLE, VOLUME, TITRAGE, NOM_MARQUE, NOM_PAYS FROM article INNER JOIN marque ON article.ID_MARQUE = marque.ID_MARQUE INNER JOIN pays ON marque.ID_PAYS = pays.ID_pays INNER JOIN continent ON pays.ID_CONTINENT = continent.ID_CONTINENT WHERE NOM_CONTINENT = "Afrique";
#Q16
#SELECT ANNEE, NUMERO_TICKET, SUM(QUANTITE*(PRIX_ACHAT+0.15*Prix_ACHAT)) AS MONTANT_TOTAL FROM ventes INNER JOIN article ON ventes.ID_ARTICLE = article.ID_ARTICLE GROUP BY NUMERO_TICKET, ANNEE;
#Q17
#SELECT ventes.ANNEE, marque.NOM_MARQUE, SUM(QUANTITE*(PRIX_ACHAT+0.15*Prix_ACHAT)) AS CHIFFRE_AFFAIRE FROM ventes INNER JOIN article ON ventes.ID_ARTICLE = article.ID_ARTICLE INNER JOIN marque ON article.ID_MARQUE = marque.ID_MARQUE GROUP BY NOM_MARQUE, ANNEE;
#Q18
#SELECT NOM_ARTICLE, SUM(QUANTITE) AS QUANTITE_TOTALE FROM ventes INNER JOIN article ON ventes.ID_ARTICLE = article.ID_ARTICLE WHERE ANNEE = 2016 GROUP BY article.ID_ARTICLE; 
#Q19
#SELECT NOM_ARTICLE, SUM(QUANTITE) AS QUANTITE_TOTALE FROM ventes INNER JOIN article ON ventes.ID_ARTICLE = article.ID_ARTICLE WHERE ANNEE = 2016 OR ANNEE = 2015 OR ANNEE = 2014 GROUP BY article.ID_ARTICLE; 
#Q20
#SELECT ID_ARTICLE, NOM_ARTICLE, VOLUME, TITRAGE FROM article WHERE ID_ARTICLE NOT IN (SELECT ID_ARTICLE FROM ventes WHERE ANNEE = 2014);
#Q21
#SELECT NOM_PAYS FROM pays INNER JOIN marque ON pays.ID_PAYS = marque.ID_PAYS INNER JOIN article ON marque.ID_MARQUE = article.ID_MARQUE INNER JOIN type ON article.ID_TYPE = type.ID_TYPE WHERE NOM_TYPE = "Trappiste" GROUP BY NOM_PAYS;
#SELECT NOM_PAYS FROM pays WHERE ID_PAYS IN (SELECT ID_PAYS FROM marque INNER JOIN article ON marque.ID_MARQUE = article.ID_MARQUE INNER JOIN type ON article.ID_TYPE = type.ID_TYPE WHERE NOM_TYPE = "Trappiste");
#Q22
#SELECT ticket.NUMERO_TICKET, ticket.ANNEE FROM ticket INNER JOIN ventes ON ticket.NUMERO_TICKET = ventes.NUMERO_TICKET AND ticket.ANNEE = ventes.ANNEE 
#	WHERE ID_ARTICLE IN ( SELECT ID_ARTICLE FROM ventes INNER JOIN ticket ON ventes.NUMERO_TICKET = ticket.NUMERO_TICKET AND ventes.ANNEE = ticket.ANNEE WHERE ticket.NUMERO_TICKET = 856 AND ticket.ANNEE = 2014 );
#Q23
#SELECT ID_ARTICLE, NOM_ARTICLE, TITRAGE FROM article WHERE TITRAGE > (SELECT MAX(TITRAGE) FROM article INNER JOIN type ON article.ID_TYPE = type.ID_TYPE WHERE NOM_TYPE= "Trappiste");
#Q24
SELECT NOM_COULEUR, SUM(ventes.QUANTITE) AS SOMME_QUANTITE FROM ventes INNER JOIN article using (ID_ARTICLE) INNER JOIN couleur using (ID_COULEUR) WHERE ventes.ANNEE = 2014 GROUP BY NOM_COULEUR;
