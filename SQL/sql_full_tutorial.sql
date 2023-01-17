After oracle db installation  (11g)

TOAD / SQL DEVELOPER

1.goto command prompt => sqlplus sys/admin as sysdba
2.grant resource , connect , dba to hr;
3.alter user hr account unlock;
4.alter user hr identified by admin;
5.grant create user to hr;
6.grant execute on utl_file to hr;
7.grant resource to hr;
8.connect hr/admin

Oak Ridge Automatic Computer and Logical Engine
********************************************
Oracle - db technology (backend)
6i , 8i , 9i , 10g , 11g , 12c ..
java frontend

other db techs
sql server
sybase
mongo db
db2 .. etc

why oracle ?  because - high performance / data security 

oracle understands only - sql/plsql 

structured query language - sql
procedural language structured query language - plsql

using sql we can store data / retreive / manipulation (correction)

insert / delete / select => english like language
Insert / INSERT => case insensitive
it can be written in multiple lines

default tables for beginers
**********************
employees / departments / locations

table => collection of data that composed of rows and columns

tools  =>  toad / sql developer / plsql developer / sqlplus / isqlplus

Relational Operators
******************
=	<> 	!=
<
>
<=
>=
in	not in
like	not like
between   	not between
all
any
is null	is not null

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

select 
	column(s)
from
	table name
where
	condition
order by	
	asc/desc   -- last


single row functions
*****************
case manipulation
character manipulation
number function
date functions
general functions
null functions
conversion functions

case manipulation

upper
lower
initcap

select first_name , upper(first_name) , last_name , lower(last_name) , email, initcap(email)  from employees;

select * from employees where lower(first_name) ='steven';

character manipulation
********************
instr
substr
length
replace
translate
reverse
trim
ltrim
rtrim
lpad
rpad

instr   4  - 1 - input  2 - searching letter 3 - starting position  4 - no of occurence
purpose : to identify the given string position
eg : select first_name , instr(first_name,'a',1,2)  from employees;
       select first_name , instr(first_name,'e',1,1)  from employees;

substr  3  - 1 - input  2 -  starting position  3 - how many char to be displayed
purpose  : to display specific strings
eg : select last_name , substr(last_name,2,2) from employees;
       select last_name , substr(first_name,1,3) from employees;

length  1 - 1 - input
purpose  : to count the no of letters
eg : select first_name , length(first_name) from employees;
       select length('Hermann') from dual;

reverse   1 - 1 - input
purpose  : to get the mirror of the given string
eg : select first_name , reverse(first_name) from employees;

replace  3  - 1 - input 2 - to be replaced   3 - replacement string ( optional)
purpose : to change a word by word
eg : select replace('university tech','tech','technologys') from dual;

translate  3 - 1 - input  2 - to be changed  3 - replacement string
purpose : to change a letter to different letter
eg : select translate('zoho','zh','lg') from dual;

trim   3 - 1 - to be trimmed  2 -  from  3 - input 
purpose : to remove string from both the sides
eg : select trim('!' from '!!university!!' ) from dual;
       select trim('   V    ') from dual;
       select '   V    ' from dual;

ltrim  - 2  - 1 - input  2 - to be trimmed
purpose : to remove a specific string from left hand side
eg : select ltrim('##university##', '#') from dual;

rtrim - 2  - 1 - input  2 - to be trimmed
purpose : to remove a specific string from right hand side
eg :  select rtrim('##university##', '#') from dual;

lpad  - 3  - 1 - input  2 - total string to be displayed  3 - to be added at the left
purpose : to add a specific string at left hand side
eg : select lpad('university',10,'!') from dual;
       select lpad(first_name,length(first_name)+2 , '*') from employees 

rpad - 3  - 1 - input  2 - total string to be displayed  3 - to be added at the right
purpose : to add a specific string at right hand side
eg : select rpad('university',10,'!') from dual;


Number function
**************
Round
Trunc
Mod
Ceil
Floor
Abs
Sign

round  - 1  checks the decimal whether 5 or > 5 => will rounding off
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

date functions
************
add_months
months_between
next_day
last_day

add_months   - 2 - 1 - input - 2 - how many months to be added
eg : select add_months(sysdate,2) from dual;  
       select add_months(sysdate,-2) from dual;
       select  add_months('09-oct-1994',4) from dual;

Oracle date format  - dd-mon-yyyy

