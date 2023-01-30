
Plsql  => Procedural Language Structured Query Language

To reduce the Network traffic 
Playing a very big role in an application development

plsql block  =>  execution block  /  anonymous block / unnamed block

begin
insert into t1(a) values(9);
insert into t1(a) values(10);
insert into t1(a) values(11);
insert into t1(a) values(12);
commit;
end;
/

begin
null;
end;
/

begin
dbms_output.put_line('hi');
dbms_output.put_line(123);
end;
/

set serveroutput on

begin
dbms_output.put_line('hi' || '  '  || 123);
end;
/

declare
g employees.first_name%type;
begin
select first_name into g from employees where employee_id = 100;
dbms_output.put_line(g);
end;
/

1.into clause
2.variable declaration
3.only one row

declare
g employees%rowtype;
begin
select * into g from employees where employee_id = 100;
dbms_output.put_line(g.first_name||'  '||g.salary||'  '||g.hire_date);
end;
/

declare
g employees.first_name%type;
h employees.salary%type;
begin
select first_name ,salary into g,h from employees where employee_id = 100;
dbms_output.put_line(g || '  '||h);
end;
/

declare
type j is record(first_name employees.first_name%type ,salary employees.salary%type);
o j;
begin
select first_name ,salary into o from employees where employee_id = 100;
dbms_output.put_line(o.first_name || '  '||o.salary);
end;
/

single column  => %type
all columns  => %rowtype
multiple column  => record

variable should be left hand side
datatype shoul be right hand side

/*

control statements
****************
simple if
if then else
if then elsif
nested if
loop
for loop
while loop
case

*/

declare
a employees%rowtype;
b number  := 100;
begin
dbms_output.put_line(b);
select * into a from employees where employee_id=100;
return;
dbms_output.put_line(a.first_name ||'  '||a.salary||'  '||a.hire_date);
end;
/


declare

begin
dbms_output.put_line(1);
goto c;
dbms_output.put_line(2);
<<b>>
dbms_output.put_line(3);
<<a>>
dbms_output.put_line(4);
<<c>>
--return;   comment line
dbms_output.put_line(5);
end;
/


declare
g number := 5;
begin
delete from t1;
commit;
if g < 10 then 

insert into t1(a) values(g);

end if;

commit;
end;
/

declare
g number := 9;
begin
--delete from t1;
commit;

if g > 10 then 
insert into t1(a) values(g);
else
update t1 set a=g;
end if;
commit;
end;
/



declare
b varchar(50) := 'oracle';
begin

if b = 'java' then
dbms_output.put_line('80% placement assurance');

elsif b = 'c++' then
dbms_output.put_line('70% placement assurance');

elsif b = 'oracle' then
dbms_output.put_line('100% placement assurance');

end if;

end;
/

declare
c number;
g varchar(5);
begin
c := 10;
g := 'java';

if  g = 'java' then

	if c > 5 then
	dbms_output.put_line('success');
	else
	dbms_output.put_line('failed');
	end if;


end if;
--dbms_output.put_line('end of the statement');
end;
/

declare
i number := 0;
begin

loop
i := i+1;

if  mod(i,2) = 1 then
dbms_output.put_line(i);
end if;

exit when i=10;
end loop;

end;
/


begin

for  j in 1..10  loop
if mod(j,2) = 1 then
dbms_output.put_line(j);
end if;
end loop;

end;
/

begin

for  j in reverse 1..10  loop
dbms_output.put_line(j);
end loop;

end;
/

begin

for k in (select * from employees where rownum <= 10)  loop
dbms_output.put_line(k.first_name || '  ' || k.salary || '  '|| k.hire_date);
end loop;

end;
/

begin

for k in (select * from employees)  loop

if  k.first_name like 'A%' then
dbms_output.put_line(k.first_name || '  ' || k.salary || '  '|| k.hire_date);
end if;

end loop;

end;
/

declare
h number;
begin

h := 1;

while h <= 10  loop
dbms_output.put_line(h);
h := h+1;
end loop;


end;
/


declare
a number := 0;
b number;
begin
select case when 1=1 then 100 end  into b  from dual;  -- 100
select decode(1,2,3,4) into b from dual;
dbms_output.put_line(b);  -- 4
case 

when a <= 0 then 
dbms_output.put_line(123);
	
when a >= 5 then
dbms_output.put_line(124);

else
dbms_output.put_line(125);

end case;

end;
/

Nested Block
***********

declare
a date := sysdate;   
begin
dbms_output.put_line(a);

	declare
	a date;
	begin
	a := sysdate + 5;
	dbms_output.put_line(a);
	end;

end;
/

*********************************************************************

