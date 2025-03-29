DELIMITER //

CREATE TRIGGER after_rental_insert
AFTER INSERT ON rental
FOR EACH ROW
BEGIN
    UPDATE inventory
    SET last_update = NOW()
    WHERE inventory_id = NEW.inventory_id;
END//

DELIMITER ;