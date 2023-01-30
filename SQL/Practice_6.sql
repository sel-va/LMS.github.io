PRACTICE 6
=============


Aggregate Functions:
=================

select max(salary) from employees;
select min(salary) from employees;
select sum(salary) from employees;
select count(salary) from employees;
select avg(salary) from employees;


--------------------------------------------------
-- We can't select non-aggregate column with aggregate column. 

select first_name,max(salary) from employees;
ORA-00937: not a single-group group function


select first_name,max(salary) from employees group by first_name;
-- wrong

select department_id,max(salary) from employees group by department_id;

whenever we want to use wise keyword, use group by.  

Filter condition on resultant of group by clause - We have to use having clause. 

Having clause is always come with group by   group by  + having 


select department_id,sum(salary) from employees group by department_id;


select department_id,sum(salary) from  employees group by department_id having sum(salary) >50000;

select first_name,max(salary) from employees;
--ORA-00937: not a single-group group function

select first_name,max(salary) from employees group by first_name;
-- wrong logic

select department_id,sum(salary) from employees where department_id is not null
group by department_id having sum(salary) >50000 order by 1;

The order of keywords in any oracle SQL statement. 

1.from
2.where
3.group by
4.having
5.order by

select e.department_id,d.department_name, sum(salary) 
from employees e , departments d
where e.department_id=d.department_id and e.department_id is not null
group by e.department_id,d.department_name
having sum(salary) >50000 order by 1;

--select the department where more than 30 employees are working;

select e.department_id,d.department_name,count(*) 
from employees e inner join departments d
on e.department_id=d.department_id 
group by e.department_id, d.department_name having count(*) > 30;
Aggregate Functions.txt
Displaying Aggregate Functions.txt.