# seccomp/ - needs libseccomp for the high-level API demo; the rest use raw
# syscalls (<linux/seccomp.h>) and don't need libseccomp.
#
# seccomp_bench has no source; seccomp_logging.c and seccomp_trap_sigsys.c are
# not built by default; seccomp_multiarch is not part of the default build set.
foreach(p IN ITEMS dump_seccomp_filter seccomp_arg64 seccomp_control_open
               seccomp_deny_open seccomp_launch seccomp_perf
               seccomp_user_notification)
    tlpi_add_program(${p})
endforeach()

# libseccomp_demo needs the libseccomp development headers and library.
find_path(SECCOMP_INCLUDE_DIR NAMES seccomp.h)
find_library(SECCOMP_LIBRARY NAMES seccomp)
if(SECCOMP_INCLUDE_DIR AND SECCOMP_LIBRARY)
    tlpi_add_program(libseccomp_demo libseccomp_demo.c)
    target_include_directories(${TLPI_LAST_TARGET} PRIVATE ${SECCOMP_INCLUDE_DIR})
    target_link_libraries(${TLPI_LAST_TARGET} ${SECCOMP_LIBRARY})
else()
    message(STATUS "libseccomp development files not found; skipping libseccomp_demo")
endif()
