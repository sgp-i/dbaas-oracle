ALTER PROFILE "DEFAULT" LIMIT PASSWORD_LIFE_TIME UNLIMITED;

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


execute dbms_workload_repository.modify_snapshot_settings (interval => 15,retention => 11520);

select
extract( day from snap_interval) *24*60+
extract( hour from snap_interval) *60+
extract( minute from snap_interval ) "Snapshot Interval",
extract( day from retention) *24*60+
extract( hour from retention) *60+
extract( minute from retention ) "Retention Interval"
from dba_hist_wr_control;

