# files/ - file_perms.c is a library helper, not built here.
foreach(p IN ITEMS t_chown t_stat t_umask t_utime t_utimes chiflag)
    tlpi_add_program(${p})
endforeach()
