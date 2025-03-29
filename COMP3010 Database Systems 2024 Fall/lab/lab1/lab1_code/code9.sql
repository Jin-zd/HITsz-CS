SELECT
    title,
    COUNT(DISTINCT customer_id) AS num_renters
FROM
    film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
GROUP BY
    film_id
ORDER BY
    COUNT(DISTINCT customer_id) DESC
LIMIT 4;