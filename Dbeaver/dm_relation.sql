--fk fact--
ALTER TABLE sales
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES product_dim(product_id);

ALTER TABLE sales
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id)
REFERENCES order_dim(order_id);

ALTER TABLE sales
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customer_dim(customer_id);

ALTER TABLE sales
ADD CONSTRAINT fk_supplier
FOREIGN KEY (supplier_id)
REFERENCES supplier_dim(supplierid);

ALTER TABLE sales
ADD CONSTRAINT fk_coupon
FOREIGN KEY (coupon)
REFERENCES coupon_dim(coupon_id);

ALTER TABLE sales
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id)
REFERENCES category_dim(category_id);

ALTER TABLE sales
ADD CONSTRAINT fk_login
FOREIGN KEY (customer_id)
REFERENCES login_history_dim(login_id);
