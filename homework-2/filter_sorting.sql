-- Write queries that output the following information:
-- 1. orders delivered to the countries France, Germany, Spain (table orders, column ship_country)
SELECT * FROM orders
WHERE ship_country IN ('France', 'Germany', 'Spain');

-- 2. unique countries and cities where orders were shipped, sorted by countries and cities (table orders, columns ship_country, ship_city)
SELECT DISTINCT ship_country, ship_city FROM orders
ORDER BY ship_country, ship_city;

-- 3. the average number of days it takes to deliver a product to Germany (table orders, columns order_date, shipped_date, ship_country)
SELECT AVG(shipped_date - order_date) FROM orders
WHERE ship_country IN ('Germany');

-- 4. the minimum and maximum price among products that are not discontinued (table products, columns unit_price, discontinued not equal to 1)
SELECT MAX(unit_price), MIN(unit_price) FROM products
WHERE discontinued <> 1;

-- 5. the minimum and maximum price among products that are not discontinued and have at least 20 units in stock (table products, columns unit_price, units_in_stock, discontinued not equal to 1)
SELECT MAX(unit_price), MIN(unit_price) FROM products
WHERE discontinued <> 1 AND units_in_stock >= 20;
