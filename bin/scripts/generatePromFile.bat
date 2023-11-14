@echo off

call D:\Telops\FIR-00251-Storage\bin\scripts\setEnvironment.bat 

call %xDir%\Vivado\2018.3\bin\vivado -mode batch -source generatePromFile.tcl
