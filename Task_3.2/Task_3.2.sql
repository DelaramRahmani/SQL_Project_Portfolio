-- Query 1: Retrieve all customer records
SELECT * FROM customer;

-- Query 2: Retrieve customer details for active accounts
SELECT customer_id, first_name, last_name, email 
FROM customer 
WHERE active = 1;

-- Query 3: Count the number of customers in each country
SELECT country, COUNT(customer_id) AS total_customers 
FROM customer 
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
GROUP BY country;
