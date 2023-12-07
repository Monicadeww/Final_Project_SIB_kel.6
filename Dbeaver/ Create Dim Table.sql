-- CREATE SCHEMA Fact and Dim Tables;

CREATE TABLE "Fact and Dim Tables".customer_dim (
  customer_id integer PRIMARY KEY,
  first_name varchar,
  last_name varchar,
  address varchar,
  gender varchar,
  zip_code varchar
);

-- Assuming "id" is actually "customer_id" in the customers table
-- Insert data into "Fact and Dim Tables".customer_dim from the customers table
INSERT INTO "Fact and Dim Tables".customer_dim (customer_id, first_name, last_name, address, gender, zip_code)
SELECT 
  id as customer_id,
  first_name,
  last_name,
  address,
  gender,
  zip_code
FROM 
  "Data Modelling Metabase".customer;

CREATE TABLE "Fact and Dim Tables".product_dim (
  product_id integer PRIMARY KEY,
  name varchar,  -- Corrected column name from "names" to "name"
  price float,
  category_id integer,
  supplier_id integer
);

-- Insert data into "Fact and Dim Tables".product_dim from the product table
INSERT INTO "Fact and Dim Tables".product_dim (product_id, name, price, category_id, supplier_id)
SELECT 
  id as product_id,
  name,
  price,
  category_id,
  supplier_id
FROM 
  "Data Modelling Metabase".products ;

CREATE TABLE "Fact and Dim Tables".product_categories_dim (
  category_id integer PRIMARY KEY,
  name varchar
);

-- Insert data into "Fact and Dim Tables".product_categories_dim from the product_categories table
INSERT INTO "Fact and Dim Tables".product_categories_dim (category_id, name)
SELECT 
  id as category_id,
  name
FROM 
  "Data Modelling Metabase".product_categories;

CREATE TABLE "Fact and Dim Tables".supplier_dim (
  supplier_id integer PRIMARY KEY,
  name varchar,
  country varchar
);

-- Insert data into "Fact and Dim Tables".supplier_dim from the suppliers table
INSERT INTO "Fact and Dim Tables".supplier_dim (supplier_id, name, country)
SELECT 
  id as supplier_id,
  name,
  country
FROM 
  "Data Modelling Metabase".suppliers;

CREATE TABLE "Fact and Dim Tables".coupon_dim (
  coupon_id integer PRIMARY KEY,
  discount_percent float
);

-- Insert data into "Fact and Dim Tables".coupon_dim from the coupons table
INSERT INTO "Fact and Dim Tables".coupon_dim (coupon_id, discount_percent)
SELECT 
  id as coupon_id,
  discount_percent
FROM 
  "Data Modelling Metabase".coupons;

CREATE TABLE "Fact and Dim Tables".order_dim (
  order_id integer PRIMARY KEY,
  customer_id integer,
  status text,
  created_at timestamp
);

-- Insert data into "Fact and Dim Tables".order_dim from the orders table
INSERT INTO "Fact and Dim Tables".order_dim (order_id, customer_id, status, created_at)
SELECT 
  id as order_id,
  customer_id,
  status,
  created_at
FROM 
  "Data Modelling Metabase".orders;

CREATE TABLE "Fact and Dim Tables".login_history_dim (
  login_id integer PRIMARY KEY,  
  attempted_at date,
  login_successful boolean
);

-- Insert data into "Fact and Dim Tables".login_history_dim from the products table (please confirm if this is intentional)
INSERT INTO "Fact and Dim Tables".login_history_dim (login_id, attempted_at, login_successful)
SELECT 
  id as login_id,
  attempted_at,
  login_successful
FROM 
  "Data Modelling Metabase".login_attemps;  
