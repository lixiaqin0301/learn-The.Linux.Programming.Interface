# syslim/
foreach(p IN ITEMS t_fpathconf t_sysconf)
    tlpi_add_program(${p})
endforeach()
