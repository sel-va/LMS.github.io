SQL Topics

1	Basic SQL Select Statement
2	Restricting and Sorting Data
3	Single Row Functions
4	Group Functions / Aggregate Functions
5	SQL Loader
6	External Tables
7	Analtical functions	
8	Set Operators
9	Sub Queries
10	Joins
11	Pseudo Columns
12	SQL PLUS Commands
13	DDL
14	DML
15	TCL
16	Constraints
17	Global Temporary Table
18	DCL
19	Views
20	Materialized Views
21	Synonyms
22	Sequence
23	Index
24	Hints
25	Table Partitioning
26	Virtual Column
27	Index Organized Table


1	Basic SQL Select Statement

		SELECT NAME FROM V$DATABASE;
		SELECT * FROM ALL_USERS;
		SELECT * FROM USER_TABLES;
		
		SELECT * FROM EMPLOYEES; 
		SELECT FIRST_NAME,SALARY FROM EMPLOYEES;
		SELECT DEPARTMENT_NAME FROM DEPARTMENTS;

		DESC EMPLOYEES;

2	Restricting and Sorting Data

		select first_name , salary , hire_date from employees where salary = 24000;
		select first_name , salary , hire_date from employees where salary > 15000;
		select first_name , salary , hire_date from employees where salary >= 17000;
		select first_name , salary , hire_date from employees where salary <= 4800;
		select employee_id , first_name , salary , hire_date from employees where first_name = 'Steven';
			
		select employee_id , first_name , salary 
		from employees where first_name <> 'Steven';

		select employee_id , first_name , salary from employees where first_name in ('Steven', 'Neena','Lex');

		select employee_id , first_name , salary from employees where first_name not in ('Steven', 'Neena','Lex');

		select first_name , salary , hire_date 
		from employees where salary in (24000 , 17000 , 4800);

		select * from employees where department_id is null;
		select * from employees where department_id is not null;

		select * from employees where first_name like 'A%';  -- starts with A
		select * from employees where first_name like '%e';   -- ends with e
		select * from employees where first_name like 'N%y';  
		select * from employees where first_name like '%and%';
		select * from employees where first_name like '__n%';
		select * from employees where first_name like '____';  -- acting like =
		select first_name , length(first_name) from employees where first_name like '________%'; 
		select * from employees where first_name not like 'A%';

		select * from employees where employee_id between 105 and 109; 
		select * from employees where salary between 5000 and 6000;
		select * from employees where salary  not between 5000 and 6000;
		select * from employees where salary >all (10000,9000,7500,10200);  -- GREATEST 
		select * from employees where salary >any (14000,14800,17500,15000); -- LEAST

		select * from employees order by salary desc;
		select first_name ,salary from employees order by 2 asc;

