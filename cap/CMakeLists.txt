# cap/ - Linux capabilities (need libcap; some programs need libcrypt).
set(TLPI_LIBS cap crypt)

# view_cap_xattr is deliberately excluded (needs a fairly recent kernel, >=4.14).
foreach(p IN ITEMS cap_launcher cap_text check_password_caps demo_file_caps
               t_cap_get_file t_cap_get_pid t_cap_set_file)
    tlpi_add_program(${p})
endforeach()
