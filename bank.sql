create database bank;
use bank;

desc Customer_types;
create table account_types(account_type_code varchar(15) primary key not null,account_type_description varchar(40));

desc account_types;
create table merchants(merchant_id int primary key Auto_increment,merchant_name varchar(40),merchant_phone int,merchant_email varchar(40),other_details varchar(40));
alter table merchants modify merchant_phone varchar(40);
desc merchants;
show tables;
create table transaction_types(transcation_types_code varchar(15) primary key,transaction_types_description varchar(40));
desc transaction_types;
create table customers(
			customer_id int primary key auto_increment,customer_name varchar(40),customer_phone int,
			customer_email varchar(40),date_become_customers date,login varchar(40),password varchar(40),
            other_details varchar(40),Customer_types_code VARCHAR(15),
			foreign key(Customer_types_code)references Customer_types(Customer_types_code));
DESC customers;
alter table customers modify customer_phone varchar(40);
create table accounts(
				account_id int primary key auto_increment,account_name varchar(40),date_opened date,other_account_details int,
				account_type_code varchar(15),foreign key(account_type_code) references account_types(account_type_code));
desc accounts;
create table merchant_details(
					product_and_service_code varchar(15) primary key,product_service_description varchar(40),merchant_id int,
					foreign key(merchant_id) references merchants(merchant_id));
desc merchant_details;
create table customer_purchase(
			purchase_id int primary key auto_increment,date date,quantity float8,other_details varchar(40),
			customer_id int,product_and_service_code varchar(40),foreign key(customer_id)  references customers(customer_id),
			foreign key(product_and_service_code) references merchant_details(product_and_service_code));
desc customer_purchase;
create table accounts1(
			transaction_id int primary key auto_increment,date date,amount_of_transaction float8,other_details varchar(40),
            purchase_id int,account_id int,
            foreign key(purchase_id) references customer_purchase(purchase_id),
            foreign key(account_id) references accounts(account_id));
desc accounts1;
INSERT INTO Customer_types VALUES
('REG','Regular Customer'),
('VIP','VIP Customer'),
('STU','Student Customer'),
('SNR','Senior Citizen'),
('COR','Corporate'),
('PRE','Premium'),
('NRI','NRI Customer'),
('BUS','Business Customer'),
('EMP','Employee'),
('GOV','Government');
select * from Customer_types;
INSERT INTO account_types VALUES
('SAV','Savings Account'),('CUR','Current Account'),('FD','Fixed Deposit'),
('RD','Recurring Deposit'),('SAL','Salary Account'),('NRI','NRI Account'),
('DEM','Demat Account'),('MIN','Minor Account'),('JNT','Joint Account'),('COR','Corporate Account');
select * from account_types;
INSERT INTO merchants
(merchant_name,merchant_phone,merchant_email,other_details)
VALUES
('Amazon',9876543210,'amazon@gmail.com','Online Store'),
('Flipkart',9123456780,'flipkart@gmail.com','E-commerce'),
('Myntra',9012345678,'myntra@gmail.com','Fashion'),
('Swiggy',9090909090,'swiggy@gmail.com','Food Delivery'),
('Zomato',8888888888,'zomato@gmail.com','Restaurant Service'),
('Paytm',7777777777,'paytm@gmail.com','Wallet'),
('Uber',7666666666,'uber@gmail.com','Transport'),
('Ola',7555555555,'ola@gmail.com','Taxi Service'),
('BigBasket',7444444444,'bb@gmail.com','Groceries'),
('Meesho',7333333333,'meesho@gmail.com','Reselling');
select * from merchants;
INSERT INTO transaction_types VALUES
('CR','Credit'),
('DB','Debit'),
('TRF','Transfer'),
('ATM','ATM Withdrawal'),
('UPI','UPI Payment'),
('NEFT','NEFT Transfer'),
('RTGS','RTGS Transfer'),
('IMPS','IMPS Transfer'),
('POS','Swipe Machine'),
('INT','Interest Credit');
select * from transaction_types;
INSERT INTO customers
(customer_name,customer_phone,customer_email,date_become_customers,
login,password,other_details,Customer_types_code)
VALUES
('Ravi Kumar',9000000001,'ravi@gmail.com','2023-01-10','ravi1','pass1','Active','REG'),
('Sita Rao',9000000002,'sita@gmail.com','2023-02-11','sita2','pass2','Active','VIP'),
('Arjun',9000000003,'arjun@gmail.com','2023-03-12','arjun3','pass3','Active','STU'),
('Priya',9000000004,'priya@gmail.com','2023-04-13','priya4','pass4','Active','PRE'),
('Kiran',9000000005,'kiran@gmail.com','2023-05-14','kiran5','pass5','Active','BUS'),
('Divya',9000000006,'divya@gmail.com','2023-06-15','divya6','pass6','Active','EMP'),
('Rahul',9000000007,'rahul@gmail.com','2023-07-16','rahul7','pass7','Active','COR'),
('Anjali',9000000008,'anjali@gmail.com','2023-08-17','anjali8','pass8','Active','SNR'),
('Vikram',9000000009,'vikram@gmail.com','2023-09-18','vikram9','pass9','Active','NRI'),
('Meena',9000000010,'meena@gmail.com','2023-10-19','meena10','pass10','Active','GOV');
select * from customers;
desc accounts; 
INSERT INTO accounts (account_id,account_name,date_opened,other_account_details,account_type_code)
values (11,"lavanya Savings",'2024-3-4',2002,'SAV');
select * from accounts;
Insert into accounts(account_name,date_opened,other_account_details,account_type_code)
VALUES
('Ravi Savings','2023-01-15',1001,'SAV'),
('Sita Current','2023-02-20',1002,'CUR'),
('Arjun FD','2023-03-25',1003,'FD'),
('Priya RD','2023-04-28',1004,'RD'),
('Kiran Salary','2023-05-30',1005,'SAL'),
('Divya NRI','2023-06-10',1006,'NRI'),
('Rahul Demat','2023-07-12',1007,'DEM'),
('Anjali Minor','2023-08-14',1008,'MIN'),
('Vikram Joint','2023-09-16',1009,'JNT'),
('Meena Corporate','2023-10-18',1010,'COR');
select * from accounts;
INSERT INTO merchant_details VALUES
('PRD1','Electronics',1),
('PRD2','Clothing',2),
('PRD3','Shoes',3),
('PRD4','Food Order',4),
('PRD5','Restaurant Bill',5),
('PRD6','Recharge',6),
('PRD7','Cab Ride',7),
('PRD8','Taxi Ride',8),
('PRD9','Groceries',9),
('PRD10','Reselling Items',10);
select * from merchant_details;

