
#Import build functions
set base_dir "d:/Telops/fir-00257-Storage/sdk"
source $base_dir/sdk_storage_cmd.tcl

#Parse arguments
if {$argc >= 1} {set create_project [lindex $argv 0]} else {set create_project 1}

#Create project
if {$create_project == 1} {
   create_storage_sw
}

#prebuild
source "D:/Telops/fir-00257-Storage/bin/scripts/generateBuildInfoFile.tcl"
set scriptEnvironment "D:/Telops/FIR-00257-Storage/bin/scripts/setEnvironment.tcl"
genCore  $scriptEnvironment "16"
genCore  $scriptEnvironment "32"

#Build project
build_storage_sw
