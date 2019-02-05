-- create tablespace and respective datafiles
define tablespace_name=&1
define datafile_path=&2
define datafile_size=&3
create BIGFILE  tablespace &tablespace_name datafile '&datafile_path' size &datafile_size AUTOEXTEND ON NEXT 1G;
quit;