use company;
select*from order_details;
-- q1. insert data minimum 20 rows --
 
create table user(user_id int primary key,name varchar(50),email varchar(50),ph_no integer,address varchar(50));
insert into user(user_id,name,email,ph_no,address)
values(101,"raj","raj@gmail.com",827937643,"jaipur"),
(102,"ishika","isha@gmail.com",827867643,"udaipur"),
(103,"vinika","vini@gmail.com",95637643,"jaipur"),
(104,"raj","raj691@gmail.com",827937643,"puna"),
(105,"rajvir","raj123@gmail.com",827937643,"rajkot"),
(106,"siya","siya@gmail.com",92792983,"indor"),
(107,"latika","lavi@gmail.com",823556643,"jaipur"),
(108,"savita","sv691@gmail.com",827998643,"kota"),
(109,"isha","isha@gmail.com",827937643,"udaipur"),
(110,"abhay","aj691@gmail.com",829999903,"jodhpur"),
(111,"raj","raj@gmail.com",82734543,"nasik"),
(112,"ishika","isha@gmail.com",997867643,"udaipur"),
(113,"vinika","vini@gmail.com",99637643,"bikaner"),
(114,"samayra","samy88@gmail.com",999937643,"puna"),
(115,"vansh","vansh765@gmail.com",977937643,"ahamdabad"),
(116,"ishvar","ishvar@gmail.com",93452983,"mumbai"),
(117,"harsh","harsh@gmail.com",878999643,"jaipur"),
(118,"jiya","jiya691@gmail.com",898787643,"chandigadh"),
(119,"harshita","harshi@gmail.com",927937643,"nasik"),
(120,"navin","navin@gmail.com",98799903,"ajmer");

insert into user
values(121,"rishika","rishika@gmail.com",828977643,"jaipur");

select*from user;


create table product(product_id int primary key,name varchar(50),categry varchar(50),prise integer,product_quntity int);
insert into product(product_id,name,categry,prise,product_quntity)
values(1,"T-shirt","Fashion",250,1),
(2,"Badsheet","Home-decore",550,1),
(3,"sofa","Home-decore",3500,1),
(4,"curtains","Home-decore",750,4),
(5,"shoes","Fashion",445,1),
(6,"Mamarth shampo","Hair-care",225,2),
(7,"kurti","fashion",250,1),
(8,"Hair dryer","Hair-care",1800,1),
(9,"Badsheet","Home-decore",750,2),
(10,"Suns cream","Skin-care",250,3),
(11,"Paint","Fahion",650,1),
(12,"Slipeer","Fashion",250,2),
(13,"Idli maker","Kitchen",700,1),
(14,"Doormat","Home-decore",250,2),
(15,"Head phone","Electronics",1200,1),
(16,"carmboard","sports",850,1),
(17,"pillows","home-decore",250,6),
(18,"T-shirt","Fashion",250,2),
(19,"sofa","Home-decore",3500,1),
(20,"curtains","Home-decore",750,2);

select*from product;



alter table orders add column (product_id int,foreign key(product_id) references product(product_id) on update cascade on delete cascade);


commit;


create table orders(order_id int primary key,
user_id int ,foreign key(user_id) references user(user_id),
order_date date);

insert into orders(order_id,user_id,order_date)
values(01,101,'2025-2-4'),
(02,102,'2025-3-2'),
(03,104,'2025-2-12'),
(04,103,'2025-3-15'),
(05,101,'2025-6-15'),
(06,105,'2025-5-7'),
(07,106,'2025-4-23'),
(08,107,'2025-7-23'),
(09,108,'2025-9-2'),
(010,106,'2025-8-9'),
(011,109,'2025-9-5'),
(012,111,'2025-6-5'),
(013,112,'2025-6-12'),
(014,113,'2025-8-23'),
(015,110,'2025-8-14'),
(016,101,'2025-6-18'),
(017,107,'2025-7-19'),
(018,114,'2025-8-20'),
(019,115,'2025-9-5'),
(020,116,'2025-5-12'),
(021,117,'2025-4-23'),
(022,118,'2025-6-27'),
(023,119,'2025-7-20'),
(024,120,'2025-9-21'),
(025,101,'2025-1-22');

select*from orders;

create table order_details(order_detail_id int primary key,
order_id int,foreign key(order_id) references orders(order_id) on update cascade on delete cascade,
product_id int,foreign key(product_id) references product(product_id) on update cascade on delete cascade,
quntity int,
prize int,
total_amount int default(quntity*prize));

