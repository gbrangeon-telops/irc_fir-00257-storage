#Set environement variable
set current_file_location_absolute_path [file normalize [file dirname [info script]]]
source $current_file_location_absolute_path/setEnvironment.tcl

set proj_name "managed_ip_project"
set proj_dir $projectDir/IP/managed_ip_project
set ip_dir $projectDir/IP
#create_project managed_ip_project Common/VHDL/IP/managed_ip_project -part xc7k160tfbg676-1 -ip
# Create project
create_project $proj_name $proj_dir -ip

# Set project properties
set obj [get_projects managed_ip_project]
set_property "part" "xc7k160tfbg676-1" $obj
set_property "simulator_language" "Mixed" $obj
set_property "target_language" "VHDL" $obj


# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Add IP sources
foreach subdir [glob -nocomplain -type d $ip_dir/*] {
   if {[glob -nocomplain $subdir/*.xci] != {}} {add_files [glob $subdir/*.xci]}
}

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

puts "INFO: Project created:managed_ip_project"


