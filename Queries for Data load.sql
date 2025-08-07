
CREATE DATABASE IF NOT EXISTS `Olist_Analytics_Final`;

USE `Olist_Analytics_Final`;


-- Create tables with their final structures, including the merged columns.
-- We create the "parent" tables first.

CREATE TABLE `Customers` (
    `customer_id` VARCHAR(32) PRIMARY KEY,
    `customer_unique_id` VARCHAR(32) NOT NULL,
    `customer_zip_code_prefix` INT,
    `customer_city` VARCHAR(100),
    `customer_state` VARCHAR(2),
    `geolocation_lat` DECIMAL(10, 8), 
    `geolocation_lng` DECIMAL(11, 8)  
);

CREATE TABLE `Sellers` (
    `seller_id` VARCHAR(32) PRIMARY KEY,
    `seller_zip_code_prefix` INT,
    `seller_city` VARCHAR(100),
    `seller_state` VARCHAR(2)
);

CREATE TABLE `Products` (
    `product_id` VARCHAR(32) PRIMARY KEY,
    `product_category_name` VARCHAR(100),
    `product_category_name_english` VARCHAR(100), 
    `product_name_lenght` INT,
    `product_description_lenght` INT,
    `product_photos_qty` INT,
    `product_weight_g` INT,
    `product_length_cm` INT,
    `product_height_cm` INT,
    `product_width_cm` INT
);

-- Create the table with NOT NULL constraints on all columns
CREATE TABLE `Orders` (
    -- Core IDs
    `order_id` VARCHAR(32) PRIMARY KEY,
    `customer_id` VARCHAR(32) NOT NULL,

    -- Order Status and Payment Details
    `order_status` VARCHAR(20) NOT NULL,
    `payment_value` DECIMAL(10, 2) NOT NULL,
    `payment_installments` INT NOT NULL,
    `payment_type` VARCHAR(20) NOT NULL,
    `payment_sequential` INT NOT NULL,

    -- Time Columns
    `order_purchase_Time` TIME NOT NULL,
    `order_approved_Time` TIME NOT NULL,
    `order_delivered_carrier_Time` TIME NOT NULL,
    `order_delivered_customer_Time` TIME NOT NULL,
    `order_estimated_delivery_Time` TIME NOT NULL,

    -- Date Columns
    `order_purchase_date` DATE NOT NULL,
    `order_approved_date` DATE NOT NULL,
    `order_delivered_carrier_date` DATE NOT NULL,
    `order_delivered_customer_date` DATE NOT NULL,
    `order_estimated_delivery_date` DATE NOT NULL
);



CREATE TABLE `Order_Items` (
    -- Core IDs
    `order_id` VARCHAR(32) NOT NULL,
    `order_item_id` INT NOT NULL,
    `product_id` VARCHAR(32) NOT NULL,
    `seller_id` VARCHAR(32) NOT NULL,

    -- Shipping Limit Date and Time
    `shipping_limit_date` DATE NOT NULL,
    `shipping_limit_Time` TIME NOT NULL,

    -- Financials
    `price` DECIMAL(10, 2) NOT NULL,
    `freight_value` DECIMAL(10, 2) NOT NULL,

    -- Define the composite primary key
    PRIMARY KEY (`order_id`, `order_item_id`)
);


CREATE TABLE `Order_Reviews` (
    -- Core IDs
    `review_id` VARCHAR(32) NOT NULL,
    `order_id` VARCHAR(32) NOT NULL,

    -- Review Details
    `review_score` INT NOT NULL,
    `review_comment_title` TEXT NOT NULL,
    `review_comment_message` TEXT NOT NULL,

    -- Date and Time Columns
    `review_creation_date` DATE NOT NULL,
    `review_answer_date` DATE NOT NULL,
    `review_creation_Time` TIME NOT NULL,
    `review_answer_Time` TIME NOT NULL,

    -- Define the composite primary key
    PRIMARY KEY (`review_id`, `order_id`)
);




ALTER TABLE `Orders` 
ADD CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `Customers`(`customer_id`);


SET SQL_SAFE_UPDATES = 0;

DELETE FROM Order_Items
WHERE order_id NOT IN (SELECT order_id FROM Orders);

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE `Order_Items` 
ADD CONSTRAINT `fk_items_orders` FOREIGN KEY (`order_id`) REFERENCES `Orders`(`order_id`);

ALTER TABLE `Order_Items` 
ADD CONSTRAINT `fk_items_products` FOREIGN KEY (`product_id`) REFERENCES `Products`(`product_id`);

ALTER TABLE `Order_Items` 
ADD CONSTRAINT `fk_items_sellers` FOREIGN KEY (`seller_id`) REFERENCES `Sellers`(`seller_id`);

ALTER TABLE `Order_Reviews` 
ADD CONSTRAINT `fk_reviews_orders` FOREIGN KEY (`order_id`) REFERENCES `Orders`(`order_id`);


select * from Customers;
select * from Sellers;
select * from Products;
select * from Orders;
select * from Order_Items;
select * from Order_Reviews;



