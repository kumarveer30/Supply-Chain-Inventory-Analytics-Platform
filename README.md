# Supply Chain & Inventory Analytics Web Application

### **Project Overview**
This repository contains a full-stack business intelligence web application designed for comprehensive inventory and supply chain analysis. The project leverages a structured, multi-table dataset covering products, orders, customers, employees, and warehouses. The backend is powered by a robust MySQL database, and the interactive frontend is built with Python and Streamlit, providing a powerful tool for SQL-based analysis, business intelligence, and inventory optimization.

---

### **1. Business Problem**

As businesses grow, managing inventory and supply chain logistics across multiple warehouses and regions becomes increasingly complex. Without a unified analytics platform, companies face significant challenges:

*   **Lack of Visibility:** Difficulty in tracking inventory levels across different warehouses and understanding the complete lifecycle of an order from placement to delivery.
*   **Disconnected Data:** Key information is spread across separate datasets for products, customers, orders, and employees, making it difficult to perform holistic analysis.
*   **Inefficient Inventory Management:** Without clear insights into sales velocity and stock distribution, businesses struggle with decisions about which products to stock, where to store them, and how to optimize stock levels to meet demand without overstocking.
*   **Complex Reporting:** Answering critical business questions—like "Who are our top customers?" or "Which warehouse is the most efficient?"—requires complex, manual data joining and analysis, which is slow and inefficient.

---

### **2. Project Goal**

The goal of this project is to build a centralized web application that serves as a business intelligence tool for inventory and supply chain management. The application is designed to:

*   **Provide a 360-Degree View:** Integrate data from all aspects of the business (products, orders, customers, warehouses, employees) into a single, interactive platform.
*   **Enable SQL-Based Analysis:** Create a user-friendly interface that allows managers to get insights from the data without writing complex SQL queries themselves.
*   **Support Inventory Optimization:** Provide analytics on inventory performance, sales volume, and revenue to help managers make data-driven decisions about stock levels and distribution.
*   **Enhance Supply Chain Management:** Offer insights into order statuses, warehouse operations, and regional performance to improve overall supply chain efficiency.

---

### **3. Key Features & Technical Implementation**

This application demonstrates a full-stack approach to building a data-driven business intelligence tool.

#### **Backend: MySQL Database**
*   **Normalized Relational Schema:** The database is structured with 7 core tables as described in the dataset: `Product`, `Orders`, `Customer`, `Warehouse`, `Employee`, `Region`, and `OrderDetails`. Foreign keys are used extensively to link these tables and ensure data integrity (e.g., linking `OrderDetails` to both `Orders` and `Product`).
*   **Data Ingestion:** The initial `.csv` files are loaded into the MySQL database to create a persistent and scalable data warehouse.
*   **Analytical Views:** Complex SQL queries using multiple `JOIN`s are used to create summary `VIEW`s. For example, a `product_performance_view` could be created to join product data with order details to pre-calculate total revenue and units sold for each product, simplifying queries from the application.

#### **Frontend: Streamlit Web Application**
*   **Interactive Dashboard:** The application serves as an interactive dashboard where users can select different analytical views from a sidebar menu.
*   **CRUD Functionality:** The interface provides full Create, Read, Update, and Delete (CRUD) functionality for key tables like `Product`, `Customer`, and `Employee`, allowing it to be used as a lightweight management system.
*   **Dynamic Data Exploration:** Users can view and filter data from any of the core tables (e.g., view all customers with a credit limit over a certain amount, or see all orders with a "Pending" status).
*   **Business Intelligence Reports:** The application includes dedicated pages for high-level analysis, such as:
    *   **Inventory Performance Analysis:** Shows which products are top sellers by revenue and volume.
    *   **Supply Chain Insights:** Displays inventory distribution across different warehouses and tracks order statuses.
    *   **Customer Analytics:** Lists top customers by order volume and total spend.

---

### **4. Business Impact & Insights**

This application empowers managers to move from raw data to actionable intelligence, driving significant business value.

*   **Improved Inventory Control:** By visualizing inventory levels at each warehouse, managers can optimize stock distribution, reduce carrying costs, and prevent regional stockouts.
*   **Enhanced Customer Relationship Management:** Identifying top customers allows the business to create targeted marketing campaigns or loyalty programs, strengthening customer relationships and increasing repeat business.
*   **Optimized Supply Chain:** Analyzing order statuses and employee performance by warehouse can help identify bottlenecks or inefficiencies in the supply chain, leading to faster order fulfillment and reduced operational costs.
*   **Data-Driven Strategic Planning:** The holistic view provided by the dashboard enables senior management to make more informed strategic decisions about product lines, market expansion, and resource allocation based on real-time performance data.
