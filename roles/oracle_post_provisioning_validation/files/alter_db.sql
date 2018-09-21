-- alter recyclebin to turn ON
alter system set recyclebin=ON scope=both sid='*';  

-- alter parallel_force_local to TRUE
alter system set parallel_force_local=true scope=both sid='*';

-- alter db_files to set to 1000
alter system set db_files=1000 scope=spfile sid='*';

-- restart instance for values to take effect 
-- shutdown immediate;
-- startup;
exit;