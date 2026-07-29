# procpri/ - process scheduling. (librt is not needed here.)
foreach(p IN ITEMS sched_set sched_view t_setpriority demo_sched_fifo
               t_sched_setaffinity t_sched_getaffinity)
    tlpi_add_program(${p})
endforeach()
