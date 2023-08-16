-- Create a new database called Military_Equipment_Management_System.
CREATE DATABASE Military_Equipment_Management_System;

-- Use the newly created database.
USE Military_Equipment_Management_System;

-- Define the database entities with their respective attributes.

-- Table for storing information about military equipment.
CREATE TABLE MilitaryEquipment (
    EquipmentID INT PRIMARY KEY,             -- Unique identifier for each equipment.
    Name VARCHAR(100),                      -- Name of the equipment.
    Type VARCHAR(50),                       -- Type or category of the equipment.
    Manufacturer VARCHAR(100),               -- Manufacturer of the equipment.
    Price NUMERIC,							-- Price of the equipment.
    StockQuantity INT,                      -- Number of items in stock.
    Description TEXT,                       -- Description of the equipment.
    Specifications TEXT,                    -- Specifications of the equipment.
    CategoryID INT,                         -- Foreign key referencing EquipmentCategories table.
    FOREIGN KEY (CategoryID) REFERENCES EquipmentCategories(CategoryID) -- Establishing a relationship with EquipmentCategories table.
);

-- Table for storing information about equipment suppliers.
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,              -- Unique identifier for each supplier.
    Name VARCHAR(255),                       -- Name of the supplier.
    ContactInformation VARCHAR(255),         -- Contact information for the supplier.
    ContractTerms TEXT                       -- Terms of contract with the supplier.
);

-- Table for storing information about orders placed for equipment.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,                 -- Unique identifier for each order.
    SupplierID INT,                          -- Foreign key referencing Suppliers table.
    OrderDate DATE,                          -- Date when the order was placed.
    ExpectedDeliveryDate DATE,               -- Expected delivery date of the order.
    OrderStatus VARCHAR(50),                 -- Status of the order.
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) -- Establishing a relationship with Suppliers table.
);

-- Table for storing information about military units.
CREATE TABLE MilitaryUnits (
    UnitID INT PRIMARY KEY,                  -- Unique identifier for each military unit.
    UnitName VARCHAR(255),                   -- Name of the military unit.
    Location VARCHAR(255)                    -- Location of the military unit.
);

-- Table for storing information about equipment categories.
CREATE TABLE EquipmentCategories (
    CategoryID INT PRIMARY KEY,              -- Unique identifier for each category.
    CategoryName VARCHAR(255)                -- Name of the category.
);

-- Table for storing maintenance records of equipment.
CREATE TABLE MaintenanceRecords (
    MaintenanceID INT PRIMARY KEY,           -- Unique identifier for each maintenance record.
    EquipmentID INT,                         -- Foreign key referencing MilitaryEquipment table.
    MaintenanceDate DATE,                   -- Date when the maintenance was performed.
    Description TEXT,                        -- Description of the maintenance.
    FOREIGN KEY (EquipmentID) REFERENCES MilitaryEquipment(EquipmentID) -- Establishing a relationship with MilitaryEquipment table.
);

-- Table for storing user information.
CREATE TABLE Users (
    UserID INT PRIMARY KEY,                  -- Unique identifier for each user.
    Username VARCHAR(50),                    -- Username of the user.
    Password VARCHAR(255),                   -- Password of the user.
    Role VARCHAR(50)                         -- Role or privilege level of the user.
);

-- Table for storing information about issued equipment.
CREATE TABLE IssuedEquipment (
    IssuedID INT PRIMARY KEY,                -- Unique identifier for each issued equipment record.
    EquipmentID INT,                         -- Foreign key referencing MilitaryEquipment table.
    UnitID INT,                              -- Foreign key referencing MilitaryUnits table.
    IssuedDate DATE,                         -- Date when the equipment was issued.
    Recipient VARCHAR(255),                  -- Recipient of the equipment.
    ReturnDate DATE,                         -- Date when the equipment was returned.
    FOREIGN KEY (EquipmentID) REFERENCES MilitaryEquipment(EquipmentID), -- Establishing a relationship with MilitaryEquipment table.
    FOREIGN KEY (UnitID) REFERENCES MilitaryUnits(UnitID)                -- Establishing a relationship with MilitaryUnits table.
);

