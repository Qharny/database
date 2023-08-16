-- Use the newly created database.
USE Military_Equipment_Management_System;

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











-- Retrieve detailed information about a specific piece of equipment
SELECT * FROM Equipment
WHERE equipment_id = 'E123';

-- List all equipment in a specific category and subcategory
SELECT * FROM Equipment
WHERE category = 'Firearms' AND subcategory = 'Rifles';

-- Retrieve information about orders placed with their current status
SELECT Order.order_id, Supplier.supplier_name, Order.order_date, Order.expected_delivery_date, Order.order_status
FROM Order
JOIN Supplier ON Order.supplier_id = Supplier.supplier_id;

-- Update stock quantity of a specific equipment item after an order is received
UPDATE Equipment
SET stock_quantity = stock_quantity + 10
WHERE equipment_id = 'E123';

-- Retrieve equipment issuance records for a specific military unit
SELECT EquipmentIssuance.*, MilitaryUnit.unit_name
FROM EquipmentIssuance
JOIN MilitaryUnit ON EquipmentIssuance.unit_id = MilitaryUnit.unit_id
WHERE unit_id = 'M456';

-- Retrieve maintenance history for a specific piece of equipment
SELECT Maintenance.maintenance_date, Maintenance.maintenance_type, Maintenance.maintenance_description
FROM Maintenance
WHERE equipment_id = 'E123';

-- Calculate the average delivery time for each supplier
SELECT Supplier.supplier_name, AVG(DATEDIFF(day, Order.order_date, Order.expected_delivery_date)) AS avg_delivery_time
FROM Supplier
JOIN Order ON Supplier.supplier_id = Order.supplier_id
GROUP BY Supplier.supplier_name;


-- Calculate the average delivery time for each supplier
SELECT Supplier.supplier_name, AVG(DATEDIFF(day, Order.order_date, Order.expected_delivery_date)) AS avg_delivery_time
FROM Supplier
JOIN Order ON Supplier.supplier_id = Order.supplier_id
GROUP BY Supplier.supplier_name;
