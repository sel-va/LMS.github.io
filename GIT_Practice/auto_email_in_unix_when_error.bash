#!/bin/bash

# Define recipient email address
email_to="arun@gmail.com"

# Define sender email address
email_from="noreply@example.com"

# Define email subject
subject="Automated Email"

# Define email message
message="This is an automated email sent from a Unix shell script."

# Use the mail command to send the email
echo "$message" | mail -s "$subject" -r "$email_from" "$email_to"


#Unix shell script that sends an email when an error is inserted into an error log table 
-----------------------------------------------------------------------------------------
#!/bin/bash

# Connect to the database and check for new errors
errors=$(sqlplus -s user/password@db << EOF
  set heading off
  set feedback off
  set pagesize 0
  select count(*) from error_log where sent_flag = 'N';
  exit;
EOF
)

# If there are new errors, send an email
if [ $errors -gt 0 ]
then
  echo "Errors found in error log table. Sending email."
  echo "There are $errors new errors in the error log table." | mail -s "Error Log Report" arun@gmail.com
  # Update the sent_flag for the errors
  sqlplus -s user/password@db << EOF
    update error_log set sent_flag = 'Y' where sent_flag = 'N';
    commit;
    exit;
EOF
else
  echo "No new errors found in error log table."
fi
