@echo off
call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat x

%x_xilperl% %scriptsDir%\verifyRelease.pl^
   -sbf %buildInfoFile%^
   -sf1 %binDir%\svnrevs_16.pl -sf2 %binDir%\svnrevs_32.pl
pause
