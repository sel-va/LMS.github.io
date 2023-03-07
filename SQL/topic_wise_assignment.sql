Oracle SQL / PLSQL AssignmentsGroup Functions
=================================================
1. Write a query to find the number of employees Joined in each year?
2. Write a query to display the number of people with the same job.
play the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.
4. display the minimum, maximum, sum, and average salary for each job type.
5. Display the manager number and the salary of the lowest paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $6,000 or less. Sort the output in descending order of salary.
6. Write a query that displays the difference between the highest and lowest salaries. Label the column DIFFERENCE.
7. Determine the number of managers without listing them. Label the column Number of Managers. Hint: Use the MANAGER_ID column to determine the number of managers.

Constraints
============
1. Add a table-level PRIMARY KEY constraint to the EMP table on the ID column. The constraint should be named at creation. Name the constraint my_emp_id_pk
2. Create a PRIMARY KEY constraint to the DEPT table using the ID column. The constraint should be named at creation. Name the constraint my_dept_id_pk.
3. Add a column DEPT_ID to the EMP table. Add a foreign key reference on the EMP table that ensures that the employee is not assigned to a nonexistent department. Name the constraint my_emp_dept_id_fk.
4. Confirm that the constraints were added by querying the USER_CONSTRAINTS view. Note the types and names of the constraints. Save your statement text in a file called lab10_4.sql.
5. Display the object names and types from the USER_OBJECTS data dictionary view for the EMP and DEPT tables. Notice that the new tables and a new index were created.
6. Modify the EMP table. Add a COMMISSION column of NUMBER data type, precision 2, scale 2. Add a constraint to the commission column that ensures that a commission value is greater than zero.


DCL
=====
1. What privilege should a user be given to log on to the Oracle Server? Is this a system or an object privilege?
2. What privilege should a user be given to create tables?
3. If you create a table, who can pass along privileges to other users on your table?
4. You are the DBA. You are creating many users who require the same system privileges. What should you use to make your job easier?
5. What command do you use to change your password?
6. Grant another user access to your DEPARTMENTS table. Have the user grant you query access to his or her DEPARTMENTS table.
7. Query all the rows in your DEPARTMENTS table.
8. Add a new row to your DEPARTMENTS table. Team 1 should add Education as department number 500. Team 2 should add Human Resources department number 510. Query the other team’s table.
9. Create a synonym for the other team’s DEPARTMENTS table.
10. Query all the rows in the other team’s DEPARTMENTS table by using your synonym.
11. Query the USER_TABLES data dictionary to see information about the tables that you own.
12. Query the ALL_TABLES data dictionary view to see information about all the tables that you can access. Exclude tables that you own.
13. Revoke the SELECT privilege from the other team.
14. Remove the row you inserted into the DEPARTMENTS table in step 8 and save the changes.

DDL
====
1. Create the DEPT table based on the following table instance chart. Place the syntax in a script called lab9_1.sql, then execute the statement in the script to create the table. Confirm that the table is created.
2. Populate the DEPT table with data from the DEPARTMENTS table. Include only columns that you need.
3. Create the EMP table based on the following table instance chart. Place the syntax in a script called lab9_3.sql, and then execute the statement in the script to create the table. Confirm that the table is created.
4. Modify the EMP table to allow for longer employee last names. Confirm your modification.
5. Confirm that both the DEPT and EMP tables are stored in the data dictionary. (Hint: USER_TABLES)
6. Create the EMPLOYEES2 table based on the structure of the EMPLOYEES table. Include only the EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, and DEPARTMENT_ID columns. Name the columns in your new table ID, FIRST_NAME, LAST_NAME, SALARY , and DEPT_ID, respectively.
7. Drop the EMP table.
8. Rename the EMPLOYEES2 table to EMP.
9. Add a comment to the DEPT and EMP table definitions describing the tables. Confirm your additions in the data dictionary. COMMENT ON TABLE emp IS ’Employee Information’; COMMENT ON TABLE dept IS ’Department Information’;
10. Drop the FIRST_NAME column from the EMP table. Confirm your modification by checking the description of the table.
11. In the EMP table, mark the DEPT_ID column in the EMP table as UNUSED. Confirm your modification by checking the description of the table.
12. Drop all the UNUSED columns from the EMP table. Confirm your modification by checking the description of the table.

