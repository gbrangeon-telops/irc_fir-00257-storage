proc create_storage_sw {} {
upvar base_dir base_dir
set current_path [exec pwd]

#Switch directory
cd $base_dir

#set workspace
setws -switch $base_dir

#Create HW projects
createhw -name hw_platform_16 -hwspec hw_16/fir_257_top.hdf
createhw -name hw_platform_32 -hwspec hw_32/fir_257_top.hdf

#Create BSP projects
createbsp -name standalone_bsp_16 -hwproject hw_platform_16 -proc MCU_microblaze_0
createbsp -name standalone_bsp_32 -hwproject hw_platform_32 -proc MCU_microblaze_0

#Import software projects
importprojects "$base_dir/fir_00257_storage_16"
importprojects "$base_dir/fir_00257_storage_32"

#Clean projects
projects -clean

#configure in release mode
configapp -app fir_00257_storage_16 build-config release
configapp -app fir_00257_storage_32 build-config release

#return to initial path
cd ${current_path}
}

proc build_storage_sw {} {
upvar base_dir base_dir
set current_path [exec pwd]

#Switch directory
cd $base_dir

#set workspace
setws -switch $base_dir

#configure in release mode
configapp -app fir_00257_storage_16 build-config release
configapp -app fir_00257_storage_32 build-config release

#Clean projects
projects -clean


#prebuild
source "D:/Telops/fir-00257-Storage/bin/scripts/generateBuildInfoFile.tcl"
set scriptEnvironment "D:/Telops/FIR-00257-Storage/bin/scripts/setEnvironment.tcl"
genCore  $scriptEnvironment "16"
genCore  $scriptEnvironment "32"

#Rebuild all Release project
projects -build -type bsp -name standalone_bsp_16
projects -build -type app -name fir_00257_storage_16
projects -build -type bsp -name standalone_bsp_32
projects -build -type app -name fir_00257_storage_32

#return to initial path
cd ${current_path}
}
