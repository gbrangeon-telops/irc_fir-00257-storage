set base_dir "d:/Telops/fir-00257-Storage"
set proj_name "fir_00257_Storage"

#Build project
source $base_dir/scripts/gen_storage_project.tcl
#generate bitstream
launch_runs impl_1 -to_step write_bitstream
#wait for run end
wait_on_run impl_1
#open implemented design
open_run impl_1
#Open Block diagram
open_bd_design {$base_dir/xilinx/$proj_name.srcs/sources_1/bd/core/core.bd}
#Export hardware for sdk
source $base_dir/scripts/export_hw_to_sdk.tcl
# End of this build
close_project