DML
=====
INSERT DATA INTO THE MY_EMPLOYEE TABLE.
1. Run the statement in the lab8_1.sql script to build the MY_EMPLOYEE table that will be used for the lab.
2. Describe the structure of the MY_EMPLOYEE table to identify the column names.
3. Add the first row of data to the MY_EMPLOYEE table from the following sample data. Do not list the columns in the INSERT clause.
4. Populate the MY_EMPLOYEE table with the second row of sample data from the preceding list. This time, list the columns explicitly in the INSERT clause.
5. Confirm your addition to the table.
6. Write an insert statement in a text file named loademp.sql to load rows into the MY_EMPLOYEE table. Concatenate the first letter of the first name and the first seven characters of the last name to produce the userid.
7. Populate the table with the next two rows of sample data by running the insert statement in the script that you created.
8. Confirm your additions to the table.
9. Make the data additions permanent.
10. Change the last name of employee 3 to Drexler. UPDATE my_employee
11. Change the salary to 1000 for all employees with a salary less than 900.
12. Verify your changes to the table.
13. Delete Betty Dancs from the MY_EMPLOYEE table.
14. Confirm your changes to the table.
15. Commit all pending changes.
16. Populate the table with the last row of sample data by modifying the statements in the script that you created in step 6. Run the statements in the script.
17. Confirm your addition to the table.
18. Mark an intermediate point in the processing of the transaction.
19. Empty the entire table.
20. Confirm that the table is empty.
21. Discard the most recent DELETE operation without discarding the earlier INSERT operation.
22. Confirm that the new row is still intact.
23. Make the data addition permanent.

Grouping Sets
==============
1. Write a query to display the following for those employees whose manager ID is less than 120:
Manager ID
Job ID and total salary for every job ID for employees who report to the same manager
Total salary of those managers
Total salary of those managers, irrespective of the job IDs
2. Observe the output from question 1. Write a query using the GROUPING function to determine whether the NULL values in the columns corresponding to the GROUP BY expressions are caused by the ROLLUP operation.
3. Write a query to display the following for those employees whose manager ID is less than 120 :
Manager ID
Job and total salaries for every job for employees who report to the same manager
Total salary of those managers
Cross-tabulation values to display the total salary for every job, irrespective of the manager
Total salary irrespective of all job titles
4. Observe the output from question 3. Write a query using the GROUPING function to determine whether the NULL values in the columns corresponding to the GROUP BY expressions are caused by the CUBE operation.
5. Using GROUPING SETS, write a query to display the following groupings :
department_id, manager_id, job_id
department_id, job_id
Manager_id, job_id
The query should calculate the sum of the salaries for each of these groups.

SET Operators
==============
1. List the department IDs for departments that do not contain the job ID ST_CLERK, using SET operators.
2. Display the country ID and the name of the countries that have no departments located in them, using SET operators.
3. Produce a list of jobs for departments 10, 50, and 20, in that order. Display job ID and department ID, using SET operators.
4. List the employee IDs and job IDs of those employees who currently have the job title that they held before beginning their tenure with the company.
5. Write a compound query that lists the following: • Last names and department ID of all the employees from the EMPLOYEES table, regardless of whether or not they belong to any department • Department ID and department name of all the departments from the DEPARTMENTS table, regardless of whether or not they have employees working in them


