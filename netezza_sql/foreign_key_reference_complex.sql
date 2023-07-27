CREATE TABLE customers (
customer_id INT,
customer_name VARCHAR(100),
customer_email VARCHAR(100)
);

-- Create the 'orders' table
CREATE TABLE orders (
order_id INT,
order_date DATE,
customer_id INT
);

-- Create the 'products' table
CREATE TABLE products (
product_id INT,
product_name VARCHAR(100),
product_price DECIMAL(10, 2)
);

-- Create the 'order_items' table (Assuming it already exists)
CREATE TABLE order_items (
order_item_id INT,
order_id INT,
product_id INT,
quantity INT
);

-- Add foreign key reference to 'orders' table
ALTER TABLE order_items
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);

-- Add foreign key reference to 'products' table
ALTER TABLE order_items
ADD FOREIGN KEY (product_id) REFERENCES products(product_id);