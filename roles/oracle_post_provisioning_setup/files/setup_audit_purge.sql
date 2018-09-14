set echo on timing on

--PROCEDURE to purge audit data

create or replace procedure purge_audit_trail (days in number) as
  purge_date date;
begin
  purge_date := trunc(sysdate-days);
  dbms_system.ksdwrt(2,'AUDIT: Purging Audit Trail until ' || purge_date || ' started');
  delete from aud$ where ntimestamp# < purge_date;
  commit;
  dbms_system.ksdwrt(2,'AUDIT: Purging Audit Trail until ' || purge_date || ' has completed');
end;
/

-- Schedule a job which runs the purge_audit_trail procedure 
BEGIN
  sys.dbms_scheduler.create_job(
    job_name => 'AUDIT_PURGE',
    job_type => 'PLSQL_BLOCK',
    job_action => 'begin purge_audit_trail(7); end;',
    schedule_name => 'MAINTENANCE_WINDOW_GROUP',
    job_class => '"DEFAULT_JOB_CLASS"',
    comments => 'Audit Trail Purge',
    auto_drop => FALSE,
    enabled => TRUE);
END;
/


