# svshm/
foreach(p IN ITEMS svshm_attach svshm_create svshm_info svshm_lock svshm_mon
               svshm_rm svshm_unlock svshm_xfr_reader svshm_xfr_writer)
    tlpi_add_program(${p})
endforeach()
