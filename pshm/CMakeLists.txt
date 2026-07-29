# pshm/ - POSIX shared memory (need librt).
set(TLPI_LIBS rt)

foreach(p IN ITEMS pshm_create pshm_read pshm_write pshm_unlink)
    tlpi_add_program(${p})
endforeach()
