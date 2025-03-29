SELECT
	title
FROM
	film
	JOIN film_category USING (film_id)
	JOIN category USING (category_id)
WHERE
	name = 'Children' AND LEFT(title, 1) = 'J';