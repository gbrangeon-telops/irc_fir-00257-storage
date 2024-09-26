#get root directory relative to this file
set current_file_location_absolute_path [file normalize [file dirname [info script]]]
source $current_file_location_absolute_path/setEnvironment.tcl

set proj_name "fir_00257_Storage_$memconf"

# Build project
source $projectDir/scripts/gen_storage_project_$memconf.tcl

#Configure IP cache location
config_ip_cache -use_cache_location $projectDir/xilinx/ip_cache

#Generate bitstream
launch_runs impl_1 -to_step write_bitstream

#Wait for run end
wait_on_run impl_1

#Open implemented design
open_run impl_1

#Open Block diagram
open_bd_design $projectDir/xilinx/$proj_name.srcs/sources_1/bd/core/core.bd

#Export hardware for sdk
source $projectDir/scripts/export_hw_to_sdk.tcl
#Build git revision
source $projectDir/scripts/updateHwRev.tcl
updateHwRev ${memconf}
#exec $projectDir/scripts/updateHwSvnRev.bat $memconf
source $projectDir/scripts/tel_xparam_extract.tcl

#Save reports
report_timing_summary -file $projectDir/reports/${proj_name}_timing_summary_routed.rpt
report_power -file $projectDir/reports/${proj_name}_power.rpt
report_clock_utilization -file $projectDir/reports/${proj_name}_clock_utilization_placed.rpt
report_utilization -file $projectDir/reports/${proj_name}_utilization_placed.rpt
report_utilization -file $projectDir/reports/${proj_name}_utilization_placed_hier.rpt -hierarchical -hierarchical_depth 5

#End of this build
close_project
