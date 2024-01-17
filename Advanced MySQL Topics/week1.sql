-- DEVELOPING FUNCTIONS

CREATE FUNCTION FindCost(order_id INT) 
RETURNS DECIMAL (5,2) DETERMINISTIC 
RETURN (SELECT Cost FROM Orders WHERE OrderID = order_id);


DELIMITER // 

CREATE Procedure GetDiscount(OrderIDInput INT) 
     BEGIN 
         DECLARE cost_after_discount DECIMAL(7,2); 
         DECLARE current_cost DECIMAL(7,2); 
         DECLARE order_quantity INT; 
         SELECT Quantity INTO order_quantity FROM Orders WHERE OrderID = OrderIDInput; 
         SELECT Cost INTO current_cost FROM Orders WHERE OrderID = OrderIDInput; 
        IF order_quantity >= 20 THEN
          SET cost_after_discount = current_cost - (current_cost * 0.2);              
        ELSEIF order_quantity >= 10 THEN
          SET cost_after_discount = current_cost - (current_cost * 0.1); 
        ELSE SET cost_after_discount = current_cost;
        END IF;
    SELECT cost_after_discount; 
END//

DELIMITER ; 

-- WORKING WITH TRIGGERS

DELIMITER //

CREATE TRIGGER ProductSellPriceInsertCheck 
    AFTER INSERT  
    ON Products FOR EACH ROW  
	BEGIN
	IF NEW.SellPrice <= NEW.BuyPrice THEN
		INSERT INTO Notifications(Notification,DateTime) 
		VALUES(CONCAT('A SellPrice same or less than the BuyPrice was inserted for ProductID ', NEW.ProductID), NOW()); 
    END IF;
	END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER ProductSellPriceUpdateCheck 
    AFTER UPDATE  
    ON Products FOR EACH ROW  
	BEGIN
	IF NEW.SellPrice <= NEW.BuyPrice THEN
		INSERT INTO Notifications(Notification,DateTime) 
		VALUES(CONCAT(NEW.ProductID,' was updated with a SellPrice of ', NEW.SellPrice,' which is the same or less than the BuyPrice'), NOW()); 
    END IF;
	END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER NotifyProductDelete 
    AFTER DELETE   
    ON Products FOR EACH ROW   
	INSERT INTO Notifications(Notification, DateTime) 
    VALUES(CONCAT('The product with a ProductID ', OLD.ProductID,' was deleted'), NOW()); 
END //

DELIMITER ;