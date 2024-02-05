USE LittleLemonDB;
--
create view orders_view as select orderID, quantity, totalCost from Orders where quantity > 2;
Select * from orders_view;
--
SELECT c.customerID, c.name, o.orderID, o.totalCost, m.cusine, m.course
FROM customers c
JOIN orders o ON c.customerID = o.customerID
JOIN menus m ON o.menuID = m.menuID
ORDER BY o.totalCost;
--
SELECT cusine
FROM menus
WHERE menuID = ANY (
    SELECT menuID
    FROM orders
    GROUP BY menuID
    HAVING COUNT(*) > 2
);
--
DROP PROCEDURE IF EXISTS GetMaxQuantity;
CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(quantity) as max_quantity_in_order from orders;
CALL GetMaxQuantity();
--
PREPARE GetOrderDetail FROM 'SELECT orderID, quantity, totalCost FROM orders WHERE orderID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

--
DELIMITER //
CREATE PROCEDURE CancelOrder(IN orderId INT)
BEGIN
    DELETE FROM orders WHERE orderID = orderId;
END //
DELIMITER ;
CALL CancelOrder(1);
