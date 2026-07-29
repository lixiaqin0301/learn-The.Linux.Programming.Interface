# pgsjc/
foreach(p IN ITEMS catch_SIGHUP disc_SIGHUP job_mon orphaned_pgrp_SIGHUP
               handling_SIGTSTP t_setsid)
    tlpi_add_program(${p})
endforeach()