3. single row functions
		select first_name , upper(first_name) , last_name , lower(last_name) , email, initcap(email)  from employees;	
		select * from employees where lower(first_name) ='steven';
	
	character manipulation
	========================
		purpose : to identify the given string position
		eg : select first_name , instr(first_name,'a',1,2)  from employees;
			   select first_name , instr(first_name,'e',1,1)  from employees;

		purpose  : to display specific strings
		eg : select last_name , substr(last_name,2,2) from employees;
			   select last_name , substr(first_name,1,3) from employees;

		purpose  : to count the no of letters
		eg : select first_name , length(first_name) from employees;
			   select length('Hermann') from dual;

		purpose  : to get the mirror of the given string
		eg : select first_name , reverse(first_name) from employees;

		purpose : to change a word by word
		eg : select replace('greens tech','tech','technologys') from dual;

		purpose : to change a letter to different letter
		eg : select translate('zoho','zh','lg') from dual;

		purpose : to remove string from both the sides
		eg : select trim('!' from '!!greens!!' ) from dual;
			   select trim('   V    ') from dual;
			   select '   V    ' from dual;

		purpose : to remove a specific string from left hand side
		eg : select ltrim('##greens##', '#') from dual;

		purpose : to remove a specific string from right hand side
		eg :  select rtrim('##greens##', '#') from dual;

		purpose : to add a specific string at left hand side
		eg : select lpad('greens',10,'!') from dual;
			   select lpad(first_name,length(first_name)+2 , '*') from employees 

		purpose : to add a specific string at right hand side
		eg : select rpad('greens',10,'!') from dual;

	Number function
	===================
		eg : select round(42.56) , round(85.86) , round(78.49) from dual;

		trunc  - 1  removes the decimals  - 2 nd argument decides hw mny digits to display
		eg : select trunc(42.56) , trunc(85.86) , trunc(78.4452589,2) from dual;

		mod  - 2  - gives the reminder
		eg : select mod(10,2)  , mod(15,2) from dual;

		ceil  - 1 - opposite to round function - irrespective of decimal - moves to next integer
		eg : select ceil(14.0001) , ceil(45.36)  , ceil(58.69) from dual;

		floor - 1 - removes the decimals  - but no 2 nd argument
		eg : select floor(12.369) from dual;

		abs  -  1 - removes the sign from a number
		eg : select  abs(-52) , abs(85.25) from dual;

		sign  - 1 -     if  -ve  then -1     if +ve then +1
		eg :  select sign(-658.52) , sign(96.23) from dual;

		as  - column alias 
	
	Date functions
	================
		Oracle date format  - dd-mon-yyyy

		add_months   - 2 - 1 - input - 2 - how many months to be added
		eg : select add_months(sysdate,2) from dual;  
			   select add_months(sysdate,-2) from dual;
			   select  add_months('09-oct-1994',4) from dual;


		months_between  - 2  - inputs  - to get no of months between two dates
		eg  :  select months_between('01-oct-2017','01-may-2017')  as output from dual;
		eg  :  select trunc(months_between(sysdate,'28-mar-1996')/12)  as age from dual;

		next_day  - 2 - 1 - input   - 2 - the next day you want to search
		eg : select next_day(sysdate,'monday') from dual;
			   select next_day('09-aug-2018','saturday') from dual;
			   select next_day('09-aug-2018',3) from dual;

		last_day  - 1 - input  - to get the last date of the input
		eg : select last_day('09-feb-2018') from dual;

	General functions
	=================
		create table gentab(a number , b number , c number , d varchar(5) , e varchar(5) );

		insert into gentab  values(12,14,17,'sai','ram');
		insert into gentab  values(28,45,87,'green','house');
		insert into gentab  values(47,52,32,'ora','cle');
		insert into gentab  values(13,18,19,'green','stech');
		insert into gentab  values(1,4,7,'chand','iran');

			select a,b,c , greatest(a,b,c) , least(a,b,c) from gentab;
			select greatest(28,	45	,87,99)  from dual;
			select unique department_id from employees;
			select  d,e , concat(d,e) from  gentab;
			select concat('green','house') from dual;
			select concat(a,b) from gentab;
			select a||'  '||b||c||d||e from gentab;
			select a , case when a>15 then a*10 when a<15 then a*15 end as output from gentab;
			select b , decode(b,45,b*10,52,b*20,b*30) from gentab;


	Null functions 
	================
			nulls first  /   nulls last

				select * from employees order by department_id asc nulls first;
				select * from employees order by department_id desc nulls last

			function    no of arguament	functionality
			Nvl	         2 				if 1 is null then 2
			Nvl2	     3				if 1 is null then 3 else 2
			Nullif	     2				if both same then null else 1
			Coalesce	 n				first not null value

			create table tl_nvl(a number , b number , c number , d number);
			insert into tl_nvl(a,b,c,d) values(null,1,2,null);
			insert into tl_nvl(a,b,c,d) values(2,1,2,null);
			insert into tl_nvl(a,b,c,d) values(null,9,2,9);
			insert into tl_nvl(a,b,c,d) values(5,1,2,3);
			insert into tl_nvl(a,b,c,d) values(8,7,null,7);
			insert into tl_nvl(a,b,c,d) values(6,null,2,null);

			select * from tl_nvl;

				select a , nvl(a,2018) from tl_nvl;
				select b , nvl2(b,2018,2017) from tl_nvl;
				select b,d , nullif(b,d) from tl_nvl;
				select a,b,c,d , coalesce(a,b,c,d) from tl_nvl;

	Conversion Functions
	======================
		select to_number('123') from dual;
		select reverse(to_number('123')) from dual;
		select to_char(sysdate,'D') , to_char(sysdate,'DD') , to_char(sysdate,'DY') , to_char(sysdate,'DAY') from dual;
		select to_char(sysdate,'MM') , to_char(sysdate,'MON') , to_char(sysdate,'MONTH') from dual;
		select to_char(sysdate,'YY') , to_char(sysdate,'YYYY') , to_char(sysdate,'YEAR') from dual;
		select to_char(sysdate,'W') , to_char(sysdate,'IW') from dual;
		select to_date('14/MAY/1998','DD/MON/YYYY') from dual;
		select to_date('1995-OCT-05','YYYY-MON-DD') from dual;
		select to_timestamp('12-FEB-2017 22:15:40' , 'DD-MON-YYYY HH24:MI:SS') from dual;


