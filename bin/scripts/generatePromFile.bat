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
call %x_updatemem% -meminfo %mmiFile% -data %elfFile% -bit %bitFile% -proc CORE_BD/core_wrapper_i/core_i/MCU/microblaze_0 -out %binDir%\download_16.bit -force
if errorlevel 1 (
	echo ELF anb bit file integration failed!
	pause
	exit
)

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
call %x_updatemem% -meminfo %mmiFile% -data %elfFile% -bit %bitFile% -proc CORE_BD/core_wrapper_i/core_i/MCU/microblaze_0 -out %binDir%\download_32.bit -force
if errorlevel 1 (
	echo ELF anb bit file integration failed!
	pause
	exit
)

rem Generate PROM file
rem %x_promgen% -w -p mcs -spi -c FF -o "%binDir%\prom\%baseName%.mcs" -s 16384 -u 0 %binDir%\download_32.bit > %binDir%\_promgen_32.log

rem Generate Multiboot PROM file
%x_promgen% -w -p mcs -spi -c FF -o "%binDir%\prom\fir_00257_storage.mcs" -s 16384 -u 0 %binDir%\download_16.bit -u 670000 %binDir%\download_32.bit > %binDir%\_promgen_multiboot.log
if errorlevel 1 (
	echo PROM file generation failed!
	pause
   exit
)
