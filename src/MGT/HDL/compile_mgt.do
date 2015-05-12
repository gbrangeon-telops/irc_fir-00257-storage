alib work
setActivelib work

setenv MGT "D:\Telops\FIR-00257-Storage\src\mgt"

#Shared Logic

acom  "$MGT\hdl\exp_mgt_cdc_sync_exdes.vhd"
acom  "$MGT\hdl\exp_mgt_clock_module.vhd"
acom  "$MGT\hdl\exp_mgt_gt_common_wrapper.vhd"
acom  "$MGT\hdl\exp_mgt_support_reset_logic.vhd"
acom  "$MGT\hdl\exp_mgt_standard_cc_module.vhd"

#MGT Controller
acom  -relax "$MGT\hdl\mgt_ctrl.vhd"

#MGT Block
acom  "$MGT\hdl\mgt_block.bde"

#MGT Wrapper
acom  "$MGT\hdl\storage_mgt_wrapper.bde"

