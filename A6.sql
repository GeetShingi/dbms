create table old(roll_no int primary key,fname varchar2(20),lname varchar2(20));
create table new(roll_no int primary key,fname varchar2(20),lname varchar2(20));
insert into old values(1,'ved','wagh');
insert into old values(2,'ved1','wagh1');
insert into old values(3,'ved12','wagh2');
insert into new values(2,'ved1','wagh1');

declare
cursor c1 is select * from old;
cursor c2(r int) is select roll_no from new where roll_no = r;
temp int;
begin
for c in c1 loop
open c2(c.roll_no);
fetch c2 into temp;
if c2%NOTFOUND then
insert into new(roll_no,fname,lname) values(c.roll_no,c.fname,c.lname);
end if;
close c2;
end loop;
end;
/