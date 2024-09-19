#Set environement variable
set current_file_location_absolute_path [file normalize [file dirname [info script]]]
source $current_file_location_absolute_path/setEnvironment.tcl

set script_dir $projectDir/scripts
set memconf "16"

# Call slave build script
source $scriptsDir/Build_project.tcl
