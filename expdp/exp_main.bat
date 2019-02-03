@echo off
rem '------------make sure the num of  param is correct--------'
set /a num=0
set /a num_of_params=4
for %%a in (%*) do set /a num+=1
if %num% neq %num_of_params% (
	echo 'please input %num_of_params% three args as follows: username, userpasswd, dmp_dir_path size_per_file'
	echo 'eg:  exp_main.bat test001 test001 E:/oracle/test001 5M'
	goto :eof
)

rem '---------get input params--------'
set user_name=%1%
set user_password=%2%
set data_dmp_dir=%3%
set size_of_perfile=%4%

rem '----------create logical directory-------'
sqlplus / as sysdba @exp_create_dir.sql %user_name% %data_dmp_dir%

rem '--------expdp data of schema--------'
expdp %user_name%/%user_password%  schemas=%user_name%  dumpfile=%user_name%_%%U.dmp directory=dmp_dir logfile=%user_name%.log  filesize=%size_of_perfile%