CURSOR  => sql private work area , only one row can be processed at a time ,
	      compile time data fetching process

Implict  => found , notfound , rowcount
Explicit => isopen , found , notfound , rowcount

declare
a employees.salary%type;
begin
select salary into a from employees where employee_id = 109;

if sql%found then
insert into t1(a) values(a);
dbms_output.put_line(sql%rowcount);  
end if;

update t1 set a=100 where a=100;
delete from t1;
if sql%found then
dbms_output.put_line(sql%rowcount);  
elsif sql%notfound then
dbms_output.put_line('no rows updated');
end if;

end;
/

declare
--a employees%rowtype;
cursor cc is select * from employees;
a cc%rowtype;
begin
open cc;
fetch cc into a;
dbms_output.put_line(a.employee_id || '  '|| a.first_name);
close cc;
end;
/


declare
--a employees%rowtype;
cursor cc is select * from employees;
a cc%rowtype;
begin
open cc;
loop
fetch cc into a;
exit when cc%notfound;
dbms_output.put_line(a.employee_id || '  '|| a.first_name);
end loop;
dbms_output.put_line(cc%rowcount);

if cc%isopen then
close cc;
end if;
fetch cc into a;
end;
/

declare
b varchar(50);
cursor j(i in number) is select first_name from employees where department_id = i;
begin
open j(90);
loop
fetch j into b;
exit when j%notfound;
dbms_output.put_line(b);
end loop;
close j;
end;
/

declare
b varchar(50);
cursor j(i in number) is select first_name from employees where department_id = i;
begin
for k in j(90) loop
dbms_output.put_line(k.first_name);
end loop;
end;
/

declare
cursor ee(c in number) is select first_name from employees where department_id=c;
cursor dd(a in varchar) is select * from departments where department_name = a;
b dd%rowtype;
g varchar(50);
begin
open dd('Sales');
fetch dd into b;
open ee(b.department_id);
loop
fetch ee into g;
exit when ee%notfound;
dbms_output.put_line(g);
end loop;
dbms_output.put_line(ee%rowcount);
close ee;
close dd;
end;
/


collections  =>  multiple values can be stored in single variable 

index by table  / plsql table / associative array
nested table
varray

declare
a number := 10,20;     -- this is not possible coz only one value can be assigned 
begin
dbms_output.put_line(a);
end;
/


declare
type t is table of varchar(50) index by pls_integer; -- binary_integer
type g is table of number index by varchar(1);
b g;
a t;    -- collection variable
begin
a(1) := 'oracle';
a(2) := 123;
a(3) := 'c++';
a(4) := 456;
dbms_output.put_line(a.count);
dbms_output.put_line(a.prior(4) );   --3
dbms_output.put_line(a.next(1));  -- 2
for j in 1..a.count loop
dbms_output.put_line( a(j) );
end loop;

b('a') := 10;
b('b') := 20;

dbms_output.put_line(b.count);
dbms_output.put_line(b.first);  -- index
dbms_output.put_line(b.last);
dbms_output.put_line(b('a')); -- 10
end;
/

declare
type c is table of varchar(50);
a c := c(1001,101,11,31,301,33,55,501,450,'oracle','java','c++');
begin
dbms_output.put_line(a.count);
for l in 1..a.count loop
dbms_output.put_line(a(l));
end loop;
a.delete(1,6);
dbms_output.put_line(a.count);
end;
/


declare
type j is varray(100) of number;
i j;
begin
i := j(11,12,13,36,45,58);
dbms_output.put_line(i.limit);
dbms_output.put_line(i.count);
i.trim(2);
dbms_output.put_line(i.count);
i.extend(2);  -- only allocated space will get extended
dbms_output.put_line(i.count);
for k in 1..i.count loop
dbms_output.put_line(i(k));
end loop;

if i.exists(7) = true then
dbms_output.put_line('yes');
end if;

end;
/

--delete cannot be used in varray but trim

declare
type h is table of varchar(50);
a h;
begin
select first_name bulk collect into a from employees;
dbms_output.put_line(a.count);
end;
/

declare

begin
for i in (select employee_id from employees) loop
insert into t1(a) values(i.employee_id);
end loop;
end;
/

*/


declare
type h is table of varchar(50);
a h;
begin
select employee_id bulk collect into a from employees;
forall j in a.first..a.last
insert into t1(a) values(a(j));
end;
/

declare
type a is table of number;
b a;
cursor d is select employee_id from employees;
begin
open d;
fetch d bulk collect into b;
forall c in b.first..b.last  save exceptions   
insert into t1(a) values(b(c));
close d;

