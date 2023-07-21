proc setEnvironmentVariable {fpgaSize} {
    upvar 1 baseName baseName
    upvar 1 commonDir commonDir
    upvar 1 projectDir projectDir
    upvar 1 sdkDir sdkDir
    upvar 1 srcDir srcDir
    upvar 1 binDir binDir
    upvar 1 scriptsDir scriptsDir

    upvar 1 elfFile elfFile
    upvar 1 hwFile hwFile
    upvar 1 buildInfoFile buildInfoFile
    upvar 1 revFile revFile


    upvar 1 tortoiseSVNDir tortoiseSVNDir
    upvar 1 svn_subwcrev svn_subwcrev
    upvar 1 xDir xDir
    upvar 1 objcopy objcopy
    upvar 1 x_xsct x_xsct

    set baseName "fir_00257_storage_$fpgaSize"
    set commonDir "D:/Telops/FIR-00251-Common"
    set projectDir "D:/Telops/FIR-00257-Storage"
    set sdkDir "$projectDir/sdk/$baseName"
    set srcDir "$projectDir/src"
    set binDir "$projectDir/bin/$baseName"
    set scriptsDir "$projectDir/bin/scripts"

    set elfFile "$binDir/${baseName}_$fpgaSize.elf"
    set hwFile "$sdkDir/${baseName}_$fpgaSize.hdf"
    set buildInfoFile "$srcDir/BuildInfo/BuildInfo.h"
    set revFile "$binDir/svnrevs_$fpgaSize.tcl"
    set tortoiseSVNDir "\"C:/Program Files/TortoiseSVN\""
    set svn_subwcrev "$tortoiseSVNDir/bin/SubWCRev.exe"
    set xDir "C:/Xilinx"
    if {[file exists "D:/Xilinx/SDK/2018.3/*.*"]} {
        set xDir "D:/Xilinx"
    }
    puts "Xilinx directory: $xDir"
    set x_mb-objcopy "$xDir/SDK/2018.3/gnu/microblaze/nt/bin/mb-objcopy.exe"
    set x_xsct "$xDir/SDK/2018.3/bin/xsct.bat"

}
