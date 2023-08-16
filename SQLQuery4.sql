-- QUERY --
-- Retrieve detailed information about a specific piece of military equipment by its unique ID
SELECT * FROM Equipment
WHERE equipment_id = 'E123';

-- Retrieve a list of all equipment categories and subcategories
SELECT * FROM EquipmentCategories;

-- Search for all military equipment of a specific type (e.g., weapons)
SELECT * FROM Equipment
WHERE equipment_type = 'Weapons';

-- Retrieve information about a specific equipment supplier by their ID
SELECT * FROM Suppliers
WHERE supplier_id = 'S456';

-- Retrieve information about an order by its ID
SELECT * FROM Orders
WHERE order_id = 'O789';

-- List all military equipment with their current stock quantities
SELECT equipment_name, stock_quantity
FROM Equipment;

-- Retrieve equipment issuance history for a specific military unit
SELECT issuance_date, recipient, return_date
FROM EquipmentIssuance
WHERE military_unit_id = 'MU101';

-- Retrieve maintenance schedule for a specific piece of equipment
SELECT maintenance_date, maintenance_description
FROM EquipmentMaintenance
WHERE equipment_id = 'E234';

-- Generate a report on supplier performance, showing the number of orders placed with each supplier
SELECT s.supplier_id, s.supplier_name, COUNT(o.supplier_id) AS order_count
FROM Suppliers s
LEFT JOIN Orders o ON s.supplier_id = o.supplier_id
GROUP BY s.supplier_id, s.supplier_name;

-- Display all pending orders that have not been delivered yet
SELECT * FROM Orders
WHERE order_status = 'Pending';
