-- create tablespace and respective datafiles
create tablespace &tablespace_name datafile 'e:\oracle\oradata\test\data_1.dbf' size 2000M;

-- create tablespace and respective datafiles
alter tablespace &tablespace_name add datafile 'e:\oracle\oradata\test\data_1.dbf' size 2000M;

DROP TABLESPACE test INCLUDING CONTENTS AND DATAFILES;

在导入之前，需要将文件重命名为test002_01.dmp
imp_main.bat test002 test002 E:/oracle/test002	 65  test remap_schema=test001:test002 remap_tablespace=users:test


sqlplus / as sysdba;
DROP USER test001 cascade;
create user test001 identified by test001;
grant connect,resource to test001;
create or replace directory imp_dir as 'E:/oracle/test001';
grant read, write on directory imp_dir to test001;
quit;
impdp test001/test001 directory=imp_dir schemas=test001 logfile=test001.log dumpfile=test001_%U.dmp 



create user test004 identified by test004;
grant resource, connect to test004;
create or replace directory dmp_test004_dir as 'E:/oracle/test004';

grant read, write on directory dmp_test004_dir to test004;


create table test(id int, name varchar2(100));

create or replace procedure generate_data( tablename IN varchar2, scale IN int)
as
       val varchar2(100):='';
begin
for i in 1..scale
loop
  val:='hello'||i;
  execute immediate 'insert into '|| tablename ||' (id,name) values(:2,:3)' using  i, val;
end loop;
commit;
end;

begin
  -- Call the procedure
  generate_data(tablename => 'test',
                scale => 100000);
end;


create table test1 as select * from test;
create table test2 as select * from test;
create table test3 as select * from test;
create table test4 as select * from test;
create table test5 as select * from test;
create table test6 as select * from test;
create table test7 as select * from test;
create table test8 as select * from test;
create table test9 as select * from test;


select * from  user_users;


expdp test004/test004 schemas=test004 directory=dmp_test004_dir dumpfile=test004_%U.dmp logfile=test004.log filesize=5M 
expdp test004/test004 directory=dmp_test004_dir dumpfile=test004_%U.dmp logfile=test004.log filesize=5M 




create tablespace test datafile 'E:\APP\LIXINMING\ORADATA\ORCL\test1.DBF' size 20M autoextend on next 5m;
alter  tablespace test add  datafile 'E:\APP\LIXINMING\ORADATA\ORCL\test2.DBF' size 20M autoextend on next 5m;
--drop user test005 cascade;
create user test005 identified by test005;
grant resource, connect to test005;
create or replace directory dmp_test005_dir as 'E:/oracle/test005';
grant read, write on directory dmp_test005_dir to test005;
impdp test005/test005 directory=dmp_test005_dir dumpfile=test005_%U.dmp  logfile=test005.log  remap_schema=test:test005

impdp test005/test005 directory=dmp_test005_dir dumpfile=test005_%U.dmp  logfile=test005.log table_exists_action=truncate remap_schema=test004:test005 

impdp system/manager directory=dmp_test005_dir dumpfile=test005_%U.dmp  logfile=test005.log table_exists_action=truncate  remap_schema=test004:test006

