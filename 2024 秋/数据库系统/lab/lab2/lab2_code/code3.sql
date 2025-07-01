DELIMITER //

CREATE PROCEDURE GetCustomerLoyalty(IN p_customer_id INT)
BEGIN
    DECLARE v_rental_count INT;
    DECLARE v_favorite_category VARCHAR(25);
    DECLARE v_total_amount DECIMAL(5,2);
    DECLARE v_loyalty_points INT;

    SELECT COUNT(*) INTO v_rental_count
    FROM rental
    WHERE customer_id = p_customer_id;

    SELECT c.name INTO v_favorite_category
    FROM rental r
    JOIN inventory i USING(inventory_id)
    JOIN film f USING (film_id)
    JOIN film_category fc USING (film_id)
    JOIN category c USING (category_id)
    WHERE r.customer_id = p_customer_id
    GROUP BY c.category_id
    ORDER BY COUNT(*) DESC
    LIMIT 1;

    SELECT COALESCE(SUM(p.amount), 0) INTO v_total_amount
    FROM payment p
    WHERE p.customer_id = p_customer_id;

    SET v_loyalty_points = v_rental_count * 10 + FLOOR(v_total_amount);

    SELECT 
        v_rental_count AS rental_count,
        v_favorite_category AS favorite_category,
        v_total_amount AS total_amount,
        v_loyalty_points AS loyalty_points;
END //

DELIMITER ;