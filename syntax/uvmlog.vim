syn keyword err_keyw UVM_ERROR ERROR error UVM_FATAL Error fail failed FAIL FAILED
syn keyword err_keyw UVM_FATAL FATAL fatal Fatal

syn keyword wan_keyw UVM_WARNING warning Warning WARNING

syn keyword info_keyw UVM_INFO

syn keyword pass_keyw PASS PASSED PASSed pass passed Passed Pass SUCCESSFULL SUCCESS SUCCESSFULLY

syn region uvm_comp start="\[" end="\]"

syn match sim_time "@\s*[0-9]*:"



hi def link err_keyw Keyword

hi def link wan_keyw Error

hi def link info_keyw Type

hi def link pass_keyw Function

hi def link uvm_comp StorageClass

hi def link sim_time String
