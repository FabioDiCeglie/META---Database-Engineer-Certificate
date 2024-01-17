-- SELECT Statement


SELECT OrderID, ProductID, Quantity, Date 
FROM Orders;

---

SELECT * 
FROM Orders 
WHERE ClientID='Cl1';

CREATE INDEX IdxClientID ON Orders(ClientID);
EXPLAIN SELECT * 
FROM Orders 
WHERE ClientID='Cl1';

---

SELECT * 
FROM Employees 
WHERE FullName LIKE '%Tolo';

ALTER TABLE Employees ADD COLUMN ReverseFullName VARCHAR(255); -- Add the ReverseFullName column
UPDATE Employees
SET ReverseFullName = CONCAT(
    SUBSTRING_INDEX(FullName, ' ', -1),  -- Extract last name
    ' ',                                 -- Add a space
    SUBSTRING_INDEX(FullName, ' ', 1)   -- Extract first name
);

CREATE INDEX IdxReverseFullName ON Employees (ReverseFullName); -- Index

SELECT * 
FROM Employees 
WHERE ReverseFullName LIKE 'Tolo%';


--

--- MySQL Optimization Techniques

WITH 
CL1_Orders AS (SELECT CONCAT("Cl1: ", COUNT(OrderID), "orders") AS "Total number of orders"  
FROM Orders 
WHERE YEAR(Date) = 2022 AND ClientID = "Cl1"), 
CL2_Orders AS (SELECT  CONCAT("Cl2: ", COUNT(OrderID), "orders") 
FROM Orders WHERE YEAR(Date) = 2022 AND ClientID = "Cl2"), 
CL3_Orders AS (SELECT  CONCAT("Cl3: ", COUNT(OrderID), "orders") 
FROM Orders WHERE YEAR(Date) = 2022 AND ClientID = "Cl3") 
SELECT * FROM CL1_Orders
UNION 
SELECT * FROM CL2_Orders
UNION 
SELECT * FROM CL3_Orders; 

PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, Cost, Date FROM Orders WHERE ClientID = ? AND YEAR(Date) = ? ';
EXECUTE GetOrderDetail USING 1,2022;

SELECT Activity.Properties ->>'$.ProductID' 
AS ProductID, Products.ProductName, Products.BuyPrice, Products.SellPrice 
FROM Products INNER JOIN Activity 
ON Products.ProductID = Activity.Properties ->>'$.ProductID' 
WHERE Activity.Properties ->>'$.Order' = "True";