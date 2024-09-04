-- Write queries that output the following information:
-- 1. "contact name" and "city" (contact_name, city) from the customers table (only these two columns)
SELECT contact_name, city FROM customers;

-- 2. order ID and the difference between the order date (order_date) and its shipment date (shipped_date) from the orders table
SELECT order_id, shipped_date - order_date FROM orders;

-- 3. all unique cities where customers are registered (customers table)
SELECT DISTINCT city FROM customers;

-- 4. the number of orders (orders table)
SELECT COUNT(order_id) FROM orders;

-- 5. the number of unique countries to which goods were shipped (orders table, ship_country column)
SELECT COUNT(DISTINCT ship_country) FROM orders;
