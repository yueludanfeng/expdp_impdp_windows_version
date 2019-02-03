set heading off;
set linesize 200;
col tablespace_name for a20;
col file_name for a150;
SELECT  tablespace_name, file_name FROM DBA_DATA_FILES where tablespace_name ='SYSTEM';
quit;