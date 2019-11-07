create table stud_marks1(roll_no int,name varchar2(20),total_marks int);
create table result1(roll_no int,name varchar2(20),class varchar2(20));
insert into stud_marks1 values(1,'v1',1500);
insert into stud_marks1 values(2,'v2',990);
insert into stud_marks1 values(3,'v3',1000);
insert into stud_marks1 values(4,'v4',989);
insert into stud_marks1 values(5,'v5',900);
insert into stud_marks1 values(6,'v6',970);
insert into stud_marks1 values(7,'v7',899);
insert into stud_marks1 values(8,'v8',825);
insert into stud_marks1 values(9,'v9',840);

create or replace function proc_grade(id IN int,n OUT varchar2(20))
	return varchar2 
	as

	roll int;
	nam varchar2(20);
	marks int;
	class varchar2(20);
	begin
	n:= 'Result';
	select roll_no,name,total_marks into roll,nam,marks from stud_marks1 where roll_no = id;
	if (marks<=1500 and marks>=990) then
	class:= 'Distinction';
	elsif (marks>=900 and marks<=989) then
	class:= 'First Class';
	elsif (marks>=825 and marks<=899) then
	class:= 'Higher Second Class';
	else
	class:= 'Fail';
	end if;
	insert into result1(roll_no,name,class) values(roll,name,class);
	return nam;
	end;
	/


declare
a varchar2(20);
b varchar2(20);
begin
b:= proc_grade(3,a);
dbms_output.put_line(a);
dbms_output.put_line(b);
end;
/

