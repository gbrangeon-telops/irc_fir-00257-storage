@echo off
call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat

rem Clean up
del %buildInfoFile%

echo #ifndef BUILDINFO_H> %buildInfoFile%
echo #define BUILDINFO_H>> %buildInfoFile%
echo.>> %buildInfoFile%

rem Get hardware revision
echo #define SVN_HARDWARE_REV   $WCMODS?-:$$WCREV$>> %buildInfoFile%
%svn_subwcrev% %bitFile% %buildInfoFile% %buildInfoFile%

rem Get software revision
echo #define SVN_SOFTWARE_REV   $WCMODS?-:$$WCREV$>> %buildInfoFile%
%svn_subwcrev% %elfFile% %buildInfoFile% %buildInfoFile%

rem Get common directory revision
echo #define SVN_COMMON_REV     $WCMODS?-:$$WCREV$>> %buildInfoFile%
%svn_subwcrev% %commonDir% %buildInfoFile% %buildInfoFile%

rem Check for uncommitted changes
echo.>> %buildInfoFile%
echo #define SVN_UNCOMMITTED_CHANGES  ((SVN_HARDWARE_REV ^< 0) ^|^| (SVN_SOFTWARE_REV ^< 0) ^|^| (SVN_COMMON_REV ^< 0))>> %buildInfoFile%
echo.>> %buildInfoFile%
echo #if SVN_UNCOMMITTED_CHANGES>> %buildInfoFile%
echo #warning Uncommitted changes detected.>> %buildInfoFile%
echo #endif>> %buildInfoFile%

rem Check for hardware definition file mismatch
set hwFile1=%sdkDir%\hw_platform_0\system.hdf
set hwFile2=%sdkDir%\hw\fir_257_top.hdf
%x_xilperl% %scriptsDir%\compareFiles.pl -f1 %hwFile1% -f2 %hwFile2%
set hardwareMismatch=%errorlevel%

echo.>> %buildInfoFile%
echo #define HARDWARE_MISMATCH (%hardwareMismatch%)>> %buildInfoFile%
echo.>> %buildInfoFile%
echo #if HARDWARE_MISMATCH>> %buildInfoFile%
echo #error %hwFile1% does not match %hwFile2%.>> %buildInfoFile%
echo #endif>> %buildInfoFile%

echo.>> %buildInfoFile%
echo #endif // BUILDINFO_H>> %buildInfoFile%
