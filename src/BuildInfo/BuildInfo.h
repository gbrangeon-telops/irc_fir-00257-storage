#ifndef BUILDINFO_H
#define BUILDINFO_H

#define SVN_STORAGE_HARDWARE_REV           16112
#define SVN_STORAGE_HARDWARE_MODIFIED      0

#define SVN_STORAGE_SOFTWARE_REV           16112
#define SVN_STORAGE_SOFTWARE_MODIFIED      0

#define SVN_COMMON_REV                  16083
#define SVN_COMMON_MODIFIED             0

#define SVN_UNCOMMITTED_CHANGES         ((SVN_STORAGE_SOFTWARE_MODIFIED == 1) || (SVN_STORAGE_HARDWARE_MODIFIED == 1) || (SVN_COMMON_MODIFIED == 1))

#if SVN_UNCOMMITTED_CHANGES
#warning Uncommitted changes detected.
#endif

#endif
