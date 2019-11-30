-- Drops the bamazon_db if it exists currently --
DROP DATABASE IF EXISTS bamazon_db;
-- Creates the "bamazon_db" database --
CREATE DATABASE bamazon_db;

-- Makes it so all of the following code will affect bamazon_db --
USE bamazon_db;

-- Creates the table "products" within bamazon_db --
CREATE TABLE products
(
    -- Unique id for each product --
    item_id INT NOT NULL
    AUTO_INCREMENT,
    -- Makes a string column called "product_name" which cannot contain null --
    product_name VARCHAR
    (30) NOT NULL,
    -- Makes a string column called "department_name" which cannot contain null --
    department_name VARCHAR
    (30) NOT NULL,
    -- Makes an numeric column called "price" which can do up to 2 decimal places --
    price DECIMAL
    (7,2),
    -- How much product is available in the store -- 
    stock_quantity INTEGER
    (15),
    -- Unique id for each product -- 
    PRIMARY KEY
    (item_id)
);

    -- Inserting new rows with mock data to all columns -- 

    -- Product 1 --
    INSERT INTO products
        (product_name, department_name, price, stock_quantity)
    VALUES
        ("Sonar Dot", "Technology & Electronics", 149.99, 3500);

    -- Product 2 --
    INSERT INTO products
        (product_name, department_name, price, stock_quantity)
    VALUES
        ("Bindle", "Books & Accessories", 69.99, 2300);

    -- Product 3 --
    INSERT INTO products
        (product_name, department_name, price, stock_quantity)
    VALUES
        ("Bamazon Dash Cam", "Auto & Devices", 45.99, 300);

    -- Product 4 --
    INSERT INTO products
        (product_name, department_name, price, stock_quantity)
    VALUES
        ("Samurai Professional Blender", "Kitchen & Dining", 55.50, 450);

    -- Product 5 --
    INSERT INTO products
        (product_name, department_name, price, stock_quantity)
    VALUES
        ("Hurricane Water Hose", "Gardening & Outdoor", 25.17, 130);

    -- Product 6 --
    INSERT INTO products
        (product_name, department_name, price, stock_quantity)
    VALUES
        ("RainMaker Shower Head", "Tools & Home", 53.49, 25);

    -- Product 7 --
    INSERT INTO products
        (product_name, department_name, price, stock_quantity)
    VALUES
        ("LazyMan Recliner", "Home & Decor", 345.20, 455);

    -- Product 8 --
    INSERT INTO products
        (product_name, department_name, price, stock_quantity)
    VALUES
        ("Antartica Nitro Refrigerator", "Appliances", 1549.99, 1200);

    -- Product 9 --
    INSERT INTO products
        (product_name, department_name, price, stock_quantity)
    VALUES
        ("Bonker's Bad Mane Day", "Video Games", 59.99, 5550);

    -- Product 10 --
    INSERT INTO products
        (product_name, department_name, price, stock_quantity)
    VALUES
        ("Organic Roasted Chicken Treats", "Pet Supplies", 25.97, 430);