alter profile "DEFAULT" limit password_life_time unlimited;
CREATE PROFILE USER_ACCOUNT_PROFILE LIMIT PASSWORD_GRACE_TIME 7 PASSWORD_LIFE_TIME 90 PASSWORD_REUSE_TIME 360 PASSWORD_REUSE_MAX UNLIMITED FAILED_LOGIN_ATTEMPTS 7 PASSWORD_LOCK_TIME UNLIMITED ;
CREATE PROFILE APP_ACCOUNT_PROFILE LIMIT PASSWORD_LIFE_TIME UNLIMITED PASSWORD_GRACE_TIME 7 PASSWORD_REUSE_MAX UNLIMITED FAILED_LOGIN_ATTEMPTS 10 PASSWORD_LOCK_TIME 1 ;
