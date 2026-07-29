# daemons/ - become_daemon.c is provided by the library (libtlpi), not built here.
foreach(p IN ITEMS daemon_SIGHUP t_syslog test_become_daemon)
    tlpi_add_program(${p})
endforeach()
