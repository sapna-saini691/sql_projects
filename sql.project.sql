create database company;
use company;
create table users(user_id int primary key auto_increment,
    user_name varchar(50),
    email_id varchar(100),
    phone_no bigint,
    address varchar(100)
);

insert into users (user_id, user_name, email_id, phone_no, address) values
(1, "Amit Sharma", "amit.sharma@example.com", "9876543210", "Delhi"),
(2, "Priya Mehta", "priya.mehta@example.com", "9876543211", "Mumbai"),
(3, 'Rohit Verma', 'rohit.verma@example.com', '9876543212', "Jaipur"),
(4, 'Neha Gupta', 'neha.gupta@example.com', '9876543213', "Kolkata"),
(5, 'Vikram Singh', 'vikram.singh@example.com', '9876543214', "Chennai"),
(6, 'Sneha Rani', 'sneha.rani@example.com', '9876543215', 'Pune'),
(7, 'Ankit Joshi', 'ankit.joshi@example.com', '9876543216', 'Hyderabad'),
(8, 'Pooja Yadav', 'pooja.yadav@example.com', '9876543217', 'Bangalore'),
(9, 'Suresh Kumar', 'suresh.kumar@example.com', '9876543218', 'Lucknow'),
(10, 'Anjali Das', 'anjali.das@example.com', '9876543219', 'Bhopal'),
(11, 'Deepak Jain', 'deepak.jain@example.com', '9876543220', 'Patna'),
(12, 'Kiran Patel', 'kiran.patel@example.com', '9876543221', 'Surat'),
(13, 'Rajesh Nair', 'rajesh.nair@example.com', '9876543222', 'Kochi'),
(14, 'Meena Iyer', 'meena.iyer@example.com', '9876543223', 'Nagpur'),
(15, 'Arjun Kapoor', 'arjun.kapoor@example.com', '9876543224', 'Indore'),
(16, 'Simran Kaur', 'simran.kaur@example.com', '9876543225', 'Amritsar'),
(17, 'Manish Sahu', 'manish.sahu@example.com', '9876543226', 'Varanasi'),
(18, 'Shreya Roy', 'shreya.roy@example.com', '9876543227', 'Guwahati'),
(19, 'Harsh Malhotra', 'harsh.malhotra@example.com', '9876543228', 'Agra'),
(20, 'Alok Mishra', 'alok.mishra@example.com', '9876543229', 'Kanpur');


create table product (
    product_id int primary key auto_increment,
    product_name varchar(50),
    category varchar(50),
    price bigint,
    stock_quantity int
);

insert into product(product_id,product_name, category, price, stock_quantity) values
(201, 'Laptop Dell', 'Electronics', 55000, 10),
(202, 'Mobile Samsung', 'Electronics', 20000, 25),
(203, 'Headphones Sony', 'Electronics', 3500, 40),
(204, 'Refrigerator LG', 'Appliances', 32000, 15),
(205, 'Washing Machine Whirlpool', 'Appliances', 28000, 12),
(206, 'Mixer Grinder', 'Appliances', 4500, 30),
(207, 'T-Shirt', 'Clothing', 799, 100),
(208, 'Jeans', 'Clothing', 1999, 60),
(209, 'Shoes Nike', 'Footwear', 4999, 35),
(210, 'Sandals Bata', 'Footwear', 1299, 50),
(211, 'Table Wooden', 'Furniture', 8500, 20),
(212, 'Chair Plastic', 'Furniture', 1200, 80),
(213, 'Bed King Size', 'Furniture', 25000, 8),
(214, 'Notebook A4', 'Stationery', 50, 500),
(215, 'Ball Pen', 'Stationery', 10, 1000),
(216, 'Bag Wildcraft', 'Accessories', 2500, 40),
(217, 'Watch Titan', 'Accessories', 4500, 25),
(218, 'Television Samsung', 'Electronics', 45000, 18),
(219, 'Air Conditioner Voltas', 'Appliances', 38000, 14),
(220, 'Smartwatch Apple', 'Electronics', 30000, 22);


create table orders (
    order_id int primary key auto_increment,
    user_id int,foreign key(user_id) references users(user_id),
    order_date date,
    total_amount bigint
);


select*from orders;
insert into orders (order_id, user_id, order_date, total_amount) values
(301, 1, '2025-01-01', 55000),
(302, 2, '2025-02-02', 20000),
(303, 3, '2025-03-03', 3500),
(304, 4, '2025-04-04', 32000),
(305, 5, '2025-05-05', 28000),
(306, 6, '2025-06-06', 4500),
(307, 7, '2025-07-07', 799),
(308, 8, '2025-08-08', 1999),
(309, 9, '2025-09-09', 4999),
(310, 10, '2025-10-10', 1299),
(311, 11, '2025-11-11', 8500),
(312, 12, '2025-12-12', 1200),
(313, 13, '2025-01-13', 25000),
(314, 14, '2025-02-14', 50),
(315, 15, '2025-03-15', 10),
(316, 16, '2025-04-16', 2500),
(317, 17, '2025-05-17', 4500),
(318, 18, '2025-06-18', 45000),
(319, 19, '2025-07-19', 38000),
(320, 20, '2025-08-20', 30000);


