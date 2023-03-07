SELECT CAST('10-AUG-30' AS TIMESTAMP)
FROM DUAL;


SELECT CAST(
    'Homer' AS NUMBER
    DEFAULT '0' ON CONVERSION ERROR
    )
FROM DUAL;

----------------------------------------------------------------------------------------------
--Collection Examples

--The CAST examples that follow build on the cust_address_typ found in the sample order entry schema, oe.

CREATE TYPE address_book_t AS TABLE OF cust_address_typ;
/
CREATE TYPE address_array_t AS VARRAY(3) OF cust_address_typ;
/
CREATE TABLE cust_address (
  custno            NUMBER, 
  street_address    VARCHAR2(40), 
  postal_code       VARCHAR2(10), 
  city              VARCHAR2(30),
  state_province    VARCHAR2(10), 
  country_id        CHAR(2));
---------------------------------------------------------------------------------
CREATE TABLE cust_short (custno NUMBER, name VARCHAR2(31));

CREATE TABLE states (state_id NUMBER, addresses address_array_t);
This example casts a subquery:

SELECT s.custno, s.name,
       CAST(MULTISET(SELECT ca.street_address,   
                            ca.postal_code, 
                            ca.city, 
                            ca.state_province, 
                            ca.country_id
                       FROM cust_address ca
                       WHERE s.custno = ca.custno)
       AS address_book_t)
  FROM cust_short s
  ORDER BY s.custno;
CAST converts a varray type column into a nested table:

SELECT CAST(s.addresses AS address_book_t)
  FROM states s 
  WHERE s.state_id = 111;

--The following objects create the basis of the example that follows:

CREATE TABLE projects 
  (employee_id NUMBER, project_name VARCHAR2(10));

CREATE TABLE emps_short 
  (employee_id NUMBER, last_name VARCHAR2(10));

CREATE TYPE project_table_typ AS TABLE OF VARCHAR2(10);
/

--The following example of a MULTISET expression uses these objects:

SELECT e.last_name,
       CAST(MULTISET(SELECT p.project_name
                       FROM projects p 
                       WHERE p.employee_id = e.employee_id
                       ORDER BY p.project_name)
       AS project_table_typ)
  FROM emps_short e
  ORDER BY e.last_name;