insert into order_details(order_detail_id,order_id,product_id,quntity,prize)
values(1002,02,1,1,250),
(1003,03,2,1,550),
(1004,04,3,1,3500),
(1005,05,4,4,750),
(1006,06,5,1,445),
(1007,07,6,2,225),
(1008,08,7,1,250),
(1009,09,8,1,1800),
(1010,010,9,2,750),
(1011,011,10,3,250),
(1012,012,11,1,650),
(1013,013,12,2,250),
(1014,014,13,1,700),
(1015,015,14,2,250),
(1016,016,15,1,1200),
(1017,017,16,1,850),
(1018,018,17,6,250),
(1019,019,18,2,250),
(1020,020,19,1,3500),
(1021,021,1,1,250),
(1022,022,2,1,550),
(1023,023,3,1,3500),
(1024,024,4,4,750),
(1025,025,5,1,445);

select  total_amount,order_id from order_details;

select*from order_details;

create table pyment(pyment_id int primary key,
order_id int,foreign key(order_id) references orders(order_id),
pyment_date date ,
pyment_mode varchar(50),
amount int);

insert into pyment(pyment_id,order_id,pyment_date,pyment_mode,amount)
values(10001,01,'2025-2-9',"UPI",3000),
(10002,02,'2025-3-10',"Debit",250),
(10003,03,'2025-2-18',"cash",550),
(10004,04,'2025-3-19',"net banking",3500),
(10005,05,'2025-6-19',"Debit",3000),
(10006,06,'2025-5-12',"cash",445),
(10007,07,'2025-4-29',"UPI",450),
(10008,08,'2025-7-29',"cash",250),
(10009,09,'2025-9-9',"cash",1800),
(100010,010,'2025-8-15',"net banking",1500),
(100011,011,'2025-9-9',"UPI",750),
(100012,012,'2025-6-11',"Debit",650),
(100013,013,'2025-6-18',"cash",500),
(100014,014,'2025-8-29',"UPI",700),
(100015,015,'2025-8-18',"UPI",500),
(100016,016,'2025-6-22',"Net banking",1200),
(100017,017,'2025-7-23',"Debit",850),
(100018,018,'2025-8-27',"cash",1500),
(100019,019,'2025-9-9',"UPI",500),
(100020,020,'2025-5-17',"cash",3500),
(100021,021,'2025-4-28',"cash",250),
(100022,022,'2025-6-29',"UPI",550),
(100023,023,'2025-7-26',"dabit",3500),
(100024,024,'2025-9-27',"cash",3000),
(100025,025,'2025-1-28',"UPI",445);


select *from pyment;
commit;


commit;

-- q2.update product prize-- 
update product set prise=500 where name="t-shirt";

 -- q3. delete a user who wont place any order --
  select user_id from user where user_id not in(select user_id from orders);
delete from user where user_id=121;
rollback;

-- q4. list all orders with user name or product --
SELECT 
    o.order_id,
    u.name as user_name,
    p.name as product_name,
    o.order_date
FROM 
    orders o
JOIN 
    user u ON o.user_id = u.user_id
JOIN 
    product p ON o.product_id = p.product_id;

-- q5. show  all products with the number of product to sold 
SELECT 
    p.product_id,
    p.name,
    SUM(p.product_quntity) AS total_sold
FROM 
    product p
 GROUP BY 
    p.product_id, p.name;
    
-- q6.find top 3  selling product by quntity
select name,product_id from product order by product_id desc limit 3 ;
select name,count(product_id) from product group by name limit 3;

-- q7. calculate mounthly sells total

-- select sum(amount),pyment_date from pyment group by  pyment_date;

SELECT
    DATE_FORMAT(pyment_date, '%Y-%m') AS month,
    SUM(amount) AS total_sales
FROM
    pyment
GROUP BY
    DATE_FORMAT(pyment_date, '%Y-%m')
ORDER BY
    month;
    
-- q8. find average order value per User
select avg(order_id),user_id from orders group by user_id;

-- q9. show orders where total amount > 5000 witout using order table

SELECT 
    o.order_id,p.name,
    SUM(p.product_quntity*p.prise) AS total_order_amount
FROM 
    order_details o
JOIN 
    product p ON o.product_id = p.product_id
GROUP BY 
    o.order_id,p.name
HAVING 
    SUM(p.product_quntity*p.prise) > 2000;

-- q10.create a triger to automaticly reduse product stock after inserting order details

delimiter //
create trigger reduse_product_stock
after insert on order_details
for each row 
begin
update product set product_quntity=product_quntity-new.quntity
where product_id=new.product_id;
end//
delimiter ;

insert into order_details(order_detail_id,order_id,product_id,quntity,prize)
values(1026,025,5,1,445);

  

 







