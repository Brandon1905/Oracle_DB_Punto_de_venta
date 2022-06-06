-- Create the user 
create user PV
  default tablespace USERS
  temporary tablespace TEMP
  profile DEFAULT
  password expire;
-- Grant/Revoke object privileges 
grant select on SYS.DBA_DATA_FILES to PV;
grant select on SYS.DBA_FREE_SPACE to PV;
grant select on SYS.DBA_INDEXES to PV;
grant select on SYS.DBA_OBJECTS to PV;
grant execute on SYS.DBMS_CRYPTO to PV;
grant execute, debug on SYS.UTL_SMTP to PV;
-- Grant/Revoke role privileges 
grant connect to PV with admin option;
grant dba to PV with admin option;
grant exp_full_database to PV with admin option;
grant imp_full_database to PV with admin option;
grant resource to PV with admin option;
-- Grant/Revoke system privileges 
grant alter session to PV with admin option;
grant create procedure to PV with admin option;
grant create sequence to PV with admin option;
grant create session to PV with admin option;
grant create synonym to PV with admin option;
grant create table to PV with admin option;
grant create trigger to PV with admin option;
grant create type to PV with admin option;
grant create view to PV with admin option;
grant import full database to PV with admin option;
grant unlimited tablespace to PV with admin option;
