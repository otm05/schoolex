create database cgsv12;
use cgsv12;
create table Option
(
    idOp varchar(20) primary key,
    nomOp varchar(20),
    description varchar(300)
);
create table Niveau
(
    idNiv  varchar(20) NOT NULL,
    nomNiv varchar(20),
    description varchar(300),
    idOpfk varchar(20) NOT NULL
   
);
alter table Niveau add constraint pk primary key(idNiv,idOpfk);
alter table Niveau add foreign key (idOpfk) references Option(idOp);
create table Matiere
(
    idMat varchar(20) NOT NULL,
    nomMat varchar(20),
    idNivfk1 varchar(20) NOT NULL,
    idOpfk varchar(20) NOT NULL
   
);
alter table Matiere add constraint pk primary key(idNivfk1,idMat,idOpfk);
alter table  Matiere add foreign key (idOpfk,idNivfk1) references Niveau(idOpfk,idNiv);
create table professeur
(
    idProf int primary key,
    nomProf varchar(20),
    loginProf varchar(300),
    pswProf varchar(300)
);
create table MaPro
(
    idProffk int NOT NULL,
    idMatfk varchar(20) NOT NULL,
    idNivfk1 varchar(20) NOT NULL,
    idOpfk varchar(20)
 );
alter table MaPro add constraint pk primary key(idMatfk,idProffk);
alter table MaPro add foreign key (idProffk) references professeur(idProf);
alter table MaPro add foreign key (idMatfk,idNivfk1,idOpfk) references Matiere(idMat,idNivfk1,idOpfk);--Index Ereur

create table Groupe
(
    idGr varchar(20),
    nomGr varchar(20),
    capaciteGr varchar(20),
    idMatfk varchar(20),
    idNivfk1 varchar(20),
    idOpfk varchar(20)
);

alter table Groupe add constraint pk primary key(idGr,idMatfk,idNivfk1);
alter table Groupe add foreign key (idMatfk,idNivfk1,idOpfk) references Matiere(idMat,idNivfk1,idOpfk);

drop table Eleve;
create table Eleve
(
    idEl varchar(20) primary key,
    nomEl varchar(300),
    Age varchar(20),
    adresse varchar(300),
    telPersonnel varchar(20),
    telParent varchar(20),
    loginEl varchar(300),
    pswEl varchar(300),
    PhotoEl varchar(300),
    idGrfk varchar(20)
);

alter table Eleve add foreign key (idGrfk) references Groupe(idGr);

create table Salle
(
    idSalle varchar(20) primary key,
    capacite varchar(20),
    Descriptione varchar(300)
);

create table Seance
(
    idSea int primary key,
    dateSea Date,
    idSallefk varchar(20),
    idProffk int,
    idGrfk varchar(20)

);

alter table Seance add foreign key (idSallefk) references Salle(idSalle);
alter table Seance add foreign key (idProffk) references professeur(idProf);
alter table Seance add foreign key (idGrfk) references Groupe(idGr);

create table User
(
    idUser int,
    login varchar(300),
    psw varchar(300)
);
create table Personel
(
    idPer varchar(20),
    nomPer varchar(50),
    loginPer varchar(50),
    pswPer varchar(50)
);

alter table Personel add constraint pk primary key(idPer);

