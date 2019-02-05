-- get input params 
define user_name=&1
define user_password=&2
define tablespace_name=&3

-- create user and grant privileges to it 
create user &user_name identified by &user_password ;
--default tablespace &tablespace_name ;
grant connect, resource to &user_name;
quit;