@echo off

call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 16
rem Clean up
del %buildInfoFile%

echo #ifndef BUILDINFO_H>> %buildInfoFile%
echo #define BUILDINFO_H>> %buildInfoFile%
echo.>> %buildInfoFile%

echo #if MEMCONF == 16>> %buildInfoFile%
echo.>> %buildInfoFile%
rem Get hardware revision
echo #define SVN_HARDWARE_REV      $WCMODS?-:$$WCREV$>> %buildInfoFile%
%svn_subwcrev% %hwFile% %buildInfoFile% %buildInfoFile%

rem Get software revision
echo #define SVN_SOFTWARE_REV      $WCMODS?-:$$WCREV$>> %buildInfoFile%
%svn_subwcrev% %elfFile% %buildInfoFile% %buildInfoFile%

rem Get boot loader revision
echo #define SVN_BOOTLOADER_REV    0 >> %buildInfoFile%

rem Get common directory revision
echo #define SVN_COMMON_REV        $WCMODS?-:$$WCREV$>> %buildInfoFile%
%svn_subwcrev% %commonDir% %buildInfoFile% %buildInfoFile%

rem Check for uncommitted changes
echo.>> %buildInfoFile%
echo #define SVN_UNCOMMITTED_CHANGES  ((SVN_HARDWARE_REV ^< 0) ^|^| (SVN_SOFTWARE_REV ^< 0) ^|^| (SVN_BOOTLOADER_REV ^< 0) ^|^| (SVN_COMMON_REV ^< 0))>> %buildInfoFile%
echo.>> %buildInfoFile%
echo #if SVN_UNCOMMITTED_CHANGES>> %buildInfoFile%
echo #warning Uncommitted changes detected.>> %buildInfoFile%
echo #endif>> %buildInfoFile%

rem Check for hardware definition file mismatch
set hwFilePlatform=%sdkDir%\hw_platform_%memconf%\system.hdf
%x_xilperl% %scriptsDir%\compareFiles.pl -f1 %hwFile% -f2 %hwFilePlatform%
set hardwareMismatch=%errorlevel%

echo.>> %buildInfoFile%
echo #define HARDWARE_MISMATCH (%hardwareMismatch%)>> %buildInfoFile%
echo.>> %buildInfoFile%
echo #if HARDWARE_MISMATCH>> %buildInfoFile%
echo #error %hwFilePlatform% does not match %hwFile%>> %buildInfoFile%
echo #endif>> %buildInfoFile%
echo.>> %buildInfoFile%

echo #elif MEMCONF == 32>> %buildInfoFile%
echo.>> %buildInfoFile%
rem switch ENV variable
call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 32

rem Get hardware revision
echo #define SVN_HARDWARE_REV      $WCMODS?-:$$WCREV$>> %buildInfoFile%
%svn_subwcrev% %hwFile% %buildInfoFile% %buildInfoFile%

rem Get software revision
echo #define SVN_SOFTWARE_REV      $WCMODS?-:$$WCREV$>> %buildInfoFile%
%svn_subwcrev% %elfFile% %buildInfoFile% %buildInfoFile%

rem Get boot loader revision
echo #define SVN_BOOTLOADER_REV    0 >> %buildInfoFile%

rem Get common directory revision
echo #define SVN_COMMON_REV        $WCMODS?-:$$WCREV$>> %buildInfoFile%
%svn_subwcrev% %commonDir% %buildInfoFile% %buildInfoFile%

rem Check for uncommitted changes
echo.>> %buildInfoFile%
echo #define SVN_UNCOMMITTED_CHANGES  ((SVN_HARDWARE_REV ^< 0) ^|^| (SVN_SOFTWARE_REV ^< 0) ^|^| (SVN_BOOTLOADER_REV ^< 0) ^|^| (SVN_COMMON_REV ^< 0))>> %buildInfoFile%
echo.>> %buildInfoFile%
echo #if SVN_UNCOMMITTED_CHANGES>> %buildInfoFile%
echo #warning Uncommitted changes detected.>> %buildInfoFile%
echo #endif>> %buildInfoFile%

rem Check for hardware definition file mismatch
set hwFilePlatform=%sdkDir%\hw_platform_%memconf%\system.hdf
%x_xilperl% %scriptsDir%\compareFiles.pl -f1 %hwFile% -f2 %hwFilePlatform%
set hardwareMismatch=%errorlevel%

echo.>> %buildInfoFile%
echo #define HARDWARE_MISMATCH (%hardwareMismatch%)>> %buildInfoFile%
echo.>> %buildInfoFile%
echo #if HARDWARE_MISMATCH>> %buildInfoFile%
echo #error %hwFilePlatform% does not match %hwFile%>> %buildInfoFile%
echo #endif>> %buildInfoFile%
echo.>> %buildInfoFile%

echo #endif  // MEMCONF Check>> %buildInfoFile%
echo.>> %buildInfoFile%

echo #endif // BUILDINFO_H>> %buildInfoFile%
