# Data Cleaning
- Checked for `NULL` values in all columns.
- Deleted rows with missing values to ensure clean analysis.

```sql
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
Total sales records: SELECT COUNT(*) FROM retail_sales;

Unique customers: SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

Distinct product categories: SELECT DISTINCT category FROM retail_sales;

SQL Queries & Business Insights
1. Retrieve all sales on a specific date
sql
Copy code
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';
2. Transactions for clothing category with quantity ≥ 4 in November 2022
sql
Copy code
SELECT * FROM retail_sales
WHERE category='clothing'
  AND DATE_FORMAT(sale_date,'%Y-%m')='2022-11'
  AND quantiy>=4;
3. Total sales per category
sql
Copy code
SELECT category, SUM(total_sale) AS net_sale, COUNT(*) AS total_order
FROM retail_sales
GROUP BY category;
4. Average age of customers for 'beauty' category
sql
Copy code
SELECT ROUND(AVG(age),2) AS avg_age
FROM retail_sales
WHERE category='beauty';
5. Transactions with total_sale > 1000
sql
Copy code
SELECT * FROM retail_sales
WHERE total_sale > 1000;
6. Total transactions by gender and category
sql
Copy code
SELECT category, gender, COUNT(*) AS total_transaction
FROM retail_sales
GROUP BY category, gender
ORDER BY gender;
7. Best-selling month of each year (average sale)
sql
Copy code
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
sql
Copy code
SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
9. Number of unique customers per category
sql
Copy code
SELECT category, COUNT(DISTINCT customer_id) AS unique_customer
FROM retail_sales
GROUP BY category;
10. Orders by shift (morning, afternoon, evening)
sql
Copy code
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
Identified total sales and orders by category and customer.

Determined best-selling months per year.

Found top customers and peak sales shifts.

Average age and demographic analysis by category.

Author
Name: Sapna Saini

GitHub: sapna-saini691

