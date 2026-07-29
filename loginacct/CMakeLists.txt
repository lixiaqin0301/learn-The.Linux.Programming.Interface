# loginacct/
foreach(p IN ITEMS dump_utmpx utmpx_login view_lastlog)
    tlpi_add_program(${p})
endforeach()
