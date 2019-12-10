rem Fetch hw and sw files (all memconf)
call D:\Telops\FIR-00257-Storage\bin\scripts\fetchHwSwFiles.bat

call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 16

rem Clean up
del %binDir%\download_%memconf%.bit
del %binDir%\_data2mem_%memconf%.log
del %binDir%\_promgen_%memconf%.log

set bitFile=%sdkDir%\hw_platform_%memconf%\fir_257_top.bit
set mmiFile=%sdkDir%\hw_platform_%memconf%\fir_257_top.mmi

rem Integrate software elf file to bit file
set mcuInstPath=CORE_BD/core_wrapper_i/core_i/MCU/microblaze_0
call %x_updatemem% -meminfo %mmiFile% -data %elfFile% -bit %bitFile% -proc %mcuInstPath% -out %binDir%\download_%memconf%.bit -force
if errorlevel 1 (
	echo ELF anb bit file integration failed!
	pause
	exit
)

rem Generate PROM file
rem %x_promgen% -w -p mcs -spi -c FF -o "%binDir%\prom\%baseName%.mcs" -s 16384 -u 0 %binDir%\download_%memconf%.bit > %binDir%\_promgen_%memconf%.log


call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 32

rem Clean up
del %binDir%\download_%memconf%.bit
del %binDir%\_data2mem_%memconf%.log
del %binDir%\_promgen_%memconf%.log

set bitFile=%sdkDir%\hw_platform_%memconf%\fir_257_top.bit
set mmiFile=%sdkDir%\hw_platform_%memconf%\fir_257_top.mmi

rem Integrate software elf file to bit file
set mcuInstPath=CORE_BD/core_wrapper_i/core_i/MCU/microblaze_0
call %x_updatemem% -meminfo %mmiFile% -data %elfFile% -bit %bitFile% -proc %mcuInstPath% -out %binDir%\download_%memconf%.bit -force
if errorlevel 1 (
	echo ELF anb bit file integration failed!
	pause
	exit
)

rem Generate PROM file
rem %x_promgen% -w -p mcs -spi -c FF -o "%binDir%\prom\%baseName%.mcs" -s 16384 -u 0 %binDir%\download_%memconf%.bit > %binDir%\_promgen_%memconf%.log

rem Clean up
del %cd%\updatemem*
del %binDir%\_promgen_multiboot.log

rem Generate Multiboot PROM file
%x_promgen% -w -p mcs -spi -c FF -o "%binDir%\prom\fir_00257_storage.mcs" -s 16384 -u 0 %binDir%\download_16.bit -u 670000 %binDir%\download_32.bit > %binDir%\_promgen_multiboot.log
if errorlevel 1 (
	echo PROM file generation failed!
	pause
   exit
)
