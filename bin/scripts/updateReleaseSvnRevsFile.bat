call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 16

rem Clean up
del %revFile%

echo our $rel_storage_hw_rev1 = $WCREV$;> %revFile%
%svn_subwcrev% %hwFile% %revFile% %revFile%

echo our $rel_storage_sw_rev1 = $WCREV$;>> %revFile%
%svn_subwcrev% %elfFile% %revFile% %revFile%

echo our $rel_storage_boot_rev1 = 0;>> %revFile%

echo our $rel_storage_common_rev1 = $WCREV$;>> %revFile%
%svn_subwcrev% %commonDir% %revFile% %revFile%


call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 32

rem Clean up
del %revFile%

echo our $rel_storage_hw_rev2 = $WCREV$;> %revFile%
%svn_subwcrev% %hwFile% %revFile% %revFile%

echo our $rel_storage_sw_rev2 = $WCREV$;>> %revFile%
%svn_subwcrev% %elfFile% %revFile% %revFile%

echo our $rel_storage_boot_rev2 = 0;>> %revFile%

echo our $rel_storage_common_rev2 = $WCREV$;>> %revFile%
%svn_subwcrev% %commonDir% %revFile% %revFile%