Relational Operators
======================
1. Write a query to display the last name, department number, and salary of any employee whose department number and salary both match the department number and salary of any employee who earns a commission.
2. Display the last name, department name, and salary of any employee whose salary and commission match the salary and commission of any employee located in location ID1700.
3. Create a query to display the last name, hire date, and salary for all employees who have the same salary and commission as Kochhar. Note: Do not display Kochhar in the result set.
4. Create a query to display the employees who earn a salary that is higher than the salary of all of the sales managers (JOB_ID = ’SA_MAN’). Sort the results on salary from highest to lowest.
5. Display the details of the employee ID, last name, and department ID of those employees who live in cities whose name begins with T.
6. Write a query to find all employees who earn more than the average salary in their departments. Display last name, salary, department ID, and the average salary for the department. Sort by average salary. Use aliases for the columns retrieved by the query as shown in the sample output.
7. Find all employees who are not supervisors. a. First do this by using the NOT EXISTS operator. b. Can this be done by using the NOT IN operator? How, or why not?
8. Write a query to display the last names of the employees who earn less than the average salary in their departments.
9. Write a query to display the last names of employees who have one or more coworkers in their departments with later hire dates but higher salaries.
10. Write a query to display the employee ID, last names, and department names of all employees. Note: Use a scalar subquery to retrieve the department name in the SELECT statement.
11. Write a query to display the department names of those departments whose total salary cost is above one-eighth (1/8) of the total salary cost of the whole company. Use the WITH clause to write this query. Name the query SUMMARY.

JOINS
=======
1. Write a query to display the last name, department number, and department name for all employees.
2. Create a unique listing of all jobs that are in department 80. Include the location of the department in the output.
3. Write a query to display the employee last name, department name, location ID, and city of all employees who earn a commission.
4. Display the employee last name and department name for all employees who have an a (lowercase) in their last names. Place your SQL statement in a text file named test4.sql.
5. Write a query to display the last name, job, department number, and department name for all employees who work in Toronto.
6. Display the employee last name and employee number along with their manager’s last name and manager number. Label the columns Employee , Emp#, Manager, Mgr#, respectively. Place your SQL statement in a text file named test6.sql.
7. Modify test6.sql to display all employees including King, who has no manager. Place your SQL statement in a text file named test7.sql. Run the query in lab4_7.sql
8. Create a query that displays employee last names, department numbers, and all the employees who work in the same department as a given employee. Give each column an appropriate label.
9. Show the structure of the JOB_GRADES table. Create a query that displays the name, job, department name, salary, and grade for all employees.
10. Create a query to display the name and hire date of any employee hired after employee Davies.
11. Display the names and hire dates for all employees who were hired before their managers, along with their manager’s names and hire dates. Label the columns Employee, Emp Hired, Manager, and Mgr Hired, respectively.
BASIC SQL STATEMENTSBasic SQL Select Statement

Single Row Functions
1. For each employee, display the employee’s last name, and calculate the number of months between today and the date the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed. Round the number of months up to the closest whole number.
2. Write a query that produces the following for each employee: earns monthly but wants <3 times salary>. Label the column Dream Salaries.
3. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY.
4. Display each employee’s last name, hire date, and salary review date, which is the first Monday after six months of service. Label the column REVIEW. Format the dates to appear in the format similar to “Monday, the Thirty-First of July, 2000.”
5. Display the last name, hire date, and day of the week on which the employee started. Label the column DAY. Order the results by the day of the week starting with Monday.
6. Create a query that displays the employees’ last names and commission amounts. If an employee does not earn commission, put “No Commission.” Label the column COMM.
7. Create a query that displays the employees’ last names and indicates the amounts of their annual salaries with asterisks. Each asterisk signifies a thousand dollars. Sort the data in descending order of salary. Label the column EMPLOYEES_AND_THEIR_SALARIES.