months_between  - 2  - inputs  - to get no of months between two dates
eg  :  select months_between('01-oct-2017','01-may-2017')  as output from dual;
eg  :  select trunc(months_between(sysdate,'28-mar-1996')/12)  as age from dual;

next_day  - 2 - 1 - input   - 2 - the next day you want to search
eg : select next_day(sysdate,'monday') from dual;
       select next_day('09-aug-2018','saturday') from dual;
       select next_day('09-aug-2018',3) from dual;

last_day  - 1 - input  - to get the last date of the input
eg : select last_day('09-feb-2018') from dual;

general functions
***************
distinct / unique
greates
least
concat	||
case
decode

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

Null functions   =>  null is not equal to anything. you can not compare                                                          anything with null. null is null

nulls first  /   nulls last

select * from employees order by department_id asc nulls first;
select * from employees order by department_id desc nulls last

function    no of arguament	functionality
Nvl	         2 		if 1 is null then 2
Nvl2	         3		if 1 is null then 3 else 2
Nullif	         2		if both same then null else 1
Coalesce	         n		first not null value

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
********************

select to_number('123') from dual;

select reverse(to_number('123')) from dual;

select to_char(sysdate,'D') , to_char(sysdate,'DD') , to_char(sysdate,'DY') , to_char(sysdate,'DAY') from dual;

select to_char(sysdate,'MM') , to_char(sysdate,'MON') , to_char(sysdate,'MONTH') from dual;

select to_char(sysdate,'YY') , to_char(sysdate,'YYYY') , to_char(sysdate,'YEAR') from dual;

select to_char(sysdate,'W') , to_char(sysdate,'IW') from dual;

select to_date('14/MAY/1998','DD/MON/YYYY') from dual;

select to_date('1995-OCT-05','YYYY-MON-DD') from dual;

select to_timestamp('12-FEB-2017 22:15:40' , 'DD-MON-YYYY HH24:MI:SS') from dual;

=================================================================

ddl  - data definition language ( auto commit language ) 

create
alter
truncate
rename
drop

datatypes
number
char		2000
varchar  / varchar2	4000
date
timestamp
long
clob    char large object
blob    binary large object
bfile    path - outside 

char(3)	varchar(3)
sai	sai
a  	hi

constriants   - to set a rule on a column  - optional

primary key	- no nulls , no duplicates
foreign key	- yes nulls , yes duplicates
unique		- yes nulls , no duplicates
not null		- no nulls , yes duplicates
check		- condition

drop table students;
drop table course;

create table course
(
cid	number	,
cname	varchar(50)  not null,
fees	number   not null,
constraint q1 primary key(cid),
constraint q2 unique(cname)
);

