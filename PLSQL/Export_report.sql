--SQL DEVELOPER > REPORTS > USER DEFINED REPORTS > RIGHT CLICK - NEW REPORT > RIGHT CLICK - EXPORT > SELECT FORMATE
--EXCEL, CSV, HTML, XML, TXT, JSON, INSERT, PDF
-------------------------------------------------------------------------------------------------------------------------------

--To generate a report as a CSV file in Oracle PL/SQL, you can use the UTL_FILE package to write the data to a file. Here's an example:

DECLARE
  file_handle   UTL_FILE.file_type;
  csv_data      VARCHAR2(32767);
BEGIN
  -- Open the file for writing
  file_handle := UTL_FILE.fopen('directory_path', 'file_name.csv', 'w');

  -- Build the CSV data to be written
  SELECT 'column1,column2,column3' || CHR(10) ||
         LISTAGG(column1 || ',' || column2 || ',' || column3, CHR(10)) WITHIN GROUP (ORDER BY column1)
    INTO csv_data
    FROM table_name;

  -- Write the CSV data to the file
  UTL_FILE.put_line(file_handle, csv_data);

  -- Close the file
  UTL_FILE.fclose(file_handle);
END;

----------------------------------------------------------------------------------------------------------------------

--To generate a report as a text file in Oracle PL/SQL, the process is similar, just replace the extension of the file name with .txt and the format of the data being written to the file.

spool file_name.csv
SELECT column1 || ',' || column2 || ',' || column3
FROM table_name;
spool off;

--To generate a report as a text file, replace the extension of the file name with .txt and adjust the format of the data being written to the file.
-------------------------------------------------------------------------------------------------------------------------------

/*
SQL*Plus: It is a command-line interface that can be used to execute SQL statements and generate reports in plain text format.

Oracle Reports: It is a powerful reporting tool that allows to create reports in various formats including PDF, HTML, RTF, and more.

Oracle Discoverer: It is a business intelligence tool used to create ad-hoc reports from an Oracle database.

Oracle Business Intelligence (OBIEE): It is a comprehensive business intelligence platform for creating and delivering reports, dashboards, and analytics.

Oracle Apex: It is a web-based development environment for creating reports, dashboards, and applications.

Oracle JDeveloper: It is an integrated development environment for creating Java-based applications, including reports.

Oracle SQL Developer: It is a free tool that can be used to query an Oracle database and generate reports in various formats.

Oracle Data Miner: It is a data mining tool that can be used to generate reports based on data mining algorithms.

Microsoft Excel: Data can be exported from Oracle to Microsoft Excel and used to generate reports.

Custom Application: A custom application can be developed to generate reports from an Oracle database, using technologies such as Java, .NET, or Python.

*/
-------------------------------------------------------------------------------------------------------------------------------
--Reporting data using interface commands

-- Set pagesize and linesize
set pagesize 50
set linesize 120

-- Set column heading
column heading on

-- Set column format
column "Column 1" format a20
column "Column 2" format a30
column "Column 3" format a40

-- Set column separator
set colsep " | "

-- Select data and display using interface commands
select column1, column2, column3 from table;

-- Set tTitle (top title)
ttitle 'Report Title' -
center 'Page: ' format 999 sql.pno

-- Set bTitle (bottom title)
btitle 'Generated on ' sysdate

-- Break on column
break on column1

-- Display data
select column1, column2, column3 from table;

