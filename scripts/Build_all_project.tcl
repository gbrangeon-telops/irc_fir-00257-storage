#get root directory relative to this file
set current_file_location_absolute_path [file normalize [file dirname [info script]]]
source $current_file_location_absolute_path/setEnvironment.tcl


source $projectDir/scripts/Build_project_16.tcl
source $projectDir/scripts/Build_project_32.tcl
