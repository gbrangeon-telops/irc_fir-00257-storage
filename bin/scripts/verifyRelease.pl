#!/usr/local/bin/perl

sub read_file {
   my($filename) = @_;
   
   local $/ = undef;
   open(my $fh, "<", $filename)
      or die ("Can't open $filename\n");
   my $fileStr = <$fh>;
   close ($fh);

   return $fileStr;
}

use Getopt::Long;
my $storageBuildInfoFile;
my $storageReleaseInfoFile1;
my $storageReleaseInfoFile2;

GetOptions("sbf=s" => \$storageBuildInfoFile,
      "sf1=s" => \$storageReleaseInfoFile1,
      "sf2=s" => \$storageReleaseInfoFile2)
   or die("Error in command line arguments\n");

my $error = 0;

# Parse storage build info file
my $storageBuildInfoFileStr = read_file($storageBuildInfoFile);
my $storageBuildInfoFileSubstr1 = substr($storageBuildInfoFileStr, index($storageBuildInfoFileStr, "MEMCONF == 16"));
my $storageBuildInfoHardware1;
my $storageBuildInfoSoftware1;
my $storageBuildInfoBootLoader1;
my $storageBuildInfoCommon1;

if ($storageBuildInfoFileSubstr1 =~ /SVN_HARDWARE_REV[^\n\r0-9]+(\d+)/) { $storageBuildInfoHardware1 = $1; } else { $error = 1; }
if ($storageBuildInfoFileSubstr1 =~ /SVN_SOFTWARE_REV[^\n\r0-9]+(\d+)/) { $storageBuildInfoSoftware1 = $1; } else { $error = 1; }
if ($storageBuildInfoFileSubstr1 =~ /SVN_BOOTLOADER_REV[^\n\r0-9]+(\d+)/) { $storageBuildInfoBootLoader1 = $1; } else { $error = 1; }
if ($storageBuildInfoFileSubstr1 =~ /SVN_COMMON_REV[^\n\r0-9]+(\d+)/) { $storageBuildInfoCommon1 = $1; } else { $error = 1; }

my $storageBuildInfoFileSubstr2 = substr($storageBuildInfoFileStr, index($storageBuildInfoFileStr, "MEMCONF == 32"));
my $storageBuildInfoHardware2;
my $storageBuildInfoSoftware2;
my $storageBuildInfoBootLoader2;
my $storageBuildInfoCommon2;

if ($storageBuildInfoFileSubstr2 =~ /SVN_HARDWARE_REV[^\n\r0-9]+(\d+)/) { $storageBuildInfoHardware2 = $1; } else { $error = 1; }
if ($storageBuildInfoFileSubstr2 =~ /SVN_SOFTWARE_REV[^\n\r0-9]+(\d+)/) { $storageBuildInfoSoftware2 = $1; } else { $error = 1; }
if ($storageBuildInfoFileSubstr2 =~ /SVN_BOOTLOADER_REV[^\n\r0-9]+(\d+)/) { $storageBuildInfoBootLoader2 = $1; } else { $error = 1; }
if ($storageBuildInfoFileSubstr2 =~ /SVN_COMMON_REV[^\n\r0-9]+(\d+)/) { $storageBuildInfoCommon2 = $1; } else { $error = 1; }

if ($error == 1)
{
   die("Cannot parse storage build info file\n");
}

# Parse storage release info file
my $storageReleaseInfoFileStr1 = read_file($storageReleaseInfoFile1);
my $storageReleaseInfoHardware1;
my $storageReleaseInfoSoftware1;
my $storageReleaseInfoBootLoader1;
my $storageReleaseInfoCommon1;

my $storageReleaseInfoFileStr2 = read_file($storageReleaseInfoFile2);
my $storageReleaseInfoHardware2;
my $storageReleaseInfoSoftware2;
my $storageReleaseInfoBootLoader2;
my $storageReleaseInfoCommon2;

if ($storageReleaseInfoFileStr1 =~ /rel_storage_hw_rev1[^\n\r0-9]+(\d+)/) { $storageReleaseInfoHardware1 = $1; } else { $error = 1; }
if ($storageReleaseInfoFileStr1 =~ /rel_storage_sw_rev1[^\n\r0-9]+(\d+)/) { $storageReleaseInfoSoftware1 = $1; } else { $error = 1; }
if ($storageReleaseInfoFileStr1 =~ /rel_storage_boot_rev1[^\n\r0-9]+(\d+)/) { $storageReleaseInfoBootLoader1 = $1; } else { $error = 1; }
if ($storageReleaseInfoFileStr1 =~ /rel_storage_common_rev1[^\n\r0-9]+(\d+)/) { $storageReleaseInfoCommon1 = $1; } else { $error = 1; }

if ($storageReleaseInfoFileStr2 =~ /rel_storage_hw_rev2[^\n\r0-9]+(\d+)/) { $storageReleaseInfoHardware2 = $1; } else { $error = 1; }
if ($storageReleaseInfoFileStr2 =~ /rel_storage_sw_rev2[^\n\r0-9]+(\d+)/) { $storageReleaseInfoSoftware2 = $1; } else { $error = 1; }
if ($storageReleaseInfoFileStr2 =~ /rel_storage_boot_rev2[^\n\r0-9]+(\d+)/) { $storageReleaseInfoBootLoader2 = $1; } else { $error = 1; }
if ($storageReleaseInfoFileStr2 =~ /rel_storage_common_rev2[^\n\r0-9]+(\d+)/) { $storageReleaseInfoCommon2 = $1; } else { $error = 1; }

if ($error == 1)
{
   die("Cannot parse storage release info file\n");
}

# Verify storage build info file
if (($storageReleaseInfoHardware1 ne $storageBuildInfoHardware1) ||
   ($storageReleaseInfoSoftware1 ne $storageBuildInfoSoftware1) || 
   ($storageReleaseInfoBootLoader1 ne $storageBuildInfoBootLoader1) || 
   ($storageReleaseInfoCommon1 ne $storageBuildInfoCommon1) ||
   ($storageReleaseInfoHardware2 ne $storageBuildInfoHardware2) ||
   ($storageReleaseInfoSoftware2 ne $storageBuildInfoSoftware2) || 
   ($storageReleaseInfoBootLoader2 ne $storageBuildInfoBootLoader2) || 
   ($storageReleaseInfoCommon2 ne $storageBuildInfoCommon2))
{
   die("Storage FPGA release info does not match build info\n");
}

print("Storage FPGA release passed\n");
