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








