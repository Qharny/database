-- Normarlization


USE Military_Equipment_Management_System;

-- Table for storing information about equipment categories.
CREATE TABLE EquipmentCategories (
    CategoryID INT PRIMARY KEY,              -- Unique identifier for each category.
    CategoryName VARCHAR(255)                -- Name of the category.
);

INSERT INTO EquipmentCategories (CategoryID, CategoryName)
VALUES
    (1, 'Firearm'),
    (2, 'Tank'),
    (3, 'Communication'),
    (4, 'Protective Gear'),
    (5, 'Aircraft'),
    (6, 'Truck'),
    (7, 'Medical'),
    (8, 'Drone'),
    (9, 'Radar');

UPDATE MilitaryEquipment SET CategoryID = 1 WHERE EquipmentID IN (1, 10);
UPDATE MilitaryEquipment SET CategoryID = 2 WHERE EquipmentID = 2;
UPDATE MilitaryEquipment SET CategoryID = 3 WHERE EquipmentID = 3;
UPDATE MilitaryEquipment SET CategoryID = 4 WHERE EquipmentID = 4;
UPDATE MilitaryEquipment SET CategoryID = 5 WHERE EquipmentID = 5;
UPDATE MilitaryEquipment SET CategoryID = 6 WHERE EquipmentID = 6;
UPDATE MilitaryEquipment SET CategoryID = 7 WHERE EquipmentID = 7;
UPDATE MilitaryEquipment SET CategoryID = 8 WHERE EquipmentID = 8;
UPDATE MilitaryEquipment SET CategoryID = 9 WHERE EquipmentID = 9;


-- Table for storing information about equipment manufacturers.
CREATE TABLE Manufacturers (
    ManufacturerID INT PRIMARY KEY,           -- Unique identifier for each manufacturer.
    ManufacturerName VARCHAR(100)             -- Name of the manufacturer.
);

-- Table for storing information about equipment types.
CREATE TABLE EquipmentTypes (
    TypeID INT PRIMARY KEY,                   -- Unique identifier for each equipment type.
    TypeName VARCHAR(50)                      -- Name of the equipment type.
);

-- Table for storing information about equipment.
CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,              -- Unique identifier for each equipment.
    Name VARCHAR(100),                        -- Name of the equipment.
    ManufacturerID INT,                       -- Foreign key referencing Manufacturers table.
    Price DECIMAL(10, 2),                     -- Price of the equipment.
    Description TEXT,                         -- Description of the equipment.
    Specifications TEXT,                      -- Specifications of the equipment.
    TypeID INT,                               -- Foreign key referencing EquipmentTypes table.
    CategoryID INT,                           -- Foreign key referencing EquipmentCategories table.
    FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID),
    FOREIGN KEY (TypeID) REFERENCES EquipmentTypes(TypeID),
    FOREIGN KEY (CategoryID) REFERENCES EquipmentCategories(CategoryID)
);

-- Table for storing information about equipment suppliers.
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,               -- Unique identifier for each supplier.
    Name VARCHAR(255),                        -- Name of the supplier.
    ContactInformation VARCHAR(255),          -- Contact information for the supplier.
    ContractTerms TEXT                        -- Terms of contract with the supplier.
);

-- Table for storing information about military units.
CREATE TABLE MilitaryUnits (
    UnitID INT PRIMARY KEY,                   -- Unique identifier for each military unit.
    UnitName VARCHAR(255),                    -- Name of the military unit.
    Location VARCHAR(255)                     -- Location of the military unit.
);

-- Table for storing information about orders placed for equipment.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,                  -- Unique identifier for each order.
    SupplierID INT,                           -- Foreign key referencing Suppliers table.
    OrderDate DATE,                           -- Date when the order was placed.
    ExpectedDeliveryDate DATE,                -- Expected delivery date of the order.
    OrderStatus VARCHAR(50),                  -- Status of the order.
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Table for storing maintenance records of equipment.
CREATE TABLE MaintenanceRecords (
    MaintenanceID INT PRIMARY KEY,            -- Unique identifier for each maintenance record.
    EquipmentID INT,                          -- Foreign key referencing Equipment table.
    MaintenanceDate DATE,                    -- Date when the maintenance was performed.
    Description TEXT,                         -- Description of the maintenance.
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

-- Table for storing user information.
CREATE TABLE Users (
    UserID INT PRIMARY KEY,                   -- Unique identifier for each user.
    Username VARCHAR(50),                     -- Username of the user.
    Password VARCHAR(255),                    -- Password of the user.
    Role VARCHAR(50)                          -- Role or privilege level of the user.
);

-- Table for storing information about issued equipment.
CREATE TABLE IssuedEquipment (
    IssuedID INT PRIMARY KEY,                 -- Unique identifier for each issued equipment record.
    EquipmentID INT,                          -- Foreign key referencing Equipment table.
    UnitID INT,                               -- Foreign key referencing MilitaryUnits table.
    IssuedDate DATE,                          -- Date when the equipment was issued.
    Recipient VARCHAR(255),                   -- Recipient of the equipment.
    ReturnDate DATE,                          -- Date when the equipment was returned.
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID),
    FOREIGN KEY (UnitID) REFERENCES MilitaryUnits(UnitID)
);

-- Table for storing various types of reports.
CREATE TABLE ReportTypes (
    ReportTypeID INT PRIMARY KEY,             -- Unique identifier for each report type.
    ReportTypeName VARCHAR(50)                -- Name of the report type.
);

-- Table for storing generated reports.
CREATE TABLE Reports (
    ReportID INT PRIMARY KEY,                 -- Unique identifier for each report.
    ReportTypeID INT,                         -- Foreign key referencing ReportTypes table.
    GeneratedByUserID INT,                    -- Foreign key referencing Users table.
    GenerationDate DATE,                      -- Date when the report was generated.
    FOREIGN KEY (ReportTypeID) REFERENCES ReportTypes(ReportTypeID),
    FOREIGN KEY (GeneratedByUserID) REFERENCES Users(UserID)
);
