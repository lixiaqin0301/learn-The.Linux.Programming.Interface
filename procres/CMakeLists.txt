# procres/ - print_rlimit.c and print_rusage.c are library helpers, not built here.
foreach(p IN ITEMS rusage rusage_wait rlimit_nproc)
    tlpi_add_program(${p})
endforeach()
