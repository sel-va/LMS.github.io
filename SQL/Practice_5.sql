PRACTICE 5 
============


Joins in Oracle: 
================

Equi join - An equi join is a type of join that combines tables 
based on matching values in specified columns.

Non-Equi join - The nonequijoins is such a join which match column 
values from different tables based on an inequality 
(instead of the equal sign like >, <, >=, <= ) expression


4 Types of Equi join:
=====================

Inner Join
Left Outer join
Right Outer Join
Full Outer Join


2 methods to write join query: 
==============================

1. Implicit method
2. ANSI Method


Table scripts for practice: 
***************************

create table customer
(
cust_id	number,
cust_name	varchar2(50),
mob_no	number(10),
email	varchar2(50),
country_id number(3)
);

Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1000,'Kannan',8989898989,'kannan@gmail.com',200);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1001,'Arun',8989898990,'arun@gmail.com',204);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1002,'Karthik',8989898991,'Karthik@gmail.com',202);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1003,'Shankar',8989898992,'shankar@gmail.com',203);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1004,'Sree',8989898993,'Sree@gmail.com',205);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1005,'Babu',8989898994,'Babu@gmail.com',200);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1006,'Radha',8989898995,'Radha@gmail.com',202);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1007,'Senthil',8989898996,'Senthil@gmail.com',200);


commit;


create table country
(
Country_id	number(3),
Country_name varchar2(50)
);

Insert into country (COUNTRY_ID,COUNTRY_NAME) values (200,'INDIA');
Insert into country (COUNTRY_ID,COUNTRY_NAME) values (201,'CHINA');
Insert into country (COUNTRY_ID,COUNTRY_NAME) values (202,'USA');
Insert into country (COUNTRY_ID,COUNTRY_NAME) values (203,'SINGAPORE');
Insert into country (COUNTRY_ID,COUNTRY_NAME) values (204,'UK');

commit;

============================================

Inner Join:
------------

  -- implicit method

select
c.cust_id,
c.cust_name,
c.mobile_no,
c.email,
c.country_id,
r.country_name
from customer c, region r
where c.country_id=r.country_id;


Inner Join:
------------
  -- ANSI Method


select
c.cust_id,
c.cust_name,
c.mobile_no,
c.email,
c.country_id,
r.country_name
from customer c inner join region r
on c.country_id=r.country_id;

*******************************************************

Left Outer Join:
------------
  -- implicit


select
c.cust_id,
c.cust_name,
c.mobile_no,
c.email,
c.country_id,
r.country_name
from customer c, region r
where c.country_id=r.country_id(+);


Left Outer Join:
------------
  -- ANSI


select
c.cust_id,
c.cust_name,
c.mobile_no,
c.email,
c.country_id,
r.country_name
from customer c Left Outer join region r
on c.country_id=r.country_id;


***************************************************************


Right Outer Join:
------------
  -- implicit


select
c.cust_id,
c.cust_name,
c.mobile_no,
c.email,
c.country_id,
r.country_name
from customer c, region r
where c.country_id(+)=r.country_id;


Right Outer Join:
------------
  -- ANSI


select
c.cust_id,
c.cust_name,
c.mobile_no,
c.email,
c.country_id,
r.country_name
from customer c Right Outer join region r
on c.country_id=r.country_id;

*****************************************************

Full Outer Join:
------------
  -- ANSI


select
c.cust_id,
c.cust_name,
c.mobile_no,
c.email,
c.country_id,
r.country_name
from customer c Full Outer join region r
on c.country_id=r.country_id;


*********************************************************

3 tables  -- customer   city    country


select
c1.cust_id,
c1.cust_name,
c1.mob_no,
c1.email,
c1.city_id,
c2.city_name,
c2.region_id country_id,
c3.country_name
from customer c1,city c2, country c3
where c1.city_id=c2.city_id 
and c2.region_id=c3.country_id;




select
c1.cust_id,
c1.cust_name,
c1.mob_no,
c1.email,
c1.city_id,
c2.city_name,
c2.region_id country_id,
c3.country_name
from customer c1 inner join city c2
on c1.city_id=c2.city_id
inner join country c3
on c2.region_id=c3.country_id;

*************************************************************

select * from employees;

select * from departments;

select
e.employee_id,
e.first_name,
e.email,
e.SALARY,
e.department_id,
d.DEPARTMENT_NAME,
d.LOCATION_ID
from Employees e,departments d
where e.department_id=d.department_id;


select
e.employee_id,
e.first_name,
e.email,
e.SALARY,
e.department_id,
d.DEPARTMENT_NAME,
d.LOCATION_ID
from employees e inner join DEPARTMENTS d
on e.department_id=d.department_id;


-- Left Outer Join

select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME
from employees e, departments d
where e.department_id=d.department_id(+);


select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME
from employees e left join departments d
on e.department_id=d.department_id;

----------------------------------------------------

-- Right outer join

select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
d.department_id,
d.DEPARTMENT_NAME
from employees e, departments d
where e.department_id(+)=d.department_id;


select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME
from employees e right join departments d
on e.department_id=d.department_id;

-- Full Outer Join

select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME
from employees e full join departments d
on e.department_id=d.department_id;

********************************************************************************

select the departmet_id where no employees are working

select
d.department_id,
d.DEPARTMENT_NAME
from employees e, departments d
where e.department_id(+)=d.department_id and e.employee_id is null;

================================================================================

3 tables join

select * from locations;

select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME,
d.location_id,
l.country_id
from employees e, departments d, locations l
where e.department_id=d.department_id and d.location_id=l.location_id and l.country_id='UK';


select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME,
d.location_id,
l.country_id
from employees e inner join departments d
on e.department_id=d.department_id 
inner join locations l 
on  d.location_id=l.location_id and l.country_id='CA' and e.salary >10000;



select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME,
d.location_id,
l.country_id,
c.COUNTRY_NAME
from employees e inner join departments d
on e.department_id=d.department_id 
inner join locations l 
on  d.location_id=l.location_id 
inner join COUNTRIES c on l.COUNTRY_ID=c.COUNTRY_ID
where l.country_id='CA' and e.salary >10000;

--------------------------------------------
4 tables join with sub query:
=============================
select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME,
d.location_id,
l.country_id,
c.country_name
from employees e inner join (select department_id,department_name,location_id from departments) d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id
join countries c
on l.country_id=c.country_id where c.country_name='United Kingdom' and e.salary >10000;


--------------------------------------------------------------------------------

--Cross Join or Cartesian product

select * from departments;
select
e.employee_id,
e.first_name,
e.email,
e.SALARY,
e.department_id,
d.DEPARTMENT_NAME,
d.LOCATION_ID
from employees e, departments d
--where e.department_id=d.department_id;

107*27=2889

--------------------------------------------------------------------------------
self Join


select * from employees;


select
e1.employee_id,
e1.first_name,
'reports to',
e2.employee_id,
e2.first_name
from employees e1,employees e2
where e1.manager_id=e2.employee_id order by e1.employee_id;

--------------------------------------------------------------------

--Non-Equi Join

select
e.employee_id,
e.first_name,
e.email,
e.SALARY,
e.department_id,
d.DEPARTMENT_NAME,
d.LOCATION_ID
from employees e, departments d
where e.department_id!=d.department_id;

