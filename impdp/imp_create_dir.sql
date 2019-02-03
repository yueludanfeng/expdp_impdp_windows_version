-- get input params 
define user_name=&1
define user_password=&2
define dump_dir_path=&3
define tablespace_name=&4

-- create user and grant privileges to it 
create user &user_name identified by &user_password default tablespace &tablespace_name ;
grant connect, resource to &user_name;

-- create logical directory for user
create or replace directory dmp_dir as '&dump_dir_path';
grant read , write on directory dmp_dir to &user_name;
quit;
