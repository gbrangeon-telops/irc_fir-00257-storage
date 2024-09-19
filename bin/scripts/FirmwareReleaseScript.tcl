
proc DebugPause {} {
    puts "\n<W> Paused"
    puts -nonewline "> "
    flush stdout
    gets stdin
    puts "\n"
}

proc fetchHwSwFiles {SwFile hwFile} {
    #clean up
    file delete -force $hwFile
    file copy -force $SwFile $hwFile
}

proc updateReleaseSvnRevsFile {} {
    global scriptsDir
    set revFile ""
    set svn_subwcrev ""
    set hwFile ""
    set elfFile ""
    set bootFile ""
    set commonDir ""

    source "${scriptsDir}/setEnvironment.tcl"
    setEnvironmentVariable 16

    # clean up
    if {[ catch {[file delete -force $revFile]} ]} {
        puts "Error: Can't delete $revFile"
    }
    set Vfo [open $revFile w]
    set rev [git_get_rev ${hwFile} 1]
    puts $Vfo "set rel_storage_hw_rev1 \"$rev\""
    close $Vfo

    set Vfo [open $revFile a]
    set rev [git_get_rev ${elfFile} 1]
    puts $Vfo "set rel_storage_sw_rev1 \"$rev\""
    close $Vfo
   
    set Vfo [open $revFile a]
    puts $Vfo "set rel_storage_boot_rev1 0"
    set rev [git_get_rev ${commonDir} 1]
    puts $Vfo "set rel_storage_common_rev1 \"$rev\""
    close $Vfo
   
    
    setEnvironmentVariable 32
    # clean up
    if {[ catch {[file delete -force $revFile]} ]} {
        puts "Error: Can't delete $revFile"
    }
    set Vfo [open $revFile w]
    set rev [git_get_rev ${hwFile} 1]
    puts $Vfo "set rel_storage_hw_rev2 \"$rev\""
    close $Vfo
    
    set Vfo [open $revFile a]
    set rev [git_get_rev ${elfFile} 1]

    puts $Vfo "set rel_storage_sw_rev2 \"$rev\""
    close $Vfo
    
    set Vfo [open $revFile a]
    puts $Vfo "set rel_storage_boot_rev2 0"
    set rev [git_get_rev ${commonDir} 1]
    puts $Vfo "set rel_storage_common_rev2 \"$rev\""
    close $Vfo
    

}

proc read_file {filename} {
    set fh [open $filename r]
    set fileStr [read $fh]
    close $fh
    return $fileStr
}

