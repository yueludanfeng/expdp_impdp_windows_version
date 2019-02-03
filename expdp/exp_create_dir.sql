define dump_dir_path=&2
create or replace directory dmp_dir as '&dump_dir_path';
grant read , write on directory dmp_dir to &1;
quit;
