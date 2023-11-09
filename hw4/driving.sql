DROP TABLE IF EXISTS Drives;
DROP TABLE IF EXISTS Car;
DROP TABLE IF EXISTS Truck;
DROP TABLE IF EXISTS Vehicle;
DROP TABLE IF EXISTS NonProfessionalDriver;
DROP TABLE IF EXISTS ProfessionalDriver;
DROP TABLE IF EXISTS Driver;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS InsuranceCo;

CREATE TABLE InsuranceCo (
    name VARCHAR(256) PRIMARY KEY,
    phone BIGINT
);

CREATE TABLE Person (
    ssn BIGINT PRIMARY KEY,
    name VARCHAR(256)
);

CREATE TABLE Driver (
    ssn BIGINT PRIMARY KEY,
    driverID BIGINT,
    FOREIGN KEY (ssn) REFERENCES Person
);

CREATE TABLE NonProfessionalDriver (
    ssn BIGINT PRIMARY KEY,
    FOREIGN KEY (ssn) REFERENCES Driver
);

CREATE TABLE ProfessionalDriver (
    ssn BIGINT PRIMARY KEY,
    medicalHistory VARCHAR(256),
    FOREIGN KEY (ssn) REFERENCES Driver
);

CREATE TABLE Vehicle (
    licensePlate VARCHAR(256) PRIMARY KEY,
    year INT,
    maxLiability REAL,
    ownerSSN BIGINT,
    insuranceName VARCHAR(256),
    FOREIGN KEY (ownerSSN) REFERENCES Person,
    FOREIGN KEY (insuranceName) REFERENCES InsuranceCo
);

CREATE TABLE Car (
    licensePlate VARCHAR(256) PRIMARY KEY,
    make VARCHAR(256),
    FOREIGN KEY (licensePlate) REFERENCES Vehicle
);

CREATE TABLE Truck (
    licensePlate VARCHAR(256) PRIMARY KEY,
    capacity INT,
    operatorSSN BIGINT,
    FOREIGN KEY (licensePlate) REFERENCES Vehicle,
    FOREIGN KEY (operatorSSN) REFERENCES ProfessionalDriver
);

CREATE TABLE Drives (
    carNo VARCHAR(256),
    driverSSN BIGINT,
    PRIMARY KEY (carNo, driverSSN),
    FOREIGN KEY (carNo) REFERENCES Car,
    FOREIGN KEY (driverSSN) REFERENCES NonProfessionalDriver
);

/*
Part 2(b):
The "insures" relationship in the E/R diagram is represented by the foreign key insuranceName 
in the Vehicle table, which references the primary key name in the InsuranceCo table. By 
referencing the name attribute in the InsuranceCo table, we can ensure that the insurance 
company exists in the database and that the vehicle is insured by a valid insurance company.
If we need to check the insurance company of a car or truck, we can reference the licensePlate
in the vehicle table, and then reference the insurance company.
*/

/*
Part 2(c):
In this schema, both Car and NonProfessionalDriver, and Truck and ProfessionalDriver have the
same primary key. However, the attribute Car and NonProfessionalDriver have different attributes
from Truck and ProfessionalDriver. For example, Car has the attribute make, while Truck has 
attribute capacity. Besides, a professional driver must have a medicalHistory, while a non-
professional driver does not.
*/