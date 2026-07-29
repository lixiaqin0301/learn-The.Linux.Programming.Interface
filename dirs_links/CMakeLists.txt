# dirs_links/
foreach(p IN ITEMS bad_symlink file_type_stats list_files list_files_readdir_r
               nftw_dir_tree t_dirbasename t_unlink view_symlink)
    tlpi_add_program(${p})
endforeach()