DDL > data definition language ( auto commit language ) 
========================================================
		create, alter, truncate, rename, drop

	constriants   - to set a rule on a column  - optional

		primary key	- no nulls , no duplicates
		foreign key	- yes nulls , yes duplicates
		unique		- yes nulls , no duplicates
		not null		- no nulls , yes duplicates
		check		- condition

	drop table students;
	drop table course;

	create table course(
		cid	number	,
		cname	varchar(50)  not null,
		fees	number   not null,
		constraint q1 primary key(cid),
		constraint q2 unique(cname)
		);

	create table students(
		sid	number,
		sname	varchar(100)   not null,
		age	number,
		dob	date,
		doj	timestamp,
		cid	number,
		gender	char(1),
		phno	number(10),
		email	varchar(100),
		address	long,
		resume	clob,
		qual	varchar(15),
		photo	blob,
		profile	bfile,
		constraint w1 primary key(sid),
		constraint w2 foreign key(cid) references course(cid),
		constraint w3 check ( gender in ('m','f') ),
		constraint w4 unique(phno),
		constraint w5 check( length(phno)  = 10 )
		);

	create table wwe(aa number);

	6 operations
		1. adding a column
		alter table wwe add bb date;

		1.adding a column
		alter table wwe add cc varchar(10);

		2.droping a column
		alter table wwe drop column bb;

		3.adding a constraint
		alter table wwe add constraint ww1 primary key(aa);

		4.droping a constraint
		alter table wwe drop constraint ww1;

		5.renaming a column
		alter table wwe rename column cc to bb;

		6.modifying a datatype
		alter table wwe modify bb date;

			select * from user_tables where table_name in ('COURSE','STUDENTS');
			select * from user_constraints where table_name = 'WWE';
			select * from user_cons_columns where table_name = 'WWE';

			truncate table emp;

			rename wwe to wwf;
			rename wwf to wwe;

DML > data manipulation language
===================================
	insert update delete merge
					
		create table t1(a number, b number);

		insert into t1(a,b) values(10,20);
		insert into t1(a,b) values(11,12);
		insert into t1(a,b) values(13,14);

		update t1 set a=20 where b=12;
		update t1 set b=50;

		delete from t1 where a>10;
		delete from t1;

Merge
======
	drop table omr;
	drop table tam;
	create table omr(id number , name varchar(5) , fee number );
	create table tam(id number , name varchar(5) , fee number );			

	insert into omr(id,name,fee)  values(101,'sai',5000);
	insert into omr(id,name,fee)  values(102,'ram',5000);

	insert into tam(id,name,fee)  values(101,'sai',4500);

		merge into tam using omr on ( omr.id = tam.id )
		when matched then
		update set tam.fee = omr.fee
		when not matched then
		insert (tam.id , tam.name , tam.fee)
		values(omr.id , omr.name , omr.fee);

