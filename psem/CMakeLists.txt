# psem/ - POSIX semaphores (need the NPTL thread library).
set(TLPI_LIBS Threads::Threads)

foreach(p IN ITEMS psem_getvalue psem_create psem_post psem_unlink
               psem_trywait psem_wait thread_incr_psem)
    tlpi_add_program(${p})
endforeach()

# psem_timedwait uses clock_gettime() which is in librt.
tlpi_add_program(psem_timedwait psem_timedwait.c)
target_link_libraries(${TLPI_LAST_TARGET} rt)
