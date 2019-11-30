-- Drops the bamazon_db if it exists currently --
DROP DATABASE IF EXISTS bamazon_db;
-- Creates the "bamazon_db" database --
CREATE DATABASE bamazon_db;

-- Makes it so all of the following code will affect bamazon_db --
USE bamazon_db;

-- Creates the table "products" within bamazon_db --
CREATE TABLE products
(
    -- unique id for each product --
    item_id INTEGER(15),
    -- Makes a string column called "product_name" which cannot contain null --
    product_name VARCHAR(30) NOT NULL,
    -- Makes a string column called "department_name" which cannot contain null --
    department_name VARCHAR(30) NOT NULL,
    -- Makes an numeric column called "price" which can do up to 2 decimal places --
    price DECIMAL(7,2),
    -- How much product is available in the store -- 
    stock_quantity INTEGER(15)
);

-- Inserting new rows with mock data to all columns -- 
INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
VALUES
    (964364, "Sonar Dot", "Technology & Electronics", 149.99, 3500);

INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
VALUES
    (346517, "Bindle", "Books & Accessories", 69.99, 2300);

INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
VALUES
    (120943, "Bamazon Dash Cam", "Auto & Devices", 45.99, 300);

INSERT INTO products
    (item_id, product_name, department_name, price, stock_quantity)
VALUES
    (405329, "Samurai Professional Blender", "Kitchen & Dining", 55.50, 450);

