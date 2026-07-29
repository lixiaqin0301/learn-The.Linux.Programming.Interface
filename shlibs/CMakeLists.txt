# shlibs/ - shared libraries. dynload uses dlopen() (needs libdl).
# mod1/mod2/mod3/prog are the shared-library sources, not built by default.
tlpi_add_program(dynload dynload.c)
target_link_libraries(${TLPI_LAST_TARGET} dl)
