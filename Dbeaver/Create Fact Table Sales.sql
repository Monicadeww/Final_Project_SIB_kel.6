CREATE SCHEMA Fact;

-- Create the fact.sales table
CREATE TABLE Fact.sales (
id serial PRIMARY KEY,
order_id integer,
product_id integer,
customer_id VARCHAR,  -- Assuming customer_id is a string, adjust the type accordingly
supplier_id integer,
category_id integer,
coupon_id varchar (255),
amount integer,
price float,
status text,
created_at date
);

-- Insert data into the fact.sales table using a SELECT statement
INSERT INTO Fact.sales (
  order_id, 
  product_id, 
  customer_id, 
  supplier_id, 
  category_id, 
  coupon_id, 
  amount, 
  price, 
  status, 
  created_at
)
SELECT
  o.id as order_id,
  oi.product_id,
  c.id as customer_id,
  p.supplier_id,
  p.category_id,
  oi.coupon_id,
  oi.amount,
  p.price,
  o.status,
  o.created_at as date
FROM
  "Data Modelling Metabase".customer c
  JOIN orders o ON c.id = o.customer_id
  JOIN order_items oi ON o.id = oi.order_id
  JOIN products p ON oi.product_id = p.id
  JOIN suppliers s ON p.supplier_id = s.id
  JOIN login_attemps l ON c.id = l.customer_id;