create table students
(
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

dml   => data manipulation language

insert 
update
delete
merge

create table t1(a number, b number);

insert into t1(a,b) values(10,20);
insert into t1(a,b) values(11,12);
insert into t1(a,b) values(13,14);

update t1 set a=20 where b=12;
update t1 set b=50;

delete from t1 where a>10;
delete from t1;

merge
*******
omr
id 	name	fee
101	sai	5000
102	ram	5000

tam
101	sai	4500	u

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

dcl  =>  data control language

grant
revoke

create user tbbm identified by abc;
select * from all_users;
grant create session to tbbm;
grant select on wwf to tbbm;
grant insert on wwf to tbbm;
grant delete on wwf to tbbm;
grant all on wwf to tbbm;
revoke all on wwf from tbbm;


=================================================================
Virtual column

create table vvtt
(
id	number,
name	varchar(10),
salary	number,
bonus	number	generated always as (salary*5/100) virtual
);

insert into vvtt(id,name,salary)  values(1,'sai',10000);
select * from vvtt;

=================================================================
Set Operators
************
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
*****
select a from t1
union
select b from t2;

union all
********
select b from t2
union all
select a from t1;

intersect
********
select a from t1
intersect
select b from t2;

minus
******
select a from t1
minus
select b from t2;

select b from t2
minus
select a from t1;

task
****

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


=================================================================

gtt  - global temporary table  - session wise data mangement

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

=================================================================

Analytical Functions
******************
Rank()
Dense_rank()
row_number()
lead
lag
listagg  -- 11g

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

=================================================================

Pseudo columns
*************
sysdate / current_date
systimestamp
user
uid
rownum
rowid
level
nextval
currval

Dual  :  Oracle predefined dummy table (Or) One row one column table

select sysdate , current_date , systimestamp from dual;
select user , uid from dual;
select * from all_users;
select rownum , first_name , salary from employees;

select rowid , first_name , salary from employees where rowid ='AAAEAbAAEAAAADNAAC';

select length('AAAEAbAAEAAAADNAAC') from dual;
select employee_id , first_name , manager_id , level from employees start with employee_id = 100
connect by prior employee_id = manager_id;

select level from dual connect by level <= 100;  -- to print 1 to 100

rownum  and rowid diff
Ans : Rownum : It just displays sequence number to the query output. It doesn't                                    stored in database. it will work for  = 1 and <= n in select stmnt.
           Rowid    : For every row in a table , oracle creates unique 18 digits alpha                                     numeric id which is stored in database.mainly used for                                                  performance  improvement

Sequence : it generates unique numbers automatically. mainly used for primary key column

Sequence attributes
nextval
currval

drop Sequence  tbmsq;
create Sequence  tbmsq start with 1 increment by 1 maxvalue 5;
dont use currval
select tbmsq.nextval from dual;
select tbmsq.currval from dual;
alter Sequence  tbmsq increment by 5 nomaxvalue;
select tbmsq.nextval from dual;
select * from user_sequences;

========================================================================================

Group functions   =>  This funcion will group the rows and fetch one row for each 	 			group.
max
min
sum
avg
count

1.Group functions ignore null values.
2.Columns in select statement with group functions, those  columns to be mentioned in group by clause
3. * allowed only in count function.
4.String ,number datatype work only in max,min,count and sum , avg will work only for number.
5.Conditions with group function to be mentioned in Having clause.
6.Only one argument possible inside a group function.

select * from employees where department_id is null;

select min(salary) , max(employee_id) , min(employee_id) , max(salary) , min(first_name) from employees;

select count(*) from employees;

select count(first_name) , count(salary) , count(department_id ) from employees

select sum(salary) from employees;

select avg(salary)  , 691416/107  from employees

select department_id , max(salary) , min(salary) from employees group by department_id order by department_id;

select department_id , count(first_name) from employees group by department_id;

select department_id , count(department_id) from employees  group by department_id
having count(department_id) <> 1

select
	column name
from
	table name
where
	conditions
group by
	add columns + grp fun
having
	grp fun with condition
order by 
	asc/desc

=================================================================
sql plus commands
===============
clear screen/clear scr
set pagesize        =>  how many records to be displayed in each page	
set linesize         =>  how many char to be printed in each line	
@	         =>  @desktop\testomr.txt
set heading on     => columns to be displyed ?
set heading off    => columns not to be displayed ?
set feedback on   => whether acknowledgement required ?
set feedback off  =>  or not ?
set timing on      => time taken to execute the query
set timing off      => to disable
set verify on        => to display 	old and new
set verify off        => to remove  old and new
define  	          => to change value of constant variable
undefine              => to reset the value of constant variable
ed	          => edit the query   .. save .. /
ttitle	' hi '
btitle	' bye '
&              => substitution variable
&&           =>  constant
/                => last executed statement	
spool        => spool desktop\test.txt   .......   spool off
show user => to display the current user
exit/quit	=> to quit the session

**********************************************************************************************
sql loader  =>  bulk loader utility

step 1 :  table creation

create table course ( cid  number , cname varchar(10)  , fees number);

step 2 :  data preparation

open a notepad

cid,cname,fees
10,sql,4500
20,plsql,3500
30,java,5000

save as (select all files)  =>  1.csv  (comma separated value file)

step 3 : control file preparation

open a notpad

load data infile 'desktop\1.csv'
into table course
fields terminated by ","
(cid,cname,fees)

save as (select all files)  =>  2.ctl   (ctl - control file )

step 4 : execution process

sql loader concept possible only in command prompt

goto cmd => don't login to database 

sqlldr hr/admin control=desktop\2.ctl skip=1

**********************************************************************
views => virtual table  /  only query will be stored / does not occupy memory in db

types of view

simple view  =>  if the select query is simple
complex view =>  if the select query is not simple

create or replace view testview as select * from t1;
select * from user_views;
dml possible ?  - yes
things reflected in base table when any action performed on view
index possible ?  - no

retriction methods
****************
with read only
with check option

create or replace view testv2 as select * from t2 with read only;
create or replace view testv3 as select * from t2 where b < 5 with check option;

insert into testv3(b)  values(1);
insert into testv3(b)  values(6);

Complex view
************
functions
expression
group function
analytical function
dictionary table
sub query .... etc 

create or replace view testv4 as select upper(first_name) as fname
from employees;

create or replace force view testv5 as select * from testvv;

select * from user_views where view_name='TESTV5';

drop view testv5;

*********************************************************************
synonym  - alternative name for an object
we can create multiple synonym for an object
we can create multiple synonym for a synonym
if table is dropped then what abt synonym ? 
invaild - synonym translation is no longer valid
is it possible to perform dml on synonym ?  yes
is it possible to create synonym with the same name of an object name ?  yes

Purpose  : To access a particular db object by different user with different access

create or replace synonym st1 for t1;
create or replace synonym st2 for st1;
select * from user_synonyms;
drop synonym st1;

**********************************************************************

joins   -- to retrieve data from more than one table

types of joins
************
inner join		=> matching records
left outer join	=> matching of both , unmatching of left table
right outer join	=> matching of both , unmatching of right table
full outer join	=> matching and unmatching of both tables
self join		=> joining table within itself
cross join		=> cartesian poduct , no of rows in first table * 		                                          no of  rows in second table
drop table students purge;
drop table course purge;
create table students(sid number, sname varchar(50), cid number) ;
create table course(cid number, cname varchar(50)) ;

insert into course(cid, cname)   values(10, 'ORACLE');
insert into course(cid, cname)   values(20, 'JAVA');
insert into course(cid, cname)   values(30, 'C++');
insert into course(cid, cname)   values(40, 'UNIX');
insert into course(cid, cname)   values(50, 'LINUX');
insert into course(cid, cname)   values(60, 'PYTHON');
insert into course(cid, cname)   values(70, 'RPA');
insert into students(sid, sname, cid) values(501, 'NEENA', 10);
insert into students(sid, sname, cid) values(502, 'ALEX', 20);
insert into students(sid, sname, cid) values(503, 'RUPA', 30);
insert into students(sid, sname, cid) values(504, 'KIRAN', 40);
insert into students(sid, sname, cid) values(505, 'RAJU', 80);
commit;

sname	cname
neena	oracle
alex	java
rupa	c++
kiran	unix

select  students.sname  , course.cname
from    course join students on  (course.cid = students.cid);

(or)

select  students.sname  , course.cname
from    course inner join students on  (course.cid = students.cid);

(or)

select   students.sname  , course.cname
from    students , course
where  students.cid  =  course.cid 

Left Outer Join
***************

sname	cname
neena	oracle
alex	java
rupa	c++
kiran	unix
raju	

select s.sname , c.cname
from  students s, course c
where s.cid = c.cid(+);

(or)

select s.sname , c.cname
from  students s left outer join course c on (s.cid = c.cid);

(or)

select s.sname , c.cname
from  students s left join course c on (s.cid = c.cid);

Right Outer Join
***************

select s.sname , c.cname
from  students s, course c
where s.cid(+) = c.cid;

(or)

select s.sname , c.cname
from  students s right outer join course c on (s.cid = c.cid);

(or)

select s.sname , c.cname
from  students s right join course c on (s.cid = c.cid);


sname	cname
neena	oracle
alex	java
rupa	c++
kiran	unix
	linux
	rpa
	python

select students.sname , course.cname
from  students full join course
on (students.cid = course.cid);

select students.sname , course.cname
from  students full outer join course
on (students.cid = course.cid) 
where students.sname is null or course.cname is null;

how to create copy table ?

create table emp as select * from employees;
create table emp as select * from employees where 1=2;

self join

select	a.first_name as empname, b.first_name as managername
from	emp a, emp b
where	a.manager_id = b.employee_id;

cross join / cartesian product

select students.sname , course.cname
from  students , course

**********************************************************************

Mview   => materialized view - snap shot of a query result

cmd => sqlplus sys/admin as sysdba
grant create materialized view to hr;
connect hr/admin

create materialized view mvw as select * from t1;

select * from user_mviews;

dml not possible ?  yes
index possible ?  yes

insert into t1(a) values(12);
delete from t1;

select * from mvw;

execute dbms_mview.refresh('mvw','c');

refresh methods
**************
complete
fast
force

drop materialized view mvw;

**********************************************************************************************
External Tables	=> data import and export process

Data Loading    -	import	
Data Pumping  / Data Unloading   -  export

create or replace directory exdata as 'D:\New';

drop table abc;

create table abc
(
cntryid		char(30),
cntrycode		char(30),
cntryname		char(30),
cntrylang		char(30)
)
organization external
(
type oracle_loader
default directory exdata
access parameters
(
records delimited by newline
fields terminated by ','
missing field values are null
(
cntryid		char(30),
cntrycode		char(30),
cntryname		char(30),
cntrylang		char(30)
)
)
location ('list1.txt','list2.txt')
)
parallel 5
reject limit unlimited;

Data Pumping  or Data Unloading or Data Export

drop table pump_data;

create table pump_data
organization external
(
type  oracle_datapump
default directory exdata
location('test.dmp')
)
as select first_name , upper(first_name) as firstname , length(first_name) as len
 from employees;




**********************************************************************************************

Index

why  ? to retrieve the data faster but not all the times
decision maker - optimizer
when ? whenever a column frequently called in where clause

b*tree	 	=> less duplicates / high cordinality
bitmap		=> more duplicates / low cordinality
unique		=> non duplicates
composite		=> for more than one column
reverse key	=> for sorting asc/desc
function based	=> applying fuction on a column

create table emp as select * from employees;   -- to create copy table

select * from emp where first_name ='Steven';

select first_name , salary , hire_date 
from emp where employee_id <= 110;  -- 3

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


Hints  => to force oracle to read the index
*****
select /*+ index(employees EMP_DEPARTMENT_IX)    */  * from employees where department_id =50; 

select  /*+   full(employees)    */  * from employees where department_id =90;

**********************************************************************

Table Partitioning	=>  to make performance better

course
sql	10
plsql	10
java	10
unix	10

select * from course where cname='plsql';  --10

course
sql	100000	p1
plsql	100000	p2
java	100000	p3
unix	100000	p4

select * from course where cname='plsql'; 	--100000

list	
range
hash

List Partitioning
**************
create table course
(
cid 	number,
cname	varchar(15)
)
partition by list(cname)
(
partition  a1 values('sql'),
partition  a2 values('plsql'),
partition  a3 values('java'),
partition  a4 values('unix'),
partition  a5 values(default)
);

Range Partitioning
****************
create table emp
(
eid	number,
ename	varchar(10),
phno	number,
salary	number
)
partition by range(salary)
interval(5000) --11g
(
partition  b1 values less than (5000),
partition  b2 values less than (10000),
partition  b3 values less than (15000),
partition  b4 values less than (20000)
);

select * from user_tab_partitions;

=================================================================

sub query  =>  query that embeded within another query
========

inner query  => this will execute first
outer query


single row sub query:  if sub query returns only one row
******************
select first_name from employees where salary = (select min(salary) from employees);

multiple row sub query:  if sub query returns multiple rows
******************** 
select first_name , department_id from employees where department_id in
(
select department_id from departments where department_name in ('Sales','Executive')
);

multiple column sub query: if sub query contains multiple columns
**********************

select * from employees where ( department_id , manager_id  ) in
(
select department_id , manager_id from departments
);

inline view:   if your sub query is in from clause
*********

select * from
(select first_name , salary , dense_rank() over(order by salary desc) as rnk from employees) 
where rnk = 2;

scalar sub query:  if your sub is in select clause
**************

select first_name , 
(select department_name from departments where departments.department_id = employees.department_id) as depname , 
salary from employees;


correlated sub query: inner query depends on outer query
******************

select * from employees where department_id  in
(
select department_id from departments where departments.department_id = 
employees.department_id
);

nested sub query:  sub query that embeded within another sub query
***************

select * from employees where department_id  in
(
select department_id from departments where departments.department_id = 
employees.department_id and departments.location_id in
(select locations.location_id from locations where locations.location_id= departments.location_id)
);

*****************************************************

How a query getting processed ?

whenever you running a select statement oracle will do 3 checks

select first_name from employees where employee_id=106;

1.syntactic check
   if any mistake there in clauses
2.symantic check
   if any mistake there in column name or table name
3.shared pool check ( library cache check )
   for every select statement oracle will generate sqlid
   it will check the same sqlid is there in the library cache
   if found then it will go for softparsing else optimizer will generate new explainplan
