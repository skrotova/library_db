CREATE DATABASE library;
USE library;

CREATE  TABLE book(
	id INT PRIMARY KEY,
	title VARCHAR(255) NOT NULL, 
    author_id INT,
    genre_id INT,
	isbn VARCHAR(255),
    edition INT NOT NULL,
    years INT NOT NULL,
    price DOUBLE NOT NULL,
    
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id) 
);

CREATE  TABLE author(
	id INT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
    birthday DATE NOT NULL,
    nationality VARCHAR(255) NOT NULL,
    biography TEXT 
);
    
CREATE  TABLE publisher(
	name VARCHAR(255) NOT NULL,
    address VARCHAR(255), 
    phone VARCHAR(20),
    website VARCHAR(255) 
);

CREATE  TABLE genre(
	id INT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
    description VARCHAR(255) 
);

CREATE  TABLE customer(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL, 
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    passwords INT NOT NULL
);

CREATE  TABLE loan(
	id INT PRIMARY KEY,
	customer VARCHAR(255),
	customer_id int,
    book_id INT, 
    loan_date DATE NOT NULL, 
    due_date DATE NOT NULL, 
    return_date DATE,
    
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (book_id) REFERENCES book(id)
); 

    
INSERT INTO book (id, title, author_id, genre_id, isbn, edition, years, price) VALUES
	(1, "Hallowe'en Party", 1, 1, "978-0-06-334297-2", 1, "2008", 9.19),
    (2, "Six of Crows", 2, 2, "978-1-51010-628-4", 1, 2018, 21.46),
    (3, "Fleabag", 3, 3, "978-1-529-34179-9", 2, 2016, 21.46),
    (4, "The Mad Women's Ball", 4, 4, "978-1-4197-5760-0", 1, 2021, 15.00),
    (5, "Pride and Prejudice", 5, 5, "978-0-141-439518", 1, 1813, 8.99),
    (6, "Frankenstein", 6, 6, "978-0-486-28273-1", 1, 1818, 10.99),
    (7, "Cain's Jawbone", 7, 7, "978-1-80018-079-6", 2, 2021, 17.95),
    (8, "To Kill a Mockingbird", 8, 8, "978-0-061-120084", 2, 1988, 15.99),
    (9, "The Picture of Dorian Gray", 9, 8, "978-0-486-30268-4", 1, 1890, 11.99),
    (10, "To Kill a Mockingbird", 8, 8, "978-0-061-120085-1", 4, 2022, 22.99),
    (11, "The Guernsey Literary and Potato Peel Pie Society", 10, 4, "978-0-385-34099-1", 1, 2008, 10.76);

INSERT INTO author (id, name, birthday, nationality, biography) VALUES
    (1, "Agatha Christie", "1890-09-15", "British", "Agatha Christie was an English writer known for her detective novels. She is best known for her 66 detective novels and 14 short story collections, as well as the world's longest-running play – The Mousetrap."),
    (2, "Leigh Bardugo", "1975-04-06", "American", "Leigh Bardugo is an American author known for her young adult and fantasy novels. She is best known for her Grisha trilogy and the Six of Crows duology."),
    (3, "Camille Laurens", "1957-11-06", "French", "Camille Laurens is a French author known for her novels and essays. She has won several literary awards for her works, which often explore themes of identity, gender, and relationships."),
    (4, "Victoria Mas", "1988-03-18", "French", "Victoria Mas is a French author known for her debut novel, The Mad Women's Ball. The novel explores the treatment of women in psychiatric institutions in the 19th century and was well-received by critics."),
    (5, "Jane Austen", "1775-12-16", "British", "Jane Austen was an English novelist known primarily for her six major novels, which interpret, critique and comment upon the British landed gentry at the end of the 18th century. Her novels have inspired many adaptations and have a significant impact on English literature."),
    (6, "Mary Shelley", "1797-08-30", "British", "Mary Shelley was an English novelist who wrote the Gothic novel Frankenstein; or, The Modern Prometheus. She also edited and promoted the works of her husband, the Romantic poet and philosopher Percy Bysshe Shelley."),
    (7, "Michelle Birkby", "1989-04-09", "British", "Michelle Birkby is an author known for her novels and short stories. Cain's Jawbone is one of her works, blending mystery and historical fiction."),
    (8, "Harper Lee", "1926-04-28", "American", "Harper Lee was an American novelist widely known for her Pulitzer Prize-winning novel To Kill a Mockingbird, which deals with the issues of racism that she observed as a child in her hometown of Monroeville, Alabama."),
    (9, "Oscar Wilde", "1854-10-16", "Irish", "Oscar Wilde was an Irish poet and playwright known for his wit, aestheticism, and flamboyant style. He is best known for his novel The Picture of Dorian Gray, as well as his plays and epigrams."),
    (10, 'Mary Ann Shaffer', '1934-12-13', 'American', 'Author of The Guernsey Literary and Potato Peel Pie Society.'),
	(11, 'Annie Barrows', '1962-08-24', 'American', 'Co-author of The Guernsey Literary and Potato Peel Pie Society.');

