spool pre_check_profile.lst
set head off
set feedback on
select distinct profile from dba_profiles where profile = 'APP_ACCOUNT_PROFILE' or profile = 'USER_ACCOUNT_PROFILE';
Spool off
