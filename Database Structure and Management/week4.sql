-- MySQL database project

SELECT * 
FROM Bookings 
WHERE BookingDate BETWEEN '2021-11-11' AND '2021-11-13';

SELECT Customers.FullName, Bookings.BookingID 
FROM Customers RIGHT JOIN Bookings 
ON Customers.CustomerID = Bookings.CustomerID 
WHERE BookingDate = '2021-11-11';

SELECT BookingDate, COUNT(BookingDate) 
FROM Bookings 
GROUP BY BookingDate;

REPLACE INTO Courses (CourseName, Cost) VALUES ("Kabasa", 20.00);

CREATE TABLE DeliveryAddress(     
    ID INT PRIMARY KEY,     
    Address VARCHAR(255) NOT NULL,     
    Type VARCHAR(100) NOT NULL DEFAULT "Private",     
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

ALTER TABLE Courses ADD COLUMN Ingredients VARCHAR(255);

SELECT FullName 
FROM Customers 
WHERE (SELECT CustomerID FROM Bookings WHERE Customers.CustomerID = Bookings.CustomerID and BookingDate = "2021-11-11");

CREATE VIEW BookingsView AS SELECT BookingID, BookingDate, NumberOfGuests FROM Bookings WHERE NumberOfGuests > 3 AND BookingDate < "2021-11-13";

CREATE PROCEDURE GetBookingsData (InputDate DATE) 
SELECT * 
FROM Bookings 
WHERE BookingDate = InputDate;
CALL GetBookingsData ("2021-11-13");

SELECT CONCAT("ID: ", BookingID,', Date: ', BookingDate,', Number of guests: ', NumberOfGuests) AS "Booking Details" FROM Bookings;