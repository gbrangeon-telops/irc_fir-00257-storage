set config=Release

rem ###########
rem Config 16GB
rem ###########
call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 16

rem Clean up
del %elfFile%
del %bitFile%
del %bmmFile%

rem Fetch hw and sw files
copy %sdkDir%\%baseName%\%config%\%baseName%.elf %elfFile%
copy %sdkDir%\hw_platform_16\fir_257_top.bit %bitFile%
copy %sdkDir%\hw_platform_16\fir_257_top_bd.bmm %bmmFile%


rem ###########
rem Config 32GB
rem ###########

call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 32

rem Clean up
del %elfFile%
del %bitFile%
del %bmmFile%

rem Fetch hw and sw files
copy %sdkDir%\%baseName%\%config%\%baseName%.elf %elfFile%
copy %sdkDir%\hw_platform_32\fir_257_top.bit %bitFile%
copy %sdkDir%\hw_platform_32\fir_257_top_bd.bmm %bmmFile%
