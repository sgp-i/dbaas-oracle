Rem NAME
Rem postprovstalone.sql
Rem Post provision DB install standalone
Rem kamos created 8/7/2018
set termout on
prompt Modifys tablespace sizes to Standard 
alter database datafile 1  autoextend on maxsize 5G;
alter database datafile 3 autoextend on maxsize 10G;
alter database tempfile 1 autoextend on maxsize 10G;
alter database datafile 4 autoextend on maxsize unlimited;
select file_name, autoextensible, bytes/1024/1024/1024, maxbytes/1024/1024/1024 from dba_data_files order by file_id;
prompt Enable Database Archiving
shutdown immediate;
startup nomount;
alter database archivelog;
alter database open;
prompt Setting up AUDIT_PURGE job
@/u01/app/oracle/admin/scripts/setup_audit_purge.sql
prompt Setting up Password Functions and Profiles
@/u01/app/oracle/admin/scripts/Password_Verification_function.sql
prompt Change default password expire to unlimited
ALTER PROFILE "DEFAULT" LIMIT PASSWORD_LIFE_TIME UNLIMITED;
prompt Create Standard Profiles USER/APP
CREATE PROFILE USER_ACCOUNT_PROFILE
LIMIT
PASSWORD_GRACE_TIME 7
PASSWORD_LIFE_TIME 90
PASSWORD_REUSE_TIME 360
PASSWORD_REUSE_MAX UNLIMITED
FAILED_LOGIN_ATTEMPTS 7
PASSWORD_LOCK_TIME UNLIMITED
PASSWORD_VERIFY_FUNCTION F_PWD_VERIFY_COMPLEXITY; 
CREATE PROFILE APP_ACCOUNT_PROFILE
LIMIT
PASSWORD_LIFE_TIME UNLIMITED
PASSWORD_GRACE_TIME 7
PASSWORD_REUSE_MAX UNLIMITED
FAILED_LOGIN_ATTEMPTS 10
PASSWORD_LOCK_TIME 1
PASSWORD_VERIFY_FUNCTION F_PWD_VERIFY_COMPLEXITY;
prompt Set DB_FILES 
show parameter db_files;
Alter system set db_files=1000 scope=spfile sid='*';
shutdown immediate;
startup;
prompt Setting Snapshot interval
execute dbms_workload_repository.modify_snapshot_settings (interval => 15,retention => 11520);
select
extract( day from snap_interval) *24*60+
extract( hour from snap_interval) *60+
extract( minute from snap_interval ) "Snapshot Interval",
extract( day from retention) *24*60+
extract( hour from retention) *60+
extract( minute from retention ) "Retention Interval"
from dba_hist_wr_control;
Alter system set parallel_force_local=TRUE scope=both sid='*';
prompt Recycle Bin on
select name, value from v$parameter where name like '%recyclebin%';
alter system set recyclebin=ON DEFERRED;;
prompt Enabling Block change tracking
alter database enable block change tracking using file '+RECO DG';
exit
EOF

