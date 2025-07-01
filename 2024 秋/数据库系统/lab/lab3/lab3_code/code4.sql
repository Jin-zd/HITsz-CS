DELIMITER //

create procedure getOrderNum(in regular_id int)
begin
	select 
		regular_id,
        count(*) as order_num
	from 
		regular_user
		join order_create using (regular_id)
        join `order` using (order_id)
	group by regular_id;
end //

DELIMITER ;