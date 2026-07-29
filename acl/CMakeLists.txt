# acl/ - programs using POSIX ACLs (need libacl).
set(TLPI_LIBS acl)

tlpi_add_program(acl_update)
tlpi_add_program(acl_view)
