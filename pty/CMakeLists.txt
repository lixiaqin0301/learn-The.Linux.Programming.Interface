# pty/ - pty_fork.c, pty_master_open.c, pty_master_open_bsd.c are library
# helpers (provided by libtlpi), not built here.
foreach(p IN ITEMS script unbuffer)
    tlpi_add_program(${p})
endforeach()
