SELECT
    first_name,
    last_name  
FROM
    actor
    JOIN film_actor USING (actor_id)
    JOIN film USING (film_id)
WHERE
    title IN ('ELEPHANT TROJAN', 'DOGMA FAMILY')
GROUP BY
    actor_id
HAVING 
    COUNT(*) = 2;
