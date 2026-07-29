# vdso/ - both programs are built from the same gettimeofday.c source.
tlpi_add_program(vdso_gettimeofday gettimeofday.c)

tlpi_add_program(syscall_gettimeofday gettimeofday.c)
target_compile_definitions(${TLPI_LAST_TARGET} PRIVATE USE_SYSCALL)
