create database library;
use library;
#  create table "category"
create table category(category_id int  primary key,category_name varchar(100));
alter table category add category_id int auto_increment;
describe category;

# create table "publisher"
create table publisher(
						publisher_id int auto_increment primary key ,publisher_name varchar(100),
						publishcation_language varchar(100),publication_type varchar(100));
describe publisher;
# create table "Location"
create table location(
					location_id int primary key auto_increment,
                    shelf_no int,shelf_name varchar(100));
describe location;
alter table location add floor_no int;
alter table location modify shelf_no varchar(10);
# create table "author"
create table author(
				author_id int primary key auto_increment,
                first_name varchar(100),last_name varchar(100));
describe author;
# create table "book"
create table book(
				book_id int primary key auto_increment,book_title varchar(100),
				category_id int,publisher_id int,publication_year int,copies_total int,
                location_id int,FOREIGN KEY (category_id) REFERENCES category(category_id),
                FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
                FOREIGN KEY (location_id) REFERENCES location(location_id));
alter table book add ISBN_code int after book_id;
alter table book modify ISBN_code varchar(50);
describe book;
# create table "book author"
create table book_author(
			book_id int,author_id int,
            primary key(book_id,author_id),
            FOREIGN KEY(book_id) REFERENCES book(book_id),
            FOREIGN KEY(author_id) REFERENCES author(author_id));
describe book_author;
# create table "Member status"
create table member_status(
				active_status_id int primary key auto_increment,
				account_type varchar(50),account_status varchar(50),
				membership_start_date date,membership_end_date date);
 describe member_status;
 # create table "Member"
 create table member(
			member_id int primary key auto_increment,first_name varchar(50),last_name varchar(50),
			city varchar(50),mobile_no int , Email varchar(50),active_status_id int,
			FOREIGN KEY(active_status_id) REFERENCES member_status(active_status_id));
alter table member drop column last_name;
describe member;
alter table member modify mobile_no varchar(10);  
# create table "library_staff"
create table library_staff(
				issued_by_id int primary key auto_increment,
                staff_name varchar(50),staff_designation varchar(50));
describe library_staff;
# create table "book issue table"
create table book_issue(
					issue_id int primary key auto_increment,book_id int,
					member_id int,issue_date date,
					return_date date, issue_status varchar(50),issued_by_id int,
                    FOREIGN KEY(book_id) REFERENCES book(book_id),
                    FOREIGN KEY(member_id) REFERENCES member(member_id),
                    FOREIGN KEY(issued_by_id) REFERENCES library_staff(issued_by_id));
describe book_issue;
# create table "Fine Due"
create table fine_due(
				fine_id int primary key auto_increment,member_id int,
                issue_id int,fine_date date,fine_total int,
                FOREIGN KEY(member_id) REFERENCES member(member_id),
                FOREIGN KEY(issue_id) REFERENCES book_issue(issue_id));
describe fine_due;
# create table "fine payment"
create table fine_payment(
				fine_payment_id int primary key auto_increment,member_id int,
                payment_date date,payment_amount int,
                FOREIGN KEY(member_id) REFERENCES member(member_id));
describe fine_payment;
# create table "book request status"
create table book_request_status(
						available_status_id int primary key auto_increment, available_status varchar(50),
                        nearest_available_date date,publication_type varchar(50));
describe book_request_status;
# create table "book request"
create table book_request(
					request_id int primary key auto_increment,book_id int,member_id int,
                    available_status_id int,
                    FOREIGN KEY(book_id) REFERENCES book(book_id),
                    FOREIGN KEY(member_id) REFERENCES member(member_id),
                    FOREIGN KEY(available_status_id) REFERENCES book_request_status(available_status_id));
describe book_request;

show tables;

# insert values
INSERT INTO category (category_name) VALUES('Science'),('Fiction'),('Computer'),('History'),('Math'),('Social'),('Stories'),('Mystery'),('Psychology'),('Poetry');

select * from category;

INSERT INTO publisher (publisher_name, publishcation_language, publication_type) 
VALUES('A','English','Book'),('B','English','Book'),
('C','English','Book'),('D','English','Book'),
('E','English','Book'),('F','English','Book'),
('G','English','Book'),('H','English','Book'),
('I','English','Book'),('J','English','Book');

