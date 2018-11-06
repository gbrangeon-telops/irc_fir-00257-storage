set root_dir "d:/Telops/fir-00257-Storage"
set script_dir $root_dir/scripts
set memconf "32"

# Call slave generation script
source $script_dir/gen_storage_project.tcl
