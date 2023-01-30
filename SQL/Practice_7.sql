PRACTICE 7
============

SET OPERATORS                              
=============                              

  -- same structured table

1. Union

 -- It will remove duplicate

2. Union ALL

-- It will not remove duplicate
-- It will be executed faster

3. Intersect 

 --- Common record between both tables

4. Minus

   -- Differences
 
***********************************************************



select * from s_customer_union1;

1000	Ramesh	32	7878787878	CHROMPET	30
1002	Vijay	26	1234567892	medavakkam	20
1003	Ajith	42	9875647661	Pallavaram	10
1004	Vishal	24	7878707878	Adyar	50

select * from s_customer_union2;
1000	Ramesh	32	7878787878	CHROMPET	30
1005	Bhuvana	23	34325435	medavakkam	20
1003	Ajith	42	9875647661	Pallavaram	10

select * from s_customer_union2
minus
select * from s_customer_union1;

  
   
   
create table emp_union_2 as select employee_id,first_name,email,phone_number,
salary,department_id from employees where salary >15000;
   
select * from EMP_UNION_1;

select * from EMP_UNION_2;


select employee_id,first_name,email,phone_number,salary,department_id from EMP_UNION_1
union
select employee_id,first_name,email,phone_number,salary,department_id from EMP_UNION_2;


select employee_id,first_name,email,phone_number,salary,department_id from EMP_UNION_1
union all
select employee_id,first_name,email,phone_number,salary,department_id from EMP_UNION_2;

select employee_id,first_name,email,phone_number,salary,department_id from EMP_UNION_1
intersect
select employee_id,first_name,email,phone_number,salary,department_id from EMP_UNION_2;



select employee_id,first_name,email,phone_number,salary,department_id from EMP_UNION_1
minus
select employee_id,first_name,email,phone_number,salary,department_id from EMP_UNION_2;


select employee_id,first_name,email,phone_number,salary,department_id from EMP_UNION_2
minus
select employee_id,first_name,email,phone_number,salary,department_id from EMP_UNION_1;

drop table EMP_UNION_2;

drop table EMP_UNION_1;


create table emp_union_1 as select employee_id,first_name,last_name,email,phone_number,
salary,department_id from employees where salary >12000;


create table emp_union_2 as select employee_id,first_name,email,phone_number,
salary,department_id from employees where salary >15000;

select * from emp_union_1
union
select * from emp_union_2;
--A-01789: query block has incorrect number of result columns
   
   
select employee_id,first_name,email,phone_number,salary,department_id from emp_union_1
union
select employee_id,first_name,email,phone_number,salary,department_id from emp_union_2;

select employee_id,first_name,email,phone_number,salary,department_id from emp_union_1
union ALL
select employee_id,first_name,email,phone_number,salary,department_id from emp_union_2;



select employee_id,first_name,email,phone_number,salary,department_id from emp_union_1
intersect
select employee_id,first_name,email,phone_number,salary,department_id from emp_union_2;

select employee_id,first_name,email,phone_number,salary,department_id from emp_union_1
minus
select employee_id,first_name,email,phone_number,salary,department_id from emp_union_2;

select employee_id,first_name,email,phone_number,salary,department_id from emp_union_2
minus
select employee_id,first_name,email,phone_number,salary,department_id from emp_union_1;


-- How to find a duplicate record

select employee_id,count(*) from emp_union_1 group by employee_id;

select employee_id,count(*) from emp_union_1 group by employee_id having count(*) >1;


select employee_id,count(*) from emp_union_2 group by employee_id having count(*) >1;

-- how to delete a deplicate record

delete from emp_union_1 where rowid not in (
select max(rowid) from emp_union_1 group by employee_id);
