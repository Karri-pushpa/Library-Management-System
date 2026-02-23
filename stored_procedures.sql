DELIMITER $$
create procedure get_all_books()
BEGIN
select * from book;
END $$
DELIMITER ;

Call get_all_books();

DELIMITER $$
create procedure add_user(
		IN p_first_name varchar(20),
        IN p_city varchar(10),
        IN p_mobile_no varchar(10),
        IN p_email varchar(15),
        IN p_status_id int
)
BEGIN 
insert into member(first_name,city,mobile_no,email,active_status_id)
values(p_first_name,p_city,p_mobile_no,p_email,p_status_id);
END $$
DELIMITER ;
call add_user("kiran","Vizag","969654123","kiran@gmail.com",1);
select * from member;
# update book title
DELIMITER $$
create procedure update_book_title(
		IN p_book_id int,
        IN p_book_title varchar(50)
)
BEGIN
update book set book_title=p_book_title where book_id=p_book_id;
END $$
DELIMITER ;

# Triggers 
CREATE TABLE book_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    ISBN_code VARCHAR(50),
    book_title VARCHAR(100),
    inserted_time DATETIME
);

DELIMITER $$

CREATE TRIGGER book_after_insert
AFTER INSERT ON book
FOR EACH ROW
BEGIN
    INSERT INTO book_log 
    (book_id, ISBN_code, book_title, inserted_time)
    VALUES 
    (NEW.book_id, NEW.ISBN_code, NEW.book_title, NOW());
END$$

DELIMITER ;

INSERT INTO book 
(ISBN_code, book_title, category_id, publisher_id, publication_year, copies_total)
VALUES
('ISBN101', 'Python Basics', 10, 10, 2023, 5);

SELECT * FROM book_log;
DESC book;
DESC book_log;
select * from book;