# proc/ - setjmp/longjmp, getenv, setjmp.
# setjmp_vars_opt has no source and is not built. mem_segments.c and setenv.c
# are helpers, not built here.
foreach(p IN ITEMS bad_longjmp display_env longjmp necho setjmp_vars t_getenv
               modify_env)
    tlpi_add_program(${p})
endforeach()
