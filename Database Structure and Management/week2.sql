-- REPLACE statement

REPLACE INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) VALUES (9, "Cl1", "P1", 10, 5000), (10, "Cl2", "P2", 5, 100);

REPLACE INTO Orders SET OrderID = 9, ClientID = "Cl1", ProductID = "P1", Quantity = 10, Cost = 500;

-- Working with constraints

CREATE TABLE Clients (ClientID INT PRIMARY KEY, FullName VARCHAR(100) NOT NULL, PhoneNumber INT NOT NULL UNIQUE);

CREATE TABLE Items (ItemID INT PRIMARY KEY, ItemName VARCHAR(100) NOT NULL, Price DECIMAL(5,2) NOT NULL);

CREATE TABLE Orders ( 
OrderID INT PRIMARY KEY,  
ItemID INT NOT NULL,   
ClientID INT NOT NULL,   
Quantity INT NOT NULL CHECK (Quantity < 4),  
Cost DECIMAL(6,2) NOT NULL,  
FOREIGN KEY (ClientID) REFERENCES Clients (ClientID), 
FOREIGN KEY (ItemID) REFERENCES Items (ItemID) 
);

-- Changing table structure

CREATE TABLE Staff (StaffID INT, FullName VARCHAR(100), PhoneNumber VARCHAR(10));

ALTER TABLE Staff MODIFY StaffID INT PRIMARY KEY, MODIFY FullName VARCHAR(100) NOT NULL, MODIFY PhoneNumber INT NOT NULL; 

ALTER TABLE Staff ADD COLUMN Role VARCHAR(50) NOT NULL;

ALTER TABLE Staff DROP COLUMN PhoneNumber;

-- Working with subqueries

SELECT * FROM Bookings WHERE BookingSlot > (SELECT BookingSlot FROM Bookings WHERE GuestFirstName = 'Vanessa' AND GuestLastName = 'McCarthy');

SELECT * FROM MenuItems WHERE Price > ALL (SELECT Price FROM MenuItems WHERE Type IN ('Starters', 'Desserts')); 

SELECT * FROM MenuItems WHERE Price = (SELECT Price FROM Menus, MenuItems WHERE Menus.ItemID = MenuItems.ItemID AND MenuItems.Type = 'Starters' AND Cuisine = 'Italian'); 

SELECT * FROM MenuItems 
WHERE NOT EXISTS (SELECT * FROM TableOrders, Menus WHERE TableOrders.MenuID = Menus.MenuID AND Menus.ItemID = MenuItems.ItemID); 

-- Working with views in MySQL

CREATE VIEW OrdersView AS SELECT OrderID, Quantity, Cost FROM Orders; 

UPDATE OrdersView SET Cost = 200 WHERE OrderID = 2; 

RENAME TABLE OrdersView TO ClientsOrdersView;

DROP VIEW ClientsOrdersView; 