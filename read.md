# Retail Sales Analysis

## Project Overview

- Database creation
- Table creation
- Data cleaning
- Data exploration
- Business insights using SQL queries

The purpose is to analyze customer behavior, sales trends, top categories, peak hours, and high-value customers.

---

## Database and Table Structure

### Database: `retail`

### Table: `retail_sales`

| Column Name      | Data Type      | Description                          |
|-----------------|---------------|-------------------------------------|
| transactions_id  | INT PRIMARY KEY | Unique ID for each transaction       |
| sale_date        | DATE          | Transaction date                     |
| sale_time        | TIME          | Transaction time                     |
| customer_id      | INT           | Unique customer ID                    |
| gender           | VARCHAR(20)   | Customer gender                       |
| age              | INT           | Customer age                          |
| category         | VARCHAR(20)   | Product category                       |
| quantiy          | INT           | Quantity sold                          |
| price_per_unit   | FLOAT         | Price per unit                         |
| cogs             | FLOAT         | Cost of goods sold                     |
| total_sale       | FLOAT         | Total sale amount                      |

---

## Data Cleaning
- Checked for null values in all columns.
- Deleted rows with missing values to ensure clean analysis.


DELETE FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;


Data Exploration


Total sales records:


SELECT COUNT(*) AS total_sale FROM retail_sales;
Unique customers:

SELECT COUNT(DISTINCT customer_id) AS total_customers FROM retail_sales;
Distinct product categories:


SELECT DISTINCT category FROM retail_sales;
SQL Queries & Business Insights

1. Sales on "2022-11-05"

SELECT * FROM retail_sales WHERE sale_date = '2022-11-05';

2. Clothing transactions in November 2022 with quantity ≥ 4

SELECT * FROM retail_sales
WHERE category='clothing'
  AND DATE_FORMAT(sale_date,'%Y-%m')='2022-11'
  AND quantiy>=4;
  
3. Total sales per category

SELECT category, SUM(total_sale) AS net_sale, COUNT(*) AS total_order
FROM retail_sales
GROUP BY category;

4. Average age of customers in 'beauty' category

SELECT ROUND(AVG(age),2) AS avg_age
FROM retail_sales
WHERE category='beauty';

5. Transactions with total_sale > 1000

SELECT * FROM retail_sales WHERE total_sale > 1000;
6. Number of transactions by gender and category

SELECT category, gender, COUNT(*) AS total_transaction
FROM retail_sales
GROUP BY category, gender
ORDER BY gender;

7. Best-selling month per year (average sale)

SELECT year, month, avg_sale
FROM (
    SELECT YEAR(sale_date) AS year,
           MONTH(sale_date) AS month,
           AVG(total_sale) AS avg_sale,
           RANK() OVER(PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS rnk
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS t1
WHERE rnk = 1;

8. Top 5 customers by total sales

SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

9. Unique customers per category

SELECT category, COUNT(DISTINCT customer_id) AS unique_customer
FROM retail_sales
GROUP BY category;

10. Orders by shift (morning, afternoon, evening)

WITH hourly_sale AS (
    SELECT *,
           CASE
               WHEN HOUR(sale_time) < 12 THEN 'morning'
               WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'afternoon'
               ELSE 'evening'
           END AS shift
    FROM retail_sales
)
SELECT shift, COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;
Key Insights
Determined total sales and orders by category and customer.

Identified best-selling months per year.

Found top 5 high-value customers.

Analyzed sales shifts (morning, afternoon, evening) for operational planning.

Average age and demographic insights per category.

Author
Name: Sapna Saini

GitHub: sapna-saini691
