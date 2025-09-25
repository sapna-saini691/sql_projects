-- sql retail sales analysis
create database retail;
use retail;
-- create table 
create table retail_sales (transactions_id int primary key ,	
		sale_date date,	
        sale_time time,	
        customer_id	int,
         gender	varchar(20),
         age int,
        category varchar(20),
	     quantiy int,
	    price_per_unit	float,
        cogs float,
	     total_sale float);
select*from retail_sales;
select count(*) from retail_sales;
-- data cleaning 
select*from retail_sales where transactions_id is null
 or
 sale_date is null 
 or
 sale_time is null
 or
 customer_id is null
 or
 gender is null
 or
 age is null
 or
 category is null
 or
 quantiy is null
 or
 price_per_unit is null
 or
 cogs is null
 or
 total_sale is null
;
-- 
delete from retail_sales  where transactions_id is null
 or
 sale_date is null 
 or
 sale_time is null
 or
 customer_id is null
 or
 gender is null
 or
 age is null
 or
 category is null
 or
 quantiy is null
 or
 price_per_unit is null
 or
 cogs is null
 or
 total_sale is null
;
-- data exploration

-- how many sales we have? 
select count(*) as total_sale from retail_sales;

-- how many unique customers we have? 
select count(distinct customer_id) as total_sale from retail_sales;

select distinct category from retail_sales;

-- data analysis & business key problems &answers

-- Q.1 Write a sql query to retrive all columns for sales made on "2022-11-05
select *from retail_sales where sale_date ="2022-11-05";

-- Q.2 write a sql query to retrive all tranasctions where is "clothing" and the quantity sold is more then 4 in the month of nov-2022
select*from retail_sales where category='clothing'
 AND DATE_FORMAT(sale_date,"%Y-%m")='2022-11' and quantiy>=4;
 
 -- Q.3 write a sql query to calculate the total sales(total_sales) for each category.
 select category,sum(total_sale) as net_sale,
 count(*) as total_order from retail_sales group by category;
 -- Q.4 WRITE A QUERY to find the average age of customer who purchased item from the 'beauty' category.
 select ROUND(avg(age),2) as avg_age from retail_sales
 where category='beauty';
 -- Q.5 write a query to find all transactionj where the total_sale is greater than 1000.
 select *from retail_sales where total_sale>1000;
 
 -- Q.6 write a query to find the total number of transaction(transaction_id)made by each gender in each category.
 select category,gender,count(*) as total_transaction from retail_sales
 group by category,gender
 order by gender;
 -- Q.7 write a sql query to calculate the average sale from each month. find out best selling month in each year.
 
 select year,month,avg_sale
 from
 (
 select year(sale_date) as year,
 month(sale_date) as month ,
 avg(total_sale) as avg_sale,
 RANK()over(partition by year(sale_date)  order by avg(total_sale) DESC) as rnk
 from retail_sales
 group by year(sale_date),month(sale_date))as t1 WHERE rnk=1;
 
-- Q.8 write a sql query to find the top 5 customers based on the highest total sale.
select customer_id,
sum(total_sale) as total_sales
from retail_sales group by customer_id
order by total_sales desc
limit 5;
-- Q.9 write a sql query to find the number of unique customers who purchases item from each category.
select  category,count(distinct customer_id) as unique_customer from 
retail_sales group by category;

-- Q.10 write a sql query to create each shift and number of orders(example morning<12,afternoon between 12&17,evening>17).
with hourly_sale
as
(
select*,
      case
          when hour(sale_time) <12 then "morning"
          when hour(sale_time) between 12 and 17 then "afternoon"
          else "evening"
	  end as shift
from retail_sales
)
select
   shift,
   count(*) as total_orders
   from hourly_sale
   group by shift;
  

 







