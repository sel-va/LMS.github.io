CREATE DATABASE LINK link_name
CONNECT TO username
IDENTIFIED BY password
USING 'database_alias';

	Database_alias - the alias name for the remote database as defined in the tnsnames.ora file on the local database server

	Locate the tnsnames.ora file on the local database server. The file is typically located in the $ORACLE_HOME/network/admin directory.

SELECT * FROM <schema_name>.<table_name>@<database_link_name>;

tnsping <alias_name>