DCL > Data control language
===========================
		grant revoke

		create user tbbm identified by abc;
		select * from all_users;
		grant create session to tbbm;
		grant select on wwf to tbbm;
		grant insert on wwf to tbbm;
		grant delete on wwf to tbbm;
		grant all on wwf to tbbm;
		revoke all on wwf from tbbm;

Virtual column
===============
		create table vvtt
			(
			id	number,
			name	varchar(10),
			salary	number,
			bonus	number	generated always as (salary*5/100) virtual
			);

		insert into vvtt(id,name,salary)  values(1,'sai',10000);
		select * from vvtt;

Set Operators
===============
	union	=> removes duplicates , asc
	union all    => it displays results as it is in the table
	intersect	=> common values
	minus	=> value in first query not in second query

		Rules
		1.no of columns should be matched
		2.data type should be matched
		3.execution order can be changed by using ( and )

			drop table t1;
			drop table t2;
			create table t11(a number);
			insert into t11(a) values(1);
			insert into t11(a) values(2);
			insert into t11(a) values(5);
			insert into t11(a) values(3);
			insert into t11(a) values(9);
			insert into t2(b) values(2);
			insert into t2(b) values(3);
			insert into t2(b) values(4);
			insert into t2(b) values(8);
			insert into t2(b) values(9);

			union
			=======
				select a from t1
				union
				select b from t2;

			union all
			==========
				select b from t2
				union all
				select a from t1;

			intersect
			==========
				select a from t1
				intersect
				select b from t2;

			minus
			======
				select a from t1
				minus
				select b from t2;

				select b from t2
				minus
				select a from t1;

			task
			=====
				select b from t2
				minus
				select a from t1
				union all
				select b from t2
				union
				select a from t1;

				select b from t2
				minus
				(select a from t1
				union all
				select b from t2)
				union
				select a from t1;

GTT
=====
		on commit delete rows  -- default
		on commit preserve rows

			create  global temporary table abcgtt(a number) on commit delete rows;
			insert into abcgtt(a) values(1);
			insert into abcgtt(a) values(2);
			insert into abcgtt(a) values(3);
			commit;

			create  global temporary table xyzgtt(a number) on commit preserve rows;
			insert into xyzgtt(a) values(1);
			insert into xyzgtt(a) values(2);
			insert into xyzgtt(a) values(3);
			commit;

				select * from xyzgtt;
				exit;
				sqlplus hr/admin
				select * from xyzgtt;

Analytical Functions
=====================
		select first_name , salary , rank() over(order by salary desc) from employees;

		select first_name , salary , dense_rank() over(order by salary desc) from employees;

		select first_name , last_name , hire_date , salary , row_number() over(order by first_name asc) from employees;

		select first_name , salary , department_id,  
		dense_rank() over(partition by department_id order by salary desc) from employees;

		select first_name , salary , lead(salary,1,4500) over(order by salary desc) as ld_function ,
		salary - lead(salary,1,4500) over(order by salary desc) as sal_diff from employees;

		select first_name , salary , lag(salary,1) over(order by salary desc) from employees;

		select * from(
		select first_name , salary ,department_id,dense_rank() over(order by salary desc) as rnk from employees)
		where rnk = 3;

		with abcde as
		(select first_name , salary ,department_id,dense_rank() over(order by salary desc) as rnk from employees)
		select * from abcde where rnk=3;

		select department_id ,listagg(first_name,'/') within group( order by first_name asc  )  from employees
		group by department_id;

		select listagg(first_name,'*') within group( order by first_name asc  )  from employees;


