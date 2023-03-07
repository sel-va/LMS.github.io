DBMS_JOB is a PL/SQL package that provides scheduling functionality within the Oracle database. It allows you to schedule and run PL/SQL procedures and anonymous blocks at specified times or intervals.

Verify that the job is running:
 
SELECT job, what, next_date, interval
FROM user_jobs;

DBMS_JOB.RUN procedure to run a job immediately
DBMS_JOB.REMOVE procedure to remove a job.


send email when trigger inserted new row in error table
===========================================================

--Create the error table:
	 
	CREATE TABLE error_table (
	   error_id NUMBER,
	   error_message VARCHAR2(100),
	   error_timestamp DATE
	);

--Create a trigger that will insert a new row into the error table when an error occurs:
 
	CREATE OR REPLACE TRIGGER error_trigger
	   AFTER INSERT ON error_table
	   FOR EACH ROW
	BEGIN
	   DBMS_JOB.SUBMIT(
		  job => :new.error_id,
		  what => 'BEGIN send_error_email; END;',
		  next_date => SYSDATE + INTERVAL '1' MINUTE
	   );
	END;
	/
	
Note that the DBMS_JOB.SUBMIT procedure is called within the trigger and the job is assigned a unique identifier from the error_id column.

--Create the send_error_email procedure that will send the email:

	CREATE OR REPLACE PROCEDURE send_error_email AS
	   v_to VARCHAR2(100) := 'support@example.com';
	   v_from VARCHAR2(100) := 'noreply@example.com';
	   v_subject VARCHAR2(100) := 'Error Occured';
	   v_message VARCHAR2(500);
	BEGIN
	   SELECT error_message, error_timestamp
	   INTO v_message, v_subject
	   FROM error_table
	   WHERE error_id = :job;
	   
	   utl_mail.send(
		  sender => v_from,
		  recipients => v_to,
		  subject => v_subject,
		  message => v_message
	   );
	END;
	/
	
This procedure retrieves the error message and timestamp from the error table based on the error_id and sends an email with the subject "Error Occured" and the error message as the body.
