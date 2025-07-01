SELECT
    category_id,
    name,
    COUNT(film_id) AS film_count
FROM
    category
    JOIN film_category USING (category_id)
    JOIN film USING (film_id)
GROUP BY
    category_id;