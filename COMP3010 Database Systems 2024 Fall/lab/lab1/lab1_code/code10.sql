SELECT
    first_name,
    last_name,
    MAX(TIMESTAMPDIFF(second, rental_date, return_date)) as rental_duration
FROM
    customer
    JOIN rental USING (customer_id)
GROUP BY
    customer_id
ORDER BY
    rental_duration DESC
LIMIT 6;
