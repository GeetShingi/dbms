create table borrower1(roll_no int primary key,name varchar2(20),doi date, nob varchar2(20),status varchar2(3));
create table fine1(roll_no int, dat date, amount int );
insert into borrower1 values(22,'dar','05-NOV-19','harrypotter','I');
insert into borrower1 values	(24,'ved','08-SEP-19','LOR','I');

declare
roll int;
nbo varchar2(20);
fine int;
days int;
begin
roll:=&roll;
nbo:=&nameofbook;
select (sysdate-doi) into days where roll_no = roll and nob = nbo;
if (days<=30) then
fine:= days*5;
else
fine:= 30*5 + (days-30)*50;
end if;
insert into fine1(roll_no,dat,amount) values(roll,sysdate,fine);
update borrower1 set status = 'R' where roll_no = roll;
exception
when no_data_found then
dbms_output.put_line('No record found');
when others then
dbms_output.put_line('Exception');
end;
/