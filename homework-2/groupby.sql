-- Write queries that output the following information:
-- 1. orders shipped to cities ending with 'burg'. Display without duplicates two columns (city, country) (see table orders, columns ship_city, ship_country)
SELECT DISTINCT ship_country, ship_city FROM orders
WHERE ship_city LIKE '%burg';

-- 2. from the orders table, select the order ID, customer ID, freight, and shipping country. The order was shipped to countries starting with 'P'. The result is sorted by freight (in descending order). Display the first 10 records.
SELECT order_id, customer_id, freight, ship_country FROM orders
WHERE ship_country LIKE 'P%'
ORDER BY freight DESC
LIMIT 10;

-- 3. first name, last name, and phone number of employees who do not have a region specified (see table employees)
SELECT first_name, last_name, home_phone FROM employees
WHERE region IS NULL;

-- 4. the number of suppliers in each country. Sort the result in descending order by the number of suppliers in the country.
SELECT country, COUNT(*) FROM suppliers
GROUP BY country
ORDER BY COUNT(*) DESC;

-- 5. the total freight of orders (where the region is known) by countries, but only display those results where the total freight per country is greater than 2750. Sort by descending total freight (see table orders, columns ship_region, ship_country, freight)
SELECT ship_country, SUM(freight) FROM orders
WHERE ship_region IS NOT NULL
GROUP BY ship_country
HAVING SUM(freight) > 2750;

-- 6. countries where customers, suppliers, and employees are registered.
SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers
INTERSECT
SELECT country FROM employees;

-- 7. countries where both customers and suppliers are registered, but employees are not.
SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers
EXCEPT
SELECT country FROM employees;
