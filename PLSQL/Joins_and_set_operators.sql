Try to understand JOINS and SET_OPERATORS:

create table ta1 (a NUMBER(1));

insert into ta1 (a)values(1);
insert into ta1 (a)values(1);
insert into ta1 (a)values(0);
insert into ta1 (a)values(null);

create table tb1 (a NUMBER(1));

insert into tb1 (a)values(1);
insert into tb1 (a)values(0);
insert into tb1 (a)values(null);
insert into tb1 (a)values(null);

select * from ta1 a natural join tb1 b;
select * from ta1 a inner join tb1 b using(a);   --Inner join using
select * from ta1 a inner join tb1 b on a.a=b.a; --Inner join on
select * from ta1 a, tb1 b where a.a=b.a;        --Inner join using comma-separated tables

select * from ta1 a LEFT join tb1 b on a.a=b.a;
select * from ta1 a, tb1 b where a.a=+b.a;                           -- left join using comma-separated tables
select * from ta1 a LEFT JOIN tb1 b on a.a=b.a WHERE A.A IS NOT NULL; --Left outer join with additional filtering
select * from ta1 a LEFT JOIN tb1 b on a.a=b.a WHERE B.A IS NULL; 

select * from ta1 a RIGHT join tb1 b on a.a=b.a;
select * from ta1 a, tb1 b where +a.a=b.a; 
select * from ta1 a RIGHT JOIN tb1 b on a.a=b.a WHERE B.A IS NOT NULL; --Right outer join with NOT null values in the left table:
select * from ta1 a RIGHT JOIN tb1 b on a.a=b.a WHERE A.A IS NULL; --Right outer join with null values in the left table:

select * from ta1 a full JOIN tb1 b on a.a=b.a;
select * from ta1 a FULL JOIN tb1 b on a.a=b.a WHERE A.A IS NULL OR B.A IS NULL; 
---------------------------------------------------------------------------------------------------------

SET OPERATOR
------------

select * from ta1
union
select * from tb1;

select * from ta1
union all
select * from tb1;

select * from ta1
minus
select * from tb1;

select * from ta1
intersect
select * from tb1;
