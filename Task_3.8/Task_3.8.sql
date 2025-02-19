-- Query 1: Average total amount paid by the top 5 customers
SELECT AVG(total_amount) AS avg_payment
FROM (
    SELECT SUM(amount) AS total_amount
    FROM payment
    GROUP BY customer_id
    ORDER BY total_amount DESC
    LIMIT 5
) AS top_customers;

-- Query 2: Customer count per country
SELECT country, COUNT(DISTINCT customer_id) AS customer_count
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
GROUP BY country;
