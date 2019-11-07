create table lib(id int primary key,book_name varchar(255),detail varchar(255));
create table lib_audit(id int primary key ,book_name varchar(255),detail varchar(255),ch_date date,lib_id int);
alter table lib_audit add foreign key (lib_id) references lib(id);

create trigger mytrig2
after insert on lib_audit 
for each row
insert into lib(id,book_name,detail) values(NEW.id,NEW.book_name,NEw.detail);

insert into lib_audit values(1,"ABC","Detail",curdate(),1);


create trigger mytrig1
after delete on lib_audit
for each row
delete from lib where book_name = OLD.book_name;

create trigger mytrig3
after update on lib
for each row
update lib_audit set book_name = NEW.book_name where book_name = OLD.book_name;

create trigger mytrig4
after delete on lib
for each row
delete from lib_audit where book_name = OLD.book_name;