-- Table for storing various types of reports.
CREATE TABLE Reports (
    ReportID INT PRIMARY KEY,                -- Unique identifier for each report.
    ReportType VARCHAR(50),                  -- Type of the report.
    GeneratedByUserID INT,                   -- Foreign key referencing Users table.
    GenerationDate DATE,                     -- Date when the report was generated.
    FOREIGN KEY (GeneratedByUserID) REFERENCES Users(UserID) -- Establishing a relationship with Users table.
);
-- Insert 10 records into the MilitaryEquipment table.
INSERT INTO MilitaryEquipment (EquipmentID, Name, Type, Manufacturer, Price, StockQuantity, Description, Specifications, CategoryID)
VALUES
    (1, 'M16A4 Rifle', 'Firearm', 'XYZ Firearms', 800.00, 50, 'Standard issue rifle', 'Caliber: 5.56mm', 1),
    (2, 'M1 Abrams Tank', 'Tank', 'Armored Vehicles Ltd.', 5000000.00, 10, 'Main battle tank', 'Weight: 63 tons', 2),
    (3, 'AN/PRC-152 Radio', 'Communication', 'SecureComms Systems', 1200.00, 30, 'Portable communication device', 'Frequency Range: 30-512 MHz', 3),
    (4, 'MICH Helmet', 'Protective Gear', 'SafetyGear Corp.', 150.00, 100, 'Advanced combat helmet', 'Protection Level: NIJ IIIA', 4),
    (5, 'F-22 Raptor', 'Aircraft', 'AirForce Supplies', 150000000.00, 5, 'Advanced stealth fighter', 'Max Speed: Mach 2', 5),
    (6, 'M984 HEMTT', 'Truck', 'LogiTrans Logistics', 250000.00, 20, 'Heavy Expanded Mobility Tactical Truck', 'Payload Capacity: 13 tons', 6),
    (7, 'Field Medic Kit', 'Medical', 'MediTech Solutions', 3000.00, 40, 'Medical supplies for field medics', 'Includes trauma gear', 7),
    (8, 'Surveillance Drone', 'Drone', 'DroneTech Innovations', 10000.00, 15, 'Unmanned surveillance drone', 'Flight Time: 2 hours', 9),
    (9, 'AN/SPY-1 Radar', 'Radar', 'RadarTech Systems', 50000000.00, 3, 'Shipborne radar system', 'Detection Range: 200+ km', 10),
    (10, 'M249 SAW', 'Firearm', 'XYZ Firearms', 1500.00, 25, 'Light machine gun', 'Caliber: 5.56mm', 1);

-- Insert 10 records into the EquipmentCategories table.
INSERT INTO EquipmentCategories (CategoryID, CategoryName)
VALUES
    (1, 'Weapons'),
    (2, 'Vehicles'),
    (3, 'Communication'),
    (4, 'Protective Gear'),
    (5, 'Aircraft'),
    (6, 'Logistics'),
    (7, 'Medical'),
    (8, 'Surveillance'),
    (9, 'Drones'),
    (10, 'Radar Systems');

-- Insert 10 records into the Suppliers table.
INSERT INTO Suppliers (SupplierID, Name, ContactInformation, ContractTerms)
VALUES
    (1, 'TechDefense Inc.', 'info@techdefense.com', 'Net 30 payment terms'),
    (2, 'Armored Vehicles Ltd.', 'sales@armoredvehicles.com', '10% discount on orders above $50,000'),
    (3, 'SecureComms Systems', 'support@securecomms.com', '2-year contract'),
    (4, 'SafetyGear Corp.', 'sales@safetygearcorp.com', 'Free training on usage'),
    (5, 'AirForce Supplies', 'orders@airforcesupplies.com', 'Exclusive military discounts'),
    (6, 'LogiTrans Logistics', 'info@logitrans.com', 'Guaranteed on-time delivery'),
    (7, 'MediTech Solutions', 'info@meditechsolutions.com', 'Medical equipment servicing included'),
    (8, 'SurveillanceTech', 'sales@surveillancetech.com', 'Customized surveillance solutions'),
    (9, 'DroneTech Innovations', 'support@dronetech.com', 'Free software updates'),
    (10, 'RadarTech Systems', 'info@radartech.com', 'Advanced training for radar operators');

-- Insert 10 records into the MilitaryUnits table.
INSERT INTO MilitaryUnits (UnitID, UnitName, Location)
VALUES
    (1, 'Alpha Company', 'Fort Alpha, Country A'),
    (2, 'Bravo Battalion', 'Camp Bravo, Country B'),
    (3, 'Delta Squadron', 'Airbase Delta, Country C'),
    (4, 'Foxtrot Platoon', 'Base Foxtrot, Country D'),
    (5, 'Tango Division', 'Camp Tango, Country E'),
    (6, 'Echo Squadron', 'Naval Base Echo, Country F'),
    (7, 'Ranger Regiment', 'Outpost Ranger, Country G'),
    (8, 'Swift Brigade', 'Camp Swift, Country H'),
    (9, 'Airborne Unit', 'Airbase Airborne, Country I'),
    (10, 'Marine Expeditionary Force', 'Base Marine, Country J');

