# svsem/
# Helpers not built here: binary_sems.c, event_flags.c (in libtlpi);
# svsem_bad_init.c and svsem_good_init.c are alternative examples not built
# by default.
foreach(p IN ITEMS svsem_create svsem_demo svsem_mon svsem_op svsem_rm
               svsem_setall svsem_info)
    tlpi_add_program(${p})
endforeach()