exception
when others then
dbms_output.put_line(sql%bulk_exceptions.count);  -- 57
end;
/


declare
type a is table of number;
b a;
cursor d is select employee_id from employees;
begin
open d;
loop
fetch d bulk collect into b  limit 10;  -- ?
exit when d%notfound;  
forall c in b.first..b.last  save exceptions 
insert into t1(a) values(b(c));
commit;  -- ?
end loop; 
close d;

exception
when others then
dbms_output.put_line(sql%bulk_exceptions.count);  -- 57
end;
/

Dynamic Sql
************

declare
a varchar(50);
begin
for j in (select employee_id from employees) loop
execute immediate 'select first_name from employees where employee_id = :bindvar' into a using j.employee_id;
dbms_output.put_line(a);
end loop;
end;
/

create or replace procedure first_sp as
c number := 100;
b varchar(50);
a varchar(50) := 'FIRST_NAME';
begin
execute immediate 
 'select  ' || a ||' from employees where employee_id = :w' into b using c;
dbms_output.put_line( b);
end;
/

create or replace procedure second_sp(b  in  employees.employee_id%type) as
c  employees.first_name%type;
d  employees.hire_date%type;
begin
select first_name , hire_date into c,d
from employees where employee_id=b;
dbms_output.put_line(c || '  '||d);
end;
/

exec second_sp(140);
exec second_sp(141);

create or replace procedure 
sp( id1 in number , id2 in number , id3 in number , a out employees.salary%type) as
b employees%rowtype;
type r is 
record(first_name  employees.first_name%type , salary employees.salary%type , hire_date  employees.hire_date%type);
t r;
begin
select salary into a from employees where employee_id =  id1 ;
dbms_output.put_line(a);
select * into b from employees where employee_id =  id2 ;
dbms_output.put_line(b.first_name||'  '||b.salary);
select first_name , salary , hire_date into t from employees where employee_id =  id3 ;
dbms_output.put_line(t.first_name||'  '||t.salary ||'  '||t.hire_date);
end;
/

create or replace procedure second_sp
(b  in  employees.employee_id%type,
 c  out employees.first_name%type,
 d  out employees.hire_date%type
) as
begin
select first_name , hire_date into c,d
from employees where employee_id=b;
dbms_output.put_line(c || '  '||d);
end;
/

declare
w varchar(50);
x date;
begin
second_sp(b => 150 ,   c => w , d => x);
end;
/

create or replace procedure exe_sp as
a number := 150;
w varchar(50);
x date;
begin
second_sp(b => a  ,   c => w , d => x);
end;
/

clear scr;
create or replace procedure inout_sp( a in out varchar) as
begin
dbms_output.put_line(a);
select first_name into a from employees where employee_id=a;  
dbms_output.put_line(a);
end;
/
 
declare
p varchar(50);
begin
p := 175;
inout_sp(p);
end;
/

create or replace function tstfun(a in number) return number as
b number;
begin
select salary*5/100 into b from employees where employee_id = a;
return b;
end;
/

create or replace function tst2(a in number , b out number) return date
as
begin
select employee_id into b from employees where salary = a;
return sysdate;
end;
/

select * from user_objects where object_name ='TSTFUN';

drop function tstfun;



declare
x number;
c date;
begin
c := tst2(24000,x);
dbms_output.put_line(x);
dbms_output.put_line(c);
end;
/

create or replace function tst2(a in number , b out date) return date
as
begin
select hire_date into b from employees where employee_id = a;
return b;
end;
/

declare
b date;
begin
b :=  tst2(101,b);
dbms_output.put_line(b);
end;
/

create or replace type h2o is table of number;
/

create or replace function tbmfun return h2o as
a h2o;
begin
select employee_id bulk collect into a from employees;
return a;
end;
/

select tbmfun() from dual;

select * from table( tbmfun() );

create or replace function insfun return number as
pragma autonomous_transaction;   -- independent transaction
begin
insert into t1(a) values(100);  -- dml
commit;
return 1;
end;
/

select  insfun() from dual;

procedure and functions diff 
************************
1.both are called as subprograms. both are used to implement a specific business logic. these are used to convert a business into technical.

2.procedure may or may not
return a value and you can perform anything inside a procedure but for ddl we have to use execute immediate(dynamic sql).

3.whereas in function we can not perform dml and it must return a value. to make dml perform we can use pragma autonomous_transaction. we can not do ddl in function.

4. procedure can be executed in anonymous block or exec or execute but function only in select statement. 

5.we can assign a function to a variable.


**********************************************************************
trigger  => to set a rule on a  table . it automatically fires when an event occurs

statement level trigger
row level trigger

logon
logoff

events