-- Insert 10 records into the Users table.
INSERT INTO Users (UserID, Username, Password, Role)
VALUES
    (1, 'admin', 'admin123', 'Administrator'),
    (2, 'operator1', 'op123', 'Operator'),
    (3, 'operator2', 'op456', 'Operator'),
    (4, 'manager1', 'manager123', 'Manager'),
    (5, 'manager2', 'manager456', 'Manager'),
    (6, 'analyst1', 'analyst123', 'Analyst'),
    (7, 'analyst2', 'analyst456', 'Analyst'),
    (8, 'technician1', 'tech123', 'Technician'),
    (9, 'technician2', 'tech456', 'Technician'),
    (10, 'guest', 'guest123', 'Guest');

-- Insert 10 records into the Orders table.
INSERT INTO Orders (OrderID, SupplierID, OrderDate, ExpectedDeliveryDate, OrderStatus)
VALUES
    (1, 1, '2023-08-01', '2023-08-15', 'Pending'),
    (2, 2, '2023-08-02', '2023-08-18', 'Processing'),
    (3, 3, '2023-08-03', '2023-08-20', 'Shipped'),
    (4, 4, '2023-08-04', '2023-08-22', 'Delivered'),
    (5, 5, '2023-08-05', '2023-08-25', 'Pending'),
    (6, 6, '2023-08-06', '2023-08-28', 'Processing'),
    (7, 7, '2023-08-07', '2023-08-30', 'Shipped'),
    (8, 8, '2023-08-08', '2023-09-02', 'Processing'),
    (9, 9, '2023-08-09', '2023-09-05', 'Pending'),
    (10, 10, '2023-08-10', '2023-09-08', 'Delivered');

-- Insert 10 records into the MaintenanceRecords table.
INSERT INTO MaintenanceRecords (MaintenanceID, EquipmentID, MaintenanceDate, Description)
VALUES
    (1, 1, '2023-08-05', 'Routine cleaning and inspection'),
    (2, 3, '2023-08-07', 'Software update and functionality test'),
    (3, 5, '2023-08-10', 'Engine maintenance and calibration'),
    (4, 7, '2023-08-12', 'Restocking medical supplies'),
    (5, 9, '2023-08-15', 'Antenna replacement'),
    (6, 2, '2023-08-18', 'Track alignment and maintenance'),
    (7, 4, '2023-08-20', 'Helmet integrity check'),
    (8, 6, '2023-08-22', 'Oil change and general maintenance'),
    (9, 8, '2023-08-25', 'Camera calibration and battery check'),
    (10, 10, '2023-08-28', 'Barrel replacement and cleaning');

-- Insert 10 records into the IssuedEquipment table.
INSERT INTO IssuedEquipment (IssuedID, EquipmentID, UnitID, IssuedDate, Recipient, ReturnDate)
VALUES
    (1, 1, 1, '2023-08-02', 'Soldier A', '2023-08-12'),
    (2, 2, 2, '2023-08-04', 'Tank Crew 1', '2023-08-14'),
    (3, 3, 3, '2023-08-06', 'Operator X', '2023-08-16'),
    (4, 4, 4, '2023-08-08', 'Medic Z', '2023-08-18'),
    (5, 5, 5, '2023-08-10', 'Pilot P', '2023-08-20'),
    (6, 6, 6, '2023-08-12', 'Logistics Officer L', '2023-08-22'),
    (7, 7, 7, '2023-08-14', 'Medic Y', '2023-08-24'),
    (8, 8, 8, '2023-08-16', 'Surveillance Operator S', '2023-08-26'),
    (9, 9, 9, '2023-08-18', 'Radar Technician R', '2023-08-28'),
    (10, 10, 10, '2023-08-20', 'Soldier B', '2023-08-30');

-- Insert 10 records into the Reports table.
INSERT INTO Reports (ReportID, ReportType, GeneratedByUserID, GenerationDate)
VALUES
    (1, 'Inventory', 6, '2023-08-15'),
    (2, 'Usage Analysis', 7, '2023-08-16'),
    (3, 'Maintenance Log', 8, '2023-08-17'),
    (4, 'Supply Chain', 9, '2023-08-18'),
    (5, 'Unit Deployment', 10, '2023-08-19'),
    (6, 'Budget Allocation', 6, '2023-08-20'),
    (7, 'Security Audit', 7, '2023-08-21'),
    (8, 'Training Report', 8, '2023-08-22'),
    (9, 'Surveillance Analysis', 9, '2023-08-23'),
    (10, 'Equipment Performance', 10, '2023-08-24');

	-- Display all records from the MilitaryEquipment table.
