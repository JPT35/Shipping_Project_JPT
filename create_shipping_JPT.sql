DROP DATABASE IF EXISTS shipping;

CREATE DATABASE shipping;

USE shipping;


CREATE TABLE ports(

portName VARCHAR(50)NOT NULL,
cityLocated VARCHAR(50)NOT NULL,
countryLocated VARCHAR(50)NOT NULL,
PRIMARY KEY (portName, cityLocated, countryLocated)

);


CREATE TABLE ship
(shipName VARCHAR (50) PRIMARY KEY,

displacementTonnage DOUBLE NOT NULL,
captainName VARCHAR (20) NOT NULL,
numberOfCrew INT NOT NULL,
portName VARCHAR (50) NOT NULL,
cityLocated VARCHAR(50)NOT NULL,
countryLocated VARCHAR(50) NOT NULL,
yearBuilt YEAR NOT NULL,
FOREIGN KEY (portName, cityLocated, countryLocated) REFERENCES ports(portName, cityLocated, countryLocated)

);


CREATE TABLE container
(containerID CHAR (13) PRIMARY KEY,

heightInFeet DOUBLE NOT NULL,
widthInFeet DOUBLE NOT NULL,
lengthInFeet DOUBLE NOT NULL,
weightInPounds DOUBLE NOT NULL,
shipName VARCHAR (50),
FOREIGN KEY (shipName) REFERENCES ship(shipName)
);

