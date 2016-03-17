#ifndef BUILDINFO_H
#define BUILDINFO_H

#define SVN_HARDWARE_REV   18184
#define SVN_SOFTWARE_REV   18185
#define SVN_COMMON_REV     18208

#define SVN_UNCOMMITTED_CHANGES  ((SVN_HARDWARE_REV < 0) || (SVN_SOFTWARE_REV < 0) || (SVN_COMMON_REV < 0))

#if SVN_UNCOMMITTED_CHANGES
#warning Uncommitted changes detected.
#endif

#define HARDWARE_MISMATCH (0)

#if HARDWARE_MISMATCH
#error D:\Telops\FIR-00257-Storage\sdk\hw_platform_0\system.hdf does not match D:\Telops\FIR-00257-Storage\sdk\hw\fir_257_top.hdf.
#endif

#endif // BUILDINFO_H
