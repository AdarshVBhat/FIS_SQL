use MySql

----------------------------------------ASSIGNMENT 3------------------------------------------

--1
create table books(
	id int primary key,
	title char(100),
	author varchar(30),
	isbn bigint unique,
	published_date smalldatetime 
	)

insert into books values (1,'My First SQL book','Mary Parker',981483029127,'2012-02-22 12:08:17'), (2,'My Second SQL book','John Mayer',857300923713,'1972-07-03 09:22:45'), (3,'My Third SQL book','Cary Flint',523120967812,'2015-10-18 14:05:44')

select * from books

select * from books where author like '%er'

--2
create table reviews(
	id int primary key ,
	book_id int foreign key references books (id),
	reviewer_name varchar(20),
	content char(50),
	rating int,
	published_date smalldatetime 
	)

insert into reviews values (1, 1, 'John Smith', 'My First review', 4, '2017-12-10 05:50:11'), (2, 2, 'John Smith', 'My Second review', 5, '2017-10-13 15:05:12'), (3, 2, 'Alice Walker', 'Another review', 1, '2017-10-22 23:47:10')

select * from reviews 

select t1.title , t1.author , t2.reviewer_name from books t1 , reviews t2 where t1.id = t2.book_id

--3
select reviewer_name as 'reviewed more than one book' from reviews group by reviewer_name having count(distinct book_id) > 1

--4
create table customer(
	ID int primary key,
	NAME varchar(30),
	AGE int,
	ADDRESS varchar(30),
	SALARY int 
	)

insert into customer values (1, 'Ramesh', 32 , 'Ahmedabad' , 2000), (2, 'Khilan', 25 , 'Delhi' , 1500), (3, 'kaushik', 23 , 'Kota' , 2000), (4, 'Chaitali', 25 , 'Mumbai' , 6500), (5, 'Hardik', 27 , 'Bhopal' , 8500), (6, 'Komal', 22 , 'MP' , 5500), (7, 'Muffy', 24 , 'Indore' , 10000)

select * from customer

select NAME from customer where ADDRESS like '%o%' 

--5
create table orders(
	OID int primary key,
	DATE smalldatetime,
	CUSTOMER_ID int foreign key references customer(ID),
	AMOUNT int
	)

insert into orders values (102, '2009-10-08 00:00:00', 3 , 3000), (100, '2009-10-08 00:00:00', 3 , 1500), (101, '2009-11-20 00:00:00', 2 , 1560), (103, '2008-05-20 00:00:00', 4 , 2060)

select * from orders

select DATE, count(CUSTOMER_ID) as 'ORDERS' from orders group by DATE

--6
create table employee(
	ID int primary key,
	NAME varchar(30),
	AGE int , 
	ADDRESS varchar(30),
	SALARY int
	)

insert into Employee values (1, 'Ramesh', 32 , 'Ahmedabad' , 2000), (2, 'Khilan', 25 , 'Delhi' , 1500), (3, 'kaushik', 23 , 'Kota' , 2000), (4, 'Chaitali', 25 , 'Mumbai' , 6500), (5, 'Hardik', 27 , 'Bhopal' , 8500), (6, 'Komal', 22 , 'MP' , null), (7, 'Muffy', 24 , 'Indore' , null)

select * from employee

select lower(NAME) as 'NO SALARY' from employee where SALARY is null 

--7
create table studentdetails(
 	RegisterNo int primary key,
 	Name varchar(30),
	Age int,
	Qualification varchar(30),
	MobileNo bigint,
	Mail_id varchar(30),
 	Location varchar(30),
	Gender char(1)
	)