create table order_details (
    detail_id int primary key auto_increment,
    order_id int,
    product_id int,
    quantity int,
    price bigint
);

insert into order_details (detail_id, order_id, product_id, quantity, price) values
(401, 301, 201, 2, 500),
(402, 302, 202, 1, 1200),
(403, 303, 203, 3, 300),
(404, 304, 204, 1, 1500),
(405, 305, 205, 2, 750),
(406, 306, 201, 4, 1000),
(07, 307, 206, 2, 1800),
(408, 308, 207, 5, 250),
(409, 309, 208, 1, 2200),
(410, 310, 209, 3, 450),
(411, 311, 210, 2, 1300),
(412, 312, 202, 1, 1200),
(413, 313, 211, 2, 900),
(414, 314, 212, 4, 400),
(415, 315, 213, 1, 2800),
(416, 316, 214, 2, 1600),
(417, 317, 215, 3, 600),
(418, 318, 216, 1, 2000),
(419, 319, 217, 2, 1400),
(420, 320, 218, 5, 350);


create table peyments(
    id int primary key auto_increment,
    order_id int,
    payment_date date,
    payment_amount bigint,
    payment_mode varchar(20)
);


insert into peyments (id, order_id, payment_date, payment_amount, payment_mode) values
(1, 101, '2025-01-01', 1700, 'Credit Card'),
(2, 102, '2025-02-02', 900, 'UPI'),
(3, 103, '2025-03-03', 2250, 'Net Banking'),
(4, 104, '2025-04-04', 2800, 'Debit Card'),
(5, 105, '2025-05-05', 1250, 'Cash'),
(6, 106, '2025-06-06', 2650, 'UPI'),
(7, 107, '2025-07-06', 2600, 'Credit Card'),
(8, 108, '2025-08-07', 2100, 'Net Banking'),
(9, 109, '2025-09-08', 1600, 'UPI'),
(10, 110, '2025-10-08', 2800, 'Debit Card'),
(11, 111, '2025-11-09', 3200, 'Credit Card'),
(12, 112, '2025-12-10', 1800, 'Cash'),
(13, 113, '2025-01-11', 2000, 'UPI'),
(14, 114, '2025-02-11', 1400, 'Net Banking'),
(15, 115, '2025-03-12', 1750, 'Credit Card'),
(16, 116, '2025-04-13', 900, 'UPI'),
(17, 117, '2025-05-14', 2200, 'Cash'),
(18, 118, '2025-06-15', 2500, 'Debit Card'),
(19, 119, '2025-07-15', 1950, 'Credit Card'),
(20, 120, '2025-08-16', 3000, 'UPI');




-- sabhi products mai 10% badhana ho
update product set price=price*200 ;

-- category  wise update karna ho
update product set price=price+500 where category="Furniture";


-- question 2 
-- DELETE A USER WHO WENT PLACE ANY ORDER
DELETE FROM users
WHERE user_id NOT IN (
    SELECT DISTINCT user_id FROM orders
);


-- question 3 LIST ALL ORDERS WITH USER NAME AUR PRODUCT
select u.user_id,u.user_name ,p.product_id,p.product_name
from 
orders as o join users as u on u.user_id=o.user_id
join product as p on o.product_id = p.product_id;

-- question 4 SHOW ALL PRODUCT WITH THE NUMBER OF PRODUCT TO SOLD
SELECT 
    p.product_id,
    p. product_name,
    COALESCE(SUM(quantity), 0) AS total_sold
FROM product p
LEFT JOIN order_details od 
    ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC;

-- 5 FIND TOP 3 SELLING PRODIUCT BY QUANTITY
select product_name,count(product_id)from product group by product_name limit 3;


-- 6  FIND CALCULATE  MONTHLY SALES TOTAL
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;



-- 7 FIND AVG ORDER VALUE PER USER
SELECT 
    u.user_id,
    u.user_name,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM users u
JOIN orders o 
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name
ORDER BY avg_order_value DESC;



-- 8  SHOW ORDERS WHERE TOTAL AMOUNT>5000
SELECT 
    o.order_id,
    o.user_id,
    o.order_date,
    SUM(od.quantity * od.price) AS total_amount
FROM orders o
JOIN order_details od 
    ON o.order_id = od.order_id
GROUP BY o.order_id, o.user_id, o.order_date
HAVING SUM(od.quantity * od.price) > 2000
ORDER BY total_amount DESC;



-- 9 CREATE A TRIGGER TO AUTO MATIC REDUCE PRODUCT STOP AFTER INSERTING ORDER DETAILS
DELIMITER $$

CREATE TRIGGER reduce_product_stock
AFTER INSERT ON order_details
FOR EACH ROW
BEGIN
    UPDATE product
    SET stop_quantity = stop_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END$$

DELIMITER ;


-- 10 LIST USERS TO MADE MORE THEN  3 ORDERS IN MONTH
SELECT 
    u.user_id,
    u.user_name,
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    COUNT(o.order_id) AS total_orders
FROM users u
JOIN orders o 
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name, DATE_FORMAT(o.order_date, '%Y-%m')
HAVING COUNT(o.order_id) <3
ORDER BY month, total_orders DESC;























































