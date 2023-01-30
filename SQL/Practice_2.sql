Practice = > 2
===============

create table customer
(
cust_id number(6),
cust_name	varchar2(50),
mobile_no	 number(10),
dob	date,
city	varchar2(30),
email_id varchar2(30)
);

select * from customer;

insert into customer
(cust_id,cust_name,mobile_no,dob,city,email_id)
values(100000,'Arun',	9090909090,to_date('08/04/2000','mm/dd/yyyy'),	'Chennai','arun@gmail.com');

insert into customer
values(100001,'John',	9090909030,to_date('12/24/1986','mm/dd/yyyy'),	'Bangaluru','john@gmail.com');

insert into customer
values(100002,'Geon',to_date('12/24/1985','mm/dd/yyyy'),	'Delhi','Geon@gmail.com');
-- SQL Error: ORA-00947: not enough values

insert into customer
(cust_id,cust_name,dob,city,email_id)
values(100002,'Geon',to_date('12/24/1985','mm/dd/yyyy'),	'Delhi','Geon@gmail.com');

rollback;

commit;

update customer 
set mobile_no =7878787878;






rollback;

update customer 
set mobile_no =7878787878 where cust_id=100002;

commit;

-- add a column 

alter table customer
add country VARCHAR2(50);

select * from customer;

-- drop a column

alter table customer
drop column city;

update customer set country='India';

commit;

desc customer;

insert into customer
(cust_id,cust_name,mobile_no,dob,email_id,country)
values(1000000,'Dilip',9090909090,to_date('08/04/2000','mm/dd/yyyy'),'arun@gmail.com','india');
--ORA-01438: value larger than specified precision allowed for this column

CUST_ID         NUMBER(6)      number(8)

MOBILE_NO       NUMBER(10)   varchar2(15)

alter table customer
modify cust_id number(8);

alter table customer
modify cust_id number(6);
-- ORA-01440: column to be modified must be empty to decrease precision or scale

alter table customer
modify MOBILE_NO varchar2(15);
--ORA-01439: column to be modified must be empty to change datatype 


1. bkp a table

2. truncate base table

3. modify data type

4. Restore the data

5. drop bkp table



create table customer_bkp as select * from customer;

select * from CUSTOMER_BKP;

truncate table customer;

select * from customer;

rollback;

alter table customer
modify MOBILE_NO varchar2(15);

desc customer;

insert into customer (select * from customer_bkp);

commit;

select * from customer_bkp;

delete from customer_bkp;

rollback;

delete from customer_bkp where cust_id=100001;

commit;

drop table customer_bkp;


desc customer;

dob date_of_birth

alter table customer
rename column dob to date_of_birth;

rename customer to customer_data;

desc customer_data;


create table test (no1 number(3), no2 number(3));

insert into test values (1,2);
savepoint a;
insert into test values (3,4);
savepoint b;
insert into test values (5,6);
savepoint c;
insert into test values (7,8);

rollback to c;

select * from test;

rollback;


desc CUSTOMER_DETAILS;

select * from CUSTOMER_DETAILS;

999999   99999999


Modify a column

alter table customer_details
modify cust_id number(8);


alter table customer_details
modify mobile_no varchar2(15);
-- ORA-01439: column to be modified must be empty to change datatype

bkp
truncate
modify
restore


create table customer_details_bkp as select * from customer_details;


select * from CUSTOMER_DETAILS_BKP;

create table customer_details_bkp1 as select * from customer_details where 1=2;


-- Truncate a table

truncate table customer_details;

-- Modify

alter table customer_details
modify mobile_no varchar2(15);


desc customer_details;

select * from customer_details;


insert into customer_details (select * from customer_details_bkp);


commit;


select * from customer_details_bkp;


-- Delete a record


delete from customer_details_bkp
where cust_id=100002;

rollback;


drop table customer_details_bkp;


select * from CUSTOMER_DETAILS_BKP;


