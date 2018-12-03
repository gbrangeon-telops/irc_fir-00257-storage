#ifndef BUILDINFO_H
#define BUILDINFO_H

#if MEMCONF == 16

#define SVN_HARDWARE_REV   22474
#define SVN_SOFTWARE_REV   22542
#define SVN_COMMON_REV     22521

#define SVN_UNCOMMITTED_CHANGES  ((SVN_HARDWARE_REV < 0) || (SVN_SOFTWARE_REV < 0) || (SVN_COMMON_REV < 0))

#if SVN_UNCOMMITTED_CHANGES
#warning Uncommitted changes detected.
#endif

#define HARDWARE_MISMATCH (0)

#if HARDWARE_MISMATCH
#error D:\Telops\FIR-00257-Storage\sdk\hw_platform_16\system.hdf does not match D:\Telops\FIR-00257-Storage\sdk\hw_16\fir_257_top.hdf.
#endif

#elif MEMCONF == 32

#define SVN_HARDWARE_REV   22474
#define SVN_SOFTWARE_REV   22542
#define SVN_COMMON_REV     22521

#define SVN_UNCOMMITTED_CHANGES  ((SVN_HARDWARE_REV < 0) || (SVN_SOFTWARE_REV < 0) || (SVN_COMMON_REV < 0))

#if SVN_UNCOMMITTED_CHANGES
#warning Uncommitted changes detected.
#endif

#define HARDWARE_MISMATCH (0)

#if HARDWARE_MISMATCH
#error D:\Telops\FIR-00257-Storage\sdk\hw_platform_32\system.hdf does not match D:\Telops\FIR-00257-Storage\sdk\hw_32\fir_257_top.hdf.
#endif

#endif 

#endif // BUILDINFO_H
