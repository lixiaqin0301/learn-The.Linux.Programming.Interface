# timers/ - need librt and pthreads; all programs are built with both.
set(TLPI_LIBS rt Threads::Threads)

# itimerspec_from_str.c is a library helper, not built here.
foreach(p IN ITEMS cpu_burner cpu_multi_burner cpu_multithread_burner
               ptmr_null_evp ptmr_sigev_signal ptmr_sigev_thread real_timer
               t_nanosleep timed_read demo_timerfd t_clock_nanosleep)
    tlpi_add_program(${p})
endforeach()
