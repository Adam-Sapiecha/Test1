-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-05-06 12:16:23.559

-- foreign keys
ALTER TABLE Przynaleznosc DROP CONSTRAINT Przynaleznosc_Partia;

ALTER TABLE Przynaleznosc DROP CONSTRAINT Przynaleznosc_Polityk;

-- tables
DROP TABLE Partia;

DROP TABLE Polityk;

DROP TABLE Przynaleznosc;

-- End of file.

