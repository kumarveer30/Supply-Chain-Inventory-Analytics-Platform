# Supply Chain Inventory Analytics

## Project Overview

This project develops a comprehensive **Profitability Analytics Framework** for a multi-region wholesale distributor. Leveraging a real-world dataset, the project demonstrates a robust approach to data engineering, advanced SQL analysis, and business intelligence. The primary goal is to transform raw operational data into actionable insights, enabling management to make strategic decisions that directly enhance net profit by understanding profitability at granular levels: by product, customer, region, and operational unit.

This repository contains the SQL scripts for database creation, data cleaning, advanced analytical queries, and the definition of key business views. It serves as a portfolio piece showcasing expertise in:
*   **Relational Database Design:** Designed and implemented a normalized 6-table relational database schema in MySQL to model complex e-commerce transactions.
*   **Data Integrity:** Enforced data integrity through meticulous data cleaning, primary keys, and foreign key constraints, resolving issues like orphan records.
*   **Advanced SQL Querying:** Authored complex SQL queries using JOINs, subqueries, CTEs, and window functions to derive meaningful business insights.

## 1. Business Problem

A multi-region wholesale distributor is struggling with inconsistent profitability per order. While overall revenue is growing, the executive team suspects that a significant portion of this growth comes from low-margin or even unprofitable orders. The complexity of their operations—spanning multiple product categories, customer types, and warehouse locations—makes it impossible to see where value is truly being created and where it is being eroded.

The key challenges they face are:
1.  **Lack of Granular Profit Visibility:** They cannot easily determine the profitability of an individual order, a specific customer, or a product line.
2.  **Inefficient Order Fulfillment:** They have no way to measure the impact of different operational units (sellers) on profitability.
3.  **Unidentified "Profit Drains":** They suspect that certain customers, regions, or product categories are consistently underperforming but lack the specific data to confirm these suspicions and take corrective action.

## 2. Technical Implementation

This project demonstrates a full data analytics pipeline, from raw data to actionable insights.

### Backend: MySQL Database
*   **Database Schema:** A normalized 6-table schema was designed and implemented in MySQL to structure the data for analysis. The tables are:
    *   `Customers`
    *   `Sellers`
    *   `Products`
    *   `Orders`
    *   `Order_Items`
    *   `Order_Reviews`
*   **Data Cleaning & Preparation:** A rigorous multi-stage data cleaning process was performed using Power Query and SQL `DELETE` statements to handle missing values, standardize formats, remove duplicates, and resolve referential integrity errors before loading the data.
*   **Data Integrity:** Primary and foreign keys were established to create a logically sound and fully connected relational model, as visualized in the project's EER Diagram.

### Analysis: Advanced SQL
*   **Exploratory Data Analysis (EDA):** Initial SQL queries were used to understand data distributions, analyze categorical variables, and explore relationships between tables.
*   **Analytical Queries:** A comprehensive suite of advanced SQL queries was developed to answer critical business questions related to performance metrics, customer behavior, and operational efficiency.

## 3. Business Impact & Insights

The analyses performed in this framework provide crucial insights that empower the business to make data-driven decisions.

*   **Identify Core Revenue Drivers:** Pinpoint the top-performing states, most popular payment methods, and best-selling product categories to focus marketing and inventory efforts.
*   **Enhance Customer Relationship Management:** Segment customers using RFM (Recency, Frequency, Monetary) analysis to identify high-value customers who can be targeted with loyalty programs.
*   **Optimize Supply Chain & Operations:** Analyze delivery times by state and seller shipping speeds to identify logistical bottlenecks and reward efficient partners.
*   **Improve Profitability:** By simulating profit margins, the business can identify the most and least profitable product categories and customers, enabling strategic decisions on pricing, sourcing, and even discontinuing unprofitable items.

