DROP DATABASE IF EXISTS webshop;
CREATE DATABASE webshop;

USE webshop;

CREATE TABLE album (
	ID INT NOT NULL AUTO_INCREMENT,
    titel VARCHAR(255) NOT NULL,
    artiest VARCHAR(255) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    prijs DECIMAL(2,1) NULL,
    voorraad INT NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE klant (
	ID INT NOT NULL AUTO_INCREMENT,
    voornaam VARCHAR(255) NOT NULL,
    achternaam VARCHAR(255) NOT NULL,
    straat VARCHAR(255) NOT NULL,
    postcode VARCHAR(7) NOT NULL,
    woonplaats VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    /*wachtwoord VARCHAR(255),
    token VARCHAR(255),
    rol TINYINT,*/
    PRIMARY KEY(ID)
);

CREATE TABLE weborder (
	ID INT NOT NULL AUTO_INCREMENT,
    klant_ID INT NOT NULL,
    datum DATE NOT NULL DEFAULT(CURRENT_DATE),
    PRIMARY KEY(ID),
    FOREIGN KEY (klant_ID) REFERENCES klant(ID)
);

CREATE TABLE item(
    ID INT NOT NULL AUTO_INCREMENT,
    weborder_ID INT NOT NULL,
    klant_ID INT NOT NULL,
    album_ID INT NOT NULL,
    aantal INT NOT NULL,
    prijs_eenheid DECIMAL(2,1) NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY (weborder_ID) REFERENCES weborder(ID),
    FOREIGN KEY (klant_ID) REFERENCES klant(ID),
    FOREIGN KEY (album_ID) REFERENCES album(ID)
);

INSERT INTO album VALUES
    (NULL, 'Cafe Atlantico', "Cesarie Evora", 'World', 3.00, 100),
    (NULL, 'Rumba Azul', "Caetona Velso", 'Latin', 4.90, 50),
    (NULL, 'Survivor', "Destiny's child", 'R&B', 3.00, 789),
    (NULL, 'Oh Girl', "The Chi-lites", 'Pop', 3.00, 2),
    (NULL, 'Der Herr ist mein getre', "Ton Koopman", 'Klassiek', 5.50, 30),
    (NULL, 'Closing Time', "Tom Waits", 'Rock', 3.00, 0),
    (NULL, 'Irresistible', "Celia Cruz", 'Latin', 3.50, 23),
    (NULL, 'Marvin Gaye II', "Marvin Gaye", 'R&B', 4.00, 154),
    (NULL, 'Mi Sangre', "Juanes", 'Latin', 3.90, 123),
    (NULL, 'Greatest Hits 2', "Qeen", 'Rock', 3.00, 0),
    (NULL, '3121', "Prince", 'Rock', 3.45, 0),
    (NULL, 'Antologia I', "Paco de Lucia", 'World', 3.00, 320)
;
INSERT INTO klant VALUES 
    (NULL, 'Dylan', 'Huisden', 'middenweg 11', '1088 VV', 'Amsterdam', 'dhuisden@roc.nl'),
    (NULL,'Nitin','Bosman','Leidseweg 22','9900 BB','Amsterdam','nbosman@roc.nl'),
    (NULL,'Joseph','Demirel','Leidseplein 33','9988 BB','Utrecht','Josdem@hotmal.com'),
    (NULL,'Franco','Tasiyan','Kruislaan 444','3300 VV','Utrecht','frantas@wanadoo.nl'),
    (NULL,'Akash','Kabli','Galileiplantsoen 333','2299 NN','Amstelveen','aka@hetnet.nl'),
    (NULL,'Tamara','Kabli','Mozartstraat 22','3388 XX','Amsterdam','tamka@hotmail.com'),
    (NULL,'Arnold','Shaw','Kruislaan 1','9876 FF','Rotterdam','asha@roc.nl')
;
INSERT INTO weborder VALUES
    (NULL, 1, '2015-01-01'),
    (NULL, 1, '2015-01-01'),
    (NULL, 2, '2015-02-15'),
    (NULL, 3, '2015-02-20'),
    (NULL, 3, '2015-03-13')
;
INSERT INTO item VALUES
    (NULL, 1, 1, 1, 1, 3.00),
    (NULL, 1, 1, 5, 2, 5.50),
    (NULL, 2, 5, 8, 1, 4.00),
    (NULL, 2, 5, 10, 2, 3.00),
    (NULL, 3, 3, 1, 1, 3.00),
    (NULL, 4, 2, 5, 1, 5.50),
    (NULL, 4, 2, 8, 1, 4.00),
    (NULL, 4, 2, 6, 1, 3.00),
    (NULL, 5, 6, 4, 2, 3.00),
    (NULL, 5, 6, 6, 1, 3.00),
    (NULL, 5, 6, 1, 1, 3.00),
    (NULL, 5, 6, 9, 1, 3.90),
    (NULL, 5, 6, 10, 3, 3.00)
;