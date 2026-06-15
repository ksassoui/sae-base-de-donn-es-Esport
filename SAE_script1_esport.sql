-- SAE BD - SQL
-- Ali DEMIR, Kelyan SASSOUI, Mathis AURENSAN

DROP SCHEMA IF EXISTS esport CASCADE;
CREATE SCHEMA esport;

CREATE TABLE esport.organisateur (
  idOrganisateur INT,
  nom            VARCHAR(32),
  prenom         VARCHAR(32),
  mail           VARCHAR(64),
  CONSTRAINT pk_organisateur PRIMARY KEY (idOrganisateur)
);

CREATE TABLE esport.arbitre (
  idArbitre INT,
  nom       VARCHAR(32),
  prenom    VARCHAR(32),
  mail      VARCHAR(64),
  CONSTRAINT pk_arbitre PRIMARY KEY (idArbitre)
);

CREATE TABLE esport.equipe (
  idEquipe     INT,
  nomEquipe    VARCHAR(32),
  dateCreation DATE,
  CONSTRAINT pk_equipe PRIMARY KEY (idEquipe)
);

CREATE TABLE esport.joueur (
  idJoueur        INT,
  nom             VARCHAR(32),
  prenom          VARCHAR(32),
  pseudo          VARCHAR(32),
  mail            VARCHAR(64),
  dateInscription DATE,
  idEquipe        INT,
  CONSTRAINT pk_joueur PRIMARY KEY (idJoueur),
  CONSTRAINT fk_joueur_equipe FOREIGN KEY (idEquipe)
    REFERENCES esport.equipe(idEquipe)
);

CREATE TABLE esport.tournoi (
  idTournoi                 INT,
  nomTournoi                VARCHAR(32),
  jeu                       VARCHAR(32),
  dateOuvertureInscriptions DATE,
  dateFermetureInscriptions DATE,
  dateDebut                 DATE,
  dateFin                   DATE,
  nbEquipesMax              INT,
  regles                    VARCHAR,
  idOrganisateur            INT,
  CONSTRAINT pk_tournoi PRIMARY KEY (idTournoi),
  CONSTRAINT fk_tournoi_organisateur FOREIGN KEY (idOrganisateur)
    REFERENCES esport.organisateur(idOrganisateur)
);

CREATE TABLE esport.inscription (
  idEquipe       INT,
  idTournoi      INT,
  dateDemande    DATE,
  statut         VARCHAR(32),
  dateValidation DATE,
  CONSTRAINT pk_inscription PRIMARY KEY (idEquipe, idTournoi),
  CONSTRAINT fk_inscription_equipe FOREIGN KEY (idEquipe)
    REFERENCES esport.equipe(idEquipe),
  CONSTRAINT fk_inscription_tournoi FOREIGN KEY (idTournoi)
    REFERENCES esport.tournoi(idTournoi)
);

CREATE TABLE esport.matchTournoi (
  idMatch     INT,
  idTournoi   INT,
  idEquipe1   INT,
  idEquipe2   INT,
  dateMatch   DATE,
  tour        INT,
  statutMatch VARCHAR(32),
  CONSTRAINT pk_match PRIMARY KEY (idMatch),
  CONSTRAINT fk_match_tournoi FOREIGN KEY (idTournoi)
    REFERENCES esport.tournoi(idTournoi),
  CONSTRAINT fk_match_equipe1 FOREIGN KEY (idEquipe1)
    REFERENCES esport.equipe(idEquipe),
  CONSTRAINT fk_match_equipe2 FOREIGN KEY (idEquipe2)
    REFERENCES esport.equipe(idEquipe)
);

CREATE TABLE esport.resultat (
  idMatch      INT,
  idArbitre    INT,
  scoreEquipe1 INT,
  scoreEquipe2 INT,
  dateSaisie   DATE,
  CONSTRAINT pk_resultat PRIMARY KEY (idMatch),
  CONSTRAINT fk_resultat_match FOREIGN KEY (idMatch)
    REFERENCES esport.matchTournoi(idMatch),
  CONSTRAINT fk_resultat_arbitre FOREIGN KEY (idArbitre)
    REFERENCES esport.arbitre(idArbitre)
);



-- INSERTIONS

