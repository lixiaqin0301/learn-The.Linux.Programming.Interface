# altio/ - alternate I/O multiplexing (select, poll, epoll, signal-driven).

foreach(p IN ITEMS demo_sigio poll_pipes select_mq self_pipe t_select
               epoll_flags_fork epoll_input)
    tlpi_add_program(${p})
endforeach()

# multithread_epoll_wait uses POSIX threads.
tlpi_add_program(multithread_epoll_wait multithread_epoll_wait.c)
target_link_libraries(${TLPI_LAST_TARGET} Threads::Threads)
