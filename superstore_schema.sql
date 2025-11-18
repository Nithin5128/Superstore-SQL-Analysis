CREATE DATABASE IF NOT EXISTS superstore_db;
USE superstore_db;
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    `Row ID` INT NOT NULL PRIMARY KEY,
    `Order ID` VARCHAR(20) NOT NULL,
    `Order Date` DATE NOT NULL,
    `Ship Date` DATE NOT NULL,
    `Ship Mode` VARCHAR(50),
    `Customer ID` VARCHAR(20) NOT NULL,
    `Customer Name` VARCHAR(100),
    `Segment` VARCHAR(50),
    `Country` VARCHAR(50),
    `City` VARCHAR(100),
    `State` VARCHAR(50),
    `Postal Code` VARCHAR(10),
    `Region` VARCHAR(20),
    `Product ID` VARCHAR(20) NOT NULL,
    `Category` VARCHAR(50),
    `Sub-Category` VARCHAR(50),
    `Product Name` VARCHAR(255),
    `Sales` DECIMAL(10, 2),
    `Quantity` INT,
    `Discount` DECIMAL(4, 2),
    `Profit` DECIMAL(10, 4)
);
LOAD DATA LOCAL INFILE 'C:\\Users\\Nithin\\OneDrive\\Documents\\ElevateLabs+Data\\Task3\\Sample - Superstore.csv'
INTO TABLE orders
CHARACTER SET LATIN1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    `Row ID`,
    `Order ID`,
    @order_date_var, 
    @ship_date_var,
    `Ship Mode`,
    `Customer ID`,
    `Customer Name`,
    `Segment`,
    `Country`,
    `City`,
    `State`,
    `Postal Code`,
    `Region`,
    `Product ID`,
    `Category`,
    `Sub-Category`,
    `Product Name`,
    `Sales`,
    `Quantity`,
    `Discount`,
    `Profit`
)
SET
    `Order Date` = STR_TO_DATE(@order_date_var, '%m/%d/%Y'),
    `Ship Date` = STR_TO_DATE(@ship_date_var, '%m/%d/%Y');
SELECT * FROM orders LIMIT 5;