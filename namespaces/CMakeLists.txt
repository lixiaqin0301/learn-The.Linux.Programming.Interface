# namespaces/ - needs libcap. userns_functions.c is a library helper, not built here.
set(TLPI_LIBS cap)

foreach(p IN ITEMS orphan cred_launcher demo_userns demo_uts_namespaces
               hostname multi_pidns ns_capable ns_child_exec ns_exec ns_run
               pidns_init_sleep show_creds simple_init t_setns_userns unshare
               userns_child_exec userns_setns_test)
    tlpi_add_program(${p})
endforeach()
