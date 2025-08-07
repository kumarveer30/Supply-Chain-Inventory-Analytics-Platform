USE Olist_Analytics_Final;

Select * from Customers;
Select * from Orders;
Select * from Order_Items;
Select * from Products;
Select * from Sellers;
Select * from Order_Reviews;

-- Overall Business Health --

-- (Total customers, total orders, total revenue, and average order value) --

SELECT
    (SELECT COUNT(DISTINCT customer_unique_id) FROM Customers) AS TotalUniqueCustomers,
    (SELECT COUNT(order_id) FROM Orders) AS TotalOrders,
    SUM(payment_value) AS TotalRevenue,
    AVG(payment_value) AS AverageOrderValue
FROM
    Orders;


-- Monthly Sales Trend --

SELECT
    DATE_FORMAT(order_purchase_date, '%Y-%m') AS OrderMonth,
    SUM(payment_value) AS MonthlyRevenue
FROM
    Orders GROUP BY OrderMonth ORDER BY OrderMonth;


-- Top 10 States by Revenue --

SELECT
    c.customer_state AS State,
    SUM(o.payment_value) AS TotalRevenue
FROM
Orders AS o
JOIN
    Customers AS c ON o.customer_id = c.customer_id
GROUP BY
    State
ORDER BY
    TotalRevenue DESC
LIMIT 10;


-- Payment Method Popularity --

SELECT
    payment_type AS PaymentMethod,
    COUNT(order_id) AS NumberOfOrders,
    SUM(payment_value) AS TotalRevenue
FROM
    Orders
GROUP BY
    PaymentMethod
ORDER BY
    TotalRevenue DESC;


-- Top 10 Product Categories by Orders --

SELECT
    p.product_category_name_english AS ProductCategory,
    COUNT(oi.order_item_id) AS NumberOfItemsSold
FROM
    Order_Items AS oi
JOIN
    Products AS p ON oi.product_id = p.product_id
GROUP BY
    ProductCategory
ORDER BY
    NumberOfItemsSold DESC
LIMIT 10;


-- Average Delivery Days by State --

SELECT
    c.customer_state AS State,
    AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_date)) AS AvgDeliveryDays
FROM
    Orders AS o
JOIN
    Customers AS c ON o.customer_id = c.customer_id
WHERE
    o.order_status = 'delivered' AND o.order_delivered_customer_date IS NOT NULL
GROUP BY
    State
ORDER BY
    AvgDeliveryDays DESC;
    

-- Delivery Time vs. Estimated Time --

SELECT
    AVG(DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date)) AS AvgDaysEarly
FROM
    Orders
WHERE
    order_status = 'delivered' AND order_delivered_customer_date IS NOT NULL;

-- Product Profitability by Category --

-- Note: This dataset does not contain 'StandardCost'.
-- For a real-world scenario, 'StandardCost' would be joined from a Product Cost table.
-- Here, we simulate 'profit' as (price - assumed_cost_percentage_of_price).
-- For demonstration, let's assume a simplified 'cost' as 60% of the 'price'.
SELECT
    p.product_category_name_english AS ProductCategory,
    SUM(oi.price) AS TotalRevenue,
    SUM(oi.price * 0.40) AS SimulatedGrossProfit, -- Assuming 40% gross margin
    (SUM(oi.price * 0.40) / SUM(oi.price)) * 100 AS SimulatedGrossProfitMarginPct
FROM
    Order_Items AS oi
JOIN
    Products AS p ON oi.product_id = p.product_id
GROUP BY
    ProductCategory
ORDER BY
    SimulatedGrossProfit DESC
LIMIT 10;


-- Top 10 Most Profitable Customers (Simulated) --

SELECT
    c.customer_unique_id,
    SUM(oi.price * 0.40) AS SimulatedCustomerGrossProfit 
FROM
    Orders AS o
JOIN
    Customers AS c ON o.customer_id = c.customer_id
JOIN
    Order_Items AS oi ON o.order_id = oi.order_id
GROUP BY
    c.customer_unique_id
ORDER BY
    SimulatedCustomerGrossProfit DESC
LIMIT 10;


-- Top 10 Most Profitable Sellers (Simulated) --

SELECT
    s.seller_id,
    SUM(oi.price * 0.40) AS SimulatedSellerGrossProfit 
FROM
    Order_Items AS oi
JOIN
    Sellers AS s ON oi.seller_id = s.seller_id
GROUP BY
    s.seller_id
ORDER BY
    SimulatedSellerGrossProfit DESC
LIMIT 10;

-- Order Status Distribution --

SELECT
    order_status,
    COUNT(order_id) AS NumberOfOrders
FROM
    Orders
GROUP BY
    order_status
ORDER BY
    NumberOfOrders DESC;


-- Product Category with Highest Freight Value --

SELECT
    p.product_category_name_english AS ProductCategory,
    AVG(oi.freight_value) AS AverageFreightValue,
    COUNT(oi.order_item_id) AS NumberOfItemsSold
FROM
    Order_Items AS oi
JOIN
    Products AS p ON oi.product_id = p.product_id
GROUP BY
    ProductCategory
ORDER BY
    AverageFreightValue DESC
LIMIT 10;







