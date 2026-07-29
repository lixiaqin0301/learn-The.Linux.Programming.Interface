# tty/ - tty_functions.c and ttyname.c are helpers, not built here.
foreach(p IN ITEMS demo_SIGWINCH new_intr no_echo test_tty_functions)
    tlpi_add_program(${p})
endforeach()
