set baseName=fir_00257_storage

set commonDir=D:\Telops\FIR-00251-Common
set projectDir=D:\Telops\FIR-00257-Storage
set sdkDir=%projectDir%\sdk
set srcDir=%projectDir%\src
set binDir=%projectDir%\bin
set scriptsDir=%binDir%\scripts

set elfFile=%binDir%\%baseName%.elf
set bitFile=%binDir%\fir_257_top.bit
set bmmFile=%binDir%\fir_257_top_bd.bmm
set buildInfoFile=%srcDir%\BuildInfo\BuildInfo.h
set releaseFile=%binDir%\%baseName%_release.bin
set releaseLogFile=%binDir%\%baseName%_release.txt
set revFile=%binDir%\svnrevs.pl

set tortoiseSVNDir="C:\Program Files\TortoiseSVN"
set svn_subwcrev=%tortoiseSVNDir%\bin\SubWCRev.exe

set xDir=C:\Xilinx
if exist D:\Xilinx\SDK\2014.4\*.* set xDir=D:\Xilinx
@echo Xilinx directory: %xDir%

set x_data2mem=%xDir%\SDK\2014.4\bin\unwrapped\win64.o\data2mem.exe
set x_xilperl=%xDir%\Vivado\2014.4\ids_lite\ISE\bin\nt64\xilperl.exe

set xDir=C:\Xilinx
if exist D:\Xilinx\14.7\*.* set xDir=D:\Xilinx
@echo Xilinx directory: %xDir%

set x_promgen=%xDir%\14.7\LabTools\LabTools\bin\nt64\promgen.exe
