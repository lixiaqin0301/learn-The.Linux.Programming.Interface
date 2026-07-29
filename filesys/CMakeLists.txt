# filesys/
foreach(p IN ITEMS t_statvfs t_statfs t_mount t_umount)
    tlpi_add_program(${p})
endforeach()