INSERT INTO esport.organisateur VALUES (1,'Robert','Lucas','lrobert1@orga.fr');
INSERT INTO esport.organisateur VALUES (2,'Moreau','Ines','imoreau2@orga.fr');
INSERT INTO esport.organisateur VALUES (3,'Roux','Mehdi','mroux3@orga.fr');
INSERT INTO esport.organisateur VALUES (4,'Nguyen','Sara','snguyen4@orga.fr');
INSERT INTO esport.organisateur VALUES (5,'Dupont','Nina','ndupont5@orga.fr');
INSERT INTO esport.organisateur VALUES (6,'Gomes','Adam','agomes6@orga.fr');
INSERT INTO esport.organisateur VALUES (7,'Renaud','Yasmine','yrenaud7@orga.fr');
INSERT INTO esport.organisateur VALUES (8,'Boyer','Hugo','hboyer8@orga.fr');
INSERT INTO esport.organisateur VALUES (9,'Paul','Aya','apaul9@orga.fr');
INSERT INTO esport.organisateur VALUES (10,'Marchand','Noah','nmarchand10@orga.fr');
INSERT INTO esport.organisateur VALUES (11,'Fischer','Lina','lfischer11@orga.fr');
INSERT INTO esport.organisateur VALUES (12,'Chevalier','Rayan','rchevalier12@orga.fr');
INSERT INTO esport.organisateur VALUES (13,'Simon','Maya','msimon13@orga.fr');
INSERT INTO esport.organisateur VALUES (14,'Petit','Tom','tpetit14@orga.fr');
INSERT INTO esport.organisateur VALUES (15,'Leroy','Lola','lleroy15@orga.fr');
INSERT INTO esport.organisateur VALUES (16,'Fournier','Eliot','efournier16@orga.fr');
INSERT INTO esport.organisateur VALUES (17,'Diallo','Zoé','zdiallo17@orga.fr');
INSERT INTO esport.organisateur VALUES (18,'Benali','Yanis','ybenali18@orga.fr');
INSERT INTO esport.organisateur VALUES (19,'Rossi','Jade','jrossi19@orga.fr');
INSERT INTO esport.organisateur VALUES (20,'Lemoine','Mia','mlemoine20@orga.fr');
INSERT INTO esport.organisateur VALUES (21,'Blanc','Nora','nblanc21@orga.fr');
INSERT INTO esport.organisateur VALUES (22,'Giraud','Samy','sgiraud22@orga.fr');
INSERT INTO esport.organisateur VALUES (23,'Perrin','Louna','lperrin23@orga.fr');
INSERT INTO esport.organisateur VALUES (24,'Gallet','Ilyes','igallet24@orga.fr');
INSERT INTO esport.organisateur VALUES (25,'Lambert','Eden','elambert25@orga.fr');
INSERT INTO esport.organisateur VALUES (26,'Mercier','Inaya','imercier26@orga.fr');
INSERT INTO esport.organisateur VALUES (27,'Bernard','Malo','mbernard27@orga.fr');
INSERT INTO esport.organisateur VALUES (28,'Durand','Lya','ldurand28@orga.fr');
INSERT INTO esport.organisateur VALUES (29,'Garcia','Amine','agarcia29@orga.fr');
INSERT INTO esport.organisateur VALUES (30,'Lopez','Haris','hlopez30@orga.fr');

INSERT INTO esport.arbitre VALUES (1,'Leroy','Mehdi','mleroy1@arbitre.fr');
INSERT INTO esport.arbitre VALUES (2,'Lopez','Nina','nlopez2@arbitre.fr');
INSERT INTO esport.arbitre VALUES (3,'Dupont','Yasmine','ydupont3@arbitre.fr');
INSERT INTO esport.arbitre VALUES (4,'Lemoine','Aya','alemoine4@arbitre.fr');
INSERT INTO esport.arbitre VALUES (5,'Thomas','Lina','lthomas5@arbitre.fr');
INSERT INTO esport.arbitre VALUES (6,'Marchand','Maya','mmarchand6@arbitre.fr');
INSERT INTO esport.arbitre VALUES (7,'Lambert','Lola','llambert7@arbitre.fr');
INSERT INTO esport.arbitre VALUES (8,'Martin','Zoé','zmartin8@arbitre.fr');
INSERT INTO esport.arbitre VALUES (9,'Leroy','Jade','jleroy9@arbitre.fr');
INSERT INTO esport.arbitre VALUES (10,'Lopez','Nora','nlopez10@arbitre.fr');
INSERT INTO esport.arbitre VALUES (11,'Dupont','Louna','ldupont11@arbitre.fr');
INSERT INTO esport.arbitre VALUES (12,'Lemoine','Eden','elemoine12@arbitre.fr');
INSERT INTO esport.arbitre VALUES (13,'Thomas','Malo','mthomas13@arbitre.fr');
INSERT INTO esport.arbitre VALUES (14,'Marchand','Amine','amarchand14@arbitre.fr');
INSERT INTO esport.arbitre VALUES (15,'Lambert','Elias','elambert15@arbitre.fr');
INSERT INTO esport.arbitre VALUES (16,'Martin','Salma','smartin16@arbitre.fr');
INSERT INTO esport.arbitre VALUES (17,'Leroy','Kylian','kleroy17@arbitre.fr');
INSERT INTO esport.arbitre VALUES (18,'Lopez','Anis','alopez18@arbitre.fr');
INSERT INTO esport.arbitre VALUES (19,'Dupont','Yassine','ydupont19@arbitre.fr');
INSERT INTO esport.arbitre VALUES (20,'Lemoine','Lucas','llemoine20@arbitre.fr');
INSERT INTO esport.arbitre VALUES (21,'Thomas','Mehdi','mthomas21@arbitre.fr');
INSERT INTO esport.arbitre VALUES (22,'Marchand','Nina','nmarchand22@arbitre.fr');
INSERT INTO esport.arbitre VALUES (23,'Lambert','Yasmine','ylambert23@arbitre.fr');
INSERT INTO esport.arbitre VALUES (24,'Martin','Aya','amartin24@arbitre.fr');
INSERT INTO esport.arbitre VALUES (25,'Leroy','Lina','lleroy25@arbitre.fr');
INSERT INTO esport.arbitre VALUES (26,'Lopez','Maya','mlopez26@arbitre.fr');
INSERT INTO esport.arbitre VALUES (27,'Dupont','Lola','ldupont27@arbitre.fr');
INSERT INTO esport.arbitre VALUES (28,'Lemoine','Zoé','zlemoine28@arbitre.fr');
INSERT INTO esport.arbitre VALUES (29,'Thomas','Jade','jthomas29@arbitre.fr');
INSERT INTO esport.arbitre VALUES (30,'Marchand','Nora','nmarchand30@arbitre.fr');

