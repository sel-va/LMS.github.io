PRACTICE 8
===========

--Analtical Functions:

Rank()
Dense_rank()
Lead()
Lag()


select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(order by salary) RANK from employees;

select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(order by salary desc) RANK from employees;

--dense rank()

select employee_id,first_name,email,phone_number,salary,department_id,
dense_rank() over(order by salary) RANK from employees;

select employee_id,first_name,email,phone_number,salary,department_id,
dense_rank() over(order by salary desc) RANK from employees;

--------------------------------------------------------------------------------

group by == > Partition by


select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(partition by department_id order by salary) RANK from employees;

select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(partition by department_id order by salary desc) RANK from employees;

---------------------------------------------------------------------------------

select employee_id,first_name,email,phone_number,salary,department_id,
dense_rank() over(partition by department_id order by salary) RANK from employees;

select employee_id,first_name,email,phone_number,salary,department_id,
dense_rank() over(partition by department_id order by salary desc) RANK from employees;

-----------------------------------------------------------------------------------
--Least 5 salaried employees
select employee_id,first_name,email,phone_number,salary,department_id,rank from
(select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(order by salary) RANK from employees) where rank <=5;

-- Top 5 earners
select employee_id,first_name,email,phone_number,salary,department_id,rank from
(select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(order by salary desc) RANK from employees)  where rank <=5;


--------------------------------------------------------------------------------

--Least 5 salaried employees
select employee_id,first_name,email,phone_number,salary,department_id,rank from
(select employee_id,first_name,email,phone_number,salary,department_id,
dense_rank() over(order by salary) RANK from employees) where rank <=5;

-- Top 5 earners
select employee_id,first_name,email,phone_number,salary,department_id,rank from
(select employee_id,first_name,email,phone_number,salary,department_id,
dense_rank() over(order by salary desc) RANK from employees)  where rank <=5;

--------------------------------------------------------------------------------

-- Top 5 earners with department_name

select a.employee_id,
a.first_name,
a.email,
a.phone_number,
a.salary,
a.department_id,
d.department_name,
a.rank from
(select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(order by salary desc) "RANK" from employees) a inner join departments d
on a.department_id=d.department_id where a.rank <=5 order by a.rank;

--------------------------------------------------------------------------------

100

middle record


select * from employees where rownum <=5;

107

select sount(rownum)=count(rownum)/2; 


select rownum,e.* from employees e where rownum <=(select round(count(*)/2) from employees)
minus
select rownum,e.*  from employees e where rownum <(select round(count(*)/2) from employees);


select * from employees;

--------------------------------------------------------------------------------

Lead()
Lag()

select employee_id,first_name,email,phone_number,hire_date,salary,department_id,
lead (hire_date) over(order by hire_date) after_hire,
lead (first_name) over(order by hire_date) after_hire from employees;


select * from (
select employee_id,first_name,email,phone_number,hire_date,salary,department_id,
lag (hire_date) over(order by hire_date) before_hire_date,
lag (first_name) over(order by hire_date) before_hire_name from employees) where employee_id=142;

--------------------------------------------------------------------------------------------

select employee_id,first_name,email,phone_number,hire_date,salary,department_id,
lead (FIRST_NAME) over(order by salary) high_salary_person,
lead (salary) over(order by salary) high_salary from employees;

---------------------------------------------------------------------------------------------