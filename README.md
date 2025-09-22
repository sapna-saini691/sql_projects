  Company Database Project
📌 Overview

This project demonstrates how to design and manage a company database using MySQL.
It includes tables for Users, Products, Orders, Order Details, and Payments, along with queries for analysis, reporting, and triggers for automation.

🏗 Database Schema

users → Stores customer details.

product → Stores product information.

orders → Records all orders placed by users.

order_details → Stores details of products in each order.

peyments → Stores payment information for orders.

📋 SQL Features Covered

✔ Create Database & Tables
✔ Insert Sample Data
✔ Update & Delete Records
✔ Joins (Inner, Left)
✔ Aggregation (SUM, AVG, COUNT, GROUP BY)
✔ Filtering with HAVING
✔ Triggers (Auto-update stock after order)

🔑 Example Queries
1. Delete users who never placed an order
DELETE FROM users
WHERE user_id NOT IN (
    SELECT DISTINCT user_id FROM orders
);

2. Show all products with total sold quantity
SELECT 
    p.product_id,
    p.product_name,
    COALESCE(SUM(od.quantity), 0) AS total_sold
FROM product p
LEFT JOIN order_details od 
    ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC;

3. Create Trigger to reduce product stock automatically
DELIMITER $$

CREATE TRIGGER reduce_product_stock
AFTER INSERT ON order_details
FOR EACH ROW
BEGIN
    UPDATE product
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END$$

DELIMITER ;

📊 Reports

Top 3 Selling Products

Monthly Sales Totals

Average Order Value Per User

Orders Greater than ₹5000

Users with More than 3 Orders in a Month

🚀 How to Run

Clone the repository

git clone https://github.com/sapna-saini691/company-database.git


Import the SQL script into MySQL

Run queries step by step

Modify queries for practice and analysis

📌 Author
👩‍💻 Developed by [Sapna saini]
📧 Contact: sapnasaini91207@gmail.com
