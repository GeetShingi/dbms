select * from book where book_isbn = (select book_isbn from book_authors where author_ciy = 'Pune');

select title from book where book_copy between 10 and 15;

select avg(price) from book where year(date_of_publication) between 2011 and 2016;

select author_name from book_authors where book_isbn = (select book_isbn from book where price = (select min(price) from book));

select upper(author_name) from book_authors where author_city = 'Pune';

select book_isbn from book union select book_isbn from book_authors;

update book set book_copy = 10 where publisher_name = "McGraw";

select publisher_name from book where book_copy = (select max(book_copy) from book);

create view view1 as select publisher_name,count(*) as books from book group by publisher_name;
select publisher_name from view1 where books = (select max(books) from view1);

select publisher_name from book where book_isbn = (select book_isbn from book_authors where author_name like "K%");

select publisher_name from book order by title asc;

select sum(book_copy) from book where date_of_publication between "2014-01-01" and curdate();

delete from book where book_isbn = (select book_isbn from book_authors where author_name = "Korth");