-- create tablespace and respective datafiles
define tablespace_name=&1
define datafile_path=&2
create tablespace &tablespace_name datafile '&datafile_path' size 20M autoextend on next 5m;
quit;