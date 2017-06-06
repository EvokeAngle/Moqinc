spool log.log

drop user devon cascade;

---drop tablespace devontblspc including contents and datafiles;

---create tablespace devontblspc datafile 'd:\devontblspc.dbf' size 50m;

create user devon identified by devon;

grant connect,resource,dba to devon;

connect devon/devon;

@@createtable.sql;

spool off;