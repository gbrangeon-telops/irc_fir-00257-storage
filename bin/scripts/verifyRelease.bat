@echo off
call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat x

%x_xsct%\SDK\2018.3\bin\xsct.bat %scriptsDir%\verifyRelease.tcl
   -sbf %buildInfoFile%^
   -sf1 %binDir%\svnrevs_16.pl -sf2 %binDir%\svnrevs_32.pl
if errorlevel 1 (
	echo Verify release failed for storage
	pause
	exit
)
