#Import build fonction
set current_file_location_absolute_path [file normalize [file dirname [info script]]]
set parts [file split $current_file_location_absolute_path]
set root_location_absolute_path [file join {*}[lrange $parts 0 end-3]]

#set project info from the root location
set commonHDLDir "$root_location_absolute_path/irc_common_hdl"
set commonDir "$root_location_absolute_path/irc_fir-00251-common"
set projectDir "$root_location_absolute_path/ircam_fir-00251-storage_temp"
set sdkDir "$projectDir/sdk"
set srcDir "$projectDir/src"
set binDir "$projectDir/bin"
set scriptsDir "$projectDir/scripts"

proc setEnvironmentVariable {fpgaSize} {
    upvar 1 baseName baseName

    upvar 1 elfFile elfFile
    upvar 1 hwFile hwFile
    upvar 1 buildInfoFile buildInfoFile
    upvar 1 revFile revFile


    upvar 1 tortoiseSVNDir tortoiseSVNDir
    upvar 1 svn_subwcrev svn_subwcrev
    upvar 1 xDir xDir
    upvar 1 x_mb-objcopy  x_mb-objcopy 
    upvar 1 x_xsct x_xsct


    set baseName "fir_00257_storage_$fpgaSize"

    set elfFile "$binDir/${baseName}.elf"
    set hwFile "$sdkDir/hw_$fpgaSize/fir_257_top.hdf"
    set buildInfoFile "$srcDir/BuildInfo/BuildInfo.h"
    set revFile "$binDir/svnrevs_$fpgaSize.tcl"
    set tortoiseSVNDir "C:/Program Files/TortoiseSVN"
    set svn_subwcrev "$tortoiseSVNDir/bin/SubWCRev.exe"
    set xDir "C:/Xilinx"
    if {[file exists "D:/Xilinx/SDK/2018.3/*.*"]} {
        set xDir "D:/Xilinx"
    }
    puts "Xilinx directory: $xDir"
    set x_mb-objcopy "$xDir/SDK/2018.3/gnu/microblaze/nt/bin/mb-objcopy.exe"
    set x_xsct "$xDir/SDK/2018.3/bin/xsct.bat"

}
