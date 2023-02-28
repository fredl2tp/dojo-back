-- SQLBook: Code
DROP DATABASE IF EXISTS DOJO_connect;
CREATE DATABASE DOJO_connect;

USE DOJO_connect;
DROP TABLE IF EXISTS produit;
CREATE TABLE produit (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_produit VARCHAR(60),
description_produit VARCHAR(255),
quantite_produit INT,
prix_produit INT) ENGINE=InnoDB;

DROP TABLE IF EXISTS fournisseur;
CREATE TABLE fournisseur (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_fournisseur VARCHAR(60),
adresse_fournisseur VARCHAR(255)) ENGINE=InnoDB;

DROP TABLE IF EXISTS categorie;
CREATE TABLE categorie (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_categorie VARCHAR(60),
description_categorie VARCHAR(255)) ENGINE=InnoDB;

DROP TABLE IF EXISTS produit_categorie;
CREATE TABLE produit_categorie (
id INT PRIMARY KEY AUTO_INCREMENT,
id_categorie INT NOT NULL,
id_produit INT NOT NULL,
-- PRIMARY KEY (id_categorie, id_produit)) UNIQUE ENGINE=InnoDB;
constraint FOREIGN KEY (id_categorie) REFERENCES categorie(id),
constraint FOREIGN KEY (id_produit) REFERENCES produit(id));

DROP TABLE IF EXISTS produit_fournisseur;
CREATE TABLE produit_fournisseur (
id INT PRIMARY KEY AUTO_INCREMENT,
id_produit INT NOT NULL,
id_fournisseur INT NOT NULL,
-- PRIMARY KEY (id_produit, id_fournisseur)) UNIQUE ENGINE=InnoDB,
constraint FOREIGN KEY (id_produit) REFERENCES produit(id),
constraint FOREIGN KEY (id_fournisseur) REFERENCES fournisseur(id));


-- ALTER TABLE appartenir ADD CONSTRAINT FK_appartenir_id_categorie FOREIGN KEY (id_categorie) REFERENCES categorie (id_categorie);
-- ALTER TABLE appartenir ADD CONSTRAINT FK_appartenir_id_produit FOREIGN KEY (id_produit) REFERENCES produit (id_produit);
-- ALTER TABLE avoir ADD CONSTRAINT FK_avoir_id_produit FOREIGN KEY (id_produit) REFERENCES produit (id_produit);
-- ALTER TABLE avoir ADD CONSTRAINT FK_avoir_id_fournisseur FOREIGN KEY (id_fournisseur) REFERENCES fournisseur (id_fournisseur);
use dojo_connect;
INSERT INTO produit (nom_produit, description_produit, quantite_produit, prix_produit) VALUES
('Téléviseur LED', 'Téléviseur de 55 pouces avec résolution 4K et connectivité Wi-Fi', 10, 899),
('Smartphone Android', 'Smartphone Android avec écran Full HD de 6,5 pouces et caméra arrière triple', 25, 449),
('Ordinateur portable', 'Ordinateur portable léger avec processeur Intel Core i7 et écran de 14 pouces', 5, 1499),
('Casque audio sans fil', 'Casque audio sans fil avec réduction de bruit active et autonomie de 30 heures', 15, 199),
('Lave-linge', 'Lave-linge frontal avec capacité de 8 kg et programmes de lavage éco', 8, 549),
('Cafetière expresso', 'Cafetière expresso avec broyeur à grains et mousseur à lait intégré', 12, 349),
('Aspirateur robot', 'Aspirateur robot intelligent avec navigation laser et fonctions de nettoyage personnalisées', 7, 799),
('Barre de son', 'Barre de son compacte avec son surround virtuel et connectivité Bluetooth', 20, 249);

INSERT INTO fournisseur (nom_fournisseur, adresse_fournisseur) VALUES
('ABC Electronics', '123 Rue de la Technologie 75001 Paris'),
('XYZ Appliances', '456 Avenue des Innovations 69002 Lyon'),
('DEF Computers', '789 Rue de Informatique 44000 Nantes'),
('GHI Home Appliances', '1010 Boulevard des Électroménagers 13008 Marseille'),
('JKL Audio', '555 Rue du Son 67000 Strasbourg'),
('MNO Coffee', '888 Avenue du Café 69003 Lyon'),
('PQR Clean', '444 Rue de la Propreté 35000 Rennes'),
('STU Sound', '777 Boulevard de la Musique 75010 Paris');


INSERT INTO categorie (nom_categorie, description_categorie) VALUES
('Télévisions', 'Produits relatifs aux télévisions et écrans'),
('Téléphonie', 'Produits relatifs à la téléphonie et smartphones'),
('Informatique', 'Produits relatifs à linformatique et aux ordinateurs'),
('Audio', 'Produits relatifs à laudio et aux écouteurs'),
('Électroménager', 'Produits relatifs à lélectroménager et aux machines à laver'),
('Café', 'Produits relatifs au café et aux machines à expresso'),
('Entretien de la maison', 'Produits relatifs à lentretien de la maison et à aspiration'),
('Audio domestique', 'Produits relatifs à laudio domestique et aux haut-parleurs');