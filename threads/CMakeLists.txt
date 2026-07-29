# threads/ - POSIX threads.
set(TLPI_LIBS Threads::Threads)

foreach(p IN ITEMS detached_attrib one_time_init prod_condvar prod_no_condvar
               pthread_barrier_demo simple_thread thread_cancel thread_cleanup
               thread_incr thread_incr_mutex thread_incr_rwlock
               thread_incr_spinlock thread_lock_speed thread_multijoin)
    tlpi_add_program(${p})
endforeach()

# strerror_test + three variants: each links strerror_test.c with a different
# strerror implementation. The strerror*.c files are not standalone programs.
tlpi_add_program(strerror_test strerror_test.c strerror.c)
tlpi_add_program(strerror_test_tsd strerror_test.c strerror_tsd.c)
tlpi_add_program(strerror_test_tls strerror_test.c strerror_tls.c)
