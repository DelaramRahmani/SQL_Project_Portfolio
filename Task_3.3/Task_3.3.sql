-- Query 1: Retrieve rental details including customer and film information
SELECT rental_id, rental_date, customer_id, film_id
FROM rental 
JOIN inventory ON rental.inventory_id = inventory.inventory_id;

-- Query 2: Find the most rented films
SELECT film.title, COUNT(rental.rental_id) AS rental_count
FROM rental 
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY film.title
ORDER BY rental_count DESC
LIMIT 10;

-- Query 3: Get customer rental history
SELECT customer.customer_id, first_name, last_name, COUNT(rental_id) AS total_rentals
FROM rental 
JOIN customer ON rental.customer_id = customer.customer_id
GROUP BY customer.customer_id, first_name, last_name
ORDER BY total_rentals DESC;
