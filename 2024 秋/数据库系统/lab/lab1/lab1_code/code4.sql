SELECT
    film_id,
    title,
    SUM(amount) AS total_revenue
FROM
    film 
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN payment USING (rental_id)
GROUP BY
    film_id
ORDER BY
    total_revenue DESC
LIMIT 1;