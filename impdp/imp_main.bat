@echo off

rem echo '------------make sure the num of  param is correct--------'
set /a num=0
set /a num_of_params=7
for %%a in (%*) do set num+=1
if %num% neq %num_of_params% (
	echo 'please input %num_of_params% seven args as follows: username, userpasswd, dmp_dir_path size_per_file local_tablespace_name source_user_name dumpfile_prefix'
	echo 'eg:  imp_main.bat test005 test005 E:/oracle/test005 5G test test004 TEST005_'
	goto :EOF
)

set user_name=%1%
set user_password=%2%
set data_dir_path=%3%
set filesize_of_dmp=%4%
set local_tablespace_name=%5%
set source_user_name=%6%
set dump_file_prefix=%7%

sqlplus -S  / as sysdba @get_datafile.sql >  res_of_datafile.txt
set datafile=''
set prefix_data_file=''
for /f "tokens=2" %%i in (res_of_datafile.txt) do set datafile=%%i

set  prefix_data_file=%datafile:SYSTEM01.DBF=%

echo %datafile%
echo %prefix_data_file%
rem E:\APP\LIXINMING\ORADATA\ORCL\
rem echo %prefix_data_file%%local_tablespace_name%0.DBF
sqlplus -S / as sysdba @first_create_tablespace.sql %local_tablespace_name% %prefix_data_file%%local_tablespace_name%0.DBF %filesize_of_dmp%


sqlplus -S / as sysdba @imp_create_dir.sql  %user_name% %user_password% %data_dir_path% %local_tablespace_name%
impdp %user_name%/%user_password% DIRECTORY=imp_dir DUMPFILE=%dump_file_prefix%%%U.dmp  logfile=%user_name%.log remap_schema=%source_user_name%:%user_name% 
rem remap_tablespace=users:test

del /a /f /q *.txt
