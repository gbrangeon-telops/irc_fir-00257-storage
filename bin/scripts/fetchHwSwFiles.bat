call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat

set config=Release

rem Clean up
del %elfFile%
del %bitFile%
del %bmmFile%

rem Fetch hw and sw files
copy %sdkDir%\%baseName%\%config%\%baseName%.elf %elfFile%
copy %sdkDir%\hw_platform_0\fir_257_top.bit %bitFile%
copy %sdkDir%\hw_platform_0\fir_257_top_bd.bmm %bmmFile%