INSERT INTO esport.equipe VALUES (1,'TeamVitality','2025-10-12');
INSERT INTO esport.equipe VALUES (2,'TeamKarmine','2025-09-20');
INSERT INTO esport.equipe VALUES (3,'TeamSolary','2025-10-21');
INSERT INTO esport.equipe VALUES (4,'TeamCrouton','2025-11-23');
INSERT INTO esport.equipe VALUES (5,'TeamJeanFils','2025-09-07');
INSERT INTO esport.equipe VALUES (6,'TeamKraken','2025-09-10');
INSERT INTO esport.equipe VALUES (7,'TeamOrion','2025-11-08');
INSERT INTO esport.equipe VALUES (8,'TeamPulse','2025-09-13');
INSERT INTO esport.equipe VALUES (9,'TeamTitan','2025-10-17');
INSERT INTO esport.equipe VALUES (10,'TeamEcho','2025-11-14');
INSERT INTO esport.equipe VALUES (11,'TeamBlaze','2025-09-08');
INSERT INTO esport.equipe VALUES (12,'TeamShawnFrost','2025-11-04');
INSERT INTO esport.equipe VALUES (13,'TeamOBTB','2025-09-28');
INSERT INTO esport.equipe VALUES (14,'TeamRaven','2025-09-05');
INSERT INTO esport.equipe VALUES (15,'TeamHydra','2025-09-12');
INSERT INTO esport.equipe VALUES (16,'TeamFalcon','2025-10-26');
INSERT INTO esport.equipe VALUES (17,'TeamLynx','2025-10-24');
INSERT INTO esport.equipe VALUES (18,'TeamManta','2025-09-09');
INSERT INTO esport.equipe VALUES (19,'TeamBasilisk','2025-10-01');
INSERT INTO esport.equipe VALUES (20,'TeamNimbus','2025-09-12');
INSERT INTO esport.equipe VALUES (21,'TeamSaber','2025-11-10');
INSERT INTO esport.equipe VALUES (22,'TeamAstra','2025-10-25');
INSERT INTO esport.equipe VALUES (23,'TeamBsb','2025-09-08');
INSERT INTO esport.equipe VALUES (24,'TeamNeon','2025-11-12');
INSERT INTO esport.equipe VALUES (25,'TeamIris','2025-09-16');
INSERT INTO esport.equipe VALUES (26,'TeamVolt','2025-09-29');
INSERT INTO esport.equipe VALUES (27,'TeamDrift','2025-11-20');
INSERT INTO esport.equipe VALUES (28,'TeamOasis','2025-11-20');
INSERT INTO esport.equipe VALUES (29,'TeamRiot','2025-11-14');
INSERT INTO esport.equipe VALUES (30,'TeamSolstice','2025-09-08');

