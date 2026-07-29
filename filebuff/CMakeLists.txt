# filebuff/ - file buffering; several write_bytes variants share one source.

foreach(p IN ITEMS copy mix23_linebuff mix23io direct_read)
    tlpi_add_program(${p})
endforeach()

# write_bytes plus three variants compiled from the same write_bytes.c with
# different feature-test macros.
tlpi_add_program(write_bytes)

tlpi_add_program(write_bytes_fdatasync write_bytes.c)
target_compile_definitions(${TLPI_LAST_TARGET} PRIVATE USE_FDATASYNC)

tlpi_add_program(write_bytes_fsync write_bytes.c)
target_compile_definitions(${TLPI_LAST_TARGET} PRIVATE USE_FSYNC)

tlpi_add_program(write_bytes_o_sync write_bytes.c)
target_compile_definitions(${TLPI_LAST_TARGET} PRIVATE USE_O_SYNC)
