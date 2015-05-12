set root_dir "d:/Telops/fir-00257-Storage"
set proj_name "fir_00257_MemStorage"
set proj_dir $root_dir/xilinx/
set script_dir $root_dir/scripts
set aldec_dir $root_dir/aldec/compile
set ip_dir $root_dir/IP
set src_dir $root_dir/src
set common_hdl_dir "d:/Telops/Common_HDL"
set fir_common_dir "d:/Telops/fir-00251-Common/VHDL"
set constr_dir $root_dir/src/constraints

# Create project
create_project $proj_name $proj_dir

# Set project properties
set obj [get_projects $proj_name]
set_property "part" "xc7k160tfbg676-1" $obj
set_property "simulator_language" "Mixed" $obj
set_property "target_language" "VHDL" $obj



# Add Project IP sources
foreach subdir [glob -nocomplain -type d $ip_dir/*] {
   if {[glob -nocomplain $subdir/*.xci] != {}} {read_ip [glob $subdir/*.xci]}
}

#Add filelist
set filelist ""

# Add aldec compile
set filelist  [concat $filelist [glob  $aldec_dir/*.vhd]]

# Add common project sources 
set filelist  [concat $filelist [glob -nocomplain $fir_common_dir/*.vhd]]
set filelist  [concat $filelist [glob -nocomplain $fir_common_dir/Fifo/*.vhd]]
set filelist  [concat $filelist [glob -nocomplain $fir_common_dir/Utilities/*.vhd]]

# BD
set filelist  [concat $filelist [glob  $src_dir/BD/hdl/*.vhd]]

# Buffering
set filelist  [concat $filelist [glob -nocomplain $src_dir/Buffering/HDL/*.vhd]]

#MGT
set filelist  [concat $filelist [glob  $src_dir/MGT/hdl/*.vhd]]

# Add specific contraint
add_files -fileset constrs_1 $constr_dir

#Add filelist to project
add_files $filelist

#Generate the bloc design
source $script_dir/gen_bd_core.tcl


#create the bd wrapper
make_wrapper -files [get_files $proj_dir/$proj_name.srcs/sources_1/bd/core/core.bd] -top
add_files -norecurse $proj_dir/$proj_name.srcs/sources_1/bd/core/hdl/core_wrapper.vhd

#Update the ip catalog
update_ip_catalog

#Set top level design
set_property top fir_257_top [current_fileset]

update_compile_order -fileset sources_1

set_property STEPS.SYNTH_DESIGN.ARGS.FLATTEN_HIERARCHY none [get_runs synth_1]
