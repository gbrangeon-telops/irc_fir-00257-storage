rem ###########
rem Config 16GB
rem ###########
call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 16

rem Clean up
del %revFile%

echo our $rel_storage_hw_rev = $WCREV$;> %revFile%
%svn_subwcrev% %bitFile% %revFile% %revFile%

echo our $rel_storage_sw_rev = $WCREV$;>> %revFile%
%svn_subwcrev% %elfFile% %revFile% %revFile%

echo our $rel_storage_boot_rev = 0;>> %revFile%

echo our $rel_storage_common_rev = $WCREV$;>> %revFile%
%svn_subwcrev% %commonDir% %revFile% %revFile%

echo 1;>> %revFile%


rem ###########
rem Config 32GB
rem ###########
call D:\Telops\FIR-00257-Storage\bin\scripts\setEnvironment.bat 32

rem Clean up
del %revFile%

echo our $rel_storage_hw_rev = $WCREV$;> %revFile%
%svn_subwcrev% %bitFile% %revFile% %revFile%

echo our $rel_storage_sw_rev = $WCREV$;>> %revFile%
%svn_subwcrev% %elfFile% %revFile% %revFile%

echo our $rel_storage_boot_rev = 0;>> %revFile%

echo our $rel_storage_common_rev = $WCREV$;>> %revFile%
%svn_subwcrev% %commonDir% %revFile% %revFile%

echo 1;>> %revFile%
