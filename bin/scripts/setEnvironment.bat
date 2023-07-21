set memconf=%1
set baseName=fir_00257_storage_%memconf%

set commonDir=D:\Telops\FIR-00251-Common
set projectDir=D:\Telops\FIR-00257-Storage
set sdkDir=%projectDir%\sdk
set srcDir=%projectDir%\src
set binDir=%projectDir%\bin
set scriptsDir=%binDir%\scripts

set elfFile=%binDir%\%baseName%.elf
set hwFile=%sdkDir%\hw_%memconf%\fir_257_top.hdf

set buildInfoFile=%srcDir%\BuildInfo\BuildInfo.h
set revFile=%binDir%\svnrevs_%memconf%.pl

set tortoiseSVNDir="C:\Program Files\TortoiseSVN"
set svn_subwcrev=%tortoiseSVNDir%\bin\SubWCRev.exe

set xDir=C:\Xilinx
if exist D:\Xilinx\SDK\2018.3\*.* set xDir=D:\Xilinx
@echo Xilinx directory: %xDir%

set x_updatemem=%xDir%\SDK\2018.3\bin\updatemem.bat
set x_xsct=%xDir%\SDK\2018.3\bin\xsct.bat
set x_xilperl=%xDir%\Vivado\2018.3\ids_lite\ISE\bin\nt64\unwrapped\xilperl.exe

set xDir=C:\Xilinx
if exist D:\Xilinx\14.7\*.* set xDir=D:\Xilinx
@echo Xilinx directory: %xDir%

set x_promgen=%xDir%\14.7\LabTools\LabTools\bin\nt64\promgen.exe
