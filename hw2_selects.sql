use hw1;

explain analyze
select count(*) 
    from (select customer.id as customer_id, loan.id as loan_id, loan.return_date, book.id as book_id, book.title, book.price
           from customer
           join loan on customer.id = loan.customer_id
           join book on loan.book_id = book.id
           where loan.return_date > '2023-06-01'
           and book.edition in (1, 2, 3)  
           and book.price < 100
           and customer.phone like '555%') as sub

           
create index idx_customer_id on clone_loan(customer_id);
create index idx_book_id on clone_loan(book_id);
create index idx_return_date on clone_loan(return_date);
           
           
explain analyze           
with cte as (
    select count(*) as count_orders
    from clone_customer 
    join clone_loan on clone_customer.id = clone_loan.customer_id
    join clone_book on clone_loan.book_id = clone_book.id
    where clone_loan.return_date > '2023-06-01'
    AND clone_book.edition IN (1, 2, 3) 
    AND clone_book.price < 100
    AND clone_customer.phone LIKE '555%')
    
select * from cte