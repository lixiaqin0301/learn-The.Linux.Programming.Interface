# pmsg/ - POSIX message queues (need librt for mq_* functions).
set(TLPI_LIBS rt)

foreach(p IN ITEMS mq_notify_sig mq_notify_sigwaitinfo mq_notify_thread)
    tlpi_add_program(${p})
endforeach()
