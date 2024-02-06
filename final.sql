USE LittleLemonDB;

-- INSERT DATA
INSERT INTO bookings (bookingID, date, tableNumber)
VALUES (1, '2022-10-10', 5),(2, '2022-11-12',3),(3, '2022-10-11', 2), (4, '2022-10-13', 2);

select * from bookings;


-- CHECK BOOKING
DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER //

CREATE PROCEDURE CheckBooking(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    DECLARE bookingStatus VARCHAR(20);

    -- Check if the table is booked for the given date
    SELECT
        CASE
            WHEN COUNT(*) > 0 THEN 'Booked'
            ELSE 'Available'
        END
    INTO bookingStatus
    FROM bookings
    WHERE bookings.date = bookingDate AND bookings.tableNumber = tableNumber;

    -- Output the booking status
    SELECT bookingStatus AS BookingStatus;
END //

DELIMITER ;

CALL CheckBooking('2022-11-12', 3);


-- ADD VALID BOOKING
ALTER TABLE customers
DROP FOREIGN KEY bookingID;

ALTER TABLE bookings
MODIFY COLUMN bookingID INT AUTO_INCREMENT;

ALTER TABLE customers
ADD CONSTRAINT fk_bookingID FOREIGN KEY (bookingID) REFERENCES bookings(bookingID) ON UPDATE CASCADE;

DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    DECLARE tableStatus INT;

	Start transaction;

    select COUNT(*)
    into tableStatus
    from bookings
    where bookings.date = bookingDate and bookings.tableNumber = tableNumber;

    -- If the table is already booked, rollback the transaction
    IF tableStatus > 0 THEN
        ROLLBACK;
        SELECT 'Booking failed: Table already booked on the given date' AS Message;
    ELSE
    -- If the table is available, insert the booking record and commit the transaction
        INSERT INTO bookings (date, TableNumber)
        VALUES (bookingDate, tableNumber);
        COMMIT; SELECT 'Booking successful' AS Message;
    END IF;
END //

DELIMITER ;

CALL AddValidBooking('2022-12-17', 6);


-- CREATE A VIEW
create view orders_view as select orderID, quantity, totalCost from Orders where quantity > 2;
Select * from orders_view;


-- JOIN SOME TABLES
SELECT c.customerID, c.name, o.orderID, o.totalCost, m.cusine, m.course
FROM customers c
JOIN orders o ON c.customerID = o.customerID
JOIN menus m ON o.menuID = m.menuID
ORDER BY o.totalCost;
-- SUBQUERY
SELECT cusine
FROM menus
WHERE menuID = ANY (
    SELECT menuID
    FROM orders
    GROUP BY menuID
    HAVING COUNT(*) > 2
);


-- CREATE PROCEDURE GetMaxQuantity
DROP PROCEDURE IF EXISTS GetMaxQuantity;
CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(quantity) as max_quantity_in_order from orders;
CALL GetMaxQuantity();
-- Select statement
PREPARE GetOrderDetail FROM 'SELECT orderID, quantity, totalCost FROM orders WHERE orderID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;


-- CREATE PROCEDURE CancelOrder
DELIMITER //
CREATE PROCEDURE CancelOrder(IN orderId INT)
BEGIN
    DELETE FROM orders WHERE orderID = orderId;
END //
DELIMITER ;
CALL CancelOrder(1);