insert / update / delete

timing point
before
after

instead of =>  view

create  or replace trigger  t1trg before insert on t1
begin
insert into t2(b) values(5);
end;
/

select * from user_triggers where table_name='T1';

create  or replace trigger  t1trg after insert or update or delete on t1
begin
insert into t2(b) values(5);
end;
/

create  or replace trigger  t1trg after update on t1
begin
insert into t2(b) values(6);
end;
/

alter trigger t1trg disable;
alter trigger t1trg enable;

create or replace trigger tttrg after delete on t2
for each row
begin
insert into t1(a) values(1);
end;
/

drop trigger tttrg;

create or replace trigger trg3 instead of update on v1
  -- for view
for each row  -- row level trigger
begin
insert into t2(b) values(20)
end;
/

create or replace trigger trg before insert on t1
declare
pragma autonomous_transaction;
a number := 100;
begin
insert into t2(b) values(a);
commit;
end;
/

create or replace trigger lgon after logon on schema
begin
delete from t2;
end;
/

create or replace trigger lgof before logoff on schema
begin
insert into t2  select level from dual connect by level <= 5;
end;
/

12 types of trigger possible on a table

before	after
stment	rowlevel
insert	insert
update	update
delete	delete

mutating table error ?

create or replace trigger totrg after insert on t1
begin
insert into t1(a) values(1000);
end;
/

*******************************************************************

create or replace function outout(a out number , b out date) return varchar
begin
select salary , hire_date into a,b from employees where rownum=1;
return a||'  '||b;
end;
/

declare
a number;
b date;
c  varchar(50);
begin
c := outout(a,b);
dbms_output.put_line(c);
end;
/

procedure =>  subprogram , to implement any business logic

in
out
in out

create or replace procedure sp as
a varchar(50);
begin
select first_name into a from employees where employee_id = 100;
dbms_output.put_line(a);
end;
/

create or replace procedure sp(b in number , a out varchar) as
--c number := 100;
begin
select first_name into a from employees where employee_id = b;
dbms_output.put_line(a);
end;
/

declare
n varchar(50);
begin
sp(b=>104,a=>n);
end;
/

create or replace procedure sp1(a in out varchar) as
--a varchar(50) := 100;
begin
dbms_output.put_line(a);
select first_name into a from employees where employee_id = a;
dbms_output.put_line(a);
end;
/

declare
a varchar(50) := 118;
begin
sp1(a);
end;
/

create or replace function f1(b number) return date as
a date;
begin
select hire_date into a from employees where employee_id = b;
return a;
end;
/

select f1(145) as fun_test from dual;

select first_name , f1(employee_id) from employees;

declare
x date;
begin
x := f1(145);
dbms_output.put_line(x);
end;
/

create or replace function f2(dob in date) return number as 
a number;
begin
select trunc(months_between(sysdate,dob) /12) into a from dual;
return a;
end;
/

package  =>  collection of subprograms that can be logically grouped in a single business unit.

specification  => declaration
body  => definition

create or replace package pkg as
a number := 9999;
procedure p1;
procedure p2(a in number);
function f5 return number;
end;
/

create or replace package body pkg as

procedure p1 as
begin
dbms_output.put_line(1);
end;

procedure p2(a in number) as
begin
dbms_output.put_line(a);
end;

function f5 return number as
begin
return 3;
end;

end;
/

utl_file  =>  oracle supplied packages 

file => read / write

flat file =>  txt , csv .. etc

sqlplus sys/admin as sysdba
create or replace directory prq as 'D:\New';
grant read,write on directory prq to hr;
grant execute on utl_file to hr;
connect hr/admin
show user


declare
i utl_file.file_type;
begin
i := utl_file.fopen('PRQ','prq.txt','w',32767);

for j in ( select first_name , salary , salary*5/100 as bonus from employees )  loop
utl_file.put_line(i,j.first_name || '  '|| j.salary||'  '|| j.bonus );
utl_file.new_line(i);
end loop;
utl_file.fclose(i);
end;
/

declare
j utl_file.file_type;
k varchar(2000);
begin
j := utl_file.fopen('ABC','list1.txt','r',32767);
for i in 1..3 loop
utl_file.get_line(j,k,32767);
dbms_output.put_line(k);
end loop;
utl_file.fclose(j);
end;
/


XML
****
select dbms_xmlgen.getxml('select first_name , salary , hire_date from employees where salary > 15000')
from dual;

exception handling
****************
two types of timing error =>  compile time compile time error  -e / run time

compile time  =>  syntax / symantic   - show error  / user_errors
run time  => exception handling

predefined exceptions
no_data_found
invalid_cursor
too_many_rows
dup_val_on_index
zero_divide

