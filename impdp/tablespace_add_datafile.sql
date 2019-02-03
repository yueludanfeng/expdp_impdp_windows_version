-- alter tablespace add datafiles
define tablespace_name=&1
define datafile_path=&2
alter tablespace &tablespace_name add  datafile '&datafile_path' size 20M autoextend on next 5m;
quit;