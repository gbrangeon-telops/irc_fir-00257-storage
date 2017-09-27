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

#define GC_AcquisitionStarted    (gAcquisitionStarted == 1)

/* AUTO-CODE BEGIN */
// Auto-generated GeniCam library.
// Generated from XML camera definition file version 12.1.0
// using generateGenICamCLib.m Matlab script.

#if ((GC_XMLMAJORVERSION != 12) || (GC_XMLMINORVERSION != 1) || (GC_XMLSUBMINORVERSION != 0))
#error "XML version mismatch."
#endif

// Registers data structure and data type
////////////////////////////////////////////////////////////////////////////////

/**
 * Registers data structure
 */
struct gcRegistersDataStruct {
   float AcquisitionFrameRate;
   float AcquisitionFrameRateMaxFG;
   float DeviceTemperature;
   float DeviceVoltage;
   float MemoryBufferSequenceDownloadBitRateMax;
   int32_t DeviceFirmwareModuleRevision;
   uint32_t AcquisitionArm;
   uint32_t AcquisitionFrameRateMode;
   uint32_t AcquisitionStart;
   uint32_t AcquisitionStop;
   uint32_t CalibrationMode;
   uint32_t DeviceBuiltInTestsResults7;
   uint32_t DeviceBuiltInTestsResults8;
   uint32_t DeviceFirmwareModuleSelector;
   uint32_t DeviceTemperatureSelector;
   uint32_t DeviceVoltageSelector;
   uint32_t EventError;
   uint32_t EventErrorCode;
   uint32_t EventErrorTimestamp;
   uint32_t EventNotification;
   uint32_t EventSelector;
   uint32_t EventTelops;
   uint32_t EventTelopsCode;
   uint32_t EventTelopsTimestamp;
   uint32_t FValSize;
   uint32_t Height;
   uint32_t MemoryBufferAvailableFreeSpaceHigh;
   uint32_t MemoryBufferAvailableFreeSpaceLow;
   uint32_t MemoryBufferFragmentedFreeSpaceHigh;
   uint32_t MemoryBufferFragmentedFreeSpaceLow;
   uint32_t MemoryBufferLegacyMode;
   uint32_t MemoryBufferMOIActivation;
   uint32_t MemoryBufferMOISource;
   uint32_t MemoryBufferMode;
   uint32_t MemoryBufferNumberOfImagesMax;
   uint32_t MemoryBufferNumberOfSequences;
   uint32_t MemoryBufferNumberOfSequencesMax;
   uint32_t MemoryBufferSequenceClear;
   uint32_t MemoryBufferSequenceClearAll;
   uint32_t MemoryBufferSequenceCount;
   uint32_t MemoryBufferSequenceDefrag;
   uint32_t MemoryBufferSequenceDownloadFrameCount;
   uint32_t MemoryBufferSequenceDownloadFrameID;
   uint32_t MemoryBufferSequenceDownloadImageFrameID;
   uint32_t MemoryBufferSequenceDownloadMode;
   uint32_t MemoryBufferSequenceFirstFrameID;
   uint32_t MemoryBufferSequenceHeight;
   uint32_t MemoryBufferSequenceMOIFrameID;
   uint32_t MemoryBufferSequenceOffsetX;
   uint32_t MemoryBufferSequenceOffsetY;
   uint32_t MemoryBufferSequencePreMOISize;
   uint32_t MemoryBufferSequenceRecordedSize;
   uint32_t MemoryBufferSequenceSelector;
   uint32_t MemoryBufferSequenceSize;
   uint32_t MemoryBufferSequenceSizeInc;
   uint32_t MemoryBufferSequenceSizeMax;
   uint32_t MemoryBufferSequenceSizeMin;
   uint32_t MemoryBufferSequenceWidth;
   uint32_t MemoryBufferStatus;
   uint32_t MemoryBufferTotalSpaceHigh;
   uint32_t MemoryBufferTotalSpaceLow;
   uint32_t OffsetX;
   uint32_t OffsetY;
   uint32_t ReverseX;
   uint32_t ReverseY;
   uint32_t SensorHeight;
   uint32_t SensorWidth;
   uint32_t TriggerMode;
   uint32_t TriggerSelector;
   uint32_t VideoAGC;
   uint32_t VideoFreeze;
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

#define DeviceTemperatureAryLen 13
extern float DeviceTemperatureAry[DeviceTemperatureAryLen];

#define DeviceVoltageAryLen 31
extern float DeviceVoltageAry[DeviceVoltageAryLen];

#define EventNotificationAryLen 33
extern uint32_t EventNotificationAry[EventNotificationAryLen];

#define DeviceFirmwareModuleRevisionAryLen 12
extern int32_t DeviceFirmwareModuleRevisionAry[DeviceFirmwareModuleRevisionAryLen];

#define TriggerModeAryLen 3
extern uint32_t TriggerModeAry[TriggerModeAryLen];

// Shared registers write macros
////////////////////////////////////////////////////////////////////////////////

#define GC_SetMemoryBufferMode(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferModeIdx], val)
#define GC_SetMemoryBufferLegacyMode(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferLegacyModeIdx], val)
#define GC_SetMemoryBufferStatus(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferStatusIdx], val)
#define GC_SetMemoryBufferSequenceCount(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceCountIdx], val)
#define GC_SetMemoryBufferSequenceDownloadMode(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceDownloadModeIdx], val)

// Locked registers utility macros
////////////////////////////////////////////////////////////////////////////////
#define GC_MemoryBufferNotEmpty (gcRegsData.MemoryBufferSequenceCount > 0)
#define GC_WaitingForImageCorrection (((/* TDCStatusReg not found */ 0) & 0x00002000) == 0x00002000)

void GC_Registers_Init();

/* AUTO-CODE END */

void GC_UpdateLockedFlag();
void GC_SetDefaultRegsData();
void GC_UpdateMemoryBufferSequenceSizeLimits();
void GC_UpdateMemoryBufferNumberOfSequenceLimits();
void GC_UpdateMemoryBufferSequencePreMOISizeLimits();
uint32_t GC_GetTimestamp();

#endif // GC_REGISTERS_H
