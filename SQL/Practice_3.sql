PRACTICE 3
============

select * from employees;

select employee_id,first_name,email,hire_date,salary,department_id from employees;

--column alias
select employee_id as emp_id,first_name,email,hire_date,salary,department_id from employees;

select employee_id emp_id,first_name,email,hire_date,salary,department_id from employees;

select employee_id emp_id,first_name,email,hire_date salary,department_id from employees;

-- column concatenation

select employee_id ,first_name,last_name,concat(first_name,last_name),email,
hire_date salary,department_id from employees;

select employee_id ,first_name,last_name,concat(first_name,last_name) full_name,email,
hire_date ,salary,department_id from employees;

select employee_id ,first_name,last_name,concat(first_name,' ',last_name) full_name,email,
hire_date ,salary,department_id from employees;
--ORA-00909: invalid number of arguments

select employee_id ,first_name,last_name,concat(concat(first_name,' '),last_name) full_name,email,
hire_date ,salary,department_id from employees;

-- alternate way - pipe
select employee_id emp_id,first_name,last_name,first_name||' '||last_name full_name,email,
hire_date, salary,department_id from employees;

-- column calculation

select employee_id,first_name,email,hire_date,salary,salary+1000 new_salary,department_id from employees;

select employee_id,first_name,email,hire_date,salary,salary*12 annual_salary,department_id from employees;

-- unique department_id

select department_id from employees;

select count(department_id) from employees;

select distinct department_id from employees;

select count(distinct department_id) from employees;

-- where clause

select * from employees where salary >10000;

select * from employees where salary <3000;


select * from employees where salary >5000 and salary <7000;

select * from employees where salary >=5000 and salary <=7000;

select * from employees where salary between 5000 and 7000;

select * from employees where salary not between 5000 and 7000;


select * from employees where department_id=30;

select * from employees where department_id=30,60,90;
-- ORA-00933: SQL command not properly ended

select * from employees where department_id IN (30,60,90);


select * from employees where department_id NOT IN (30,50,80);


select * from employees where department_id=80 AND salary >10000;

select * from employees where department_id=60 OR salary >15000;

select * from employees where department_id=60 OR (department_id=80 AND salary >10000);

select * from employees where rownum <=5;

select * from employees where rownum =5;  -- Wrong

select * from employees where rownum > 5; -- wrong


select rownum,rowid,employee_id,first_name from employees;

select rownum,rowid,* from employees;  --ORA-00936: missing expression

select rownum,rowid,e.* from employees e;

select * from employees where commission_pct is null;

select * from employees where commission_pct is not null;


select count(*) from employees;

select count(commission_pct) from employees;

select count(*) from employees where commission_pct is null;


select employee_id,hire_date,to_char(hire_date,'yyyy') from employees;


select employee_id,hire_date,to_number(to_char(hire_date,'yyyy')) from employees;


select employee_id,hire_date,to_number(to_char(hire_date,'mm')) from employees;


select employee_id,hire_date,to_char(hire_date,'mon') from employees;


select employee_id,hire_date,to_char(hire_date,'Month') from employees;

select employee_id,hire_date,to_char(hire_date,'dd') from employees;


select * from employees where to_char(hire_date,'yyyy')='2005';

select * from employees where to_char(hire_date,'mmyyyy') between '092005' and '092006';

select * from employees where to_char(hire_date,'mm')='02';

select * from employees where to_char(hire_date,'mmyyyy')='032005';

select * from employees where to_char(hire_date,'FMDay')='Monday';

select * from employees where to_char(hire_date,'D')='2';

select sysdate from dual;

select current_date from dual;

select sysdate from employees;

select systimestamp from dual;
------------------------------------------------------------------ pattern matching  -- like 

select * from employees where first_name like 'A%';

select * from employees where first_name like '%s';

select * from employees where first_name like '%an%';

select * from employees where first_name like 'S%n';

select * from employees where first_name like '______';

select * from employees where first_name like '_a____';

select * from employees where first_name like '_a_t__';


select * from employees;

select * from employees order by first_name;

select * from employees order by first_name desc;

select * from employees order by salary;

select * from employees order by salary desc;

select * from employees order by salary desc,hire_date;

select * from employees order by 8;

select * from employees order by 6,8 desc;

--------------------------------------------------------------------------------
Single Row functions in Oracle:
===============================

select first_name,upper(first_name),lower(first_name),initcap(first_name),
length(first_name),reverse(first_name) from employees;

select address,lower(address) from customer_details;

select address from customer_details where lower(ADDRESS)='chennai';

select * from customer_details where address ='chennai';

select * from customer_details where lower(address) ='chennai';

select * from customer_details where upper(address) ='CHENNAI';

--------------------------------------------------------------------------------

substr(string,from_position,no_of_char);    -- 3 argument

substr(string,from_position);    -- 2 argument


select substr('Welcome to India!!!',12,5) from dual;

select substr('Welcome to India!!!',12) from dual;

select substr('Welcome to India!!!',-8) from dual;

select substr('Welcome to India!!!',-8,5) from dual;

select job_id,substr(job_id,1,4) from employees;



-- Instr will return the position of the character



select INSTR('CORPORATE FLOOR','R') from dual;

select INSTR('CORPORATE FLOOR','AB') from dual;

-- from 3rd position 2nd occurance
select INSTR('CORPORATE FLOOR','OR',3,2) from dual;

select INSTR('CORPORATE FLOOR','OR',3,1) from dual;

select substr('When system dialog prompts, click Open Zoom Meetings.',1,
instr('When system dialog prompts, click Open Zoom Meetings.',',')-1) from dual;

select substr('sample@gmail.com', 1, instr('sample@gmail.com', '@')-1) from dual;

select substr('abc@gmail.com', 1, instr('abc@gmail.com', '@')-1) from dual;


select INSTR('CORPORATE FLOOR GARDEN',' ') from dual;

select substr('CORPORATE FLOOR GARDEN',17) from dual;

select instr('CORPORATE FLOOR GARDEN',' ',1,2) from dual;

select substr('CORPORATE FLOOR GARDEN',instr('CORPORATE FLOOR GARDEN',' ',1,2)+1) from dual;

select substr('WELCOME TO CHENNAI CHROMPET',instr('WELCOME TO CHENNAI CHROMPET',' ',1,3)+1) from dual;

select substr('asfdfadsfad@gmail.com', 1, instr('asfdfadsfad@gmail.com','@')-1) from dual;






select LPAD('WELCOME',15,'*') from dual;

select RPAD('WELCOME',15,'*') from dual;

select LPAD(RPAD('WELCOME',15,'*'),30,'*') from dual;

select salary,LPAD(salary,15,0) from employees;

-------------------------------------------------------


select substr('WELCOME TO ORACLE PLSQL',instr('WELCOME TO ORACLE PLSQL',' ',1,3)+1) from dual;

instr('WELCOME TO ORACLE PLSQL',' ',1,3)  -- Returns the position of char from 1st to 3rd occurance  so 18

18+1 -- 19

substr('WELCOME TO ORACLE PLSQL',19) -- from 19th position to right hand side.

so PLSQL is the answer

------------------------------------------------------

Consider the below column value

Welcome to CHENNAI CHROMPET
WELCOME to BANGALURU ITPL
Welcome to MUMBAI KALYAN


Write one query to fetch only city value from the string

output should be:

CHENNAI
BANGALURU
MUMBAI
