--Add primary key--

ALTER TABLE customers
ADD PRIMARY KEY (id);

ALTER TABLE suppliers
ADD PRIMARY KEY (id);

ALTER TABLE login_attempt_history
ADD PRIMARY KEY (id);

ALTER TABLE orders
ADD PRIMARY KEY (id);

ALTER TABLE products
ADD PRIMARY KEY (id);

ALTER TABLE order_items
ADD PRIMARY KEY (id);

ALTER TABLE product_categories
ADD PRIMARY KEY (id);

ALTER TABLE coupons
ADD PRIMARY KEY (id);


--Add foreign key--

ALTER TABLE login_attemps_test
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customer_test(id);

ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customers(id);

ALTER TABLE products 
ADD CONSTRAINT fk_supplier
FOREIGN KEY (supplier_id)
REFERENCES suppliers(id);

ALTER TABLE products 
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id)
REFERENCES product_categories(id);

ALTER TABLE order_items 
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES products(id);

ALTER TABLE order_items 
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id)
REFERENCES orders(id);

ALTER TABLE order_items 
ADD CONSTRAINT fk_coupon
FOREIGN KEY (coupon_id)
REFERENCES coupons(id);