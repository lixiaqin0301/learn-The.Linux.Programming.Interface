# svmsg/
foreach(p IN ITEMS svmsg_chqbytes svmsg_file_client svmsg_file_server
               svmsg_create svmsg_receive svmsg_rm svmsg_send
               svmsg_info svmsg_ls)
    tlpi_add_program(${p})
endforeach()
