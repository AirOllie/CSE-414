DROP TABLE IF EXISTS NonProfessionalDriver;
DROP TABLE IF EXISTS ProfessionalDriver;
DROP TABLE IF EXISTS Car;
DROP TABLE IF EXISTS Truck;
DROP TABLE IF EXISTS Driver;
DROP TABLE IF EXISTS Vehicle;
DROP TABLE IF EXISTS InsuranceCo;
DROP TABLE IF EXISTS Person;

CREATE TABLE InsuranceCo (
    name VARCHAR(256) PRIMARY KEY,
    phone BIGINT
);

CREATE TABLE Person (
    ssn BIGINT PRIMARY KEY,
    name VARCHAR(256)
);

CREATE TABLE Driver (
    driverID BIGINT PRIMARY KEY,
    ssn BIGINT,
    FOREIGN KEY (ssn) REFERENCES Person(ssn)
);

CREATE TABLE NonProfessionalDriver (
    driverID BIGINT PRIMARY KEY,
    FOREIGN KEY (driverID) REFERENCES Driver(driverID)
);

CREATE TABLE ProfessionalDriver (
    driverID BIGINT PRIMARY KEY,
    medicalHistory VARCHAR(256),
    FOREIGN KEY (driverID) REFERENCES Driver(driverID)
);

CREATE TABLE Vehicle (
    liscensePlate VARCHAR(256) PRIMARY KEY,
    year INT,
    maxLiability REAL,
    ownerSSN BIGINT,
    insuranceName VARCHAR(256),
    FOREIGN KEY (ownerSSN) REFERENCES Person(ssn),
    FOREIGN KEY (insuranceName) REFERENCES InsuranceCo(name)
);

CREATE TABLE Car (
    liscensePlate VARCHAR(256) PRIMARY KEY,
    make VARCHAR(256),
    driverID BIGINT,
    FOREIGN KEY (liscensePlate) REFERENCES Vehicle(liscensePlate),
    FOREIGN KEY (driverID) REFERENCES Driver(driverID)
);

CREATE TABLE Truck (
    liscensePlate VARCHAR(256) PRIMARY KEY,
    capacity INT,
    driverID BIGINT,
    FOREIGN KEY (liscensePlate) REFERENCES Vehicle(liscensePlate),
    FOREIGN KEY (driverID) REFERENCES Driver(driverID)
);

/*
Part 2(b):
The "insures" relationship in the E/R diagram is represented by the foreign key insuranceName 
in the Vehicle table, which references the primary key name in the InsuranceCo table. This is 
because each vehicle is insured by an insurance company, and the insuranceName attribute in 
the Vehicle table is used to store the name of the insurance company that insures the vehicle. 
By referencing the name attribute in the InsuranceCo table, we can ensure that the insurance 
company exists in the database and that the vehicle is insured by a valid insurance company.
If we need to check the insurance company of a car or truck, we can reference the licensePlate
in the vehicle table, and then track to the insurance company.
*/

/*
Part 2(c):
In this schema, the "drives" relationship is represented by a foreign key in the Car table 
that references the primary key in the NonProfessionalDriver table. This means that each car 
is associated with a non-professional driver, and the driverID attribute in the Car table is 
used to store the ID of the driver who drives the car. On the other hand, the "operates" 
relationship is represented by a foreign key in the Truck table that references the primary 
key in the ProfessionalDriver table. This means that each truck is associated with a 
professional driver, and the driverID attribute in the Truck table is used to store the ID 
of the driver who operates the truck.

The reason why they are different is that the "drives" relationship is between a car and a 
non-professional driver, while the "operates" relationship is between a truck and a 
professional driver. These are two different types of vehicles that require different types 
of drivers. A non-professional driver is someone who drives a car for personal use, while a 
professional driver is someone who operates a truck for commercial purposes. Therefore, it 
makes sense to represent these relationships differently in the schema.
*/