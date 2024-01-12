-- FILTERING DATA

SELECT * FROM Orders WHERE Cost <= 250;

SELECT * FROM Orders WHERE Cost > 50 AND Cost < 750;

SELECT * FROM Orders WHERE ClientID = "Cl3" and Cost > 100; 

SELECT * FROM Orders WHERE ProductID = "P1" OR ProductID = "P2" AND Quantity > 2;


-- PRACTICE USING JOINS

SELECT Customers.FullName, Customers.PhoneNumber, Bookings.BookingDate, Bookings.NumberOfGuests 
FROM Customers INNER JOIN Bookings 
ON Customers.CustomerID = Bookings.CustomerID;

SELECT Customers.CustomerID, Bookings.BookingID 
FROM Customers LEFT JOIN Bookings 
ON Customers.CustomerID = Bookings.CustomerID;


-- GROUPING DATA

SELECT OrderDate FROM Orders GROUP BY OrderDate;

SELECT OrderDate,COUNT(OrderID) FROM Orders GROUP BY OrderDate;

SELECT Department, SUM(OrderQty) FROM Orders GROUP BY Department;

SELECT OrderDate,COUNT(OrderID) FROM Orders GROUP BY OrderDate HAVING OrderDate BETWEEN '2022-06-01' AND '2022-06-30';