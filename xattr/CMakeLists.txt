# xattr/
foreach(p IN ITEMS t_setxattr xattr_view)
    tlpi_add_program(${p})
endforeach()
