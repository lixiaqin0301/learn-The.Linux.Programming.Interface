# procexec/ - process creation and exec.
# Helpers not built here: execlp.c, print_wait_status.c, simple_system.c,
# system.c (print_wait_status is provided by libtlpi).

foreach(p IN ITEMS acct_on acct_view child_status closeonexec envargs
               exit_handlers footprint fork_file_sharing fork_sig_sync
               fork_stdio_buf fork_whos_on_first make_zombie multi_SIGCHLD
               multi_wait necho orphan t_execl t_execle t_execlp t_execve
               t_fork t_system t_vfork vfork_fd_test
               demo_clone t_clone acct_v3_view)
    tlpi_add_program(${p})
endforeach()

# pdeath_signal uses POSIX threads.
tlpi_add_program(pdeath_signal pdeath_signal.c)
target_link_libraries(${TLPI_LAST_TARGET} Threads::Threads)
