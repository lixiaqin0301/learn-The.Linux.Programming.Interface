# sysinfo/
foreach(p IN ITEMS t_uname procfs_pidmax procfs_user_exe)
    tlpi_add_program(${p})
endforeach()
