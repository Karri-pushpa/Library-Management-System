
#  Library Management System

##  Project Overview

A Library Management System is a relational database system designed to manage and organize library operations efficiently.  
It stores information about books, authors, members, staff, issue and return transactions, fines, and book requests.

The system is built using a structured database model where data is stored in multiple related tables.  
These tables are connected using primary keys and foreign keys to maintain relationships and ensure data integrity.

The system follows normalization principles to reduce redundancy and maintain consistency.  
It uses SQL operations to perform data manipulation and retrieval.

Advanced database concepts such as joins, views, stored procedures, and triggers are implemented to simplify queries, automate tasks, and improve performance.

Overall, the Library Management System provides an organized, accurate, and efficient way to manage library records digitally.

---

# Key Features

-  Add, update, delete, and manage books
-  Manage library members and membership status
-  Issue and return books with tracking
-  Track book availability and copies
-  Manage categories, publishers, and authors
-  Fine calculation and payment tracking
-  Book request and availability status system
-  Automated logging using triggers
-  Complex data retrieval using joins and views

---

 #  Technologies Used

- MySQL
- SQL (DDL, DML, TCL)
- Stored Procedures
- Triggers
- Views
- Relational Database Design

---

 ## Complete Database Structure

## Core Tables

- category
- publisher
- location
- author
- book
- book_author (Many-to-Many relationship)
- member_status
- member
- library_staff
- book_issue
- fine_due
- fine_payment
- book_request_status
- book_request
- book_log (Trigger logging table)

---

## 🔗 Database Relationships

- One-to-Many (Category → Book)
- One-to-Many (Publisher → Book)
- One-to-Many (Member → Book Issue)
- Many-to-Many (Book ↔ Author using book_author)
- Foreign Key Constraints for Referential Integrity

---

##  SQL Concepts Implemented

##  DDL (Data Definition Language)
- CREATE DATABASE
- CREATE TABLE
- ALTER TABLE
- MODIFY COLUMN

##  DML (Data Manipulation Language)
- INSERT
- SELECT
- UPDATE
- DELETE

##  Constraints
- PRIMARY KEY
- FOREIGN KEY
- AUTO_INCREMENT

---

##  Joins Implemented

- INNER JOIN (Book with Category & Publisher)
- LEFT JOIN (All books with optional matches)
- RIGHT JOIN (Members with issue details)

---

##  Views Created

- book_view
- available_books
- book_view1
- members_view

**Purpose of Views:**
- Simplify complex queries
- Improve security
- Reusable query structure
- Display filtered data

---

##  Stored Procedures

- `get_all_books()` – Retrieve all book records
- `add_user()` – Add new member with parameters
- `update_book_title()` – Update book title dynamically

**Concept Used:**
- Parameterized procedures
- Code reusability
- Encapsulation

---

## 🔥 Trigger Implementation

### AFTER INSERT Trigger on Book Table

- Automatically logs inserted book details
- Stores audit information in `book_log` table
- Demonstrates event-driven database logic

---

##  Sample Operations Performed

- Insert new book and member records
- Issue and return books
- Update publication year and book titles
- Delete issue records
- Track fine dues and payments
- Retrieve distinct member cities
- Filter books by publication year and copies
- Execute join queries
- Execute stored procedures
- Verify trigger logging

---

## Learning Outcomes

- Strong understanding of relational database concepts
- Hands-on experience in schema design and normalization
- Practical implementation of joins and relationships
- Experience in creating views, stored procedures, and triggers
- Improved problem-solving using SQL queries