Pseudo columns
================
		select sysdate , current_date , systimestamp from dual;
		select user , uid from dual;
		select * from all_users;
		select rownum , first_name , salary from employees;

		select rowid , first_name , salary from employees where rowid ='AAAEAbAAEAAAADNAAC';

		select length('AAAEAbAAEAAAADNAAC') from dual;
		select employee_id , first_name , manager_id , level from employees start with employee_id = 100
		connect by prior employee_id = manager_id;

		select level from dual connect by level <= 100;  -- to print 1 to 100

Sequence
==========
		drop Sequence  tbmsq;
		create Sequence  tbmsq start with 1 increment by 1 maxvalue 5;
		dont use currval
		select tbmsq.nextval from dual;
		select tbmsq.currval from dual;
		alter Sequence  tbmsq increment by 5 nomaxvalue;
		select tbmsq.nextval from dual;
		select * from user_sequences;

Group functions   
================
		select * from employees where department_id is null;
		select min(salary) , max(employee_id) , min(employee_id) , max(salary) , min(first_name) from employees;
		select count(*) from employees;
		select count(first_name) , count(salary) , count(department_id ) from employees
		select sum(salary) from employees;
		select avg(salary)  , 691416/107  from employees
		select department_id , max(salary) , min(salary) from employees group by department_id order by department_id;
		select department_id , count(first_name) from employees group by department_id;
		select department_id , count(department_id) from employees  group by department_id having count(department_id) <> 1


sql loader 
==========

views
=======
		create or replace view testview as select * from t1;
		select * from user_views;

		retriction methods
		====================
		with read only
		with check option
			create or replace view testv2 as select * from t2 with read only;
			create or replace view testv3 as select * from t2 where b < 5 with check option;
				insert into testv3(b)  values(1);
				insert into testv3(b)  values(6);

		Complex view
		==============
		create or replace view testv4 as select upper(first_name) as fname from employees;
		
		create or replace force view testv5 as select * from testvv;
		select * from user_views where view_name='TESTV5';
		drop view testv5;

synonym 
=========
		create or replace synonym st1 for t1;
		create or replace synonym st2 for st1;
		select * from user_synonyms;
		drop synonym st1;

JOINS
======
	select  students.sname  , course.cname from course join students on  (course.cid = students.cid);
	(or)

	select  students.sname  , course.cname from course inner join students on  (course.cid = students.cid);
	(or)

	select   students.sname  , course.cname from    students , course where  students.cid  =  course.cid 

		select students.sname , course.cname
		from  students full outer join course
		on (students.cid = course.cid) 
		where students.sname is null or course.cname is null;


	self join
	
		select	a.first_name as empname, b.first_name as managername
		from	emp a, emp b
		where	a.manager_id = b.employee_id;

	cross join / cartesian product

		select students.sname , course.cname
		from  students , course

MVIEWS
EXTERNAL TABLES

Index
======
	b*tree	 	=> less duplicates / high cordinality
	bitmap		=> more duplicates / low cordinality
	unique		=> non duplicates
	composite	=> for more than one column
	reverse key	=> for sorting asc/desc
	fxnl based	=> applying fuction on a column

		create table emp as select * from employees;   -- to create copy table

		create index fninx  on emp(first_name);   -- btree
		create bitmap index gninx on emp(gender);  --bitmap
			 
	select * from user_indexes where table_name ='EMP';
	select * from user_ind_columns where table_name ='EMP';

		create unique index edinx on employees2(employee_id);

		select * from emp where first_name = 'Steven' and salary = 2200;
		create index cmpinx on emp(first_name,salary);

		select * from emp order by salary asc;
		create index orinx on emp(salary asc);   -- reversekey

		select * from emp where upper(first_name) = 'STEVEN';
		create index fnbinx on emp(upper(first_name));  -- function based index

		HINTS
		======
			select /*+ index(employees EMP_DEPARTMENT_IX) */ * from employees where department_id =50; 

			select  /*+ full(employees) */ * from employees where department_id =90;

Table Partitioning
	list	
	range
	hash

sub query 
	