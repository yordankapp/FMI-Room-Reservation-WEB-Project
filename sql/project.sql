
DROP DATABASE IF EXISTS project;
CREATE DATABASE project;
USE project;

SET NAMES utf8;

CREATE TABLE building(
buildingName VARCHAR(100),
latitude DOUBLE,
longitude DOUBLE
);

CREATE TABLE room(
buildingName VARCHAR(100),
roomNumber VARCHAR(10),
type VARCHAR(50),
seats INTEGER,
responsiblePerson VARCHAR(100)
);

CREATE TABLE feature(
featureName VARCHAR(50),
iconCode CHAR(8)
);

CREATE TABLE reservation(
buildingName VARCHAR(100),
roomNumber VARCHAR(10),
reservedFrom DATETIME,
reservedTo DATETIME,
personWhoReserved VARCHAR(50),
subject VARCHAR(100)
);

CREATE TABLE roomfeature(
buildingName VARCHAR(100),
roomNumber VARCHAR(10),
featureName VARCHAR(30)
);

----- Constraints -----
ALTER TABLE building ADD CONSTRAINT pk_building PRIMARY KEY(buildingName);

ALTER TABLE room ADD CONSTRAINT pk_room PRIMARY KEY(buildingName, roomNumber);

ALTER TABLE feature ADD CONSTRAINT pk_feature PRIMARY KEY(featureName);

ALTER TABLE reservation ADD CONSTRAINT pk_reservation PRIMARY KEY(buildingName, roomNumber, reservedFrom, reservedTo);

ALTER TABLE roomfeature ADD CONSTRAINT pk_roomfeature PRIMARY KEY(buildingName, roomNumber, featureName);

----- Building Data ----
INSERT INTO building 
	VALUES('ФМИ', 42.674735, 23.330535);
    
INSERT INTO building 
	VALUES('ФХФ', 42.674929, 23.332668);    

INSERT INTO building 
	VALUES('ФЗФ', 42.674038, 23.329663);
    
INSERT INTO building 
	VALUES('Ректорат', 42.674735, 23.334752);
  
---- Features Data ----
INSERT INTO feature
	VALUES('Проектор', '&#xf03d;');
    
INSERT INTO feature 
	VALUES('Компютър', '&#xf108;');

INSERT INTO room
    VALUES('ФХФ', '210', 'Семинарна зала', 200, 'Милен Петров');

INSERT INTO room
    VALUES('ФМИ', '325', 'Семинарна зала', 100, 'Тинко Тинчев');

INSERT INTO reservation
	VALUES('ФМИ', '200', '2020-01-01 10:10:10','2020-01-01 11:10:10','Милен Петров','Web');
