-- Data analysis in MySQL

SELECT CONCAT (SUM(Quantity), "(2020)") AS "P4 product: Quantity sold" FROM Orders WHERE YEAR (Date) = 2020 AND ProductID = "P4"
UNION 
SELECT CONCAT (SUM(Quantity), "(2021)") FROM Orders WHERE YEAR (Date) = 2021 AND ProductID = "P4"
UNION 
SELECT CONCAT (SUM(Quantity), "(2022)") FROM Orders WHERE YEAR (Date) = 2022 AND ProductID = "P4";

SELECT Clients.ClientID, Clients.ContactNumber, Addresses.Street, Addresses.County,  Orders.OrderID, Orders.ProductID, Products.ProductName, Orders.Cost, Orders.Date 
FROM Clients 
INNER JOIN Addresses ON Clients.AddressID = Addresses.AddressID 
INNER JOIN Orders ON Clients.ClientID = Orders.ClientID 
INNER JOIN Products ON Orders.ProductID = Products.ProductID 
WHERE YEAR (Orders.Date) = 2021 OR YEAR (Orders.Date) = 2022 ORDER BY Orders.Date;

CREATE FUNCTION FindSoldQuantity (product_id VARCHAR(10), YearInput INT) returns INT DETERMINISTIC RETURN (SELECT SUM(Quantity) FROM Orders WHERE ProductID = product_id AND YEAR (Date) = YearInput);
SELECT FindSoldQuantity ("P3", 2021);