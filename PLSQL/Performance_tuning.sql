--I. QUERY OPTIMIZATION AND ANALYSIS TOOLS:

--1. EXPLAIN PLAN - stored in library cache
EXPLAIN PLAN FOR SELECT * FROM DEPARTMENTS;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
EXPLAIN PLAN FOR SET STATEMENT_ID= ‘Q1’ SELECT * FROM DEPARTMENTS;

Select * from table(DBMS_XPLAN.DISPLAY(‘PLAN’_TABLE’,’Q1’,’BASIC/ADVANCED’));
--SYSDBA IS Owner for permanent plan table
--DBMS_PROFILER - profile the performance of PL/SQL code
--Privileges – ENABLE – EXE plslql – DISABLE – Generate report – review – delete_trace
--DBMS_PROFILER.SESSION_TRACE_ENABLE / DISABLE , DBMS_PROFILER.DELETE_TRACE
--DBMS_PROFILER.REPORT_HTML / TEXT procedures to generate a report
BEGIN
 DBMS_PROFILER.SESSION_TRACE_ENABLE(
 trace_name => 'my_trace',
 level => 'ALL');
END;

BEGIN
 DBMS_PROFILER.REPORT_HTML(
 trace_name => 'my_trace',
 report_name => 'my_report.html');
END;
--DBMS_PROFILER.SET_FILTER_VALUE to specify which PL/SQL programs included in trace file.
--DBMS_PROFILER.RESET_DATA to clear data collected, allowing to start new file in clean slate.
--DBMS_PROFILER.REPORT_HTML_DIFF / TEXT_DIFF to report show diff B/W 2 trace files.
--Table to check -- select * from plsql_profiler_runs / plsql_profiler_units / plsql_profiler_data

-- II. AUTOMATIC WORKLOAD REPOSITORY (AWR) – auto collects and stores performance data
DBMS_WORKLOAD_REPOSITORY

SELECT * FROM DBA_HIST_SNAPSHOT;
Privileges - Generate an AWR - Review

BEGIN
DBMS_WORKLOAD_REPOSITORY.AWR_REPORT_HTML(
begin_snap => &start_snap,
end_snap => &end_snap,
report_name => 'awr_report.html'); 
END;
/

3. TKPROF - analyze the performance
--DBMS_MONITOR.DB_TRACE_ENABLE/ DISABLE 
--tkprof trace_file.trc report.txt

4. V$SQLTEXT, V$SQLAREA, V$SQLPLAN
DESC V$SQL;-- execution statistics and metadata for unique SQL statements executed in DB
DESC V$SQL_PLAN; -- execution plans for unique SQL statements executed in DB
DESC V$SQLTEXT; -- the full text of each unique SQL statement in DB.

Select * from V$SQL; -- To view that plan
Select * from V$SQL_PLAN;
Select * from V$SQLTEXT;

2. DATA LOADING TECHNIQUES: -- http://www.greenstechnologys.com/sql-loader-faq.html
--Direct Path Loader - high-speed, not check/bypass (constrain, triggers, empty blocks), disable unique index
--Conventional Path Loader - using SQL INSERT stmt. Check all and throw error
--NoLogging - not logged in the database redo log - changes are not recoverable when db failure or crash.

CREATE TABLE emps ( column_name data_type) NOLOGGING; - any data changes will not be logged
LATER TABLE emps nologging;
INSERT INTO emps SELECT * FROM employees_backup; --fast insert wo redo log

3. INDEX MAINTENANCE:
INDEX
--Full scan : where clause column no index 
--Index scan : where clause column contains any index
--Range scan : where clause contains non unique index 
--Unique scan : where clause contains unique index

JOIN TYPES in PT:
--1. Nested loop - clmn must contains unique index.
--2. Hash join - column contains no index
--3. Sort/ merge join - non unique index 
SELECT /*+USE_NL(emp, dept)*/ * FROM emp, dept;
USE_MERGE(emp, dept) , USE_HASH(emp, dept)

GATHER TABLE STATISTICS - Based On Statistics Only Oracle Created Explain Plan
 SELECT TABLE_NAME,NUM_ROWS,LAST_ANALYZED FROM USER_TABLES; -- WHERE TABLE_NAME='T77';
