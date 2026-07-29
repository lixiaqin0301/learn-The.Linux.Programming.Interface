# pipes/
foreach(p IN ITEMS change_case fifo_seqnum_client fifo_seqnum_server
               pipe_ls_wc pipe_sync popen_glob simple_pipe)
    tlpi_add_program(${p})
endforeach()
