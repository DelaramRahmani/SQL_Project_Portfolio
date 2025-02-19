-- Query 1: Identifying the top 5 customers
SELECT customer_id, SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id
ORDER BY total_amount DESC
LIMIT 5;

-- Query 2: Getting the average total amount paid
SELECT AVG(total_amount) AS avg_amount
FROM (
    SELECT customer_id, SUM(amount) AS total_amount
    FROM payment
    GROUP BY customer_id
    ORDER BY total_amount DESC
    LIMIT 5
) AS top_customers;
