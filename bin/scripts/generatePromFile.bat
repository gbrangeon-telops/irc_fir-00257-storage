call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat

rem Clean up
del %binDir%\download.bit
del %binDir%\_data2mem.log
del %binDir%\_promgen.log

rem Fetch hw and sw files
call %scriptsDir%\fetchHwSwFiles.bat

rem Integrate software elf file to bit file
%x_data2mem% -bm %bmmFile% -bt %bitFile% -bd %elfFile% -o b %binDir%\download.bit -log %binDir%\_data2mem.log

rem Generate PROM file
%x_promgen% -w -p mcs -spi -c FF -o "%binDir%\prom\%baseName%.mcs" -s 16384 -u 0 %binDir%\download.bit > %binDir%\_promgen.log
