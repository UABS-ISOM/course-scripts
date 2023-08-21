# SQL Server scripts for teaching courses

## Overview
Typical set up for a course involves creating logins, databases, and permissions for each student in the course. The scripts' numbering reflects the sequence of steps to perform. Most scripts expect student usernames (UPIs) to exist in a SQL Server database and table called `xxxAdmin.dbo.Student`

## Known SQL Server instances for teaching
1. isomdatabasep01\infosys330
	- SSAS and SSRS enabled
1. isomdatabasep01\infomgmt393
	- Instance to be renamed to busan302 if it's to be used in future
	- SSAS and SSRS enabled
2. isomdatabasep01\infosys320
	- SSAS and SSRS enabled
	- Unused since 2015
3. isomdatabasep01\infosys722
	- SSAS enabled
	- Unused since 2017

## Script description
Scripts suffixed with `-gen.sql` indicate the script will generate SQL commands, i.e. the output of the script is plaintext SQL to the output window in SSMS. Copy and paste the output to a new query window to excecute the commands. At the beginning of semester, follow steps 0-5.1 (skipping 3.2). Ensure tutor/staff list is complete, students can be added/dropped using the toAdd/toRemove tables.

Script name | Description
------------ | -------------
0-create logins from windows-gen.sql | Creates logins from the UOA Windows domain for Windows Authentication. [CREATE LOGIN](https://docs.microsoft.com/en-us/sql/t-sql/statements/create-login-transact-sql) also grants users permission to log onto the server.
[1-create blank database-gen.sql](#1-create-blank-database-gensql) | Creates new databases. The `@DataPath` and `@LogPath` refer to locations on the server (probably isomdatabasep01).
2-restore from .bak to blank database-gen.sql | Restores the AWLT2008R2 .bak file onto each student's database. Paths refer to locations on the server (probably isomdatabasep01).
3.1-grant access-gen.sql | Sets `sa` and users as dbowners. [sp_addrolemember](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-addrolemember-transact-sql) also creates a user object for the login if it doesn't already exist.
3.2-revoke access-gen.sql | Revokes user access to databases using [sp_dropuser](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-dropuser-transact-sql).
4-grant access to staff-gen.sql | Grants staff db_ddladmin, db_datawriter, and db_datareader roles on student databases.
5.1-grant read-only access-gen.sql | Grants users the db_datareader role on various databases.
5.2-revoke read-only access-gen.sql | Revokes the db_datareader role for all users on a single database.
99.1-take databases offline-gen.sql |
99.2-detach databases-gen.sql |
99.3-drop databases-gen.sql |
99.4-drop logins-gen.sql |
SSAS.delete-gen.dmx | DMX query to generate the body to use in `SSAS.drop batch.xmla`. Run this on the SSAS instance containing deployments to delete.
SSAS.drop batch.xmla | XMLA command to delete the deployments listed between `<Batch>` and `</Batch>`. Run this on the SSAS instance containing deployments to delete.
#### Notes for 1-create blank database-gen.sql
...
