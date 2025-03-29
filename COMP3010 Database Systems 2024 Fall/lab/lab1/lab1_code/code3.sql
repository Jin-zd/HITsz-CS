SELECT
	first_name,
    last_name,
    SUM(amount) AS pay_amount
FROM 
	customer
	JOIN payment USING (customer_id)
GROUP BY 
	customer_id
HAVING 
	pay_amount > 180 AND pay_amount < 200;
	


	