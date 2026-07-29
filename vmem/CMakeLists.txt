# vmem/
foreach(p IN ITEMS memlock madvise_dontneed t_mprotect)
    tlpi_add_program(${p})
endforeach()
