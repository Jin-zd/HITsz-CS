create view shop_details_view as
select
    shop_id,
    shop_name,
    canteen_name,
    shop_address,
    shop_time,
    phone_num
from
    shop
join
    canteen using (canteen_id)
join
    shopper using (shopper_id);

