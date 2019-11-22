set config=Release

rem ###########
rem Config 16GB
rem ###########
call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 16

rem Clean up
del %elfFile%
del %bitFile%
del %mmiFile%

rem Fetch hw and sw files
copy %sdkDir%\%baseName%\%config%\%baseName%.elf %elfFile%
if errorlevel 1 goto err
copy %sdkDir%\hw_platform_16\fir_257_top.bit %bitFile%
if errorlevel 1 goto err
copy %sdkDir%\hw_platform_16\fir_257_top.mmi %mmiFile%
if errorlevel 1 goto err

rem ###########
rem Config 32GB
rem ###########
call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 32

rem Clean up
del %elfFile%
del %bitFile%
del %mmiFile%

rem Fetch hw and sw files
copy %sdkDir%\%baseName%\%config%\%baseName%.elf %elfFile%
if errorlevel 1 goto err
copy %sdkDir%\hw_platform_32\fir_257_top.bit %bitFile%
if errorlevel 1 goto err
copy %sdkDir%\hw_platform_32\fir_257_top.mmi %mmiFile%
if errorlevel 1 goto err
goto end

:err
echo Copy failed!
pause
exit

:end
