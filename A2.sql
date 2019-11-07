create table book_authors(book_isbn int not null AUTO_INCREMENT,author_name varchar(255),author_city varchar(255) default 'Pune',phone varchar(255) unique,primary key (book_isbn),foreign key (book_isbn) references book(book_isbn) on delete cascade);

create table book(book_isbn int not null,title varchar(255) not null,publisher_name varchar(255),price int check (price>0),primary key (book_isbn));

alter table book_authors add column address varchar(255);

alter table book add column date_of_publication date;

update book set date_of_publication = '2012-02-29' where book_isbn = "1234";

create view book_table as select book_isbn, title, publisher_name from book;

create view book_table1 as select * from book where year(date_of_publication) > 2014;

drop view book_table;

insert into book_table1 values("1238","ABC","McGraw",20,"2019-08-26");

update book_table1 set price = 30 where book_isbn = "1236";

update book_table1 set title = "XYZ" where book_isbn = "1236";

create index index1 on book(book_isbn);

create index index2 on book_authors(book_isbn,author_name);

alter table book_authors drop index index2;

alter table book_authors AUTO_INCREMENT = 100;