DB LEVEL -- EXECUTE DBMS_STATS.GATHER_DATABASE_STATS;
SCHEMA LEVEL -- EXECUTE DBMS_STATS.GATHER_SCHEMA_STATS (ownname => 'SCHEMA_NAME');
TABLE LEVEL -- EXECUTE DBMS_STATS.GATHER_TABLE_STATS('SCHEMA_NAME','TABLE_NAME');
COLUMN LEVEL -- EXECUTE DBMS_STATS.GATHER_COLUMN_STATS('HR','emp, 'COLUMN_NAME'); 
Analyse table dept compute statitics; -- also gather stats for table 
More than 10% data_add -- stale state -- select * from dba_table_statistics; -- to know gather req or not 
BEGIN DBMS_STATS.FLUSH_DATABASE_MONITORING_INFO; END;/ --code to flush stats
SELECT table_name, stale_percent FROM DBA_TABLES WHERE owner = USER;
We can also set stale percent by using query

--REBUILT INDEX - ALTER INDEX employee_idx REBUILD ONLINE; -- online for prod env, tab not lock 
ALTER INDEX employee_idx REBUILD TABLESPACE index_tbs PARALLEL 4;
ANALYZE INDEX Idx_name COMPUTE STATISTICS; --to analyse idx
ALTER INDEX idx_name ENABLE / DISABLE; --enable or disable idx

4. QUERY OPTIMIZATION TECHNIQUES:
1. Parallel Query - SELECT /*+ PARALLEL(8) */ * FROM sales; -- using 8 CPU cores - not always 
improve performance - good to test & benchmark diff config to find optimal settings for ur specific 
workload.
2. Query Rewrite
3. Hints - to override the default optimization behaviour
INSERT : /*+ APPEND */
MERGE : /*+ FULL(e) */ 
TABLE : /*+ FULL(e) */
PARALLEL : /*+ PARALLEL(e,4) */
DELETE : /*+ INDEX(e employees_pk) */
INDEX : /*+ INDEX(e employees_pk) */
MATERIALIZE : /*+ MATERIALIZE */
NO_EXPAND : /*+ NO_EXPAND */
SELECT : SELECT /*+ ORDERED */ * FROM emp e, dept d WHERE e.dept_id = d.dept_id;
UPDATE : UPDATE /*+ FULL(e) */ emp e SET salary = salary + 1000 WHERE job_id = 'Manager';

4. Bind Variables

5. PL/SQL PROGRAMMING:

1. Bulk Collect, 
2. Bulk Bind
3. Pipelined Table Function 
6. Table partition
7. Materialized views
8. QUERY RESULT CACHE (11G)

8. OTHER TECHNIQUES:
Table fragmentation - release the unblocked space in the table
ALTER TABLE T77 ENABLE ROW MOVEMENT;
ALTER TABLE T77 SHRINK SPACE;
 Select row_moement from use_tables where table_name = ‘T1’;
Global temporary table
 - storing intermediate results in a PL/SQL block or SP.

ORACLE OPTIMIZER : 
--RULE -- ALTER SESSION SET OPTIMIZER_MODE = RULE; -- to determine execution plan
--COST -- ALTER SESSION SET OPTIMIZER_MODE = COST; -- most efficient plan 
--CHOOSE -- ALTER SESSION SET OPTIMIZER_MODE = CHOOSE; -- Optimizer to choose the best plan
--ALTER SESSION SET OPTIMIZER_GOAL = FIRST_ROWS; --ALL_ROWS, --FIRST_ROW(1 | 10 | 1000);
--SELECT value FROM V$PARAMETER WHERE name = 'optimizer_mode'; -- view what mode it have 
--Query level optimizer using hint -- select /*+ first_row(10)*/ * from emp;
BUFFER CACHE: store as data blocks – used for lookup table (no change)
Recommended to enable caching only for tables that are frequently accessed and small in size.
Query stored -- library cache | Data stored -- buffer cache

SELECT name, size_for_estimate, size_factor, buffered_gets, physical_reads
FROM V$CACHE_TYPE WHERE name = 'Buffer Cache';
ALTER TABLE EMP CACHE / NOCACHE; -- to cache table 
Select table_name, cache from user_tables; -- view what table are using cache
SELECT /*+ CACHE */ * FROM emp; -- hint for force to use cache, SELECT * FROM V$CACHE_OBJECT_TYPE

QUERY RESULT CACHE (11G) :
– if any change in data (auto delete cache) – once cached its used for all user (bcoz stored in shared pool)
Cache – Shared Pool – Logical read
Data file – physical read
Direct physical read using Hint -- SELECT /*+ NO_RESULT_CACHE */ FROM sales WHERE sales >=1000;
Manual Cache using Hint -- SELECT /*+ RESULT_CACHE */ FROM sales WHERE sales >=1000;
Force Cache -- Alter session set result_cache_mode=force; -- cache all in session
Auto Cache -- cache only if eligible for caching -- Alter ,,,,= Auto; -- if query have bind variable then not cache
Show Parameter result_cache_mode; -- only shows its manual / force / auto
Show Parameter;-- result chache memory space in shared pool
Show result_cache_max_result; - max memory 5% for query
Select * from v$result_cache_objects; -- created date, row_count
Create table t1 result_cache(mode force) as select * from emp;
Alter table emp2 result_cache(mode force);
SELECT * FROM V$RESULT_CACHE_OBJECTS; -- Displays information about objects
SELECT * FROM V$RESULT_CACHE_MEMORY; -- Displays information about memory usage
SELECT * FROM V$RESULT_CACHE_STATS; -- Displays statistics about Result Cache performance
SELECT * FROM V$RESULT_CACHE_DEPENDENCY – know about dependencies b/w objects in Result Cach