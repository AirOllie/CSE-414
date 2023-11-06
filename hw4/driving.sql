CREATE TABLE InsuranceCo (
    name VARCHAR(256) PRIMARY KEY,
    phone INT,
);

CREATE TABLE Person (
    ssn INT PRIMARY KEY,
    name VARCHAR(256),
);

CREATE TABLE Driver (
    ssn INT PRIMARY KEY,
    driverID INT,
    FOREIGN KEY (ssn) REFERENCES Person(ssn)
);

CREATE TABLE NonProfessionalDriver (
    driverID INT,
    FOREIGN KEY (driverID) REFERENCES Driver(driverID)
);

CREATE TABLE ProfessionalDriver (
    driverID INT,
    medicalHistory VARCHAR(256),
    FOREIGN KEY (driverID) REFERENCES Driver(driverID)
);

CREATE TABLE Vehicle (
    liscensePlate VARCHAR(256) PRIMARY KEY,
    year INT,
    maxLiability REAL,
    ownerSsn INT,
    insuranceName VARCHAR(256),
    FOREIGN KEY (ownerSsn) REFERENCES Person(ssn),
    FOREIGN KEY (insuranceName) REFERENCES InsuranceCo(name)
);

CREATE TABLE Car (
    liscensePlate VARCHAR(256) PRIMARY KEY,
    make VARCHAR(256),
    driverID INT,
    FOREIGN KEY (liscensePlate) REFERENCES Vehicle(liscensePlate),
    FOREIGN KEY (driverID) REFERENCES NonProfessionalDriver(driverID)
);

CREATE TABLE Truck (
    liscensePlate VARCHAR(256) PRIMARY KEY,
    capacity INT,
    driverID INT,
    FOREIGN KEY (liscensePlate) REFERENCES Vehicle(liscensePlate),
    FOREIGN KEY (driverID) REFERENCES ProfessionalDriver(driverID)
);