select * from publisher;

INSERT INTO location (shelf_no, shelf_name, floor_no) VALUES('A1','Science Shelf',1),('A2','Fiction Shelf',1),
('B1','Computer Shelf',2),('B2','History Shelf',2),('C1','Math Shelf',3),('C2','Social Shelf',3),('D1','Stories Shelf',4),
('D2','Mystery Shelf',4),('E1','Psychology Shelf',5),('E2','Poetry Shelf',5);

select * from location;

INSERT INTO author (first_name, last_name) VALUES('Ravi','Kumar'),('Anita','Sharma'),('Amit','Patel'),
('Neha','Verma'),('Arjun','Rao'),('William','Shakespeare'),('Rabindranath','Tagore'),('Chetan','Bhagat'),
('J.K.','Rowling'),('George','Orwell');

select * from author;

INSERT INTO member_status (account_type, account_status, membership_start_date, membership_end_date) 
VALUES('Student','Active','2024-01-01','2026-01-01'),('Student','Active','2024-02-01','2026-02-01'),
('Staff','Active','2023-01-01','2026-01-01'),('Student','Inactive','2022-01-01','2023-01-01'),
('Staff','Active','2023-06-01','2026-06-01'),('Student','Active','2024-02-05','2026-09-04'),
('Student','Inactive','2024-03-05','2026-08-02'),('Staff','Active','2024-05-01','2026-01-01'),
('Staff','Inactive','2020-09-01','2023-01-01'),('Staff','Active','2024-01-01','2026-06-01');

select * from member_status;

INSERT INTO member 
(first_name, last_name, city, mobile_no, Email, active_status_id) VALUES
('Rahul','Hyderabad','9000000001','rahul@gmail.com',1),
('Sneha','Chennai','9000000002','sneha@gmail.com',2),
('Vikas','Delhi','9000000003','vikas@gmail.com',3),
('Pooja','Kerala','9000000004','pooja@gmail.com',4),
('Suresh','Guntur','9000000005','suresh@gmail.com',5),
('Pushpa','Hyderabad','9000225001','pushpa@gmail.com',6),
('Sri','Chennai','9045680025','sriharshini@gmail.com',7),
('Lavnya','Delhi','9547845783','lavnya@gmail.com',8),
('sowjanya','Kerala','9347056345','sowji@gmail.com',9),
('Prudhuvi','Guntur','9568923415','prudhvi@gmail.com',10);

select * from member;

INSERT INTO library_staff (staff_name, staff_designation) VALUES
('Ramesh','Lib rarian'),('Sita','Assistant'),
('Mahesh','Clerk'),('Sunita','Librarian'),
('Raju','Assistant'),('Raja','Librarian'),
('Sriram','Assistant'),('Maya','Clerk'),
('Syamala','Librarian'),('Raj','Assistant');

update library_staff set staff_name="Reddy" where issued_by_id=4;
select * from library_staff;

INSERT INTO book (ISBN_code, book_title, category_id, publisher_id, publication_year, copies_total, location_id) VALUES
('ISBN101','Science Book',1,1,2021,10,1),('ISBN102','Story Book',2,2,2020,8,2),
('ISBN103','Computer Book',3,3,2022,12,3),('ISBN104','History Book',4,4,2019,6,4),
('ISBN105','Math Book',5,5,2023,15,5),('ISBN106','Social Book',6,6,2021,9,6),
('ISBN107','Story Book',7,7,2019,8,7),('ISBN108','Mystery Book',8,8,2022,12,8),
('ISBN109','Pyschology Book',9,9,2019,6,9),('ISBN110','Poetry Book',10,10,2005,15,10);
INSERT INTO book (ISBN_code, book_title, category_id, publisher_id, publication_year, copies_total, location_id) VALUES
('ISBN101','Science Book',1,1,2021,10,1);
INSERT INTO book (ISBN_code, book_title, category_id, publisher_id, publication_year, copies_total, location_id) VALUES
('ISBN101','Science Book',1,1,2021,10,2);
select * from book;

