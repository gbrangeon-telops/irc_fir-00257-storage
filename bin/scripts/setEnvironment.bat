set memconf=%1
set baseName=fir_00257_storage_%memconf%

set commonDir=D:\Telops\FIR-00251-Common
set projectDir=D:\Telops\FIR-00257-Storage
set sdkDir=%projectDir%\sdk
set srcDir=%projectDir%\src
set binDir=%projectDir%\bin
set scriptsDir=%binDir%\scripts

set elfFile=%binDir%\%baseName%.elf
set bitFile=%binDir%\fir_257_top_%memconf%.bit
set mmiFile=%binDir%\fir_257_top_%memconf%.mmi
set buildInfoFile=%srcDir%\BuildInfo\BuildInfo.h
set releaseFile=%binDir%\%baseName%_release_%memconf%.bin
set releaseLogFile=%binDir%\%baseName%_release_%memconf%.txt
set revFile=%binDir%\svnrevs_%memconf%.pl

set tortoiseSVNDir="C:\Program Files\TortoiseSVN"
set svn_subwcrev=%tortoiseSVNDir%\bin\SubWCRev.exe

set xDir=C:\Xilinx
if exist D:\Xilinx\SDK\2016.3\*.* set xDir=D:\Xilinx
@echo Xilinx directory: %xDir%

set x_data2mem=%xDir%\SDK\2016.3\bin\unwrapped\win64.o\data2mem.exe
set x_updatemem=%xDir%\SDK\2016.3\bin\updatemem.bat
set x_xilperl=%xDir%\Vivado\2016.3\ids_lite\ISE\bin\nt64\xilperl.exe

set xDir=C:\Xilinx
if exist D:\Xilinx\14.7\*.* set xDir=D:\Xilinx
@echo Xilinx directory: %xDir%

set x_promgen=%xDir%\14.7\LabTools\LabTools\bin\nt64\promgen.exe
