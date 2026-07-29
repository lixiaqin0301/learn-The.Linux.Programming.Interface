# CMakeLists.txt - build all TLPI (The Linux Programming Interface) example programs
#
# This is the CMake counterpart to the original hand-rolled Makefiles.
# The shared library libtlpi.a is built first (see lib/), then each chapter
# subdirectory's programs are built against it.

cmake_minimum_required(VERSION 3.10)

project(tlpi C)

# ---------------------------------------------------------------------------
# Global compile flags (mirror lib/Makefile.inc IMPL_CFLAGS)
# ---------------------------------------------------------------------------

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Defining _DEFAULT_SOURCE avoids the warnings that would otherwise be produced
# when compiling code that defines _BSD_SOURCE/_SVID_SOURCE against glibc 2.20+.
add_compile_options(
    -D_XOPEN_SOURCE=600
    -D_DEFAULT_SOURCE
    -g
    -O0
    -pedantic
    -Wall
    -W                       # equivalent to -Wextra on recent gcc
    -Wmissing-prototypes
    -Wno-sign-compare
    -Wimplicit-fallthrough
    -Wno-unused-parameter
)

# clang is a little more zealous than gcc with some warnings; suppress the ones
# that relate to code that is fine in the book examples.
if(CMAKE_C_COMPILER_ID MATCHES "Clang")
    add_compile_options(
        -Wno-uninitialized
        -Wno-infinite-recursion
        -Wno-format-pedantic
    )
endif()

# The library headers (tlpi_hdr.h, ename.c.inc, etc.) live in lib/.
include_directories(${CMAKE_SOURCE_DIR}/lib)

# Enable compile_commands.json for IDE / clangd support.
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# ---------------------------------------------------------------------------
# Optional/experimental subdirectories.
#
# The original top-level Makefile deliberately excludes `namespaces` and
# `seccomp` from the default `all` target (they need a relatively recent
# kernel/userspace, and seccomp needs the external libseccomp). Gate them
# behind this option so the default build matches `make all`.
# ---------------------------------------------------------------------------
option(TLPI_BUILD_EXTRA "Also build the namespaces/ and seccomp/ programs" OFF)

# Threads (used by the threads/, psem/, timers/ dirs and a few individual progs).
find_package(Threads REQUIRED)

# ---------------------------------------------------------------------------
# Shared helper functions used by every chapter directory.
# ---------------------------------------------------------------------------
include(${CMAKE_SOURCE_DIR}/cmake/tlpi.cmake)

# ---------------------------------------------------------------------------
# The library is built first so it is available to every chapter.
# ---------------------------------------------------------------------------
add_subdirectory(lib)

# Chapter directories (the same list as the original Makefile's DIRS, minus lib).
add_subdirectory(acl)
add_subdirectory(altio)
add_subdirectory(cap)
add_subdirectory(daemons)
add_subdirectory(dirs_links)
add_subdirectory(filebuff)
add_subdirectory(fileio)
add_subdirectory(filelock)
add_subdirectory(files)
add_subdirectory(filesys)
add_subdirectory(getopt)
add_subdirectory(inotify)
add_subdirectory(loginacct)
add_subdirectory(memalloc)
add_subdirectory(mmap)
add_subdirectory(pgsjc)
add_subdirectory(pipes)
add_subdirectory(pmsg)
add_subdirectory(proc)
add_subdirectory(proccred)
add_subdirectory(procexec)
add_subdirectory(procpri)
add_subdirectory(procres)
add_subdirectory(progconc)
add_subdirectory(psem)
add_subdirectory(pshm)
add_subdirectory(pty)
add_subdirectory(shlibs)
add_subdirectory(signals)
add_subdirectory(sockets)
add_subdirectory(svipc)
add_subdirectory(svmsg)
add_subdirectory(svsem)
add_subdirectory(svshm)
add_subdirectory(sysinfo)
add_subdirectory(syslim)
add_subdirectory(threads)
add_subdirectory(time)
add_subdirectory(timers)
add_subdirectory(tty)
add_subdirectory(users_groups)
add_subdirectory(vdso)
add_subdirectory(vmem)
add_subdirectory(xattr)

if(TLPI_BUILD_EXTRA)
    add_subdirectory(namespaces)
    add_subdirectory(seccomp)
endif()
