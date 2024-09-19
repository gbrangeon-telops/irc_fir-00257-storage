set current_file_location_absolute_path [file normalize [file dirname [info script]]]
set parts [file split $current_file_location_absolute_path]
set root_location_absolute_path [file join {*}[lrange $parts 0 end-2]]

source "sdk_storage_cmd.tcl"

#Parse arguments
if {$argc >= 1} {set create_project [lindex $argv 0]} else {set create_project 1}

#Create project
if {$create_project == 1} {
   create_storage_sw
}

#Build project
build_storage_sw
