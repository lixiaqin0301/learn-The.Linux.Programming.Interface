# sockets/
# Helpers not built here: inet_sockets.c, rdwrn.c, read_line.c,
# read_line_buf.c, scm_functions.c, sendfile.c, unix_sockets.c
# (provided by libtlpi).

foreach(p IN ITEMS i6d_ucase_sv i6d_ucase_cl
               id_echo_cl id_echo_sv
               is_echo_cl is_echo_sv is_echo_inetd_sv is_echo_v2_sv
               is_seqnum_sv is_seqnum_cl is_seqnum_v2_sv is_seqnum_v2_cl
               socknames t_gethostbyname t_getservbyname
               ud_ucase_sv ud_ucase_cl
               us_xfr_cl us_xfr_sv us_xfr_v2_cl us_xfr_v2_sv
               list_host_addresses
               scm_cred_recv scm_cred_send
               scm_multi_recv scm_multi_send
               scm_rights_recv scm_rights_send
               us_abstract_bind)
    tlpi_add_program(${p})
endforeach()
