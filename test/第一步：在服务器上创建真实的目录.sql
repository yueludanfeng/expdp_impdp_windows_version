第一步：在服务器上创建真实的目录
E:/oracle/test001

第二步：用sys管理员登录sqlplus
sqlplus / as sysdba

第三步：创建逻辑目录
create directory dmp_dir as 'E:/oracle/test001';

第四步：用sys管理员给你的指定用户赋予在该目录的操作权限
grant read , write on directory dmp_dir to test001;

第五步：用expdp导出dmp
# 按照schemas用户导出
expdp user_name/passwd@orcl schemas=user dumpfile=test001.dmp directory=dmp_dir logfile=test001.log

create user test001 identified by test001;
grant dba to test001;
create table test(id int, name varchar2(100));
create or replace procedure generate_data( tablename IN varchar2, scale IN int)
as
id number:=i;
val varchar2(100):='';
begin
for i in 1..scale
loop
	val:='hello'||i;
	execute immediate 'insert into '|| tablename || 'values(:val1,:val2);' using i,val;
end loop;
end;

begin
execute generate_data('test', 100000);
end;



 select default_tablespace from dba_users where username='TEST001';
 
declare
id int:=0;
val varchar2(10):='';
 begin
 for i in 1..100000
 loop
 	execute immediate 'insert into test values(:val1,:val2)' using id,val;
 end loop;
 end;



select count(*) from test;
create table test1 as select * from test;
create table test2 as select * from test;
create table test3 as select * from test;
create table test4 as select * from test;
create table test5 as select * from test;
create table test6 as select * from test;
create table test7 as select * from test;
create table test8 as select * from test;
create table test9 as select * from test;





  SELECT Upper(F.TABLESPACE_NAME)         "表空间名",
       D.TOT_GROOTTE_MB                 "表空间大小(M)",
       D.TOT_GROOTTE_MB - F.TOTAL_BYTES "已使用空间(M)",
       To_char(Round(( D.TOT_GROOTTE_MB - F.TOTAL_BYTES ) / D.TOT_GROOTTE_MB * 100, 2), '990.99')
       || '%'                           "使用比",
       F.TOTAL_BYTES                    "空闲空间(M)",
       F.MAX_BYTES                      "最大块(M)"
FROM   (SELECT TABLESPACE_NAME,
               Round(Sum(BYTES) / ( 1024 * 1024 ), 2) TOTAL_BYTES,
               Round(Max(BYTES) / ( 1024 * 1024 ), 2) MAX_BYTES
        FROM   SYS.DBA_FREE_SPACE
        GROUP  BY TABLESPACE_NAME) F,
       (SELECT DD.TABLESPACE_NAME,
               Round(Sum(DD.BYTES) / ( 1024 * 1024 ), 2) TOT_GROOTTE_MB
        FROM   SYS.DBA_DATA_FILES DD
        GROUP  BY DD.TABLESPACE_NAME) D
WHERE  D.TABLESPACE_NAME = F.TABLESPACE_NAME


grant dba to test001;

create directory dmp_dir as 'E:/oracle/test001';
grant read , write on directory dmp_dir to test001;
expdp test001/test001  schmeas=test001  dumpfile=test001.dmp directory=dmp_dir logfile=test001.log


expdp user_name/passwd@orcl schemas=user dumpfile=test001.dmp directory=dmp_dir logfile=test001.log
