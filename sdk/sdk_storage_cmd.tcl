proc create_storage_sw {} {
set current_path [exec pwd]
global sdkDir

#Switch directory
cd "$sdkDir"

#set workspace
setws -switch "$sdkDir"

#Create HW projects
createhw -name hw_platform_16 -hwspec hw_16/fir_257_top.hdf
createhw -name hw_platform_32 -hwspec hw_32/fir_257_top.hdf

#Create BSP projects
createbsp -name standalone_bsp_16 -hwproject hw_platform_16 -proc MCU_microblaze_0
createbsp -name standalone_bsp_32 -hwproject hw_platform_32 -proc MCU_microblaze_0

#Import software projects
importprojects "$sdkDir/fir_00257_storage_16"
importprojects "$sdkDir/fir_00257_storage_32"

#Import makefile
file delete "$sdkDir/fir_00257_storage_16/makefile.defs"
file link "$sdkDir/fir_00257_storage_16/makefile.defs" "$sdkDir/makefile.defs"
file delete "$sdkDir/fir_00257_storage_32/makefile.defs"
file link "$sdkDir/fir_00257_storage_32/makefile.defs" "$sdkDir/makefile.defs"

#Clean projects
projects -clean

#configure in release mode
configapp -app fir_00257_storage_16 build-config release
configapp -app fir_00257_storage_32 build-config release

#return to initial path
cd ${current_path}
}

proc build_storage_sw {} {
set current_path [exec pwd]
global sdkDir

#Switch directory
cd "$sdkDir"

#set workspace
setws -switch "$sdkDir"

#configure in release mode
configapp -app fir_00257_storage_16 build-config release
configapp -app fir_00257_storage_32 build-config release

#Clean projects
projects -clean

#Rebuild all Release project
projects -build -type bsp -name standalone_bsp_16
projects -build -type app -name fir_00257_storage_16
projects -build -type bsp -name standalone_bsp_32
projects -build -type app -name fir_00257_storage_32

#return to initial path
cd ${current_path}
}
