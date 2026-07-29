# cgroups/
tlpi_add_program(fork_bomb)

# alloc_mem uses POSIX threads.
tlpi_add_program(alloc_mem alloc_mem.c)
target_link_libraries(${TLPI_LAST_TARGET} Threads::Threads)