SQLPLUS_COMMANDS
DETERMINE WHETHER THE FOLLOWING STATEMENTS ARE TRUE OR FALSE:
1. The following statement is correct: DEFINE & p_val = 100
2. The DEFINE command is a SQL command.
3. Write a script to display the employee last name, job, and hire date for all employees who started between a given range. Concatenate the name and job together, separated by a space and comma, and label the column Employees. In a separate SQL script file, use the DEFINE command to provide the two ranges. Use the format MM/DD/YYYY. Save the script files as lab7_3a.sql and lab7_3b.sql.
4. Write a script to display the employee last name, job, and department name for a given location. The search condition should allow for case-insensitive searches of the department location. Save the script file as lab7_4.sql.
5. Modify the code in lab7_4.sql to create a report containing the department name, employee last name, hire date, salary, and each employee’s annual salary for all employees in a given location. Label the columns DEPARTMENT NAME, EMPLOYEE NAME, START DATE, SALARY, and ANNUAL SALARY, placing the labels on multiple lines. Resave the script as lab7_5.sql and execute the commands in the script.

SUB_QUERY
1. Write a query to display the last name and hire date of any employee in the same department as Zlotkey. Exclude Zlotkey.
2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary.
3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a u. Place your SQL statement in a text file named lab6_3.sql. Run your query.
4. Display the last name, department number, and job ID of all employees whose department location ID is 1700.
5. Display the last name and salary of every employee who reports to King.
6. Display the department number, last name, and job ID for every employee in the Executive department.
7. Modify the query in lab6_3.sql to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any employee with a u in their name. Resave lab6_3.sql to lab6_7.sql. Run the statement in lab6_7.sql.


VIEWS
1. Create a view called EMPLOYEES_VU based on the employee numbers, employee names, and department numbers from the EMPLOYEES table. Change the heading for the employee name to EMPLOYEE.
2. Display the contents of the EMPLOYEES_VU view.
3. Select the view name and text from the USER_VIEWS data dictionary view. Note: Another view already exists. The EMP_DETAILS_VIEW was created as part of your schema. Note: To see more contents of a LONG column, use the iSQL*Plus command SET LONG n, where n is the value of the number of characters of the LONG column that you want to see.
4. Using your EMPLOYEES_VU view, enter a query to display all employee names and department numbers.
5. Create a view named DEPT50 that contains the employee numbers, employee last names, and department numbers for all employees in department 50. Label the view columns EMPNO, EMPLOYEE, and DEPTNO. Do not allow an employee to be reassigned to another department through the view.
6. Display the structure and contents of the DEPT50 view.
7. Attempt to reassign Matos to department 80.
8. Create a view called SALARY_VU based on the employee last names, department names, salaries, and salary grades for all employees. Use the EMPLOYEES, DEPARTMENTS, and JOB_GRADES tables. Label the columns Employee, Department, Salary, and Grade, respectively.


SEQUENCE
1. Create a sequence to be used with the primary key column of the DEPT table. The sequence should start at 200 and have a maximum value of 1000. Have your sequence increment by ten numbers. Name the sequence DEPT_ID_SEQ.
2. Write a query in a script to display the following information about your sequences: sequence name, maximum value, increment size, and last number. Name the script lab12_2.sql. Run the statement in your script.
3. Write a script to insert two rows into the DEPT table. Name your script lab12_3.sql. Be sure to use the sequence that you created for the ID column. Add two departments named Education and Administration. Confirm your additions. Run the commands in your script.
4. Create a nonunique index on the foreign key column (DEPT_ID) in the EMP table.
5. Display the indexes and uniqueness that exist in the data dictionary for the EMP table. Save the statement into a script named lab12_5.sql.


