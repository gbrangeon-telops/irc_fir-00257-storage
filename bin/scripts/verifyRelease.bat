@echo off
call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat x

%x_xsct% %scriptsDir%\verifyRelease.tcl^
   -sbf %buildInfoFile%^
   -sf1 %binDir%\svnrevs_16.tcl -sf2 %binDir%\svnrevs_32.tcl
if errorlevel 1 (
	echo Verify release failed for storage
	pause
	exit
)
