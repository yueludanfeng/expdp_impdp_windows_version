-- get input params 
define user_name=&1
define user_password=&2
define imp_dir_path=&3
define tablespace_name=&4

alter database default tablespace &tablespace_name;
-- create user and grant privileges to it 
create user &user_name identified by &user_password;

grant connect, resource to &user_name ;

alter user &user_name quota unlimited on &tablespace_name ;

-- create logical directory for user
create or replace directory imp_dir as '&imp_dir_path' ;

grant read , write on directory imp_dir to &user_name ;

quit;
