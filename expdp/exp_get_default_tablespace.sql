set linesize 100; 
col username for a20;
col default_tablespace for a20;

select t.username, t.default_tablespace from dba_users  t where t.username=upper('&1');
quit;