truncate table customer;

delete from customer;

commit;

--------------------------------------------------------------------------------

create a 

insert

update

insert

alter

update

insert

alter -- commit

update

insert 

insert

rollback;

how many records will be there in the table? 
-----------------------------------------------------------

insert into customer_details values (100003,'Vijay',sysdate,9080706050,896745);

select * from customer_details;

--------------------------------------------------------------------------------

Constraints In Oracle:
======================

Data validation before inserting the data into the table


1. Primary Key

  -- It will not allow duplicate record
  -- It will not allow null
  -- Only one primary key in a table
  
  e.g   emp_id, prod_id, cust_id, user_id, account_no

    composite Key: 

    cust_id+mobile_no   ---> Primary key(cust_id,mobile_no)

 
2. Not Null      *mandatory filed

  -- It will not allow null value
  -- It will allow duplicate
  
  e.g  First_name

3. Unique

   -- It will not allow duplicate
   -- It will allow null  
  
  e.g   mobile_no

4. Check

   -- data validation
   
   check (age >=18)

5. Foreign Key


  --- Relationship between two tables
  -- It will accept duplicate value
  -- It should be a primary key in another table
  -- Any no of foreign key in a table
  
  e.g   foreign key (city_id) references city(city_id)
  
Violation:

  Integrity constrains violated - parent key not found
  
--------------------------------------------------------------------------------


create table customer
(
cust_id number(6) primary key,
cust_name varchar2(30) not null,
mobile_no number(10) unique check (length(mobile_no)=10),
age number(3) check (age>=18),
city_id number(4) references city(city_id) 
);

select * from city;


create table city
(
city_id number(4),
city_name varchar2(30)
);


insert into city values (10,'Chennai');
insert into city values (20,'Pune');
insert into city values (30,'Hyd');
insert into city values (40,'Delhi');


alter table city add primary key(city_id);


select * from city;


select * from customer;


insert into customer values (100000,'Arun',9090909090,28,20);


insert into customer values (100001,'Arun',8080808080,31,30);


insert into customer values (100002,'Vijay',5050505050,31,10);


insert into customer values (100003,'Ajith',2894738243,13,30);


insert into customer values (100004,'Ramesh',2894738789,31,60);


commit;

desc customer;

select * from all_constraints where owner='HR' and table_name='CUSTOMER';

select * from all_cons_columns where owner='HR' and table_name='CUSTOMER';

select
a.owner,a.constraint_name,a.constraint_type,b.table_name,b.column_name
from all_constraints a , all_cons_columns b where a.constraint_name=b.constraint_name 
and a.owner='HR' and a.table_name='CUSTOMER';


--------------------------------------------------------------------------------
On delete cascade

ALTER TABLE customer
drop CONSTRAINT SYS_C009091;

ALTER TABLE customer 
  ADD CONSTRAINT city_fk 
  FOREIGN KEY (city_id) 
  REFERENCES city(city_id) 
  ON DELETE CASCADE;


select * from all_constraints where owner='CORE' and table_name='CUSTOMER';

------------------------------------------------------------------------------------
--Meta data tables will have all table & column level details

select * from all_tables where owner='HR'; 

select * from all_tab_columns where owner='HR' and column_name='SALARY'; 

------------------------------------------------------------------------------------


create table country
(
cust_country_code varchar2(2) primary key,
country_name varchar2(30)
);


insert into country values('IN','India');

insert into country values('IN','USA');

drop table country;
----------------------------------------------------------------------

create table customer
(
cust_id number(6),
cust_name varchar2(30) not null,
mobile_no number(10),
age number(3) check (age>=18),
city_id number(4) references city(city_id),
primary key(cust_id,mobile_no)
);

insert into customer values (100000,'Arun',9090909090,28,20);

insert into customer values (100000,'Arun',9090909091,28,20);

insert into customer values (100001,'Arun',9090909090,28,20);

select * from customer; 
