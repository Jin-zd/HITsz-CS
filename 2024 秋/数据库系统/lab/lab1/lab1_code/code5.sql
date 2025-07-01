SELECT
    first_name,
    last_name,
    COUNT(*) AS film_count
FROM
    actor
    JOIN film_actor USING (actor_id)
GROUP BY
    actor_id
HAVING
    COUNT(*) > 38;