WITH customer_not_valid AS (
    SELECT
        customer_id
    FROM
        rental
        JOIN inventory USING (inventory_id)
        JOIN film fi USING (film_id)
    WHERE
        fi.title = 'NATURAL STOCK'
)
SELECT
    first_name,
    last_name
FROM
    customer
WHERE   
    customer_id NOT IN (
        SELECT customer_id 
        FROM customer_not_valid
    );