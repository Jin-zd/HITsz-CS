CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY INVOKER
VIEW `customer_rentals` AS
	SELECT
		customer_id,
        CONCAT(first_name, ' ', last_name) AS customer_name,
        rental_date,
        return_date,
        film_id,
        title
    FROM
		customer
        JOIN rental USING (customer_id)
        JOIN inventory USING (inventory_id)
        JOIN film USING (film_id)
	ORDER BY
		customer_id;


