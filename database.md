🛒 Company Database Project

This project is a SQL-based database system for managing users, products, orders, payments, and sales reports. It demonstrates SQL schema design, data insertion, queries, joins, triggers, and transactions.

📌 Features

👤 User management (add, update, delete customers)

📦 Product management with categories and stock tracking

🛍️ Orders and order details with product mapping

💳 Payments tracking (UPI, Cash, Debit, Net Banking, etc.)

📊 Reports: sales, top-selling products, monthly sales, average order value

⚡ Trigger to automatically update product stock after order insertion

📂 Database Schema
Tables Created

user → stores customer details

product → stores product details

orders → stores order information linked with users

order_details → links orders with products & quantity

pyment → stores payment details

Trigger → reduces product stock automatically after purchase

🛠️ SQL Queries
✅ Data Operations

Inserted 20+ rows of data in user, product, orders, order_details, and pyment

Updated product price

Deleted users who did not place orders

✅ Analytical Queries

List all orders with user name and product

Show all products with the number of units sold

Find Top 3 selling products

Calculate Monthly Sales Total

Find Average Order Value per User

Show Orders where total amount > 5000

Created Trigger to reduce stock after order placement

📊 Example Queries
1. Monthly Sales Report
SELECT
    DATE_FORMAT(pyment_date, '%Y-%m') AS month,
    SUM(amount) AS total_sales
FROM
    pyment
GROUP BY
    DATE_FORMAT(pyment_date, '%Y-%m')
ORDER BY
    month;

2. Trigger to Reduce Stock
DELIMITER //
CREATE TRIGGER reduse_product_stock
AFTER INSERT ON order_details
FOR EACH ROW
BEGIN
   UPDATE product 
   SET product_quntity = product_quntity - NEW.quntity
   WHERE product_id = NEW.product_id;
END//
DELIMITER ;

🚀 How to Run

Create a database company

Run all table creation scripts

Insert sample data

Execute queries one by one

Test reports and triggers

📌 Future Improvements

Add stored procedures for order placement

Add discount & tax system

Create an ER diagram for better visualization

Implement front-end integration

👩‍💻 Author

Sapna Saini
📍 Project created for learning SQL, database design, and data analysis

