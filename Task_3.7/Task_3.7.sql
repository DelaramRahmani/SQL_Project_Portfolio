-- Query 1: Finding the top rented movies
SELECT film_id, COUNT(*) AS rental_count
FROM rental
GROUP BY film_id
ORDER BY rental_count DESC
LIMIT 10;

-- Query 2: Most active customers
SELECT customer_id, COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id
ORDER BY rental_count DESC
LIMIT 10;
