-- Write queries that output the following information:
-- 1. The company name of the customer (company_name from the customers table) and the full name of the employee handling the order for that company (see the employees table),
-- where both the customer and the employee are registered in the city of London, and the order is shipped by the company United Package (company_name in the shippers table).
SELECT customers.company_name AS customer, CONCAT(first_name, ' ', last_name) AS employee
FROM customers
INNER JOIN orders USING (customer_id)
INNER JOIN employees USING (employee_id)
INNER JOIN shippers ON shippers.shipper_id = orders.ship_via
WHERE employees.city = 'London' AND customers.city = 'London' AND shippers.company_name = 'United Package';

-- 2. The product name, quantity in stock (product_name and units_in_stock from the products table),
-- the supplier's name and phone number (contact_name and phone from the suppliers table) for products
-- that are not discontinued (discontinued field), have less than 25 units in stock, and belong to the categories Dairy Products and Condiments.
-- Sort the result in ascending order by the quantity of remaining stock.
SELECT product_name, units_in_stock, contact_name, phone
FROM products
INNER JOIN suppliers USING (supplier_id)
INNER JOIN categories USING (category_id)
WHERE discontinued = 0 AND units_in_stock < 25 AND categories.category_name IN ('Dairy Products', 'Condiments')
ORDER BY units_in_stock ASC;

-- 3. List of customer companies (company_name from the customers table) that have not placed any orders
SELECT company_name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);

-- 4. Unique product names that were ordered in exactly 10 units (quantity ordered can be found in the quantity column in the order_details table).
-- Write this query specifically using a subquery.
SELECT DISTINCT product_name
FROM products
WHERE product_id IN (SELECT product_id
                     FROM order_details
                     WHERE quantity = 10);
