call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat

rem Clean up
del %buildInfoFile%

echo #ifndef BUILDINFO_H> %buildInfoFile%
echo #define BUILDINFO_H>> %buildInfoFile%

% rem Get hardware revision
echo.>> %buildInfoFile%
echo #define SVN_STORAGE_HARDWARE_REV           $WCREV$>> %buildInfoFile%
echo #define SVN_STORAGE_HARDWARE_MODIFIED      $WCMODS?1:0$>> %buildInfoFile%
%svn_subwcrev% %bitFile% %buildInfoFile% %buildInfoFile%

% rem Get software revision
echo.>> %buildInfoFile%
echo #define SVN_STORAGE_SOFTWARE_REV           $WCREV$>> %buildInfoFile%
echo #define SVN_STORAGE_SOFTWARE_MODIFIED      $WCMODS?1:0$>> %buildInfoFile%
%svn_subwcrev% %elfFile% %buildInfoFile% %buildInfoFile%

% rem Get common directory revision
echo.>> %buildInfoFile%
echo #define SVN_COMMON_REV                  $WCREV$>> %buildInfoFile%
echo #define SVN_COMMON_MODIFIED             $WCMODS?1:0$>> %buildInfoFile%
%svn_subwcrev% %commonDir% %buildInfoFile% %buildInfoFile%

% rem Check for uncommitted changes
echo.>> %buildInfoFile%
echo #define SVN_UNCOMMITTED_CHANGES         ((SVN_STORAGE_SOFTWARE_MODIFIED ^=^= 1) ^|^| (SVN_STORAGE_HARDWARE_MODIFIED ^=^= 1) ^|^| (SVN_COMMON_MODIFIED ^=^= 1))>> %buildInfoFile%
echo.>> %buildInfoFile%
echo #if SVN_UNCOMMITTED_CHANGES>> %buildInfoFile%
rem echo #ifdef DEBUG>> %buildInfoFile%
echo #warning Uncommitted changes detected.>> %buildInfoFile%
rem echo #else>> %buildInfoFile%
rem echo #error Uncommitted changes detected. Commit your changes first.>> %buildInfoFile%
rem echo #endif>> %buildInfoFile%
echo #endif>> %buildInfoFile%
echo.>> %buildInfoFile%
echo #endif>> %buildInfoFile%
