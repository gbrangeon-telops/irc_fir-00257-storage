proc read_file {filename} {
    set fh [open $filename r]
    set fileStr [read $fh]
    close $fh
    return $fileStr
}
proc usage {} {
    #note : see switch case line 25
    puts "Usage: verifyRelease.tcl -pbf <procBuildInfoFile> -obf <outputBuildInfoFile> ... "
}


set storageBuildInfoFile ""
set storageReleaseInfoFile1 ""
set storageReleaseInfoFile2 ""


#set argv [lassign $argv _]

while {[llength $argv] > 0} {
    switch -- [lindex $argv 0] {
    "-sbf" {
        set storageBuildInfoFile [lindex $argv 1]
        set argv [lrange $argv 2 end]
    }
    "-sf1" {
        set storageReleaseInfoFile1 [lindex $argv 1]
        set argv [lrange $argv 2 end]
    }
    "-sf2" {
        set storageReleaseInfoFile2 [lindex $argv 1]
        set argv [lrange $argv 2 end]
    }
    default {
        usage
        error "Error in command line arguments"
        }
    }
}

set error 0

# Parse storage build info file
set storageBuildInfoFileStr [read_file $storageBuildInfoFile]
set storageBuildInfoFileSubstr1 [string range $storageBuildInfoFileStr \
[string first "MEMCONF == 16" $storageBuildInfoFileStr] end]
set storageBuildInfoHardware1 ""
set storageBuildInfoSoftware1 ""
set storageBuildInfoBootLoader1 ""
set storageBuildInfoCommon1 ""

if {[regexp {SVN_HARDWARE_REV[^\n\r0-9]+(\d+)} $storageBuildInfoFileSubstr1 match storageBuildInfoHardware1]} {
    set storageBuildInfoHardware1 $storageBuildInfoHardware1
} else {
    set error 1
}
if {[regexp {SVN_SOFTWARE_REV[^\n\r0-9]+(\d+)} $storageBuildInfoFileSubstr1 match storageBuildInfoSoftware1]} {
    set storageBuildInfoSoftware1 $storageBuildInfoSoftware1
} else {
    set error 1
}
if {[regexp {SVN_BOOTLOADER_REV[^\n\r0-9]+(\d+)} $storageBuildInfoFileSubstr1 match storageBuildInfoBootLoader1]} {
    set storageBuildInfoBootLoader1 $storageBuildInfoBootLoader1
} else {
    set error 1
}
if {[regexp {SVN_COMMON_REV[^\n\r0-9]+(\d+)} $storageBuildInfoFileSubstr1 match storageBuildInfoCommon1]} {
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

if {[regexp {SVN_HARDWARE_REV[^\n\r0-9]+(\d+)} $storageBuildInfoFileSubstr2 match storageBuildInfoHardware2]} {
    set storageBuildInfoHardware2 $storageBuildInfoHardware2
} else {
    set error 1
}
if {[regexp {SVN_SOFTWARE_REV[^\n\r0-9]+(\d+)} $storageBuildInfoFileSubstr2 match storageBuildInfoSoftware2]} {
    set storageBuildInfoSoftware2 $storageBuildInfoSoftware2
} else {
    set error 1
}
if {[regexp {SVN_BOOTLOADER_REV[^\n\r0-9]+(\d+)} $storageBuildInfoFileSubstr2 match storageBuildInfoBootLoader2]} {
    set storageBuildInfoBootLoader2 $storageBuildInfoBootLoader2
} else {
    set error 1
}
if {[regexp {SVN_COMMON_REV[^\n\r0-9]+(\d+)} $storageBuildInfoFileSubstr2 match storageBuildInfoCommon2]} {
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

if {[regexp {rel_storage_hw_rev1[^\n\r0-9]+(\d+)} $storageReleaseInfoFileStr1 match storageReleaseInfoHardware1]} {
    set storageReleaseInfoHardware1 $storageReleaseInfoHardware1
} else {
    set error 1
}
if {[regexp {rel_storage_sw_rev1[^\n\r0-9]+(\d+)} $storageReleaseInfoFileStr1 match storageReleaseInfoSoftware1]} {
    set storageReleaseInfoSoftware1 $storageReleaseInfoSoftware1
} else {
    set error 1
}
if {[regexp {rel_storage_boot_rev1[^\n\r0-9]+(\d+)} $storageReleaseInfoFileStr1 match storageReleaseInfoBootLoader1]} {
    set storageReleaseInfoBootLoader1 $storageReleaseInfoBootLoader1
} else {
    set error 1
}
if {[regexp {rel_storage_common_rev1[^\n\r0-9]+(\d+)} $storageReleaseInfoFileStr1 match storageReleaseInfoCommon1]} {
    set storageReleaseInfoCommon1 $storageReleaseInfoCommon1
} else {
    set error 1
}

set storageReleaseInfoFileStr2 [read_file $storageReleaseInfoFile2]
set storageReleaseInfoHardware2 ""
set storageReleaseInfoSoftware2 ""
set storageReleaseInfoBootLoader2 ""
set storageReleaseInfoCommon2 ""

if {[regexp {rel_storage_hw_rev2[^\n\r0-9]+(\d+)} $storageReleaseInfoFileStr2 match storageReleaseInfoHardware2]} {
    set storageReleaseInfoHardware2 $storageReleaseInfoHardware2
} else {
    set error 1
}
if {[regexp {rel_storage_sw_rev2[^\n\r0-9]+(\d+)} $storageReleaseInfoFileStr2 match storageReleaseInfoSoftware2]} {
    set storageReleaseInfoSoftware2 $storageReleaseInfoSoftware2
} else {
    set error 1
}
if {[regexp {rel_storage_boot_rev2[^\n\r0-9]+(\d+)} $storageReleaseInfoFileStr2 match storageReleaseInfoBootLoader2]} {
    set storageReleaseInfoBootLoader2 $storageReleaseInfoBootLoader2
} else {
    set error 1
}
if {[regexp {rel_storage_common_rev2[^\n\r0-9]+(\d+)} $storageReleaseInfoFileStr2 match storageReleaseInfoCommon2]} {
    set storageReleaseInfoCommon2 $storageReleaseInfoCommon2
} else {
    set error 1
}

if {$error == 1} {
    puts "Cannot parse storage build info file"
    exit 1
}

#e build info file
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

# Verify storage release log file
# NOT PRESENT
#if {($storageReleaseInfoHardware1 != $releaseLogStorageHardware1) ||
#($storageReleaseInfoSoftware1 != $releaseLogStorageSoftware1) ||
#($storageReleaseInfoBootLoader1 != $releaseLogStorageBootLoader1) ||
#($storageReleaseInfoCommon1 != $releaseLogStorageCommon1) ||
#($storageReleaseInfoHardware2 != $releaseLogStorageHardware2) ||
#($storageReleaseInfoSoftware2 != $releaseLogStorageSoftware2) ||
#($storageReleaseInfoBootLoader2 != $releaseLogStorageBootLoader2) ||
#($storageReleaseInfoCommon2 != $releaseLogStorageCommon2)} {
#    puts "Storage FPGA release info does not match release log file"
#    exit 1
#}

puts "Storage FPGA release (Passed)"