insert into studentdetails values (2 , 'Sai', 22 , 'B.E', 9952836777 , 'Sai@gmail.com' , 'Chennai', 'M'), (3 , 'Kumar', 20 , 'BSC', 7890125648 , 'Kumar@gmail.com' , 'Madurai', 'M'), (4 , 'Selvi',22 , 'B.Tech', 8904567342 , 'selvi@gmail.com' , 'Selam', 'F'), (5 , 'Nisha', 25 , 'M.E', 7834672310 , 'Nisha@gmail.com' , 'Theni', 'F'),  (6 , 'SaiSaran', 21 , 'B.A', 7890345678 , 'saran@gmail.com' , 'Madurai', 'F'), (7 , 'Tom', 23 , 'BCA', 89012345675 , 'Tom@gmail.com' , 'Pune', 'M')

select * from studentdetails

select Gender , Count(Gender) as 'Total no of male and female' from studentdetails group by Gender

--8
create table coursedetails(
	C_id varchar(30) primary key,
	C_Name varchar(30),
	Start_date date,
	End_date date,
	Fee int
	)

insert into coursedetails values ('DN003', 'DotNet', '2018-02-01', '2018-02-28', 15000), ('DV004', 'Date Visualization', '2018-03-01', '2018-04-15', 15000), ('JA002', 'Advanced Java', '2018-01-02', '2018-01-20', 10000), ('JC001', 'CoreJava', '2018-01-02', '2018-01-12', 3000)

select * from coursedetails

create table courseregistration(
	RegisterNo int ,
	Cid varchar(30) foreign key references coursedetails(C_id),
	Batch varchar(30)
	)

insert into courseregistration values (2, 'DN003', 'FN'), (3, 'DV004', 'AN'), (4, 'JA002', 'FN'),(2,'JA002', 'AN'),(5,'JC001', 'FN')

select * from courseregistration

--doubt
select t1.C_Name , t2.Cid, count(t2.RegisterNo) as 'Students Registered'  from coursedetails t1 left join courseregistration t2 on t1.C_id = t2.Cid where Start_date between '2018-01-02' and '2018-02-28'  group by t1.C_Name, t2.Cid order by t2.Cid desc

--9
create table customer2(
	customer_id int primary key,
	first_name varchar(30),
	last_name varchar(30),
	)

insert into customer2 values (1, 'George', 'Washington'), (2, 'John', 'Adams'), (3, 'Thomas', 'Jefferson'), (4, 'James', 'Madison'), (5, 'James', 'Monroe')

select * from customer2

create table order2(
	order_id int primary key,
	order_date date,
	amount float,
	customer_id int foreign key references customer2(customer_id)
)

insert into order2 values (1, '1776-07-04', 234.56, 1), (2, '1760-03-14', 78.50, 3), (3, '1784-05-23',124.00, 2), (4, '1790-09-03', 65.50, 3), (5, '1795-07-21', 25.50, 5), (6, '1787-11-27', 14.40, 4)

select * from order2

select t1.first_name , t1.last_name from customer2 t1 join order2 t2 on t1.customer_id = t2.customer_id  group by t1.first_name , t1.last_name having count(t2.customer_id) = 2

--10
select reverse(Name) as Revsersed_Name, upper(Location) as Location from studentdetails

--11
create table ORD(
	Id int primary key,
	OrderDate date,
	OrderNumber int,
	CustomerId varchar(30),
	TotalAmount int
	)

create table ORDERITEM(
	Id int foreign key references ORD(Id),
	OrderId varchar(30),
	ProductId varchar(30),
	UnitPrice int,
	Quantity int
	)

create table PRODUCT(
	Id int foreign key references ORD(Id),
	ProductName varchar(30),
	SupplierId varchar(30),
	UnitPrice int,
	Package varchar(30),
	IsDiscontinued varchar(30)
	)

--doubt
select PRODUCT.ProductName, ORDERITEM.Quantity, ORD.OrderNumber from ORD inner join ORDERITEM on ORD.Id = ORDERITEM.Id inner join PRODUCT on ORD.Id = PRODUCT.Id

--12
select t1.C_Name from studentdetails t2 join courseregistration t3 on t2.RegisterNo = t3.RegisterNo  join coursedetails T1 on T1.C_id = T3.Cid where T2.Name = 'Nisha'


