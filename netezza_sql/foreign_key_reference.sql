Create table order_items(

order_id INT,
customer_id INT

);

ALTER TABLE order_items ADD FOREIGN KEY (order_id) REFERENCES orders (order_id);