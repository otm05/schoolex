create database cgsv14;
use cgsv14;

create table Option
(
    idOp int primary key NOT NULL AUTO_INCREMENT,
    nomOp varchar(20),
    description varchar(300)
);

create table Niveau
(
    idNiv  int NOT NULL AUTO_INCREMENT,
    nomNiv varchar(20),
    description varchar(300),
    idOpfk int NOT NULL,
    primary key(idNiv,idOpfk)
);
alter table Niveau add foreign key (idOpfk) references Option(idOp);

create table Matiere
(
    idMat int NOT NULL AUTO_INCREMENT,
    nomMat varchar(20),
    idNivfk1 int NOT NULL,
    idOpfk int NOT NULL,
    primary key(idMat,idNivfk1,idOpfk)
);
alter table  Matiere add foreign key (idOpfk,idNivfk1) references Niveau(idOpfk,idNiv);

create table User
(
    idUser int primary key NOT NULL AUTO_INCREMENT,
    typee varchar(30),
    nom varchar(20),
    adresse varchar(20),
    Tel varchar(20),
    PhotoEl varchar(300),
    login varchar(300),
    psw varchar(300)
);

create table professeur
(
    idProf int primary key NOT NULL AUTO_INCREMENT,
    idUserfk int
);
alter table professeur add foreign key (idUserfk) references User(idUser);

create table MaPro
(
    idProffk int NOT NULL,
    idMatfk int NOT NULL,
    idNivfk1 int NOT NULL,
    idOpfk int
);
alter table MaPro add constraint pk primary key(idMatfk,idProffk);
alter table MaPro add foreign key (idProffk) references professeur(idProf);
alter table MaPro add foreign key (idMatfk,idNivfk1,idOpfk) references Matiere(idMat,idNivfk1,idOpfk);

create table Groupe
(
    idGr int NOT NULL AUTO_INCREMENT,
    nomGr varchar(20),
    capaciteGr varchar(20),
    idMatfk int NOT NULL,
    idNivfk1 int NOT NULL,
    idOpfk int NOT NULL,
    idProffk int NOT NULL,
    primary key(idGr,idMatfk,idNivfk1)
);
alter table Groupe add foreign key (idMatfk,idNivfk1,idOpfk) references Matiere(idMat,idNivfk1,idOpfk);
alter table Groupe add foreign key (idProffk) references professeur(idProf); 

create table Eleve
(
    idEl int NOT NULL primary key AUTO_INCREMENT,
    telParent varchar(20),
    idGrfk int NOT NULL,
    idUserfk int NOT NULL
);
alter table Eleve add foreign key (idUserfk) references User(idUser);
alter table Eleve add foreign key (idGrfk) references Groupe(idGr);

create table Salle
(
    idSalle int NOT NULL primary key AUTO_INCREMENT,
    capacite varchar(20),
    Descriptione varchar(300)
);

create table Seance
(
    idSea int NOT NULL primary key AUTO_INCREMENT,
    dateSea Date,
    idSallefk int,
    idGrfk int
);
alter table Seance add foreign key (idSallefk) references Salle(idSalle);
alter table Seance add foreign key (idGrfk) references Groupe(idGr);

create table Personel
(
    idPer int NOT NULL primary key AUTO_INCREMENT,
    idUserfk int NOT NULL
);
alter table Personel add foreign key (idUserfk) references User(idUser);











