# users_groups/ - ugid_functions.c is a library helper, not built here.
# idshow has no source in this directory (proccred/idshow.c is the real one).

foreach(p IN ITEMS t_getpwent t_getpwnam_r)
    tlpi_add_program(${p})
endforeach()

# check_password needs libcrypt.
tlpi_add_program(check_password check_password.c)
target_link_libraries(${TLPI_LAST_TARGET} crypt)
