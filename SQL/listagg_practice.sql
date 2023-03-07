--LISTAGG SIMPLE EXPLAIN

WITH sample_data AS (
SELECT 1 as id, 'apple' as fruit from dual UNION
    SELECT 1, 'banana'  from dual UNION
    SELECT 1, 'cherry'  from dual UNION
    SELECT 2, 'apple'  from dual UNION
    SELECT 2, 'orange'  from dual UNION
    SELECT 3, 'grapes' from dual
)SELECT id, LISTAGG(fruit, ', ') WITHIN GROUP (ORDER BY fruit) as fruits
FROM sample_data
GROUP BY id;
----------------------------------------------------------------------------------------------------------------

select department_id ,listagg(first_name,'/') within group( order by first_name asc  )  from employees
group by department_id;

----------------------------------------------------------------------------------------------------------------
--PRINT ONE STRING TO MULTIROW, 1 COLUMN
select level as ne, substr('selvasql',level, 1) name from dual connect by level <= length('selvasql');

----------------------------------------------------------------------------------------------------------------
--PRINT GIVEN STRING INTO REVERSE ORDER
with rvs as (
select level as ne, substr('selvasql',level, 1) name from dual connect by level <= length('selvasql')
) SELECT LISTAGG(name,'') WITHIN GROUP (ORDER BY ne desc) AS names
FROM rvs;

----------------------------------------------------------------------------------------------------------------

