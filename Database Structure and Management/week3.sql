-- Working with MySQL functions 

SELECT CONCAT(LCASE(Name),'-',Quantity,'-', UCASE(OrderStatus)) 
FROM item,mg_orders 
WHERE item.ItemID = mg_orders.ItemID;

SELECT DATE_FORMAT(DeliveryDate,'%W') FROM mg_orders; 

SELECT OrderID, ROUND((Cost * 5 / 100),2) AS HandlingCost FROM mg_orders;

SELECT DATE_FORMAT(DeliveryDate,'%W') FROM mg_orders WHERE !ISNULL(DeliveryDate);

-- Practicing with functions

SELECT ClientID, OrderID, CEIL((Cost -(Cost * 5 /100))) AS afterDiscount 
FROM client_orders
WHERE ItemID = 4;

SELECT ClientID, OrderID, FORMAT ((Cost -(Cost * 5 /100)), 2) AS afterDiscount 
FROM client_orders
WHERE ItemID = 4;

SELECT ADDDATE(OrderDate,INTERVAL 30 DAY) AS ExpectedDelDate 
FROM mg_orders;

SELECT ADDDATE(OrderDate,30) AS ExpectedDelDate FROM mg_orders;

SELECT OrderID, ItemID, Quantity, Cost, OrderDate,COALESCE (DeliveryDate,'NOT DELIVERED'), OrderStatus 
FROM mg_orders;

SELECT OrderID, NULLIF(OrderStatus,'In Progress') AS status 
FROM mg_orders;

-- Working with procedures

CREATE PROCEDURE GetOrdersData ()  SELECT * FROM Orders; 
CALL GetOrdersData(); 

CREATE PROCEDURE GetListOfOrdersInRange (MinimumValue DECIMAL, MaximumValue DECIMAL) SELECT * FROM Orders WHERE Cost >= MinimumValue AND Cost <= MaximumValue;
CALL GetListOfOrdersInRange (150, 600);