INSERT INTO esport.joueur VALUES (1,'Sassoui','Kelyan','kely1','kely1@mail.fr','2025-11-13',1);
INSERT INTO esport.joueur VALUES (2,'Demir','Ali','ali2','ali2@mail.fr','2025-11-14',2);
INSERT INTO esport.joueur VALUES (3,'Fischer','Samy','safi3','safi3@mail.fr','2025-10-21',3);
INSERT INTO esport.joueur VALUES (4,'Durand','Amine','amdu4','amdu4@mail.fr','2025-09-07',4);
INSERT INTO esport.joueur VALUES (5,'Aurensan','Mathis','mathis5','mathis5@mail.fr','2025-09-29',5);
INSERT INTO esport.joueur VALUES (6,'Bourguiba','Zakariya','Zaki6','zaki6@mail.fr','2025-09-06',6);
INSERT INTO esport.joueur VALUES (7,'Francois','Noah','nofr7','nofr7@mail.fr','2025-11-11',7);
INSERT INTO esport.joueur VALUES (8,'Fournier','Zoé','zofo8','zofo8@mail.fr','2025-12-19',8);
INSERT INTO esport.joueur VALUES (9,'Cohen','Ilyes','ilco9','ilco9@mail.fr','2025-09-18',9);
INSERT INTO esport.joueur VALUES (10,'Marchand','Elias','elma10','elma10@mail.fr','2025-10-08',10);
INSERT INTO esport.joueur VALUES (11,'Bernard','Imane','imbe11','imbe11@mail.fr','2025-10-24',11);
INSERT INTO esport.joueur VALUES (12,'Nguyen','Nina','ning12','ning12@mail.fr','2025-09-19',12);
INSERT INTO esport.joueur VALUES (13,'Blanc','Rayan','rabl13','rabl13@mail.fr','2025-11-09',13);
INSERT INTO esport.joueur VALUES (14,'Dufour','Jade','jadu14','jadu14@mail.fr','2025-09-16',14);
INSERT INTO esport.joueur VALUES (15,'Leroy','Inaya','inle15','inle15@mail.fr','2025-11-13',15);
INSERT INTO esport.joueur VALUES (16,'Henry','Salma','sahe16','sahe16@mail.fr','2025-10-10',16);
INSERT INTO esport.joueur VALUES (17,'Paul','Rania','rapa17','rapa17@mail.fr','2025-11-11',17);
INSERT INTO esport.joueur VALUES (18,'Mercier','Yasmine','yame18','yame18@mail.fr','2025-12-14',18);
INSERT INTO esport.joueur VALUES (19,'Roux','Tom','toro19','toro19@mail.fr','2025-11-27',19);
INSERT INTO esport.joueur VALUES (20,'Lemoine','Nora','nole20','nole20@mail.fr','2025-09-24',20);
INSERT INTO esport.joueur VALUES (21,'Barbier','Lya','lyba21','lyba21@mail.fr','2025-09-14',21);
INSERT INTO esport.joueur VALUES (22,'Petit','Kylian','kype22','kype22@mail.fr','2025-11-14',22);
INSERT INTO esport.joueur VALUES (23,'Morel','Ines','inmo23','inmo23@mail.fr','2025-11-13',23);
INSERT INTO esport.joueur VALUES (24,'Boyer','Aya','aybo24','aybo24@mail.fr','2025-11-21',24);
INSERT INTO esport.joueur VALUES (25,'Lambert','Eliot','ella25','ella25@mail.fr','2025-09-25',25);
INSERT INTO esport.joueur VALUES (26,'Moreau','Louna','lomo26','lomo26@mail.fr','2025-10-18',26);
INSERT INTO esport.joueur VALUES (27,'Rossi','Haris','haro27','haro27@mail.fr','2025-09-13',27);
INSERT INTO esport.joueur VALUES (28,'Riviere','Anis','anri28','anri28@mail.fr','2025-11-10',28);
INSERT INTO esport.joueur VALUES (29,'Simon','Sara','sasi29','sasi29@mail.fr','2025-12-01',29);
INSERT INTO esport.joueur VALUES (30,'Lopez','Lina','lilo30','lilo30@mail.fr','2025-09-09',30);
INSERT INTO esport.joueur VALUES (31,'Garcia','Rayan','remp19rg','remp19rg@mail.fr','2025-11-27',19);
INSERT INTO esport.joueur VALUES (32,'Giraud','Jade','remp2jg','remp2jg@mail.fr','2025-11-08',2);
INSERT INTO esport.joueur VALUES (33,'Lemoine','Nora','remp20nl','remp20nl@mail.fr','2025-10-25',20);
INSERT INTO esport.joueur VALUES (34,'Diallo','Ilyes','remp7id','remp7id@mail.fr','2025-12-09',7);
INSERT INTO esport.joueur VALUES (35,'Fournier','Eden','remp16ef','remp16ef@mail.fr','2025-10-11',16);

