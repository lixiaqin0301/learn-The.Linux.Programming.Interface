# filelock/ - create_pid_file.c and region_locking.c are library helpers, not built here.
foreach(p IN ITEMS i_fcntl_locking t_flock)
    tlpi_add_program(${p})
endforeach()
