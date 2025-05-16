-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-05-06 12:16:23.559

-- tables
-- Table: Partia
CREATE TABLE Partia (
    ID int  NOT NULL IDENTITY,
    Nazwa varchar(300)  NOT NULL,
    Skrot varchar(10)  NULL,
    DataZalozenia datetime  NOT NULL,
    CONSTRAINT Partia_pk PRIMARY KEY  (ID)
);

-- Table: Polityk
CREATE TABLE Polityk (
    ID int  NOT NULL IDENTITY,
    Imie varchar(50)  NOT NULL,
    Nazwisko varchar(100)  NOT NULL,
    Powiedzenie varchar(200)  NULL,
    CONSTRAINT Polityk_pk PRIMARY KEY  (ID)
);

-- Table: Przynaleznosc
CREATE TABLE Przynaleznosc (
    ID int  NOT NULL IDENTITY,
    Partia_ID int  NOT NULL,
    Polityk_ID int  NOT NULL,
    Od datetime  NOT NULL,
    Do datetime  NULL,
    CONSTRAINT Przynaleznosc_pk PRIMARY KEY  (ID)
);

-- foreign keys
-- Reference: Przynaleznosc_Partia (table: Przynaleznosc)
ALTER TABLE Przynaleznosc ADD CONSTRAINT Przynaleznosc_Partia
    FOREIGN KEY (Partia_ID)
    REFERENCES Partia (ID);

-- Reference: Przynaleznosc_Polityk (table: Przynaleznosc)
ALTER TABLE Przynaleznosc ADD CONSTRAINT Przynaleznosc_Polityk
    FOREIGN KEY (Polityk_ID)
    REFERENCES Polityk (ID);

-- End of file.

-- Partie polityczne (unikalne)
INSERT INTO Partia (Nazwa, Skrot, DataZalozenia) VALUES
('Uniwersalna Partia Zdrowego Rozsądku', 'UPZR', '2002-04-12T00:00:00'),
('Front Empatycznego Kompromisu', 'FEK', '2011-10-10T00:00:00'),
('Koalicja Radykalnego Optymizmu', 'KRO', '2019-01-05T00:00:00'),
('Partia Twardych Narracji', 'PTN', '2021-02-02T00:00:00'),
('Centropartyjny Front Pogodowy', 'CFP', '2005-06-20T00:00:00'),
('Partia Dialogu z Orientem', 'PDO', '1998-02-14T00:00:00'),
('Związek Plusów i Minusów', 'ZPiM', '2004-05-01T00:00:00'),
('Ruch Demokratycznej Równowagi', 'RDR', '2011-01-01T00:00:00'),
('Fundamentalna Jedność Narodu', 'FUN', '2001-07-04T00:00:00'),
('Partia Pokornych Proroków', 'PPP', '2015-12-08T00:00:00'),
('Zjednoczenie Zmartwionych Zbawieniem', 'ZZZ', '2019-03-30T00:00:00');


-- Politycy
INSERT INTO Polityk (Imie, Nazwisko, Powiedzenie) VALUES
('Jola', 'Sensińska', 'Nie macie wyjścia!'),
('Sławomir', 'Mętza', 'Mam największe szanse na wygraną w drugiej turze wyborów!'),
('Donat', 'Tuskowski', 'Taki mamy klimat...'),
('Bronek', 'Komorozki', 'Chodź, Shogunie!'),
('Lech', 'Wałęski', 'Plusy Unii Europejskiej mają swoje plusy i minusy...'),
('Jarek', 'Kaczynszczyk', 'Żadne wrzaski i lamenty nie przekonają nas, że białe to białe, a czarne to czarne!'),
('Grzegorz', 'Brączek', 'Szczęść Boże!');


-- Przynależności
-- Jola Sensińska (ID 1)
INSERT INTO Przynaleznosc (Partia_ID, Polityk_ID, Od, Do) VALUES
(1, 1, '2016-09-01T00:00:00', NULL),
(2, 1, '2022-01-15T00:00:00', NULL);

-- Sławomir Mętza (ID 2)
INSERT INTO Przynaleznosc (Partia_ID, Polityk_ID, Od, Do) VALUES
(3, 2, '2020-03-10T00:00:00', NULL),
(4, 2, '2023-04-01T00:00:00', NULL);

-- Donat Tuskowski (ID 3)
INSERT INTO Przynaleznosc (Partia_ID, Polityk_ID, Od, Do) VALUES
(5, 3, '2007-10-12T00:00:00', '2022-11-30T00:00:00');

-- Bronek Komorozki (ID 4)
INSERT INTO Przynaleznosc (Partia_ID, Polityk_ID, Od, Do) VALUES
(6, 4, '2001-04-01T00:00:00', '2015-08-06T00:00:00');

-- Lech Wałęski (ID 5)
INSERT INTO Przynaleznosc (Partia_ID, Polityk_ID, Od, Do) VALUES
(7, 5, '2004-05-01T00:00:00', '2010-10-10T00:00:00'),
(8, 5, '2012-03-15T00:00:00', NULL);

-- Jarek Kaczynszczyk (ID 6)
INSERT INTO Przynaleznosc (Partia_ID, Polityk_ID, Od, Do) VALUES
(9, 6, '2001-07-05T00:00:00', NULL);

-- Grzegorz Brączek (ID 7)
INSERT INTO Przynaleznosc (Partia_ID, Polityk_ID, Od, Do) VALUES
(10, 7, '2016-01-01T00:00:00', NULL),
(11, 7, '2021-05-01T00:00:00', NULL);