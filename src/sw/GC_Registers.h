/**
 * @file GC_Registers.h
 * GenICam registers data declaration.
 *
 * This file declares the GenICam registers data.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef GC_REGISTERS_H
#define GC_REGISTERS_H

#include <stdint.h>


/* AUTO-CODE BEGIN */
// Auto-generated GeniCam library.
// Generated from XML camera definition file version 10.3.0
// using generateGenICamCLib.m Matlab script.

// Registers data structure and data type
////////////////////////////////////////////////////////////////////////////////

/**
 * Registers data structure
 */
struct gcRegistersDataStruct {
   uint32_t Height;
   uint32_t MemoryBufferMode;
   uint32_t MemoryBufferNumberOfImagesMax;
   uint32_t MemoryBufferNumberOfSequences;
   uint32_t MemoryBufferNumberOfSequencesMax;
   uint32_t MemoryBufferSequenceClearAll;
   uint32_t MemoryBufferSequenceCount;
   uint32_t MemoryBufferSequenceDownloadImageFrameID;
   uint32_t MemoryBufferSequenceDownloadMode;
   uint32_t MemoryBufferSequenceFirstFrameID;
   uint32_t MemoryBufferSequenceMOIFrameID;
   uint32_t MemoryBufferSequencePreMOISize;
   uint32_t MemoryBufferSequenceRecordedSize;
   uint32_t MemoryBufferSequenceSelector;
   uint32_t MemoryBufferSequenceSize;
   uint32_t MemoryBufferSequenceSizeMax;
   uint32_t Width;
};

/**
 * Registers data type
 */
typedef struct gcRegistersDataStruct gcRegistersData_t;


extern gcRegistersData_t gcRegsData;

/* AUTO-CODE END */



#endif // GC_REGISTERS_H