INSERT INTO esport.tournoi VALUES (1,'AutumnCup','R6','2025-12-14','2025-12-26','2026-01-02','2026-01-04',8,'elim directe',26);
INSERT INTO esport.tournoi VALUES (2,'RookieClash','CS2','2025-11-01','2025-11-07','2025-11-13','2025-11-16',16,'elim directe',29);
INSERT INTO esport.tournoi VALUES (3,'NightLeague','Fortnite','2025-11-27','2025-12-06','2025-12-09','2025-12-10',32,'elim directe',14);
INSERT INTO esport.tournoi VALUES (4,'WinterShowdown','CS2','2025-11-13','2025-11-20','2025-11-29','2025-12-01',8,'elim directe',22);
INSERT INTO esport.tournoi VALUES (5,'CampusMasters','Valorant','2025-12-11','2025-12-21','2025-12-28','2025-12-31',16,'elim directe',20);
INSERT INTO esport.tournoi VALUES (6,'WeekendKO','R6','2025-12-14','2025-12-26','2025-12-29','2025-12-30',16,'elim directe',16);
INSERT INTO esport.tournoi VALUES (7,'NeonArena','Valorant','2025-10-08','2025-10-17','2025-10-26','2025-10-28',32,'elim directe',13);
INSERT INTO esport.tournoi VALUES (8,'StormBracket','Fortnite','2025-10-03','2025-10-15','2025-10-22','2025-10-23',32,'elim directe',4);
INSERT INTO esport.tournoi VALUES (9,'RivalryCup','R6','2025-10-08','2025-10-16','2025-10-22','2025-10-23',32,'elim directe',8);
INSERT INTO esport.tournoi VALUES (10,'ProvingGrounds','EAFC','2025-11-20','2025-12-02','2025-12-05','2025-12-06',16,'elim directe',13);
INSERT INTO esport.tournoi VALUES (11,'NextGenCup','Overwatch2','2025-10-18','2025-10-29','2025-11-08','2025-11-10',32,'elim directe',14);
INSERT INTO esport.tournoi VALUES (12,'MidnightSeries','Fortnite','2025-11-18','2025-11-26','2025-11-30','2025-12-01',8,'elim directe',5);
INSERT INTO esport.tournoi VALUES (13,'AuroraCup','RocketLeague','2025-12-24','2026-01-01','2026-01-03','2026-01-05',32,'elim directe',6);
INSERT INTO esport.tournoi VALUES (14,'ZenithChallenge','Overwatch2','2025-11-06','2025-11-11','2025-11-15','2025-11-17',32,'elim directe',12);
INSERT INTO esport.tournoi VALUES (15,'PulseTournament','Fortnite','2025-10-17','2025-10-22','2025-10-31','2025-11-03',32,'elim directe',13);
INSERT INTO esport.tournoi VALUES (16,'TitanTrial','EAFC','2025-11-21','2025-12-02','2025-12-05','2025-12-07',32,'elim directe',13);
INSERT INTO esport.tournoi VALUES (17,'EchoKO','LoL','2025-10-25','2025-10-31','2025-11-05','2025-11-07',8,'elim directe',4);
INSERT INTO esport.tournoi VALUES (18,'BlazeCup','Fortnite','2025-12-16','2025-12-21','2025-12-24','2025-12-25',32,'elim directe',5);
INSERT INTO esport.tournoi VALUES (19,'FrostFinals','Valorant','2025-11-16','2025-11-21','2025-11-24','2025-11-25',32,'elim directe',13);
INSERT INTO esport.tournoi VALUES (20,'CometCup','CS2','2025-12-21','2025-12-30','2026-01-06','2026-01-09',16,'elim directe',16);
INSERT INTO esport.tournoi VALUES (21,'RavenRumble','Valorant','2025-10-15','2025-10-27','2025-11-05','2025-11-07',16,'elim directe',10);
INSERT INTO esport.tournoi VALUES (22,'HydraCup','Valorant','2025-10-19','2025-10-25','2025-11-01','2025-11-04',16,'elim directe',16);
INSERT INTO esport.tournoi VALUES (23,'FalconFight','CS2','2025-12-06','2025-12-11','2025-12-16','2025-12-19',16,'elim directe',5);
INSERT INTO esport.tournoi VALUES (24,'LynxLeague','LoL','2025-12-07','2025-12-16','2025-12-19','2025-12-22',16,'elim directe',17);
INSERT INTO esport.tournoi VALUES (25,'MantaMasters','Fortnite','2025-10-22','2025-11-01','2025-11-06','2025-11-09',32,'elim directe',25);
INSERT INTO esport.tournoi VALUES (26,'BasiliskBash','Fortnite','2025-12-21','2025-12-29','2026-01-03','2026-01-04',16,'elim directe',24);
INSERT INTO esport.tournoi VALUES (27,'NimbusNight','RocketLeague','2025-10-26','2025-11-07','2025-11-14','2025-11-17',8,'elim directe',1);
INSERT INTO esport.tournoi VALUES (28,'SaberSeries','Overwatch2','2025-11-30','2025-12-09','2025-12-14','2025-12-17',32,'elim directe',12);
INSERT INTO esport.tournoi VALUES (29,'AstraArena','R6','2025-11-14','2025-11-24','2025-11-27','2025-11-28',8,'elim directe',8);
INSERT INTO esport.tournoi VALUES (30,'SolsticeSlam','R6','2025-10-26','2025-11-05','2025-11-10','2025-11-12',32,'elim directe',29);

