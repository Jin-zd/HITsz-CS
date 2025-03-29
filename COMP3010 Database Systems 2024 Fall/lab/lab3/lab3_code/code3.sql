DELIMITER //
create trigger after_shop_insert
after insert on shop
for each row
begin
	update canteen
    set shop_num = shop_num + 1
    where canteen_id = NEW.canteen_id;
end //

DELIMITER ;

	