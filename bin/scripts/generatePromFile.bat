rem Fetch hw and sw files
call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat xx
call %scriptsDir%\fetchHwSwFiles.bat

rem ###########
rem Config 16GB
rem ###########
call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 16

rem Clean up
del %binDir%\download_16.bit
del %binDir%\_data2mem_16.log
del %binDir%\_promgen_16.log

rem Integrate software elf file to bit file
%x_data2mem% -bm %bmmFile% -bt %bitFile% -bd %elfFile% -o b %binDir%\download_16.bit -log %binDir%\_data2mem_16.log

rem Generate PROM file
rem %x_promgen% -w -p mcs -spi -c FF -o "%binDir%\prom\%baseName%.mcs" -s 16384 -u 0 %binDir%\download_16.bit > %binDir%\_promgen_16.log


rem ###########
rem Config 32GB
rem ###########
call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 32

rem Clean up
del %binDir%\download_32.bit
del %binDir%\_data2mem_32.log
del %binDir%\_promgen_32.log

rem Integrate software elf file to bit file
%x_data2mem% -bm %bmmFile% -bt %bitFile% -bd %elfFile% -o b %binDir%\download_32.bit -log %binDir%\_data2mem_32.log

rem Generate PROM file
rem %x_promgen% -w -p mcs -spi -c FF -o "%binDir%\prom\%baseName%.mcs" -s 16384 -u 0 %binDir%\download_32.bit > %binDir%\_promgen_32.log

rem Generate Multiboot PROM file
%x_promgen% -w -p mcs -spi -c FF -o "%binDir%\prom\FIR-00257_storage_multiboot.mcs" -s 16384 -u 0 %binDir%\download_16.bit -u 670000 %binDir%\download_32.bit > %binDir%\_promgen_multiboot.log
pause