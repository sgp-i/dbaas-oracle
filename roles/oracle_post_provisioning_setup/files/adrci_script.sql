spool adrci_script.log
set echo on

show homes

#Give the ASM instance name i.e. +ASM1, +ASM2 , +ASM3 .......
set homepath diag/asm/+asm/+ASM2

show control

#change the retention policy (SHORTP_POLICY - 168 hours and LONGP_POLICY = 31 days) for all the trace files.REFER - DOC ID 1283137.1
set control (SHORTP_POLICY=168)
set control (LONGP_POLICY=744)

#-- Make sure the values are set as above.
show control

#-- Here kstllorad04 is server_name.Replace this with the server name that you want to configure
set homepath diag/tnslsnr/kstllorad04/listener_scan1

show control

#-- change the retention policy for all the trace files.REFER - DOC ID 1283137.1
set control (SHORTP_POLICY=168)
set control (LONGP_POLICY=744)

#-- Make sure the values are set as above.
show control

set homepath diag/tnslsnr/kstllorad04/listener_scan2

show control

#-- change the retention policy for all the trace files.REFER - DOC ID 1283137.1
set control (SHORTP_POLICY=168)
set control (LONGP_POLICY=744)

#-- Make sure the values are set as above.
show control

set homepath diag/tnslsnr/kstllorad04/listener_scan3

show control

#-- change the retention policy for all the trace files.REFER - DOC ID 1283137.1
set control (SHORTP_POLICY=168)
set control (LONGP_POLICY=744)

#-- Make sure the values are set as above.
show control

set homepath diag/tnslsnr/kstllorad04/listener

show control

#-- change the retention policy for all the trace files.REFER - DOC ID 1283137.1
set control (SHORTP_POLICY=168)
set control (LONGP_POLICY=744)

#-- Make sure the values are set as above.
show control

#-- Here rehl11g is a dbname and GNT01D_1 is instance_name.Replace these with the database names that you want to change the settings.
set homepath diag/rdbms/gnt01d/gnt01d_1

show control

#-- change the retention policy for all the trace files.REFER - DOC ID 1283137.1
set control (SHORTP_POLICY=168)
set control (LONGP_POLICY=744)

#-- Make sure the values are set as above.
show control
