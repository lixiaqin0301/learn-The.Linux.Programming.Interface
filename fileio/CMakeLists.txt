# fileio/
foreach(p IN ITEMS atomic_append bad_exclusive_open copy multi_descriptors
               seek_io t_readv t_truncate large_file)
    tlpi_add_program(${p})
endforeach()
