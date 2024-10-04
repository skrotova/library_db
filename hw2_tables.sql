use hw1;

CREATE  TABLE customer(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL, 
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    passwords INT NOT NULL
);

CREATE  TABLE book(
	id INT auto_increment PRIMARY KEY,
	title VARCHAR(255) NOT NULL, 
	isbn VARCHAR(255),
    edition INT NOT NULL,
    years INT NOT NULL,
    price DOUBLE NOT NULL
);

CREATE  TABLE loan(
	id INT auto_increment PRIMARY KEY,
	customer_id int,
    book_id INT, 
    return_date DATE,
    
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (book_id) REFERENCES book(id)
); 

 
CREATE TABLE clone_customer LIKE customer;
CREATE TABLE clone_book LIKE book;
CREATE TABLE clone_loan LIKE loan;


INSERT INTO clone_customer
SELECT * FROM customer;

INSERT INTO clone_book
SELECT * FROM book;

INSERT INTO clone_loan
SELECT * FROM loan;


   