non predefined  -- pragma exception_init  --  -1476
user defined  -- raise  / raise_application_error
sqlcode
sqlerrm
dbms_utility.format_error_backtrace()
dbms_utility.format_error_stack()

create or replace procedure sp(a in number) as
b varchar(50);
begin
dbms_output.put_line(1/0);
select first_name into b from employees where employee_id <= a;
dbms_output.put_line(b);

exception
when no_data_found then
dbms_output.put_line(sqlerrm);

when too_many_rows then
dbms_output.put_line('hi');

when zero_divide then
dbms_output.put_line(sqlcode);

when others then
dbms_output.put_line('bye');
end;
/
create or replace procedure sspp as
a number;
begin
select salary into a from employees where employee_id = 300;
dbms_output.put_line(4/0);
exception
when zero_divide then
dbms_output.put_line(sqlcode);
dbms_output.put_line(sqlerrm);  -- code with message
when no_data_found then
dbms_output.put_line('no proper input');
when others then
dbms_output.put_line(sqlerrm);
end;
/

declare
e exception;
pragma exception_init(e,-1476);
f exception;
pragma exception_init(f,-1402);
g exception;
pragma exception_init(g,-1);
begin
dbms_output.put_line(5/0);

exception 
when e then
dbms_output.put_line('0  divide');
when f then
dbms_output.put_line('no data found');
when g then
dbms_output.put_line('too many rows');
end;
/


user defined 
***********

declare
a exception;
begin
dbms_output.put_line(5/2);
dbms_output.put_line(10/2);
raise a;
dbms_output.put_line(20/2);
exception 
when a then
dbms_output.put_line('test 1');
end;
/

begin
dbms_output.put_line('test 1');
insert into t1(a) values(10);
raise_application_error(-20152,'hi this is for testing');   --  -20000 to -20999
delete from t1;
end;
/

create or replace trigger wk_delete_notallowed before delete on t1
begin
if  to_char(sysdate,'dy') in ( 'sat' , 'sun') then
raise_application_error(-20101,'delete not allowed on wk ends');
end if;
end;
/

create or replace procedure sp as
a number;
j number;
emsg err_log.error_msg%type;
begin
insert into t1(a) values(1);
select 5/0 into j from dual;
select salary into a from employees where employee_id=1500;

exception
when others then
dbms_output.put_line(sqlcode);
dbms_output.put_line(dbms_utility.format_error_backtrace() );
dbms_output.put_line(dbms_utility.format_error_stack() );
dbms_output.put_line(sqlerrm);
emsg := sqlerrm;
insert into err_log(error_msg,which_sp,when)
values(emsg,'sp',systimestamp);
commit;
end;
/

begin
dbms_output.put_line('test 1');
dbms_output.put_line('test 1');
dbms_output.put_line('test 1');
dbms_output.put_line(8/0);
dbms_output.put_line('test 1');
dbms_output.put_line('test 1');
dbms_output.put_line('test 1');

exception
when others then
dbms_output.put_line( dbms_utility.format_error_backtrace() );  -- error line
dbms_output.put_line( dbms_utility.format_error_stack() );  -- sqlerrm
end;
/

create or replace function f6 return number as
pragma  autonomous_transaction;
begin
delete from t1;
rollback;
return 1;
end;
/

*********************************************************************

Ref cursor

It is a datatype

strongly refcursor
weakly refcursor

create or replace  package tbmpkg  as
type x is ref cursor return employees%rowtype;
type y is ref cursor;
procedure p1(a out tbmpkg.x  , b out tbmpkg.y );
end;
/

create or replace  package body  tbmpkg  as
procedure p1(a out tbmpkg.x  , b out tbmpkg.y )  as
begin
open a for select * from employees where salary> 15000;
open b for select first_name , department_name from employees , departments
where employees.department_id = departments.department_id;
end;
end;
/

create or replace procedure sp(a out sys_refcursor) as
begin
open a for select * from employees;
end;
/

goto cmd

variable a refcursor
exec sp(a=>:a);
print a;

**********************************************************************

Local Procedure

Declare
procedure g1;
procedure g1 as 
begin
insert into t1(a) values(1);
commit;
end;

procedure g2;
procedure g2 as
begin
delete from t1 where a=5;
commit;
end;

begin
g2;
g1;
end;
/

*********************************************************************

Forward Declaration

Declare
procedure xy;
procedure yz;  -- forward declaration
procedure xy as 
begin
yz;
dbms_output.put_line(10);
end;

procedure yz as
begin
dbms_output.put_line(1);
end;

begin
xy;
end;
/

**********************************************************************