Interview Questions
========================
1. Identifying duplicates and Deleting duplicates
2. 2nd maximum salary
3. rownum and rowid diff
4. case and decode diff
5. Write all the sql and plsql concepts you know
6. What is synonym and purpose?
7. sequence and purpose
8. diff between group fun and analytical fun
9. replace and translate diff
10. instr and substr diff with examples
11. identify the no of ‘a’ in a string
12. What is view – why? – functionality
13. mview and refresh methods
14. constraints
15. delete and truncate diff
16. null functions with real time scenario
17. write a query with group by clause
18. joins – diff – cartesian product
19. Why we are using gtt ? disadvantages
20. What is index? functionality – types
21. procedure and functions diff
22. How many table u ‘ve created?
23. How many subprograms u ‘ve created?
24. Types of exceptions,how exceptions handling in your project ?
25. recently created procedure/function/package ?
26. yesterday the query was running fast but not today why ?
27. what is cursor ? – attributes – real time example
28. diff between cursor and ref cursor – real time scenario
29. files handling concepts in oracle – which is faster ?
30. write a query for delete and update with joins
31. insert values using select statement
32. create table using select statement and structure ?
33. how take insert scripts using sql developer/toad
34. how to check the program error and debug ?
35. connect by level – hierarchycal query
36. collection types – where u used in your project
37. collection type as table column
38. mutating table error – hw to solve it ?
39. where u ‘ve used trigger in ur project
40. :new ? :old ?
41. what is compound trigger
42. recently faced issue , ur contribution ?
43. how oracle works while executing the query
44. function based index – issue – why ?
45. packages – advantages
46. write a query – who joined on tuesdays ?
47. list all the alphabets – write a querypossible to create fk for the same table ?
48. how to generate awr report ? – how to read it
49. query tuning – how do u do that ?
50. what is table fragmentation ?
51. explain plan – how to get it ? and how to read it ?
52. sample real time procedure and function
53. basic unix commands – 10 frequently used commands
54. what is olap ? Online Analytical Processings
55. what is oltp ? Online transaction Processings
56. joins and sub query diff
57. with clause and sub query
58. Inline view ?
59. who is getting the maximum salary ?
60. dynamic sql ?
61. how to insert values in clob , blob and bfile ?
62. There is a column name Inv-128 how you print separately char alone and number alone?
63. insert – Last One year data into another table
64. Get – Last 30 days data Month wise employees count ?
65. Which dep is having max no of employees ?
66. Recently inserted record ?
67. Change fname to lname and lname to fname
68. when parent key not found error will occur ?
69. when child record found error will occur ?
70. what is on delete cascade / on delete null ?
71. what is novalidate ? — not to validate the existing data
72. How to get no of records in a table?
73. Which join will be faster
74. Find the count of a char in a string using regular exp and other way
75. Return 50% of the data from a table
76. Date and year functions in oracle
77. TOP N values
78. Hierarchy queries
79. 11 G features, 12 C features
80. Split a comma separated string into rows
81. Find the 1st and last date of a given period
82. Listagg
83. Rollup & Cube
84. In bulk collect if limit is not used what will happen
85. Query a plsql table
86. Virtual column
87. How to modify a column datatype in a table which contains millions of records?
88. Merge & it uses
89. What happens when a query executed in a database
90. Explain plan & the structure of the explain plan
91. Gather statistics report
92. Normalization
93. Pragma Autonomous transaction
94. Pragma exception_init
95. How to fine line of error in a program
96. Types of cursor and attributes
97. Refcursor & sys_refcursor
98. Weak & strong ref Cursor
99. DBMS packages
100. Check with oracle default packages
101. UTIL file handling
102. How to debug the procedures or packages
103. Transaction Isolation level
104. Round(45.883,-2) & Round(45.883,-1)
105. How to debug the procedures or packages
106. Find which query is performing low inside proc or package
107. Subquery types and example . Which subquery will return fast
108. Different types of hints & when to use it
109. Different types of hints & when to use it
110. Why we should not use commit inside trigger? If we use what will happen


