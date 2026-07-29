# time/ - curr_time.c is a library helper, not built here.
# cal_time and process_time_test have no sources and are not built.
foreach(p IN ITEMS calendar_time show_time process_time strtime t_stime)
    tlpi_add_program(${p})
endforeach()
