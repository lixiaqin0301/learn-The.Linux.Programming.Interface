# mmap/
foreach(p IN ITEMS anon_mmap mmcat mmcopy t_mmap t_remap_file_pages)
    tlpi_add_program(${p})
endforeach()