Oracle TestSelf Evaluation – 1 hrs
*************
1.write a query to display no of employees in each department ?
2.write a query to get second max salary using group function ?
3.write a query to display who is getting the max salary in each department ?
4.write a query to display the avg salary in each department ?
5.what happens internally in oracle when primary key created for a column ?
6.what is index ? types ? functionality of each ?
7.what is view ? types ? restriction methods ? purpose of views ?
10.what are analytical functions ? difference between rank and dense_rank ?
11.write a query to delete duplicate rows ?
12.write a query to get department wise maximum salary by using analytical function ?
13.what is the difference between left join and right join ?
14.find the output for the below query
	i. select case when 1=1 then 2 else 3 end from dual;
	ii. select decode(4,2,5,4,9,3) from dual;
	iii.select round(’12-nov-2001′,’yy’) from dual;
15.write a query to display even numbers
16.write the syntax for lead
17.what is synonym ? explain the purpose
18.write the syntax for adding foreign key in alter statement
19.find the output
	i. select * from emp where empid = 100 and empid = 101;
	ii. select * from emp where empid = 100 or empid = 101;
20.differnce between union and union all ?
21.write a query using having clause
22.write syntax for listagg function
23.what is default / interval partition ?
24.what are the concepts you know in sql ?
25.list some features of 11g
26.list some features of 12C
----------------------------------------------------------------------------------------------------------

Prod-SupportL1 and L2 support
about yourself/day to day activities
currently working as an associate in tcs
i have exp in IM , PM , exp in support and dev
support => manitanance
develop => enhancement
i have raised more incedents(tickets – issues) – jira/remedy/service now
IM – IR => incedent request
PM – PR => problem request
Application users : End uers (retail client/ institutional client)
Project => application – issue – call/mail/chat/web form
L1 – calls , mails , chat , web form
step 2 : ticket raise – incedent raise – jira
: problem request
: incedent log
L2 : L1 – incedent – L2 mail – jira – analyse – run book (issue – solution)
issues
slowness
login
connectivity
serverful
cpu usage
performance
Application monitor – Oracle Enterprise Manager – Autosys – job – mail
L3 support
job – shell script
Service Level Agreement SLA
problem => critical,high,low,CR
we are facing performance issue tickets – run book – l3 – acknowledge
24/7 support – rotational
crtical 5mins 1 hour
high 5 3 hours
low 5 8 hours
CR
CR – Change Request
coding – L3 – Release – minor – major
minor – one week
major – one month
=================================================================
Day to Day activities: L1 , L2 and L3 production support
I’m a pure application support executive
currently working for xxx company for the project yyy and our
client is ? bank
This project is nothing but to manage cash flows / customer validations/down stream application logic validations/
transactions – rtgs/neft/cheque/local cheques handling
i have good experience in level 1 and level 2 support
i have used jira/service now/remedy as ticking tool.
i have worked for both incident management and problem management
i have raised so many tickets for application issues
mostly we are getting performance related issues
since our application used by several end users – retail clients
or institutional clients
our application using by retail clients
or institutional clients – we are getting issues by chats / mails / web forms / calls
tasks been segrigated by diff team
as a support person i will be analyzing it , i will be follwing runbook
we have some common listed issues with solution in that book.
we will try to rectify the issue then and there using check list. if not then we are supposed to raise ticket in service now.
yesterday we have faced an issue – which the java web services not restarted by the l4 team . we have raised a ticket to do the same.
appart from raising tickets , i used to monitor the application in all the
way like cpu usage / cpu utilization / memory capacity /performance
of the application / connectivity issues – by oem – oracle enterprise manager / invoice issue / booking issue / maintenance / quotation poblem / data issues / order management
if anything related to this monitoring issue i will be raising a ticket
to l3 and l4 team.
eg/ if we getting ora error related issues
analyze the issue
proritize the issue – critical / high / low / cr – change request
decision making – by l1 or l2 team or it has to be moved to l3 team
if any code fix – eg/ sequence altering issue – String buffer too small
we will sending/attaching the screenshots in jira and raising ticket to dev team.
they should acknowledge within 5 mins and should fix the issue within the SLA (service level agreement)
if not then we will be calling them , to get the update else
again ticket will be raised – using service now
production support team working – 24/7
i have worked in rotational shifts. 9pm – 6am now
we have supported in week ends too
analysis – code fix
Environments:
dev
sit
uat
staging – replica of prod – we access in this environment
production – we dont have any access for prod
i have good knowledge in plsql concepts. like proc , function , packages,triggers , bulk collect , bulk bind , cursor
having good experience in handling these concepts and little performance tuning knowledge
since we are the very first contact for the end users , i will be connecting dev team for performance related issues
1.query taking much time
2.index invalid staus
3.hints – to force index
4.stats gathering – remove the empty blocks to make the performace faster
i have good experience in unix basic commands
we are using putty as a tool to connect the server.
i used to check the data flows and error log files in putty.
i used to get the connection strings and server infomation
to connect the putty if any issues related to java or oracle
i have learned so many commands in unix
ls
cd
awk
grep
sed
cp
mv
mkdir
vi editor – important – u can edit in cmd – save – we dont have access
i will be updating my staus in stand up call every day – 10pm
Pt for Interview QuestionsI ve good understanding of pt concepts. i ve hands on experience in pt like to generate awr report , sql query tuning , explain plan analysis . i ve been part of pt team for last 3 4 months. i got the clear understanding of application flow.
we recently faced an issue of
application latency
blank report
query slowness
memory usage full
for application latency , our dba will be sending the awr reprt to us and i will analyze the report based on the check list give to us. we have standard process to follow for pt, whether we can go for joins instead of sub query , null functions to be replaced by case or decode to be replaced by case .. etc
i will check the explain plan for the query first with screenshot, then i will analyze which scans have been done by optimizer whether index has been read (if index there), or index required , hints to be forced , sub query to be replaced … if i found any cost decrease then i will force hint or iniating index .. or gathering table statics
we faced more application slowness (particular page will be blank at specific point of time ) issues. for that we will be doing
exec dbms_stats.gather_table_stats(‘hr’,’employees’);
after running this .. index may go for unusable status so we have to check the index status in user_indexes. if it is in unusable status then
alter index index_name rebuild online; ( if production time issue ) or
alter index index_name rebuild;
i have some knowledge of analysing awr report
select * from dba_hist_snapshot;
first of all we need to get the application slowness issue timings from L1 people
based on that i will be checking in the respective database to get the snap start id , snap end id , db id , instance number to generate awr report.
using select * from
table(dbms_workload_repository.awr_report_html(dbid,insnumber,snapsid,snapeid));
i will check top 10 fore ground events and then i can easily identify the query which took more time to execute. if the cost of the query says 100% above then i will tune the query…
table partitioning
awr report
index
hints
bind variable
avoidance of null functions
use case instead of decode
collections / bulk collect ..
How to see explain plan
in sqlplus => set autot on
in toad => ctl+e
General way
explain for select * from emp;
select dbms_xplan.display from dual;


