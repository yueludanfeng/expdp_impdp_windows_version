-- alter tablespace add datafiles
define tablespace_name=&1
define datafile_path=&2
define datafile_size=&3
alter tablespace &tablespace_name add  datafile '&datafile_path' size &datafile_size ;
quit;