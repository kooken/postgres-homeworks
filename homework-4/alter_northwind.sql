-- Connect to the Northwind database and make the following changes:
-- 1. Add a constraint on the unit_price field in the products table (the price must be greater than 0)
ALTER TABLE products ADD CONSTRAINT chk_products_unit_price CHECK (unit_price > 0);

-- 2. Add a constraint that the discontinued field in the products table can only contain values 0 or 1
ALTER TABLE products ADD CONSTRAINT chk_products_discontinued CHECK (discontinued IN (0, 1));

-- 3. Create a new table containing all products that have been discontinued (discontinued = 1)
SELECT * INTO new_products
FROM products
WHERE discontinued = 1;

-- 4. Delete from the products table the products that have been discontinued (discontinued = 1)
-- For the 4th point, it may be necessary to remove the foreign_key constraint. Think about how this can be resolved
-- while still maintaining the relationship with the order_details table.
ALTER TABLE order_details
DROP CONSTRAINT fk_order_details_products;

DELETE FROM products
WHERE discontinued = 1;

DELETE FROM order_details
WHERE product_id NOT IN (SELECT product_id FROM products);

ALTER TABLE order_details
ADD CONSTRAINT fk_order_details_products
FOREIGN KEY (product_id) REFERENCES products(product_id);
