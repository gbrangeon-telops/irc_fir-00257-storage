
#Import build functions
set base_dir "d:/Telops/fir-00257-Storage/sdk"
source $base_dir/sdk_storage_cmd.tcl

#Parse arguments
if {$argc >= 1} {set create_project [lindex $argv 0]} else {set create_project 1}

#Create project
if {$create_project == 1} {
   create_storage_sw
}


#Build project
build_storage_sw
