-- Query 1: Average total amount paid by top customers using CTE
WITH top_customers AS (
    SELECT customer_id, SUM(amount) AS total_payment
    FROM payment
    GROUP BY customer_id
    ORDER BY total_payment DESC
    LIMIT 5
)
SELECT AVG(total_payment) AS avg_payment FROM top_customers;

-- Query 2: Customer count per country with CTE
WITH country_data AS (
    SELECT country, COUNT(DISTINCT customer_id) AS customer_count
    FROM customer
    JOIN address ON customer.address_id = address.address_id
    JOIN city ON address.city_id = city.city_id
    JOIN country ON city.country_id = country.country_id
    GROUP BY country
)
SELECT * FROM country_data;
