USE superstore_db;
SELECT
    `State`,
    SUM(Profit) AS Total_Profit
FROM
    orders
GROUP BY
    `State`
ORDER BY
    Total_Profit DESC
LIMIT 10;
SELECT
    Category,
    AVG(Sales) AS Average_Sales,
    SUM(Profit) AS Total_Profit
FROM
    orders
GROUP BY
    Category
ORDER BY
    Total_Profit DESC;
SELECT
    `Order ID`,
    `Product Name`,
    Sales,
    Discount,
    Profit
FROM
    orders
WHERE
    Profit < 0
ORDER BY
    Profit ASC
LIMIT 15;
SELECT
    `Product Name`,
    Sales,
    `Order Date`
FROM
    orders
WHERE
    Sales > (
        SELECT AVG(Sales) FROM orders
    )
ORDER BY
    Sales DESC
LIMIT 10;
    SELECT
    `Customer ID`,
    `Customer Name`,
    SUM(Quantity) AS Total_Quantity_Purchased
FROM
    orders
GROUP BY
    `Customer ID`, `Customer Name`
HAVING
    SUM(Quantity) = (
        SELECT MAX(Total_Quantity)
        FROM (
            SELECT SUM(Quantity) AS Total_Quantity
            FROM orders
            GROUP BY `Customer ID`
        ) AS Customer_Aggregates
    );
SELECT
    t1.`Order ID`,
    t1.`Ship Mode`,
    t1.Sales
FROM
    orders t1
WHERE
    t1.Sales = (
        SELECT MAX(t2.Sales)
        FROM orders t2
        WHERE t2.`Ship Mode` = t1.`Ship Mode`
    )
ORDER BY
    t1.Sales DESC;
CREATE OR REPLACE VIEW High_Value_Orders AS
SELECT
    `Order ID`,
    `Order Date`,
    `Customer Name`,
    Region,
    Category,
    Sales,
    Profit
FROM
    orders
WHERE
    Sales >= 1000
ORDER BY
    Sales DESC;
SELECT * FROM High_Value_Orders LIMIT 5;
CREATE INDEX idx_order_date ON orders (`Order Date`);
CREATE INDEX idx_product_name ON orders (`Product Name`);