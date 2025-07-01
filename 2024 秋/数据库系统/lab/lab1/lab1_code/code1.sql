SELECT 
	customer_id,
    CONCAT(first_name, ' ', last_name) AS customer_name,
    address,
    district,
    city
FROM 
	customer
	JOIN address USING (address_id)
	JOIN city USING (city_id)
	JOIN country USING (country_id)
WHERE
	country = "France";

