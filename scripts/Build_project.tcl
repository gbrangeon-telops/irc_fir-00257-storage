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
#Save reports
report_timing_summary -file $base_dir/reports/${proj_name}_timing_summary_routed.rpt
report_clock_utilization -file $base_dir/reports/${proj_name}_clock_utilization_placed.rpt
report_utilization -file $base_dir/reports/${proj_name}_utilization_placed.rpt
report_utilization -file $base_dir/reports/${proj_name}_utilization_placed_hier.rpt -hierarchical -hierarchical_depth 5
#Open Block diagram
#open_bd_design $base_dir/xilinx/$proj_name.srcs/sources_1/bd/core/core.bd
#Export hardware for sdk
source $base_dir/scripts/export_hw_to_sdk.tcl
exec $base_dir/scripts/updateHwSvnRev.bat
# End of this build
close_project
