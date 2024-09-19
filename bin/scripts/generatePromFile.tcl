set current_file_location_absolute_path [file normalize [file dirname [info script]]]
source "$current_file_location_absolute_path/setEnvironment.tcl"

proc generatePromFile {mem_conf} {
    #set variables
    global projectDir
    set project_dir "$projectDir"
    set bin_dir "${project_dir}/bin"
    set sdk_dir "${project_dir}/sdk"
    set base_name "fir_00257_storage_${mem_conf}"
    set elf_file "${bin_dir}/${base_name}.elf"

    #fetch hw and sw files
    file delete -force "${elf_file}"
    if {[ catch {[file copy "${sdk_dir}/${base_name}/Release/${base_name}.elf" ${elf_file}]} err]} {
        puts $err
        error "ERROR: Missing elf file"
    } else {

        set bit_file "${sdk_dir}/hw_platform_${mem_conf}/fir_257_top.bit"
        set mmi_file "${sdk_dir}/hw_platform_${mem_conf}/fir_257_top.mmi"

        #Integrate software elf file to bit file
        set mcu_inst_path "CORE_BD/core_wrapper_i/core_i/MCU/microblaze_0"
        if {[ catch {[exec updatemem -meminfo $mmi_file -data $elf_file -bit $bit_file -proc $mcu_inst_path -out "${bin_dir}/download_${mem_conf}.bit" -force]} err]} {
            #Note: The command catch an error even the command is done successfully, see log for more information
            puts $err
        }
   } 

}

generatePromFile "16"
generatePromFile "32"


#Clean up
if {[ catch {[file delete -force {*}[glob *.backup.log] ]} err]} {
    puts $err
} 
if {[ catch {[file delete -force {*}[glob *.backup.jou]  ]} err]} {
 	puts $err
} 

#Generate PROM file
#Here the size is in M Bytes (was K Bytes), default checksum FF
write_cfgmem  -format mcs -size 16 -interface SPIx4 -loadbit {up 0x00000000 "$binDir/download_16.bit" up 0x00670000 "D:/Telops/FIR-00257-Storage/bin/download_32.bit" } -checksum -force -file "$binDir/prom/fir_00257_storage.mcs"
