create database VAIKSASI ;
use VAIKSASI;

create TABLE Utilisateur (
    idUser int not null AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(150)NOT NULL,
    prenom varchar(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    contact varchar(20) NOT NULL UNIQUE,
    sexe varchar(2) not null default 'M',
    dateDeNaissance date not null ,
    adresse varchar(250) not null
);
create TABLE Connexion(
    idConnexion int not null AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL UNIQUE,
    contact varchar(20) NOT NULL UNIQUE,
    mdp varchar(250) NOT NULL 
);
create table BqUtilisateur (
    idBQU int not null AUTO_INCREMENT PRIMARY KEY,
    idUser int NOT NULL,
    montant float not null default 0,
    retrait float not null default 0,
    depot float not null default 0,
    dateUp date not null,
    foreign KEY(idUser) REFERENCES Utilisateur(idUser)
);
create TABLE compteBQ(
    idBQ int not null AUTO_INCREMENT PRIMARY KEY,
    montant float not null default 0,
    depot float not null default 0,
    dateUp date not null 
);
create table TypeAnnonces (
    idTypeA int not null AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) not null UNIQUE
);
create table CategorieVoitures (
    idCategories int not null AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) not NULL unique
);
create table ProduitsVoiture (
    idProduitsV int not null AUTO_INCREMENT PRIMARY KEY,
    idUser int NOT NULL,
    idType int not null,
    idCategorie int not null ,
    nom varchar(150) not null,
    anne int not null,
    places int not null,
    descriptionPlus varchar(250) not null ,
    prix float not null ,
    disponibilite int not null DEFAULT 1,
    foreign KEY(idUser) REFERENCES Utilisateur(idUser),
    foreign key(idType) REFERENCES TypeAnnonces(idTypeA),
    foreign key(idCategorie) REFERENCES CategorieVoitures(idCategories)
);
create table imageProduit(
    id int not null auto_increment primary key ,
    idProduit int not null,
    pathImage varchar(250) not null,
    foreign key(idProduit) REFERENCES produitsVoiture(idProduitsV)
);
create table Panier (
    idUser int NOT NULL,
    idProduitsV int NOT NULL,
    prixAchat float not null ,
    valider int not null DEFAULT 0,
    foreign KEY(idUser) REFERENCES Utilisateur(idUser),
    foreign KEY(idProduitsV) REFERENCES ProduitsVoiture(idProduitsV)
);

