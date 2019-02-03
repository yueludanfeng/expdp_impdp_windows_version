rem @echo off
rem 'get filesize of dmp file 上取整'

set user_name=%1%
set user_password=%2%
set data_dir_path=%3%
set filesize_of_dmp=%4%
set tablespace_name=%5%

echo %tablespace_name%
rem '----------get db_block_size----------'
sqlplus -S / as sysdba @get_db_blocksize.sql > res_db_blocksize.txt
set db_blocksize=0
for /f "tokens=3" %%i in (res_db_blocksize.txt) do set db_blocksize=%%i
echo %db_blocksize%

rem 'get max value of datafile such as 32 G''
set /a datafile_size = %db_blocksize% / 256

rem 'get num of additional datafiles'
set /a num_of_addtional_datafiles= %filesize_of_dmp% / %datafile_size% + 1
echo %num_of_addtional_datafiles%

sqlplus -S  / as sysdba @get_datafile.sql >  res_of_datafile.txt
set datafile=''
set prefix_data_file=''
for /f "tokens=2" %%i in (res_of_datafile.txt) do set datafile=%%i
rem del /a /f /q res_of_datafile.txt
set  prefix_data_file=%datafile:SYSTEM01.DBF=%

echo %datafile%
echo %prefix_data_file%
rem E:\APP\LIXINMING\ORADATA\ORCL\

rem sqlplus -S / as sysdba @first_create_tablespace.sql
rem echo %prefix_data_file%%tablespace_name%0.DBF
sqlplus -S / as sysdba @first_create_tablespace.sql %tablespace_name% %prefix_data_file%%tablespace_name%0.DBF
if %num_of_addtional_datafiles% GTR 1 (
	set num_of_add_datafiles=%num_of_addtional_datafiles% -1
	rem sqlplus -S / as sysdba @tablespace_add_datafile.sql
	rem for /l %%i in (1,1,%num_of_add_datafiles%) do echo %prefix_data_file%%tablespace_name%%%i.DBF
	for /l %%i in (1,1,%num_of_add_datafiles%) do sqlplus -S / as sysdba @tablespace_add_datafile.sql %tablespace_name% %prefix_data_file%%tablespace_name%%%i.DBF

)

sqlplus -S / as sysdba @imp_create_dir.sql  %user_name% %user_password% %data_dir_path% %tablespace_name%
impdp %user_name%/%user_password% DIRECTORY=%data_dir_path% DUMPFILE=%user_name%_%%U.dmp SCHEMAS=%user_name% log=%user_name%.log