proc verifyRelease {storageBuildInfoFile storageReleaseInfoFile1 storageReleaseInfoFile2} {
    global scriptsDir
    set error 0

    # Parse storage build info file
    set storageBuildInfoFileStr [read_file $storageBuildInfoFile]
    set storageBuildInfoFileSubstr1 [string range $storageBuildInfoFileStr \
    [string first "MEMCONF == 16" $storageBuildInfoFileStr] end]
    set storageBuildInfoHardware1 ""
    set storageBuildInfoSoftware1 ""
    set storageBuildInfoBootLoader1 ""
    set storageBuildInfoCommon1 ""

    if {[regexp {SVN_HARDWARE_REV[^\n\r0-9]+0x([a-fA-F0-9]+)} $storageBuildInfoFileSubstr1 match storageBuildInfoHardware1]} {
        set storageBuildInfoHardware1 $storageBuildInfoHardware1
    } else {
        set error 1
    }
    if {[regexp {SVN_SOFTWARE_REV[^\n\r0-9]+0x([a-fA-F0-9]+)} $storageBuildInfoFileSubstr1 match storageBuildInfoSoftware1]} {
        set storageBuildInfoSoftware1 $storageBuildInfoSoftware1
    } else {
        set error 1
    }
    if {[regexp {SVN_BOOTLOADER_REV[^\n\r0-9]+0x([a-fA-F0-9]+)} $storageBuildInfoFileSubstr1 match storageBuildInfoBootLoader1]} {
        set storageBuildInfoBootLoader1 $storageBuildInfoBootLoader1
    } else {
        set error 1
    }
    if {[regexp {SVN_COMMON_REV[^\n\r0-9]+0x([a-fA-F0-9]+)} $storageBuildInfoFileSubstr1 match storageBuildInfoCommon1]} {
        set storageBuildInfoCommon1 $storageBuildInfoCommon1
    } else {
        set error 1
    }

    if {$error == 1} {
        puts "Cannot parse storage build info file"
        exit 1
    }

    set storageBuildInfoFileSubstr2 [string range $storageBuildInfoFileStr \
    [string first "MEMCONF == 32" $storageBuildInfoFileStr] end]
    set storageBuildInfoHardware2 ""
    set storageBuildInfoSoftware2 ""
    set storageBuildInfoBootLoader2 ""
    set storageBuildInfoCommon2 ""

    if {[regexp {SVN_HARDWARE_REV[^\n\r0-9]+0x([a-fA-F0-9]+)} $storageBuildInfoFileSubstr2 match storageBuildInfoHardware2]} {
        set storageBuildInfoHardware2 $storageBuildInfoHardware2
    } else {
        set error 1
    }
    if {[regexp {SVN_SOFTWARE_REV[^\n\r0-9]+0x([a-fA-F0-9]+)} $storageBuildInfoFileSubstr2 match storageBuildInfoSoftware2]} {
        set storageBuildInfoSoftware2 $storageBuildInfoSoftware2
    } else {
        set error 1
    }
    if {[regexp {SVN_BOOTLOADER_REV[^\n\r0-9]+0x([a-fA-F0-9]+)} $storageBuildInfoFileSubstr2 match storageBuildInfoBootLoader2]} {
        set storageBuildInfoBootLoader2 $storageBuildInfoBootLoader2
    } else {
        set error 1
    }
    if {[regexp {SVN_COMMON_REV[^\n\r0-9]+0x([a-fA-F0-9]+)} $storageBuildInfoFileSubstr2 match storageBuildInfoCommon2]} {
        set storageBuildInfoCommon2 $storageBuildInfoCommon2
    } else {
        set error 1
    }

    if {$error == 1} {
        puts "Cannot parse storage build info file"
        exit 1
    }

    # Parse storage release info file
    set storageReleaseInfoFileStr1 [read_file $storageReleaseInfoFile1]
    set storageReleaseInfoHardware1 ""
    set storageReleaseInfoSoftware1 ""
    set storageReleaseInfoBootLoader1 ""
    set storageReleaseInfoCommon1 ""

    if {[regexp {rel_storage_hw_rev1[^\n\r0-9]+\"([a-zA-Z0-9]+)\"} $storageReleaseInfoFileStr1 match storageReleaseInfoHardware1]} {
        set storageReleaseInfoHardware1 $storageReleaseInfoHardware1
    } else {
        set error 1
    }
    if {[regexp {rel_storage_sw_rev1[^\n\r0-9]+\"([a-zA-Z0-9]+)\"} $storageReleaseInfoFileStr1 match storageReleaseInfoSoftware1]} {
        set storageReleaseInfoSoftware1 $storageReleaseInfoSoftware1
    } else {
        set error 1
    }
    if {[regexp {rel_storage_boot_rev1[^\n\r0-9]+\"([a-zA-Z0-9]+)\"} $storageReleaseInfoFileStr1 match storageReleaseInfoBootLoader1]} {
        set storageReleaseInfoBootLoader1 $storageReleaseInfoBootLoader1
    } else {
        set error 1
    }
    if {[regexp {rel_storage_common_rev1[^\n\r0-9]+\"([a-zA-Z0-9]+)\"} $storageReleaseInfoFileStr1 match storageReleaseInfoCommon1]} {
        set storageReleaseInfoCommon1 $storageReleaseInfoCommon1
    } else {
        set error 1
    }

    set storageReleaseInfoFileStr2 [read_file $storageReleaseInfoFile2]
    set storageReleaseInfoHardware2 ""
    set storageReleaseInfoSoftware2 ""
    set storageReleaseInfoBootLoader2 ""
    set storageReleaseInfoCommon2 ""

    if {[regexp {rel_storage_hw_rev2[^\n\r0-9]+\"([a-zA-Z0-9]+)\"} $storageReleaseInfoFileStr2 match storageReleaseInfoHardware2]} {
        set storageReleaseInfoHardware2 $storageReleaseInfoHardware2
    } else {
        set error 1
    }
    if {[regexp {rel_storage_sw_rev2[^\n\r0-9]+\"([a-zA-Z0-9]+)\"} $storageReleaseInfoFileStr2 match storageReleaseInfoSoftware2]} {
        set storageReleaseInfoSoftware2 $storageReleaseInfoSoftware2
    } else {
        set error 1
    }
    if {[regexp {rel_storage_boot_rev2[^\n\r0-9]+\"([a-zA-Z0-9]+)\"} $storageReleaseInfoFileStr2 match storageReleaseInfoBootLoader2]} {
        set storageReleaseInfoBootLoader2 $storageReleaseInfoBootLoader2
    } else {
        set error 1
    }
    if {[regexp {rel_storage_common_rev2[^\n\r0-9]+\"([a-zA-Z0-9]+)\"} $storageReleaseInfoFileStr2 match storageReleaseInfoCommon2]} {
        set storageReleaseInfoCommon2 $storageReleaseInfoCommon2
    } else {
        set error 1
    }

    if {$error == 1} {
        puts "Cannot parse storage build info file"
        exit 1
    }

    #e build info file
    puts "$storageReleaseInfoHardware1"
    puts "$storageBuildInfoHardware1"
    puts "$storageReleaseInfoSoftware1"
    puts "$storageBuildInfoSoftware1"
    puts "$storageReleaseInfoBootLoader1"
    puts "$storageBuildInfoBootLoader1"
    puts "$storageReleaseInfoCommon1"
    puts "$storageBuildInfoCommon1"
    puts "$storageReleaseInfoHardware2"
    puts "$storageBuildInfoHardware2"
    puts "$storageReleaseInfoSoftware2"
    puts "$storageBuildInfoSoftware2"
    puts "$storageReleaseInfoBootLoader2"
    puts "$storageBuildInfoBootLoader2"
    puts "$storageReleaseInfoCommon2"
    puts "$storageBuildInfoCommon2"

    if {($storageReleaseInfoHardware1 != $storageBuildInfoHardware1) ||
    ($storageReleaseInfoSoftware1 != $storageBuildInfoSoftware1) ||
    ($storageReleaseInfoBootLoader1 != $storageBuildInfoBootLoader1) ||
    ($storageReleaseInfoCommon1 != $storageBuildInfoCommon1) ||
    ($storageReleaseInfoHardware2 != $storageBuildInfoHardware2) ||
    ($storageReleaseInfoSoftware2 != $storageBuildInfoSoftware2) ||
    ($storageReleaseInfoBootLoader2 != $storageBuildInfoBootLoader2) ||
    ($storageReleaseInfoCommon2 != $storageBuildInfoCommon2)} {
        puts "Storage FPGA release info does not match build info"
        exit 1
    }

    puts "Storage FPGA release (Passed)"

}

source setEnvironment.tcl

set TestMode "None"
#Argument check
if { $argc == 1 } {
	puts "Call FirmwareReleaseScript in TestMode"
	set TestMode [lindex $argv 0 ]
} 

set FirmwareReleaseVersionFile "$procDir/bin/FirmwareReleaseVersion.txt"
set FirmwareReleaseLogFile "$projectDir/bin/scripts/FirmwareRelease.log"
set svnDir "http://einstein/svn/firmware/"
set tortoiseSvnBin "C:/Program Files/TortoiseSVN/bin/svn.exe"

#In this mode, skip the release procedure and get only the process
if {$TestMode == "Source"} {
    exit 0
}
#clean up
file delete -force $FirmwareReleaseLogFile

set major ""
set minor ""
set build ""

set fid [open $FirmwareReleaseVersionFile r]
set contents [read $fid]
set lines [split $contents "\n"]
close $fid

foreach line $lines {
    if {[string match "*firmwareVersionMajor*" $line]} {
        set major [lindex [split $line "="] 1]
    } elseif {[string match "*firmwareVersionMinor*" $line]} {
        set minor [lindex [split $line "="] 1]
    } elseif {[string match "*firmwareVersionBuild*" $line]} {
        set build [lindex [split $line "="] 1]
    }   
}

set firmwareReleaseVersion [format "%s.%s.x.%s" $major $minor $build]
puts "*****************************************"
puts "BEGIN Firmware release $firmwareReleaseVersion"
puts "*****************************************"
puts ""

set fid [open $FirmwareReleaseLogFile w]
puts $fid "*****************************************"
puts $fid "BEGIN Firmware release $firmwareReleaseVersion"
puts $fid "*****************************************"
puts $fid ""

puts $fid "BEGIN Pre-release compile"

# Set environment variables
source "${scriptsDir}/setEnvironment.tcl"
setEnvironmentVariable x

# Create and build for pre-release
source  "$projectDir/sdk/sdk_storage_cmd.tcl" 
#sdkDir is used in create and build
if {$TestMode != "SkipOne"} {
    create_storage_sw
    build_storage_sw

    if {![file exists $sdkDir/fir_00257_storage_16/Release/fir_00257_storage_16.elf]} {
        puts $fid "Create and build project 16 failed!\n"
        # Append log content to the log file
        close $fid
        error "Create and build project 16 failed!\n"
    }
    if {![file exists $sdkDir/fir_00257_storage_32/Release/fir_00257_storage_32.elf]} {
        puts $fid "Create and build project 32 failed!\n"
        # Append log content to the log file
        close $fid
        error "Create and build project 32 failed!\n"
    }
    puts $fid "Create and build project done\n"

    # Copy files
    setEnvironmentVariable 16
    fetchHwSwFiles "$sdkDir/${baseName}/Release/${baseName}.elf" $elfFile
    setEnvironmentVariable 32
    fetchHwSwFiles "$sdkDir/${baseName}/Release/${baseName}.elf" $elfFile

    puts $fid "fetchHwSwFiles done"
    puts $fid ""
    puts "END Pre-release compile"

}

if {$TestMode == "Debug"} {
    DebugPause
}

set preReleaseMessage "Pre-release $firmwareReleaseVersion"
exec git add -u
exec git commit -m \"$preReleaseMessage\"

puts $fid "*****************************************"
puts $fid "Pre-release commit done"
puts $fid "*****************************************"
puts $fid ""

puts "*****************************************"
puts "Pre-release commit done"
puts "*****************************************"
puts ""


puts $fid "BEGIN Release compile"

#Build main project
build_storage_sw

if {![file exists $sdkDir/fir_00257_storage_16/Release/fir_00257_storage_16.elf]} {
    puts $fid "Build project 16 failed!"
    # Append log content to the log file
    close $fid
    error "Build project 16 failed!"
}
if {![file exists $sdkDir/fir_00257_storage_32/Release/fir_00257_storage_32.elf]} {
    puts $fid "Build project 32 failed!"
    # Append log content to the log file
    close $fid
    error "Build project 32 failed!"
}
puts $fid "Build project done"

if {$TestMode == "Debug"} {
    DebugPause
}

#updateReleaseSvnRevsFile
updateReleaseSvnRevsFile 
puts "updateReleaseSvnRevsFile done"
puts $fid "updateReleaseSvnRevsFile done"

# Verify release files
verifyRelease $buildInfoFile "$binDir/svnrevs_16.tcl" "$binDir/svnrevs_32.tcl"
puts $fid "verifyRelease done\n"
# Note: Because generatePromFile uses the vivado bin, we have to call the .bat
if {[ catch {[exec $scriptsDir/generatePromFile.bat]} err]} {
    #Note: The command catch an error anyway, see log for more information
    puts $err
}

puts $fid "generatePromFile done"
puts "generatePromFile done"

set releaseMessage "Release $firmwareReleaseVersion"
exec git add -u
exec git commit -m \"$releaseMessage\"

puts $fid "*****************************************"
puts $fid "Release commit done"
puts $fid "*****************************************"
puts $fid ""

puts $fid "*****************************************"
puts $fid "END Firmware release $firmwareReleaseVersion"
puts $fid "*****************************************"
close $fid
#Open release file
exec {*}[auto_execok start] "" [file nativename [file normalize $FirmwareReleaseLogFile]]