Screening
Name
Total IT Exp 2 years 1 months
Relevant Exp in Oracle 2 years 1 months
Current CTC 3.9 Lakhs
Expected CTC 5.0 Lakhs (Negotiable)
Notice Period 2 months
Company Name Wipro Technologies
Contract / Permanant Permanant
Designation Production Support Engineer
Role L1, L2 Production Support
Team size 20+
Telecom / Insurance Yes
SQL 3.5/5 70% 80%
PLSQL 3.5/5
UNIX SHELL SCRIPTING 3.5/5
PERFORMANCE Tuning 3.5/5
Relocation Yes
Contract to Hire Yes
Bank Statement HDFC Bank
Form 16 Yes
PF Yes
Production Support Yes
Development Yes
Reason for Change Career Growth
official email id first_name.last_name@wipro.com
Certification OCA, OCP
Versions 10g, 11g, 12c
Tools
Tools Used
Oracle Developer SQLPLUS, TOAD, SQL Developer
UNIX Putty, F-Secure SSH Client
Ticket tracking Service Now, ITT, JIRA, Remedy
Version Control CVS, SVN, VSS
Data Modeling ERWIN, VISIO
Job Scheduling Autosys
Database Oracle, Sybase
Server Oracle Solaris 10
Application Server
Middleware Oracle WebLogic Server 12cR2 (12.2.1)
Name
Company name
Phone Extn
email
Job Description
89399 15577
Performance Tuning
Explain Plan
DBMS_Profiler
Automatic Workload Repository (AWR)
TKProf
Index
Table Partition
Hints
Parallel Query
Bind Variables
Pipelined Table Function
Query rewrite
Global Temporary table
Materialized Views
XML
Bulk Collect
Bulk Bind
Gather Table Statistics
Rebuilt Index
Direct Path loader
Conventional Path loader
NoLogging
V$SQLTEXT, V$SQLAREA, V$SQLPLAN
Table Fragmentation
Last Analyzed – Index, Table, Schema, Database
Table_DesignRoles of Data Modeler
Data modeler will create three types of data models based on the page design given by the Business Analyst.
First data model is, Conceptual data model which includes
-> Entity names
->Entity relationship
Second data model is, Logical data model which includes
->Entity names
->Entity relationship
->Attributes
->Primary key
->Foreign key
Third data model is, Physical data model which includes
->Table Name
->Column Name
->Column Data type
->Primary key
->Foreign key
Table Creations
Clients_Table
create table c_clients(client_id number not null,client_details varchar(255),Constraint c1 primary key(client_id));
Accounts_Table
create table a_accounts(account_id number not null, client_id number,
account_details varchar(255),Constraint c2 primary key (account_id),foreign key(client_id) References c_clients(client_id));
Financial_products_table
create table f_products(f_product_id number not null,f_product_details varchar(255),
Constraint c3 primary key(f_product_id));
Asset_Table
create table a_asset(asset_id number not null,asset_details varchar(255),Constraint c4 primary key(asset_id));
Brokerage_Table
create table b_broker(broker_id number not null,broker_details varchar(255),Constraint c5 primary key(broker_id));
Mobile_Device_Table
create table m_device(mobile_device_id number not null,mobile_details varchar(255),Constraint c6 primary key(mobile_device_id));
Staff_Table
create table s_staff(staff_id number not null,mobile_device_id number,staff_details varchar(255),Constraint c7 primary key(staff_id), foreign key(mobile_device_id) References m_device(mobile_device_id));
Deals_table
create table d_deals(deal_id number not null, account_id number,asset_id number, broker_id number ,f_product_id number,staff_id number,generic_deal_details varchar(255),Constraint c8 primary key(deal_id), foreign key(account_id) References a_accounts (account_id),foreign key(asset_id) References a_asset (asset_id),foreign key (broker_id) References b_broker(broker_id),foreign key(f_product_id) References f_products (f_product_id), foreign key(staff_id) References s_staff (staff_id));
Transactions_Table
create table t_transactions(transaction_id number not null, deal_id number,
transaction_details varchar(255),Constraint c9 primary key (transaction_id),foreign key(deal_id) References d_deals(deal_id));
Settlements_Table
create table s_settlement(settlement_id number not null, deal_id number,settlement_deal_details varchar
(255),Constraint c10 primary key (settlement_id),foreign key(deal_id) References d_deals
(deal_id));
Ref_Currencies_Table
create table r_currencies(currency_code char(15),currency_name varchar(255),current_USD_exchange_rate REAL,Constraint c11 primary key
(currency_code));
Deals_Currencies_Table
create table d_currencies(deal_currency_id number not null, currency_code char(15),currency_deal_details varchar(255),Constraint c12 primary key
(deal_currency_id),foreign key(currency_code) References r_currencies(currency_code));
Deals_General_Table
create table d_general(deal_general_id number not null, details_general_details varchar(40),Constraint c13 primary key
(deal_general_id));
Deals_Fx_Table
create table d_fx(deal_fx_id number not null, details_fx_details varchar(40),Constraint c14 primary key
(deal_fx_id));