INSERT INTO book_author (book_id, author_id) VALUES(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);

select * from book_author;

INSERT INTO book_issue (book_id, member_id, issue_date, return_date, issue_status, issued_by_id) VALUES
(1,1,'2025-01-01','2025-01-10','Returned',1),
(2,2,'2025-01-05',NULL,'Issued',2),
(3,3,'2025-01-07','2025-01-15','Returned',3),
(4,4,'2025-01-10',NULL,'Issued',4),
(5,5,'2025-01-12',NULL,'Issued',5),
(6,6,'2025-02-01','2025-01-10','Returned',6),
(7,7,'2025-03-05',NULL,'Issued',7),
(8,8,'2025-01-09','2025-01-15','Returned',8),
(9,9,'2024-01-10',NULL,'Issued',9),
(10,10,'2024-02-12',NULL,'Issued',10);
update book_issue set return_date="2027-02-20" where issue_status="Returned" limit 6;
update book_issue set return_date="2027-02-20" where issue_status="Issued" limit 6;

select * from book_issue;

INSERT INTO fine_due (member_id, issue_id, fine_date, fine_total) VALUES
(1,1,'2025-01-12',20),(3,3,'2025-01-16',10),(4,4,'2025-01-18',15),(5,5,'2025-01-20',5),(2,2,'2025-01-22',25),
(6,6,'2025-01-12',20),(7,7,'2025-01-20',10),(8,8,'2025-01-18',20),(9,9,'2025-01-20',5),(10,10,'2025-01-22',25);


select * from fine_due;

INSERT INTO fine_payment (member_id, payment_date, payment_amount) VALUES
(1,'2025-01-13',20),(3,'2025-01-17',10),(4,'2025-01-19',15),(5,'2025-01-21',5),(2,'2025-01-23',25),
(6,'2025-01-15',20),(7,'2025-01-20',10),(8,'2025-01-25',15),(9,'2025-01-01',5),(10,'2025-01-23',25);


select * from fine_payment;

INSERT INTO book_request_status (available_status, nearest_available_date, publication_type) VALUES
('Available','2025-02-01','Book'),('Not Available','2025-02-10','Book'),
('Available','2025-02-05','Book'),('Not Available','2025-02-15','Book'),
('Available','2025-02-08','Book'),('Available','2025-04-01','Book'),
('Not Available','2025-09-10','Book'),('Available','2025-07-05','Book'),
('Not Available','2025-09-15','Book'),('Available','2025-04-08','Book');

select * from book_request_status;

INSERT INTO book_request (book_id, member_id, available_status_id) VALUES
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),
(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);

select * from book_request;

select * from book;
select distinct city from member;
select book_title,Publication_year from book;
update  book set book_title="cs book" where book_id=5;
update book set publication_year=2002 where book_id=2;
select * from book;

delete from book_issue  where issue_id between 6 and 10;
select * from book_issue;
update book_issue set return_date="2026-01-15" where issue_id=2;
update book_issue set return_date="2026-01-5" where issue_id=2;
update book_issue set return_date="2026-01-25" where issue_id=2;

select * from member_status where account_status="Active";
select * from book where publication_year>2020;
select * from book where copies_total>5;
select * from member;
select * from member where city="Kerala";

select b.ISBN_code,book_title,b.copies_total,b.category_id,c.category_name 
from book b 
inner join category c 
on b.category_id = c.category_id;

select b.ISBN_code,book_title,b.copies_total,b.category_id,c.category_name 
from book b 
left join category c 
on b.category_id = c.category_id;

select * from member;
select * from book_issue;

select m.first_name,m.city,b.book_id
from member m 
right join book_issue b
on m.member_id = b.member_id;
select * from book;
select * from category;
select * from publisher;
select b.book_title, b.ISBN_code,c.category_name,p.publisher_name
from book b
Inner join category c
on b.category_id=c.category_id
Inner join publisher p
on b.publisher_id=p.publisher_id;
select * from book;


select b.book_title, b.ISBN_code,c.category_name,p.publisher_name
from book b
left join category c
on b.category_id=c.category_id
left join publisher p
on b.publisher_id=p.publisher_id;
select * from book;

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