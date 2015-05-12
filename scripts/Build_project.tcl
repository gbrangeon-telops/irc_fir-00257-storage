set base_dir "d:/Telops/fir-00251-Proc"


#Build project PelicanD
source $base_dir/scripts/pelicanD_project.tcl
#generate bitstream
launch_runs impl_1 -to_step write_bitstream
#wait for run end
wait_on_run impl_1
#open implemented design
open_run impl_1
#Open Block diagram
open_bd_design {d:/Telops/fir-00251-Proc/xilinx/PelicanD/fir_00251_proc_pelicanD.srcs/sources_1/bd/core/core.bd}
#Export hardware for sdk
export_hardware [get_files d:/Telops/fir-00251-Proc/xilinx/PelicanD/fir_00251_proc_pelicanD.srcs/sources_1/bd/core/core.bd] [get_runs impl_1] -bitstream -dir D:/Telops/FIR-00251-Proc/sdk/fir_00251_proc_pelicanD
# End of this build
close_project 


#Build project ScorpiolwD
source $base_dir/scripts/scorpiolwD_project.tcl
#generate bitstream
launch_runs impl_1 -to_step write_bitstream
#wait for run end
wait_on_run impl_1
#open implemented design
open_run impl_1
#Open Block diagram
open_bd_design {d:/Telops/fir-00251-Proc/xilinx/scorpiolwD/fir_00251_proc_scorpiolwD.srcs/sources_1/bd/core/core.bd}
#Export hardware for sdk
export_hardware [get_files d:/Telops/fir-00251-Proc/xilinx/scorpiolwD/fir_00251_proc_scorpiolwD.srcs/sources_1/bd/core/core.bd] [get_runs impl_1] -bitstream -dir D:/Telops/FIR-00251-Proc/sdk/fir_00251_proc_scorpiolwD
# End of this build
close_project

#Build project MarsVlwD
source $base_dir/scripts/marsD_project.tcl
#generate bitstream
launch_runs impl_1 -to_step write_bitstream
#wait for run end
wait_on_run impl_1
#open implemented design
open_run impl_1
#Open Block diagram
open_bd_design {d:/Telops/fir-00251-Proc/xilinx/marsD/fir_00251_proc_marsD.srcs/sources_1/bd/core/core.bd}
#Export hardware for sdk
export_hardware [get_files d:/Telops/fir-00251-Proc/xilinx/marsD/fir_00251_proc_marsD.srcs/sources_1/bd/core/core.bd] [get_runs impl_1] -bitstream -dir D:/Telops/FIR-00251-Proc/sdk/fir_00251_proc_marsD
# End of this build
close_project
