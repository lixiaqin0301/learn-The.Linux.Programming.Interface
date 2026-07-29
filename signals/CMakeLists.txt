# signals/
# Helpers not built here: signal.c, signal_functions.c, siginterrupt.c
# (provided by libtlpi / not in the build set).

foreach(p IN ITEMS catch_rtsigs demo_SIGFPE ignore_pending_sig sig_sender
               sig_speed_sigsuspend sigmask_longjmp t_kill t_sigaltstack
               t_sigsuspend t_sigqueue t_sigwaitinfo signalfd_sigval)
    tlpi_add_program(${p})
endforeach()

# These programs use signal(); define _BSD_SOURCE to get reliable BSD semantics.
tlpi_add_program(ouch ouch.c)
target_compile_definitions(${TLPI_LAST_TARGET} PRIVATE _BSD_SOURCE)

tlpi_add_program(intquit intquit.c)
target_compile_definitions(${TLPI_LAST_TARGET} PRIVATE _BSD_SOURCE)

tlpi_add_program(sig_receiver sig_receiver.c)
target_compile_definitions(${TLPI_LAST_TARGET} PRIVATE _BSD_SOURCE)

# nonreentrant needs libcrypt.
tlpi_add_program(nonreentrant nonreentrant.c)
target_link_libraries(${TLPI_LAST_TARGET} crypt)

# sigmask_siglongjmp is compiled from sigmask_longjmp.c with -DUSE_SIGSETJMP.
tlpi_add_program(sigmask_siglongjmp sigmask_longjmp.c)
target_compile_definitions(${TLPI_LAST_TARGET} PRIVATE USE_SIGSETJMP)
