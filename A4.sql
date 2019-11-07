-- create table cust_mstr(custno int primary key,fname varchar(20), lname varchar(20));
-- create table add_dets(custno int primary key,add1 varchar(20), add2 varchar(20),state varchar(20),city varchar(20),pincode int);
-- alter table add_dets add foreign key (custno) references cust_mstr(custno) on delete cascade;
-- insert into cust_mstr values ('23','ved','wagh'),('3','ved','bagh');
-- insert into add_dets values('23','treedom','park','maha','pune','411015'),('3','freedom','park','wb','bhut','411082');
-- select * from add_dets a, cust_mstr c where a.custno=c.custno and c.fname='ved' and c.lname='wagh';
-- Select * from add_dets a inner join cust_mstr c on a.custno=c.custno where c.fname='ved' and c.lname='wagh';

-- create table fd_dets(fd_sr_no int primary key,amount int);
-- create table acc_fd_cust_dets(custno int ,acc_fd_no int);
-- alter table acc_fd_cust_dets  add foreign key (custno) references cust_mstr(custno) on delete cascade;
-- alter table acc_fd_cust_dets add foreign key (acc_fd_no) references fd_dets(fd_sr_no) on delete cascade;
-- insert into fd_dets values ('101','4050'),('102','5000'),('103','6000');
-- insert into acc_fd_cust_dets values ('23','101'),('3','102'),('3','103');
-- select a.custno, b.fname,b.lname from cust_mstr b inner join acc_fd_cust_dets a on b.custno=a.custno inner join fd_dets f on f.fd_sr_no=a.acc_fd_no where f.amount<5000;

-- create table emp_mstr(e_mpno int primary key,fname varchar(20),lname varchar(20),m_name varchar(20),dept int,degn varchar(20),branch_no int);
-- create table branch_mstr(name int ,b_no int);
-- alter table branch_mstr add primary key (b_no);
-- alter table emp_mstr add foreign key (branch_no) references branch_mstr(b_no) on delete cascade;	
	-- alter table branch_mstr modify name varchar(20);
-- insert into branch_mstr values('vish','1'),('yerwas','3'),('london','4');
	-- insert into emp_mstr values('231','ved','wagh','qwerty','2','emp','4'),('211','cvb','wagh','vgy','6','emp','3'),('111','tan','bhu','qwerty','2','emp','4');
-- select e.e_mpno,e.lname,e.fname,e.m_name,e.dept,e.degn,b.b_no,b.name from emp_mstr e left join branch_mstr b on b.b_no=e.branch_no;

-- select e.e_mpno,e.lname,e.fname,e.m_name,e.dept,e.degn,b.b_no,b.name from emp_mstr e right join branch_mstr b on b.b_no=e.branch_no;

-- create view view_6a as select e_mpno,fname from emp_mstr;
-- insert into view_6a values('444','hp');
-- delete from view_6a where fname='cvb';
-- create view view6a_1 as select lname,fname from emp_mstr;
	-- insert into view6a_1 values('potter','hari');didnt work
		-- delete from view6a_1 where fname='ved';
		-- insert into emp_mstr values('231','ved','wagh','qwerty','2','emp','4'),('211','cvb','wagh','vgy','6','emp','3'),('111','tan','bhu','qwerty','2','emp','4');
		-- update view_6a set fname='vedangi' where e_mpno='231';
			-- update view6a_1 set fname='vedangi' where lname='bhu';