INSERT INTO customer_purchase
(date,quantity,other_details,customer_id,product_and_service_code)
VALUES
('2024-01-01',1,'Online',1,'PRD1'),
('2024-01-02',2,'Shopping',2,'PRD2'),
('2024-01-03',1,'Shoes Buy',3,'PRD3'),
('2024-01-04',3,'Food',4,'PRD4'),
('2024-01-05',2,'Dinner',5,'PRD5'),
('2024-01-06',1,'Recharge',6,'PRD6'),
('2024-01-07',1,'Uber Ride',7,'PRD7'),
('2024-01-08',2,'Taxi',8,'PRD8'),
('2024-01-09',5,'Groceries',9,'PRD9'),
('2024-01-10',1,'Reselling',10,'PRD10');
select * from customer_purchase;

INSERT INTO accounts1
(date,amount_of_transaction,other_details,purchase_id,account_id)
VALUES
('2024-01-01',15000.50,'Payment',1,1),
('2024-01-02',2500.75,'Payment',2,2),
('2024-01-03',3200.00,'Payment',3,3),
('2024-01-04',850.25,'Payment',4,4),
('2024-01-05',1200.00,'Payment',5,5),
('2024-01-06',500.00,'Payment',6,6),
('2024-01-07',760.00,'Payment',7,7),
('2024-01-08',900.00,'Payment',8,8),
('2024-01-09',4300.00,'Payment',9,9),
('2024-01-10',2100.00,'Payment',10,10);
select * from accounts1;
select * from Customer_types;
select * from customers;
select c.Customer_types_description,ci.customer_name,ci.customer_id,ci.customer_email 
from Customer_types c
inner join customers ci
on c.Customer_types_code=ci.Customer_types_code; 

select c.Customer_types_description,ci.customer_name,ci.customer_id,ci.customer_email 
from Customer_types c
left join customers ci
on c.Customer_types_code=ci.Customer_types_code;

select c.Customer_types_description,ci.customer_name,ci.customer_id,ci.customer_email 
from Customer_types c
right join customers ci
on c.Customer_types_code=ci.Customer_types_code;

# create views

create view book_view as select book_id,book_title from book;
select * from book_view;

create view available_books as 
select book_id,book_title
from book
where copies_total>0;
select * from available_books;

create view book_view1 as 
select book_id,ISBN_code,book_title
from book;
select * from book_view1;
select * from member;
create view members_view as 
select member_id,first_name,city
from member;
select * from members_view;





