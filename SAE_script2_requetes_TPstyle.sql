-- SAE BD - Script 2 : Requetes SQL (PostgreSQL)
-- Niveau BUT1 (style TP/controle) : SELECT / DISTINCT / INNER JOIN / NATURAL JOIN / USING / GROUP BY / HAVING / ORDER BY / EXCEPT

-- 1) Joueurs + leur equipe (NATURAL JOIN)
SELECT joueur.nom, joueur.prenom, joueur.pseudo, equipe.nomEquipe
FROM esport.joueur NATURAL JOIN esport.equipe;

-- 2) Tournois + organisateur (NATURAL JOIN)
SELECT DISTINCT tournoi.nomTournoi, tournoi.jeu, organisateur.nom, organisateur.prenom
FROM esport.tournoi NATURAL JOIN esport.organisateur;

-- 3) Nombre total d'inscriptions par tournoi (GROUP BY + COUNT)
SELECT tournoi.nomTournoi, COUNT(*)
FROM esport.tournoi NATURAL JOIN esport.inscription
GROUP BY tournoi.nomTournoi;

-- 4) Equipes qui ont fait au moins 2 demandes d'inscription (GROUP BY + HAVING)
SELECT equipe.nomEquipe, COUNT(*)
FROM esport.equipe NATURAL JOIN esport.inscription
GROUP BY equipe.nomEquipe
HAVING COUNT(*) >= 2;

-- 5) Equipes qui n'ont AUCUNE inscription VALIDEE (EXCEPT)
SELECT idEquipe, nomEquipe
FROM esport.equipe
EXCEPT
SELECT equipe.idEquipe, equipe.nomEquipe
FROM esport.equipe INNER JOIN esport.inscription ON equipe.idEquipe = inscription.idEquipe
WHERE inscription.statut = 'VALIDEE';

-- 6) Matchs qui ont un resultat (match + tournoi + scores) (INNER JOIN USING)
SELECT tournoi.nomTournoi, matchTournoi.idMatch, resultat.scoreEquipe1, resultat.scoreEquipe2
FROM esport.matchTournoi
         INNER JOIN esport.resultat USING(idMatch)
         INNER JOIN esport.tournoi USING(idTournoi);

-- 7) Arbitres : combien de resultats saisis (GROUP BY + COUNT)
SELECT arbitre.idArbitre, arbitre.nom, arbitre.prenom, COUNT(*)
FROM esport.arbitre INNER JOIN esport.resultat USING(idArbitre)
GROUP BY arbitre.idArbitre, arbitre.nom, arbitre.prenom;

-- 8) Tournois qui ont au moins un match ANNULE (INNER JOIN ON)
SELECT tournoi.nomTournoi
FROM esport.tournoi INNER JOIN esport.matchTournoi ON tournoi.idTournoi = matchTournoi.idTournoi
WHERE matchTournoi.statutMatch = 'ANNULE';

-- 9) Liste des equipes qui ont joue au moins un match (JOUE) (UNION)
SELECT idEquipe1
FROM esport.matchTournoi
WHERE statutMatch = 'JOUE'
UNION
SELECT idEquipe2
FROM esport.matchTournoi
WHERE statutMatch = 'JOUE';

-- 10) Liste des equipes qui ont marqué plus de 5 buts dans un match
SELECT equipe.idEquipe, equipe.nomEquipe
FROM esport.equipe INNER JOIN esport.matchTournoi ON equipe.idEquipe = matchTournoi.idEquipe1
INNER JOIN esport.resultat USING(idMatch) WHERE resultat.scoreEquipe1 > 5

UNION

SELECT equipe.idEquipe, equipe.nomEquipe
FROM esport.equipe INNER JOIN esport.matchTournoi ON equipe.idEquipe = matchTournoi.idEquipe2
INNER JOIN esport.resultat USING(idMatch) WHERE resultat.scoreEquipe2 > 5;