INSERT INTO publisher(name, address, phone, website) VALUES
	("Harper Collins Publishers", "195 Broadway, New York, NY 10007", "1-800-242-7737", "https://www.harpercollins.com/"),
    ("Orion Children's Books", "50 Victoria Embankment, London EC4Y 0DZ", "020-3122-6444", "https://www.orionbooks.co.uk/"),
    ("Nick Hern Books", "49a Goldhawk Road, London W12 8QP", "020-8749-4953", "https://www.nickhernbooks.co.uk/"),
    ("Doubleday", "1745 Broadway, New York City, U.S", "1-212-572-2662", "https://www.doubledaybookclub.com/"),
    ("Dover Publications", "1325 Franklin Ave, Garden City, NY", "01892-888690", "https://store.doverpublications.com/"),
    ("Lackington, Hughes, Harding, Mavor, & Jones", "Finsbury Square", "none", "none"), 
    ("Unbound", "20th St Thomas Street, London, SE1 9RS, United Kingdom", "020-3997-6790", "https://unbound.com/"),
    ("Dial Press", "1745 Broadway New York, NY 10019", "212-782-9000", "https://www.writerscafe.org/");

INSERT INTO genre (id, name, description) VALUES
    (1, "Mystery", "Books that involve solving a crime or puzzle, often with a focus on suspense and investigation."),
    (2, "Fantasy", "Books that feature magic, supernatural elements, or imaginary worlds."),
    (3, "Drama", "Books that depict serious or intense human conflict or emotion."),
    (4, "Historical Fiction", "Books set in the past, often incorporating real historical events or figures."),
    (5, "Classic", "Books that have stood the test of time and are considered exemplary or noteworthy."),
    (6, "Science Fiction", "Books that explore speculative concepts, often related to science and technology."),
    (7, "Literary Fiction", "Books known for their artistic merit and intellectual depth, often focusing on character development and thematic exploration."),
    (8, "Novel", "A novel is an extended work of narrative fiction usually written in prose and published as a book.");

INSERT INTO customer (name, address, phone, email, passwords) VALUES
    ("Emma Brown", "789 Maple Avenue, Anytown, USA", "555-1111", "emma@gmail.com", 1234),
    ("Michael Johnson", "456 Oak Street, Othertown, USA", "555-2222", "michael@gmail.com", 9837),
    ("Sophia Wilson", "123 Elm Street, AnotherTown, USA", "555-3333", "sophia@gmail.com", 9823),
    ("William Martinez", "789 Pine Street, New Town, USA", "555-4444", "william@gmail.com", 4444),
    ("Olivia Davis", "456 Cedar Street, Smalltown, USA", "555-5555", "olivia@gmail.com", 5019),
    ("James Garcia", "123 Birch Street, Bigtown, USA", "555-6666", "james@gmail.com", 6672),
    ("Ava Rodriguez", "789 Walnut Street, Hometown, USA", "555-7777", "ava@gmail.com", 7987),
    ("Noah Jones", "456 Spruce Street, Twin Town, USA", "555-8888", "noah@gmail.com", 8456),
    ("Isabella Nguyen", "123 Sycamore Street, Midtown, USA", "555-9999", "isabella@gmail.com", 9653),
    ("Liam Smith", "789 Cherry Street, Easttown, USA", "555-0000", "liam@gmail.com", 0678);

INSERT INTO loan (id, customer, customer_id, book_id, loan_date, due_date, return_date) VALUES
    (1, "Emma Brown", 1, 1, "2023-02-05", "2025-03-10", "2023-03-5"),
    (2, "Michael Johnson", 2, 5, "2023-01-20", "2023-02-20", "2023-02-25"),
    (3, "Sophia Wilson", 3, 6, "2023-02-01", "2023-03-01", "2023-03-08"),
    (4, "William Martinez", 4, 8, "2023-02-10", "2023-04-10", NULL),
	(5, "Olivia Davis", 5, 3, "2023-02-15", "2023-03-22", "2023-03-22"),
    (6, "James Garcia", 6, 9, "2023-01-25", "2023-02-25", "2023-03-01"),
    (7, "Ava Rodriguez", 7, 4, "2023-01-15", "2023-02-28", "2023-01-25"),
    (8, "Noah Jones", 8, 10, "2023-02-05", "2023-03-05", "2023-03-12"),
    (9, "Isabella Nguyen", 9, 2, "2023-02-10", "2023-03-20", "2023-03-15"),
    (10, "Liam Smith", 10, 7, "2023-01-15", "2023-02-20", NULL),
    (11, "Emma Brown", 1, 3, "2023-02-05", "2023-03-10", "2023-03-5"),
    (12, "Michael Johnson", 2, 4, "2023-01-20", "2023-02-20", "2023-02-25"),
    (13, "Sophia Wilson", 3, 1, "2023-02-01", "2023-03-01", "2023-03-08"),
    (14, "William Martinez", 4, 2, "2023-02-10", "2023-04-10", NULL),
	(15, "Olivia Davis", 5, 9, "2023-02-15", "2023-03-22", "2023-03-22");


SELECT 
    c.name AS customer_name, 
    b.title AS book_title, 
    a.name AS author_name, 
    g.name AS genre_name, 
    COUNT(l.id) AS total_loans, 
    COUNT(l.return_date) AS returned_books
FROM loan l
JOIN customer c ON l.customer_id = c.id
JOIN book b ON l.book_id = b.id
JOIN author a ON b.author_id = a.id
JOIN genre g ON b.genre_id = g.id
WHERE l.loan_date >= '2023-01-01' 
GROUP BY c.name, b.title, a.name, g.name
ORDER BY total_loans DESC, returned_books DESC;


CREATE TABLE not_returned AS 
SELECT author.id, author.name
FROM author
JOIN book ON author.id = book.author_id
JOIN loan ON book.id = loan.book_id
WHERE loan.return_date IS NULL
ORDER BY author.id;

SELECT * FROM not_returned;



SELECT name FROM author
UNION 
SELECT title FROM book;

SELECT name FROM author WHERE nationality = "British"
UNION ALL
SELECT title FROM book WHERE edition = 1;



