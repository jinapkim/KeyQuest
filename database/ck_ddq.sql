DROP TABLE IF EXISTS Cases;
CREATE TABLE Cases(
    caseID INT(11) AUTO_INCREMENT PRIMARY KEY, 
    caseName VARCHAR(255) NOT NULL
);

INSERT INTO Cases(caseName)
VALUES('KBDFans Tofu60 Aluminum 60% Case- Black'),
('KBDFans Tofu60 Aluminum 60% Case- E-white'),
('Think 6.5 V2 Polycarbonate'),
('Vega- Blue'),
('NK65- Entry Edition- N65 Purple'),
('Keychron K2');

-- -------------------------------------------------------------------------

-- Table structure for table Pcb
DROP TABLE IF EXISTS Pcbs;
CREATE TABLE Pcbs(
    pcbID INT(11) AUTO_INCREMENT PRIMARY KEY, 
    pcbType VARCHAR(255) NOT NULL
);

INSERT INTO Pcbs(pcbType) VALUES
('Soldered'),
('Hotswap');

-- -------------------------------------------------------------------------

-- Table structure for table Plate
DROP TABLE IF EXISTS Plates;
CREATE TABLE Plates(
    plateID INT(11) AUTO_INCREMENT PRIMARY KEY, 
    material VARCHAR(255) NOT NULL
);

INSERT INTO Plates(material) VALUES
('Aluminum'), 
('Brass'),
('POM'),
('Fr4'),
('Carbon fiber'),
('Polycarbonate');

-- -------------------------------------------------------------------------

-- Table structure for table Switches
DROP TABLE IF EXISTS Switches;
CREATE TABLE Switches(
    switchID INT(11) AUTO_INCREMENT PRIMARY KEY, 
    switchName VARCHAR(255) NOT NULL
);

INSERT INTO Switches(switchName) VALUES
('Alpaca Linear'),
('C3 Equalz X TKC Tangerine Dark Green'), 
('C3 Equalz X TKC Tangerine Light Green'), 
('C3 Equalz X TKC Banana Split'), 
('Gateron Ink Black'), 
('NK Cream'), 
('SP Star Meteor White'), 
('Zeal Tealio V2'), 
('Akko CS Rose Red'), 
('Drop Invyr Holy Panda'), 
('Everglide Dark Jade'),
('Hako True'), 
('NK Blueberry'), 
('Tecsee Purple Panda'), 
('Alpaca Silent Linear'), 
('Durock Dolphin'), 
('Gateron Silent Ink Black');


-- -------------------------------------------------------------------------

-- Table structure for table Keycaps
DROP TABLE IF EXISTS Keycaps;
CREATE TABLE Keycaps(
    keycapID INT(11) AUTO_INCREMENT PRIMARY KEY, 
    keycapName VARCHAR(255) NOT NULL
);

INSERT INTO Keycaps(keycapName) VALUES
('Drop + MiTo GMK Laser'),
('GMK White on Black'),
('ePBT Black on White'), 
('GMK Fuyu'), 
('GMK Olivia'),
('Tai-Hao PBT Double Shot- Dark Gray/Black'),
('NP PBT Blank Keycaps'), 
('NP PBT Crayon Milky White'), 
('YDMK Rainbow Carbon Sunset');

-- -------------------------------------------------------------------------

-- Table structure for table Builds

DROP TABLE IF EXISTS Builds;
CREATE TABLE Builds(
    buildID INT(11) AUTO_INCREMENT PRIMARY KEY,
    buildName VARCHAR(255) NOT NULL,
    caseID INT(11) NOT NULL,
    pcbID INT(11) NOT NULL, 
    plateID INT(11) NOT NULL,
    switchID INT(11) NOT NULL,
    keycapID INT(11) NOT NULL,
    FOREIGN KEY (caseID) REFERENCES Cases(caseID), 
    FOREIGN KEY (pcbID) REFERENCES Pcbs(pcbID), 
    FOREIGN KEY (plateID) REFERENCES Plates(plateID), 
    FOREIGN KEY (switchID) REFERENCES Switches(switchID), 
    FOREIGN KEY (keycapID) REFERENCES Keycaps(keycapID)
);


INSERT INTO Builds (buildName, caseID, pcbID, plateID, switchID, keycapID) 
VALUES ('Sample Build', 1, 1, 1, 4, 5);