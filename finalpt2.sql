USE LittleLemonDB;

-- INSERT DATA
DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //

CREATE PROCEDURE AddBooking(
    IN bookingID INT,
    IN date DATE,
    IN number INT
)
BEGIN
    INSERT INTO bookings (BookingID, date, TableNumber)
    VALUES (bookingID, date, tableNumber);
END //

DELIMITER ;

CALL AddBooking(5,'2024-02-06', 4);


-- UPDATE DATA
DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN bookingIDToUpdate INT,
    IN newBookingDate DATE
)
BEGIN
    UPDATE bookings
    SET bookings.date = newBookingDate
    WHERE bookings.bookingID = bookingIDToUpdate;
END //

DELIMITER ;

CALL UpdateBooking(5, '2024-02-07');


-- DELETE DATA
DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN bookingIDToRemove INT
)
BEGIN
    DELETE FROM bookings
    WHERE bookings.bookingID = bookingIDToRemove;
END //

DELIMITER ;

CALL CancelBooking(5);
