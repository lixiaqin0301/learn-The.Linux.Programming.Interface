# inotify/
foreach(p IN ITEMS demo_inotify dnotify inotify_dtree rand_dtree)
    tlpi_add_program(${p})
endforeach()