SELECT * FROM MilitaryEquipment;
	-- Display all records from the EquipmentCategories table.
SELECT * FROM EquipmentCategories;

-- Display all records from the Suppliers table.
SELECT * FROM Suppliers;

-- Display all records from the MilitaryUnits table.
SELECT * FROM MilitaryUnits;

-- Display all records from the Users table.
SELECT * FROM Users;

-- Display all records from the Orders table.
SELECT * FROM Orders;

-- Display all records from the MaintenanceRecords table.
SELECT * FROM MaintenanceRecords; 

-- Display all records from the IssuedEquipment table.
SELECT * FROM IssuedEquipment;

-- Display all records from the Reports table.
SELECT * FROM Reports;


-- QUERRIES --

-- Retrieve all equipment from a specific category:
SELECT *
FROM MilitaryEquipment
WHERE CategoryID = 1; -- Replace with the desired category ID

-- Retrieve issued equipment information for a specific military unit:
SELECT ME.Name, IE.IssuedDate, IE.ReturnDate, IE.Recipient
FROM MilitaryEquipment AS ME
JOIN IssuedEquipment AS IE ON ME.EquipmentID = IE.EquipmentID
WHERE IE.UnitID = 3; -- Replace with the desired unit ID

-- Retrieve maintenance records for a specific equipment:
SELECT ME.Name, MR.MaintenanceDate, MR.Description
FROM MilitaryEquipment AS ME
JOIN MaintenanceRecords AS MR ON ME.EquipmentID = MR.EquipmentID
WHERE ME.EquipmentID = 5; -- Replace with the desired equipment ID

-- Retrieve orders along with supplier information:
SELECT O.OrderID, S.Name AS SupplierName, O.OrderDate, O.ExpectedDeliveryDate, O.OrderStatus
FROM Orders AS O
JOIN Suppliers AS S ON O.SupplierID = S.SupplierID;

-- Retrieve a list of military units with their assigned equipment:
SELECT MU.UnitName, ME.Name AS EquipmentName, IE.IssuedDate, IE.ReturnDate, IE.Recipient
FROM MilitaryUnits AS MU
LEFT JOIN IssuedEquipment AS IE ON MU.UnitID = IE.UnitID
LEFT JOIN MilitaryEquipment AS ME ON IE.EquipmentID = ME.EquipmentID;

-- Retrieve maintenance records for equipment:
SELECT ME.Name AS EquipmentName, MR.MaintenanceDate, MR.Description
FROM MilitaryEquipment AS ME
JOIN MaintenanceRecords AS MR ON ME.EquipmentID = MR.EquipmentID;

-- Retrieve user information:
SELECT UserID, Username, Role
FROM Users;

-- Retrieve equipment with low stock quantity:
SELECT Name, StockQuantity
FROM MilitaryEquipment
WHERE StockQuantity < 10; -- Adjust the threshold as needed

-- Retrieve issued equipment that hasn't been returned yet:
SELECT ME.Name AS EquipmentName, MU.UnitName, IE.IssuedDate, IE.Recipient
FROM IssuedEquipment AS IE
JOIN MilitaryEquipment AS ME ON IE.EquipmentID = ME.EquipmentID
JOIN MilitaryUnits AS MU ON IE.UnitID = MU.UnitID
WHERE IE.ReturnDate IS NULL;

-- Retrieve equipment sorted by price in descending order:
SELECT Name, Price
FROM MilitaryEquipment
ORDER BY Price DESC;

-- Retrieve a report on equipment category-wise count:
SELECT EC.CategoryName, COUNT(*) AS EquipmentCount
FROM MilitaryEquipment AS ME
JOIN EquipmentCategories AS EC ON ME.CategoryID = EC.CategoryID
GROUP BY EC.CategoryName;

-- Retrieve orders along with supplier contact information:
SELECT O.OrderID, S.Name AS SupplierName, S.ContactInformation, O.OrderDate, O.OrderStatus
FROM Orders AS O
JOIN Suppliers AS S ON O.SupplierID = S.SupplierID;


-- Rename the 'EquipmentIssuance' table to 'IssuanceHistory'
EXEC sp_rename 'IssuedEquipment', 'IssuanceHistory';


-- Change the data type of the 'description' column in Equipment table
ALTER TABLE MilitaryEquipment
ALTER COLUMN description VARCHAR(1000);

-- Remove the 'obsolete' column from the Equipment table
ALTER TABLE MilitaryEquipment
DROP COLUMN Specifications;
