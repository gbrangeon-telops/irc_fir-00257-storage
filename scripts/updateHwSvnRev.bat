@echo off

set MEMCONF=%1

set storageDir=D:\Telops\FIR-00257-Storage
set commonDir=D:\Telops\FIR-00251-Common
set commonHdlDir=D:\Telops\Common_HDL

set srcExtensionList=".bde" ".vhd" ".xdc"

set tortoiseSVNDir="C:\Program Files\TortoiseSVN"
set svn_subwcrev=%tortoiseSVNDir%\bin\SubWCRev.exe

set hwRevFile=%storageDir%\sdk\hw_%MEMCONF%\hw_svn_rev_%MEMCONF%.txt

REM Delete old revision file
del %hwRevFile%

echo * indicates local modifications>> %hwRevFile%
echo.>> %hwRevFile%

REM Storage repo
echo %storageDir% $WCREV$$WCMODS?*:$>> %hwRevFile%
%svn_subwcrev% %storageDir% %hwRevFile% %hwRevFile%

REM Storage IP files
for /f %%G in ('dir /b /s /a:-d %storageDir%\IP ^| findstr /v "managed_ip_project"') do (
   if "%%~xG"==".xci" (
      echo %%G $WCREV$$WCMODS?*:$>> %hwRevFile%
      %svn_subwcrev% %%G %hwRevFile% %hwRevFile%
   )
)

REM Storage scripts files
for /f %%G in ('dir /b /s /a:-d %storageDir%\scripts') do (
   echo %%G $WCREV$$WCMODS?*:$>> %hwRevFile%
   %svn_subwcrev% %%G %hwRevFile% %hwRevFile%
)

REM Storage src files
for /f %%G in ('dir /b /s /a:-d %storageDir%\src') do (
   for %%H in (%srcExtensionList%) do (
      if "%%~xG"==%%H (
         echo %%G $WCREV$$WCMODS?*:$>> %hwRevFile%
         %svn_subwcrev% %%G %hwRevFile% %hwRevFile%
      )
   )
)

REM Common repo
echo %commonDir% $WCREV$$WCMODS?*:$>> %hwRevFile%
%svn_subwcrev% %commonDir% %hwRevFile% %hwRevFile%

REM Common src files
for /f %%G in ('dir /b /s /a:-d %commonDir%\VHDL') do (
   for %%H in (%srcExtensionList%) do (
      if "%%~xG"==%%H (
         echo %%G $WCREV$$WCMODS?*:$>> %hwRevFile%
         %svn_subwcrev% %%G %hwRevFile% %hwRevFile%
      )
   )
)

REM Common_HDL repo
echo %commonHdlDir% $WCREV$$WCMODS?*:$>> %hwRevFile%
%svn_subwcrev% %commonHdlDir% %hwRevFile% %hwRevFile%

REM Common_HDL FPA files
for /f %%G in ('dir /b /s /a:-d %commonHdlDir%\Common_Projects\TEL2000\FPA_common\src') do (
   echo %%G $WCREV$$WCMODS?*:$>> %hwRevFile%
   %svn_subwcrev% %%G %hwRevFile% %hwRevFile%
)

REM Common_HDL gh files
for /f %%G in ('dir /b /s /a:-d %commonHdlDir%\gh_vhdl_lib\custom_MSI') do (
   echo %%G $WCREV$$WCMODS?*:$>> %hwRevFile%
   %svn_subwcrev% %%G %hwRevFile% %hwRevFile%
)

REM Common_HDL RS232 file
echo %commonHdlDir%\RS232\uarts.vhd $WCREV$$WCMODS?*:$>> %hwRevFile%
%svn_subwcrev% %commonHdlDir%\RS232\uarts.vhd %hwRevFile% %hwRevFile%

REM Common_HDL SPI files
for /f %%G in ('dir /b /a:-d %commonHdlDir%\SPI\*.vhd') do (
   echo %commonHdlDir%\SPI\%%G $WCREV$$WCMODS?*:$>> %hwRevFile%
   %svn_subwcrev% %commonHdlDir%\SPI\%%G %hwRevFile% %hwRevFile%
)

REM Common_HDL Utilities files
for /f %%G in ('dir /b /a:-d %commonHdlDir%\Utilities\*.vhd') do (
   echo %commonHdlDir%\Utilities\%%G $WCREV$$WCMODS?*:$>> %hwRevFile%
   %svn_subwcrev% %commonHdlDir%\Utilities\%%G %hwRevFile% %hwRevFile%
)
