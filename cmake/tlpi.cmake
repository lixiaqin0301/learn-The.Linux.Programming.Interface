# cmake/tlpi.cmake - shared helper functions for building TLPI programs.
#
# Each chapter directory may set two optional local variables before adding its
# programs:
#
#   TLPI_LIBS   - extra libraries to link (e.g. "rt", "acl", "Threads::Threads")
#   TLPI_FLAGS  - extra compile+link flags (e.g. "-pthread") applied PRIVATE
#
# Target names must be globally unique in CMake, but several programs share a
# name across directories (e.g. `copy` in filebuff/ and fileio/, `necho` in
# proc/ and procexec/). To allow that, every target is created as
# "<dirname>__<name>" with OUTPUT_NAME set to <name>, so the resulting binary
# is still <name> placed under build/<dirname>/<name>.
#
# After a call, the variable ${TLPI_LAST_TARGET} holds the created target name
# so special cases can attach compile definitions or extra libraries, e.g.:
#
#   tlpi_add_program(ouch ouch.c)
#   target_compile_definitions(${TLPI_LAST_TARGET} PRIVATE _BSD_SOURCE)

# Link a target against libtlpi plus this directory's extra libs/flags.
function(tlpi_link target)
    target_link_libraries(${target} tlpi ${TLPI_LIBS})
    if(TLPI_FLAGS)
        target_compile_options(${target} PRIVATE ${TLPI_FLAGS})
        target_link_options(${target} PRIVATE ${TLPI_FLAGS})
    endif()
endfunction()

# Add a program: sources default to <name>.c; pass extra sources for
# multi-object programs (e.g. tlpi_add_program(strerror_test strerror_test.c strerror.c)).
function(tlpi_add_program name)
    set(_srcs ${ARGN})
    if(NOT _srcs)
        set(_srcs ${name}.c)
    endif()
    get_filename_component(_dir "${CMAKE_CURRENT_SOURCE_DIR}" NAME)
    set(_target "${_dir}__${name}")
    add_executable(${_target} ${_srcs})
    set_target_properties(${_target} PROPERTIES OUTPUT_NAME "${name}")
    tlpi_link(${_target})
    set(TLPI_LAST_TARGET "${_target}" PARENT_SCOPE)
endfunction()
