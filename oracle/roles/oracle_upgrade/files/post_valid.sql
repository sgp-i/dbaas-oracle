Rem NAME
Rem post_valid.sql
Rem This performs post validations after database upgrade
Rem checks that components status are in valid state and database
Rem version is 12.1.0.2
Rem Modified
Rem kamos created 8/1/2018
Rem --run utlrp.sql script after upgrade to identify
Rem --check for invalid objects
set termout on
  select object_name, object_type, status from dba_objects where status='INVALID';
@/u01/app/oracle/product/12.1.0.2/db_1/rdbms/admin/utlrp.sql
Rem--check to verify all objects recompiled
prompt  CHECKING COMPONENTS----DATABASE REGISTRY
Rem select object_name, object_type, status from dba_objects where status='INVALID';
@$HOME/checkcomp.sql
exit
EOF
