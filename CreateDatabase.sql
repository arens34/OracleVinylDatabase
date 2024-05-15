--To run this script, you have to run command prompt as administrator, navigate to the folder where
--this file is located, and enter these commands. Here are the steps:
--Open cmd as Administrator
--Copy your file location (mouse over address bar and copy paste), then enter it after a cd command
--sqlplus / as sysdba
-- @CreateDatabase.sql

--After running this, navigate to SQLDeveloper and log in using assignment2User, assignment2Password and your SID.

--Creates tablespace to store the tables
CREATE TABLESPACE assignment2
  DATAFILE 'assignment2.dat' SIZE 100M 
  ONLINE;

-- Create Users
CREATE USER assignment2User IDENTIFIED BY assignment2Password ACCOUNT UNLOCK
	DEFAULT TABLESPACE assignment2
	QUOTA 20M ON assignment2;

-- Create ROLES
CREATE ROLE assignment2Admin;

-- Grant PRIVILEGES
GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE TRIGGER, CREATE PROCEDURE TO assignment2Admin;

GRANT assignment2Admin TO assignment2User;

--Connect
CONNECT assignment2User/assignment2Password;