@echo off
set projectDir=D:\Telops\FIR-00257-Storage
set FirmwareReleaseVersionFile=D:\Telops\FIR-00251-Proc\bin\FirmwareReleaseVersion.txt
set FirmwareReleaseLogFile=%projectDir%\bin\scripts\FirmwareRelease.log
set svnDir="http://einstein/svn/firmware/"

REM Clean up
del %FirmwareReleaseLogFile%

REM Parse FirmwareReleaseVersionFile
for /F "tokens=1-2 delims==" %%G in ('findstr "firmwareVersionMajor" %FirmwareReleaseVersionFile%') do set major=%%H
for /F "tokens=1-2 delims==" %%G in ('findstr "firmwareVersionMinor" %FirmwareReleaseVersionFile%') do set minor=%%H
for /F "tokens=1-2 delims==" %%G in ('findstr "firmwareVersionBuild" %FirmwareReleaseVersionFile%') do set build=%%H
set firmwareReleaseVersion=%major%.%minor%.x.%build%
echo *****************************************>> %FirmwareReleaseLogFile%
echo BEGIN Firmware release %firmwareReleaseVersion%>> %FirmwareReleaseLogFile%
echo *****************************************>> %FirmwareReleaseLogFile%

echo.>> %FirmwareReleaseLogFile%
echo BEGIN Pre-release compile>> %FirmwareReleaseLogFile%

REM Set environment variables
call %projectDir%\bin\scripts\setEnvironment.bat x

REM Create and build projects for pre-release
cmd /c %x_xsct% %sdkDir%\build_all_sw.tcl 1
for %%A in (%sdkDir%\fir_00257_storage_16\Release\fir_00257_storage_16.elf %sdkDir%\fir_00257_storage_32\Release\fir_00257_storage_32.elf) do (
   if not exist %%A (
      echo Create and build project failed!
      pause
      exit
   )
)
echo Create and build projects done>> %FirmwareReleaseLogFile%

REM Copy files
call %scriptsDir%\fetchHwSwFiles.bat
echo fetchHwSwFiles done>> %FirmwareReleaseLogFile%

echo END Pre-release compile>> %FirmwareReleaseLogFile%
echo.>> %FirmwareReleaseLogFile%

REM Commit pre-release
set preReleaseMessage=Pre-release %firmwareReleaseVersion%
timeout /t 5
svn commit %projectDir% -m "%preReleaseMessage%"
svn update %projectDir%
echo *****************************************>> %FirmwareReleaseLogFile%
echo Pre-release commit done>> %FirmwareReleaseLogFile%
echo *****************************************>> %FirmwareReleaseLogFile%

echo.>> %FirmwareReleaseLogFile%
echo BEGIN Release compile>> %FirmwareReleaseLogFile%

REM Build main project
cmd /c %x_xsct% %sdkDir%\build_all_sw.tcl 0
for %%A in (%sdkDir%\fir_00257_storage_16\Release\fir_00257_storage_16.elf %sdkDir%\fir_00257_storage_32\Release\fir_00257_storage_32.elf) do (
   if not exist %%A (
      echo Create and build project failed!
      pause
      exit
   )
)
echo Build projects done>> %FirmwareReleaseLogFile%

REM Update release files
call %scriptsDir%\updateReleaseSvnRevsFile.bat
echo updateReleaseSvnRevsFile done>> %FirmwareReleaseLogFile%

REM Verify release files
call %scriptsDir%\verifyRelease.bat
echo verifyRelease done>> %FirmwareReleaseLogFile%

REM Generate prom files
call %scriptsDir%\generatePromFile.bat
echo generatePromFile done>> %FirmwareReleaseLogFile%

echo END Release compile>> %FirmwareReleaseLogFile%
echo.>> %FirmwareReleaseLogFile%

REM Commit release
set releaseMessage=Release %firmwareReleaseVersion%
timeout /t 5
svn commit %projectDir% -m "%releaseMessage%"
svn update %projectDir%
echo *****************************************>> %FirmwareReleaseLogFile%
echo Release commit done>> %FirmwareReleaseLogFile%
echo *****************************************>> %FirmwareReleaseLogFile%

echo.>> %FirmwareReleaseLogFile%
echo *****************************************>> %FirmwareReleaseLogFile%
echo END Firmware release %firmwareReleaseVersion%>> %FirmwareReleaseLogFile%
echo *****************************************>> %FirmwareReleaseLogFile%

start %FirmwareReleaseLogFile%
