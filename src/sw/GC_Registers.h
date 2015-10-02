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

#include "GC_Manager.h"
#include <stdint.h>

/* AUTO-CODE BEGIN */
// Auto-generated GeniCam library.
// Generated from XML camera definition file version 10.10.1
// using generateGenICamCLib.m Matlab script.

// Registers data structure and data type
////////////////////////////////////////////////////////////////////////////////

/**
 * Registers data structure
 */
struct gcRegistersDataStruct {
   float AcquisitionFrameRate;
   float MemoryBufferSequenceDownloadBitRateMax;
   int32_t DeviceFirmwareModuleRevision;
   uint32_t AcquisitionArm;
   uint32_t AcquisitionFrameRateMode;
   uint32_t AcquisitionStart;
   uint32_t AcquisitionStop;
   uint32_t DeviceFirmwareModuleSelector;
   uint32_t FValSize;
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
   uint32_t SensorHeight;
   uint32_t SensorWidth;
   uint32_t TriggerMode;
   uint32_t TriggerSelector;
   uint32_t Width;
};

/**
 * Registers data type
 */
typedef struct gcRegistersDataStruct gcRegistersData_t;

// GenICam global variables declaration
////////////////////////////////////////////////////////////////////////////////

extern gcRegistersData_t gcRegsDataFactory;

extern gcRegistersData_t gcRegsData;

#define DeviceFirmwareModuleRevisionAryLen 12
extern int32_t DeviceFirmwareModuleRevisionAry[DeviceFirmwareModuleRevisionAryLen];

#define TriggerModeAryLen 3
extern uint32_t TriggerModeAry[TriggerModeAryLen];

// Shared registers write macros
////////////////////////////////////////////////////////////////////////////////

#define GC_SetMemoryBufferMode(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferModeIdx], val)
#define GC_SetMemoryBufferSequenceCount(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceCountIdx], val)
#define GC_SetMemoryBufferSequenceDownloadMode(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceDownloadModeIdx], val)

void GC_Registers_Init();

/* AUTO-CODE END */

void GC_SetDefaultRegsData();
void GC_UpdateLockedFlag();
void GC_UpdateMemoryBufferSequenceSizeLimits();
void GC_UpdateMemoryBufferNumberOfSequenceLimits();
void GC_UpdateMemoryBufferSequencePreMOISizeLimits();

#endif // GC_REGISTERS_H
