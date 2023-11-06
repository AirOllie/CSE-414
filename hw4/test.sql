-- Insert data into InsuranceCo table
INSERT INTO InsuranceCo (name, phone) VALUES
    ('ABC Insurance', 1234567890),
    ('XYZ Insurance', 9876543210);

-- Insert data into Person table
INSERT INTO Person (ssn, name) VALUES
    (111223333, 'John Doe'),
    (222334444, 'Jane Smith'),
    (333445555, 'Bob Johnson');

-- Insert data into Driver table
INSERT INTO Driver (driverID, ssn) VALUES
    (1001, 111223333),
    (1002, 222334444),
    (1003, 333445555);

-- Insert data into NonProfessionalDriver table
INSERT INTO NonProfessionalDriver (driverSSN) VALUES
    (111223333),
    (222334444);

-- Insert data into ProfessionalDriver table
INSERT INTO ProfessionalDriver (driverSSN, medicalHistory) VALUES
    (333445555, 'Good health');

-- Insert data into Vehicle table
INSERT INTO Vehicle (licensePlate, year, maxLiability, ownerSSN, insuranceName) VALUES
    ('ABC123', 2020, 50000.00, 111223333, 'ABC Insurance'),
    ('XYZ789', 2018, 75000.00, 222334444, 'XYZ Insurance');

-- Insert data into Car table
INSERT INTO Car (licensePlate, make) VALUES
    ('ABC123', 'Toyota');

-- Insert data into Truck table
INSERT INTO Truck (licensePlate, capacity) VALUES
    ('XYZ789', 5000);