-- La raison de pourquoi on a pris la décision de faire deux fois plus que les insert minimal (30), c'est que
-- La SAE demande au moins 30 lignes par table donc inscription doit en avoir au moins 30.
-- Et si on met juste 30 inscriptions (1 par équipe), c’est un peu basic, en tout cas c'est ce qu'on a pensé.
-- Avec 60, ça fait plus réaliste : certaines équipes s’inscrivent à plusieurs tournois, comme une "vrai" base de données et pas un projet d'etudiants.

INSERT INTO esport.inscription VALUES (20,27,'2025-10-01','VALIDEE','2025-10-07');
INSERT INTO esport.inscription VALUES (12,26,'2025-12-22','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (27,22,'2025-10-16','VALIDEE','2025-10-23');
INSERT INTO esport.inscription VALUES (23,25,'2025-10-26','VALIDEE','2025-10-28');
INSERT INTO esport.inscription VALUES (14,26,'2025-12-21','REFUSEE','2025-12-22');
INSERT INTO esport.inscription VALUES (26,24,'2025-11-20','VALIDEE','2025-11-24');
INSERT INTO esport.inscription VALUES (24,3,'2026-01-01','VALIDEE','2026-01-03');
INSERT INTO esport.inscription VALUES (5,1,'2025-10-20','VALIDEE','2025-10-24');
INSERT INTO esport.inscription VALUES (26,21,'2025-10-19','VALIDEE','2025-10-26');
INSERT INTO esport.inscription VALUES (20,16,'2025-12-24','REFUSEE','2025-12-26');
INSERT INTO esport.inscription VALUES (18,18,'2025-10-17','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (1,26,'2026-01-01','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (17,24,'2025-10-18','VALIDEE','2025-10-25');
INSERT INTO esport.inscription VALUES (7,27,'2025-10-28','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (9,7,'2025-11-07','VALIDEE','2025-11-09');
INSERT INTO esport.inscription VALUES (25,19,'2025-11-11','REFUSEE','2025-11-16');
INSERT INTO esport.inscription VALUES (14,27,'2025-10-17','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (30,24,'2025-11-15','VALIDEE','2025-11-21');
INSERT INTO esport.inscription VALUES (19,27,'2025-12-06','VALIDEE','2025-12-13');
INSERT INTO esport.inscription VALUES (30,29,'2025-12-04','VALIDEE','2025-12-09');
INSERT INTO esport.inscription VALUES (5,17,'2025-12-05','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (28,15,'2026-01-08','VALIDEE','2026-01-13');
INSERT INTO esport.inscription VALUES (1,25,'2026-01-11','VALIDEE','2026-01-13');
INSERT INTO esport.inscription VALUES (5,16,'2025-12-19','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (18,2,'2025-11-11','VALIDEE','2025-11-16');
INSERT INTO esport.inscription VALUES (18,16,'2026-01-09','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (29,18,'2025-10-08','VALIDEE','2025-10-10');
INSERT INTO esport.inscription VALUES (9,2,'2026-01-07','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (17,15,'2025-12-11','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (25,29,'2025-10-09','VALIDEE','2025-10-12');
INSERT INTO esport.inscription VALUES (20,17,'2025-12-17','VALIDEE','2025-12-19');
INSERT INTO esport.inscription VALUES (23,9,'2025-11-27','VALIDEE','2025-12-02');
INSERT INTO esport.inscription VALUES (26,16,'2025-12-04','VALIDEE','2025-12-10');
INSERT INTO esport.inscription VALUES (17,29,'2025-11-03','VALIDEE','2025-11-05');
INSERT INTO esport.inscription VALUES (27,15,'2025-10-18','VALIDEE','2025-10-19');
INSERT INTO esport.inscription VALUES (13,15,'2025-11-10','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (22,8,'2025-11-24','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (7,22,'2025-11-08','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (29,25,'2025-10-20','REFUSEE','2025-10-22');
INSERT INTO esport.inscription VALUES (9,29,'2025-10-18','VALIDEE','2025-10-20');
INSERT INTO esport.inscription VALUES (24,4,'2025-11-20','VALIDEE','2025-11-22');
INSERT INTO esport.inscription VALUES (22,27,'2025-10-29','VALIDEE','2025-11-04');
INSERT INTO esport.inscription VALUES (14,17,'2025-11-21','REFUSEE','2025-11-25');
INSERT INTO esport.inscription VALUES (7,12,'2025-11-10','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (24,12,'2025-10-03','REFUSEE','2025-10-08');
INSERT INTO esport.inscription VALUES (15,15,'2025-12-30','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (13,11,'2025-12-06','VALIDEE','2025-12-09');
INSERT INTO esport.inscription VALUES (17,3,'2025-10-15','VALIDEE','2025-10-16');
INSERT INTO esport.inscription VALUES (3,9,'2025-11-04','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (6,9,'2026-01-05','VALIDEE','2026-01-12');
INSERT INTO esport.inscription VALUES (14,28,'2025-12-26','REFUSEE','2025-12-30');
INSERT INTO esport.inscription VALUES (5,18,'2025-12-05','VALIDEE','2025-12-09');
INSERT INTO esport.inscription VALUES (23,11,'2025-10-12','REFUSEE','2025-10-13');
INSERT INTO esport.inscription VALUES (26,23,'2025-10-24','VALIDEE','2025-10-25');
INSERT INTO esport.inscription VALUES (9,1,'2025-12-21','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (26,9,'2025-10-11','VALIDEE','2025-10-18');
INSERT INTO esport.inscription VALUES (8,3,'2025-11-03','EN_ATTENTE',NULL);
INSERT INTO esport.inscription VALUES (15,1,'2025-11-13','VALIDEE','2025-11-17');
INSERT INTO esport.inscription VALUES (30,30,'2025-11-04','VALIDEE','2025-11-06');
INSERT INTO esport.inscription VALUES (2,17,'2025-12-30','VALIDEE','2025-12-31');

INSERT INTO esport.matchTournoi VALUES (1,3,9,2,'2025-11-24',1,'JOUE');
INSERT INTO esport.matchTournoi VALUES (2,11,10,17,'2026-02-06',1,'JOUE');
INSERT INTO esport.matchTournoi VALUES (3,8,17,22,'2025-11-23',1,'JOUE');
INSERT INTO esport.matchTournoi VALUES (4,1,9,2,'2025-11-02',1,'ANNULE');
INSERT INTO esport.matchTournoi VALUES (5,9,7,17,'2025-12-31',1,'JOUE');
INSERT INTO esport.matchTournoi VALUES (6,2,22,27,'2026-01-23',2,'JOUE');
INSERT INTO esport.matchTournoi VALUES (7,9,27,29,'2025-12-21',2,'JOUE');
INSERT INTO esport.matchTournoi VALUES (8,12,7,8,'2025-12-14',1,'JOUE');
INSERT INTO esport.matchTournoi VALUES (9,7,12,2,'2026-02-16',1,'PREVU');
INSERT INTO esport.matchTournoi VALUES (10,2,21,24,'2025-12-03',2,'JOUE');
INSERT INTO esport.matchTournoi VALUES (11,1,3,22,'2026-02-16',2,'ANNULE');
INSERT INTO esport.matchTournoi VALUES (12,11,10,20,'2025-12-02',3,'JOUE');
INSERT INTO esport.matchTournoi VALUES (13,1,15,6,'2025-11-21',1,'JOUE');
INSERT INTO esport.matchTournoi VALUES (14,1,9,12,'2025-12-13',2,'JOUE');
INSERT INTO esport.matchTournoi VALUES (15,4,2,29,'2025-12-10',1,'JOUE');
INSERT INTO esport.matchTournoi VALUES (16,3,1,11,'2025-12-19',1,'JOUE');
INSERT INTO esport.matchTournoi VALUES (17,5,17,21,'2025-11-26',1,'ANNULE');
INSERT INTO esport.matchTournoi VALUES (18,1,3,9,'2026-02-13',1,'JOUE');
INSERT INTO esport.matchTournoi VALUES (19,7,19,2,'2025-12-21',1,'JOUE');
INSERT INTO esport.matchTournoi VALUES (20,5,21,8,'2025-11-11',2,'ANNULE');
INSERT INTO esport.matchTournoi VALUES (21,3,22,29,'2026-01-31',4,'ANNULE');
INSERT INTO esport.matchTournoi VALUES (22,7,25,11,'2026-02-01',2,'JOUE');
INSERT INTO esport.matchTournoi VALUES (23,5,24,20,'2026-01-22',1,'PREVU');
INSERT INTO esport.matchTournoi VALUES (24,12,29,17,'2026-01-20',2,'ANNULE');
INSERT INTO esport.matchTournoi VALUES (25,3,30,17,'2026-02-05',2,'ANNULE');
INSERT INTO esport.matchTournoi VALUES (26,1,27,22,'2026-01-14',4,'JOUE');
INSERT INTO esport.matchTournoi VALUES (27,2,1,2,'2025-11-18',3,'JOUE');
INSERT INTO esport.matchTournoi VALUES (28,2,13,27,'2025-12-28',2,'PREVU');
INSERT INTO esport.matchTournoi VALUES (29,11,1,21,'2026-01-08',3,'JOUE');
INSERT INTO esport.matchTournoi VALUES (30,8,9,1,'2025-12-29',4,'PREVU');
INSERT INTO esport.matchTournoi VALUES (31,12,30,17,'2026-01-08',1,'ANNULE');
INSERT INTO esport.matchTournoi VALUES (32,2,24,16,'2025-12-03',4,'PREVU');
INSERT INTO esport.matchTournoi VALUES (33,5,8,24,'2026-02-05',1,'JOUE');
INSERT INTO esport.matchTournoi VALUES (34,12,21,15,'2026-01-03',4,'JOUE');
INSERT INTO esport.matchTournoi VALUES (35,2,16,30,'2026-01-27',1,'PREVU');
INSERT INTO esport.matchTournoi VALUES (36,10,21,7,'2025-11-10',2,'JOUE');
INSERT INTO esport.matchTournoi VALUES (37,6,9,21,'2026-02-04',3,'JOUE');
INSERT INTO esport.matchTournoi VALUES (38,10,19,5,'2025-11-02',2,'PREVU');
INSERT INTO esport.matchTournoi VALUES (39,8,9,22,'2025-11-13',3,'JOUE');
INSERT INTO esport.matchTournoi VALUES (40,11,16,10,'2026-01-30',2,'JOUE');

INSERT INTO esport.resultat VALUES (1,15,15,14,'2026-02-07');
INSERT INTO esport.resultat VALUES (2,4,6,9,'2025-11-11');
INSERT INTO esport.resultat VALUES (3,30,15,0,'2025-12-08');
INSERT INTO esport.resultat VALUES (4,15,2,16,'2025-12-28');
INSERT INTO esport.resultat VALUES (5,9,12,6,'2025-11-27');
INSERT INTO esport.resultat VALUES (6,3,2,4,'2026-02-04');
INSERT INTO esport.resultat VALUES (7,17,8,11,'2025-11-17');
INSERT INTO esport.resultat VALUES (8,20,16,8,'2026-02-22');
INSERT INTO esport.resultat VALUES (9,4,11,7,'2026-01-03');
INSERT INTO esport.resultat VALUES (10,29,15,12,'2025-11-04');
INSERT INTO esport.resultat VALUES (11,6,0,15,'2026-01-27');
INSERT INTO esport.resultat VALUES (12,15,12,9,'2026-02-02');
INSERT INTO esport.resultat VALUES (13,5,13,11,'2025-12-19');
INSERT INTO esport.resultat VALUES (14,11,3,10,'2025-11-01');
INSERT INTO esport.resultat VALUES (15,11,10,12,'2025-11-16');
INSERT INTO esport.resultat VALUES (16,30,6,0,'2026-02-24');
INSERT INTO esport.resultat VALUES (17,24,9,8,'2025-12-18');
INSERT INTO esport.resultat VALUES (18,3,13,12,'2026-02-20');
INSERT INTO esport.resultat VALUES (19,19,2,11,'2025-12-25');
INSERT INTO esport.resultat VALUES (20,25,8,1,'2025-12-06');
INSERT INTO esport.resultat VALUES (21,4,1,9,'2026-01-21');
INSERT INTO esport.resultat VALUES (22,30,4,7,'2025-12-05');
INSERT INTO esport.resultat VALUES (23,14,16,10,'2025-11-25');
INSERT INTO esport.resultat VALUES (24,25,11,13,'2026-02-22');
INSERT INTO esport.resultat VALUES (25,1,12,6,'2026-02-01');
INSERT INTO esport.resultat VALUES (26,3,1,13,'2025-12-28');
INSERT INTO esport.resultat VALUES (27,20,4,9,'2026-01-02');
INSERT INTO esport.resultat VALUES (28,2,4,5,'2025-12-31');
INSERT INTO esport.resultat VALUES (29,14,10,9,'2025-12-09');
INSERT INTO esport.resultat VALUES (30,9,8,12,'2026-01-23');
INSERT INTO esport.resultat VALUES (31,8,9,15,'2026-01-11');
INSERT INTO esport.resultat VALUES (32,22,12,3,'2025-11-22');
INSERT INTO esport.resultat VALUES (33,21,5,2,'2025-11-27');
INSERT INTO esport.resultat VALUES (34,17,15,7,'2025-12-28');
INSERT INTO esport.resultat VALUES (35,30,10,14,'2025-12-25');