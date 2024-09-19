#Set environement variable
set current_file_location_absolute_path [file normalize [file dirname [info script]]]
source $current_file_location_absolute_path/setEnvironment.tcl

set memconf "32"

# Call slave generation script
source $scriptsDir/gen_storage_project.tcl
