-- Query 1: Revenue generated per category
SELECT category.name AS category_name, SUM(payment.amount) AS total_revenue
FROM payment 
JOIN rental ON payment.rental_id = rental.rental_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY total_revenue DESC;

-- Query 2: Find high-value customers based on total spending
SELECT customer.customer_id, first_name, last_name, SUM(payment.amount) AS total_spent
FROM payment 
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id, first_name, last_name
ORDER BY total_spent DESC
LIMIT 10;

-- Query 3: Monthly revenue trend
SELECT DATE_TRUNC('month', payment.payment_date) AS month, SUM(payment.amount) AS total_revenue
FROM payment
GROUP BY month
ORDER BY month;
