call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat

rem Clean up
del %revFile%

echo our $rel_storage_hw_rev = $WCREV$;> %revFile%
echo our $rel_storage_hw_modified = $WCMODS?1:0$;>> %revFile%
%svn_subwcrev% %bitFile% %revFile% %revFile%

echo our $rel_storage_sw_rev = $WCREV$;>> %revFile%
echo our $rel_storage_sw_modified = $WCMODS?1:0$;>> %revFile%
%svn_subwcrev% %elfFile% %revFile% %revFile%

echo our $rel_storage_boot_rev = 0;>> %revFile%
echo our $rel_storage_boot_modified = 0;>> %revFile%

echo our $rel_storage_common_rev = $WCREV$;>> %revFile%
echo our $rel_storage_common_modified = $WCMODS?1:0$;>> %revFile%
%svn_subwcrev% %commonDir% %revFile% %revFile%

echo 1;>> %revFile%