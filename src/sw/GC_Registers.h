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

extern uint8_t gAcquisitionStarted;
#define GC_AcquisitionStarted                (gAcquisitionStarted == 1)
#define GC_ExternalMemoryBufferIsImplemented (1) // We are in the storage firmware !!!

/* AUTO-CODE BEGIN */
// Auto-generated GeniCam library.
// Generated from XML camera definition file version 13.3.1
// using generateGenICamCLib.m Matlab script.

#if ((GC_XMLMAJORVERSION != 13) || (GC_XMLMINORVERSION != 3) || (GC_XMLSUBMINORVERSION != 1))
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
   float DeviceClockFrequency;
   float DeviceTemperature;
   float DeviceVoltage;
   float MemoryBufferSequenceDownloadBitRateMax;
   int32_t DeviceFirmwareModuleRevision;
   uint32_t AcquisitionArm;
   uint32_t AcquisitionFrameRateMode;
   uint32_t AcquisitionStart;
   uint32_t AcquisitionStop;
   uint32_t BadPixelReplacement;
   uint32_t CalibrationMode;
   uint32_t ClConfiguration;
   uint32_t DeviceBuiltInTestsResults7;
   uint32_t DeviceBuiltInTestsResults8;
   uint32_t DeviceClockSelector;
   uint32_t DeviceFirmwareModuleSelector;
   uint32_t DeviceTemperatureSelector;
   uint32_t DeviceVoltageSelector;
   uint32_t EHDRINumberOfExposures;
   uint32_t EventError;
   uint32_t EventErrorCode;
   uint32_t EventErrorTimestamp;
   uint32_t EventNotification;
   uint32_t EventSelector;
   uint32_t EventTelops;
   uint32_t EventTelopsCode;
   uint32_t EventTelopsTimestamp;
   uint32_t FValSize;
   uint32_t FWMode;
   uint32_t Height;
   uint32_t IsActiveFlags;
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
   uint32_t MemoryBufferNumberOfSequencesMin;
   uint32_t MemoryBufferSequenceBadPixelReplacement;
   uint32_t MemoryBufferSequenceCalibrationMode;
   uint32_t MemoryBufferSequenceClear;
   uint32_t MemoryBufferSequenceClearAll;
   uint32_t MemoryBufferSequenceCount;
   uint32_t MemoryBufferSequenceDefrag;
   uint32_t MemoryBufferSequenceDownloadFrameCount;
   uint32_t MemoryBufferSequenceDownloadFrameID;
   uint32_t MemoryBufferSequenceDownloadFrameImageCount;
   uint32_t MemoryBufferSequenceDownloadImageFrameID;
   uint32_t MemoryBufferSequenceDownloadMode;
   uint32_t MemoryBufferSequenceDownloadSuggestedFrameImageCount;
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
   uint32_t PayloadSizeMinFG;
   uint32_t ReverseX;
   uint32_t ReverseY;
   uint32_t SensorHeight;
   uint32_t SensorWidth;
   uint32_t TDCFlags;
   uint32_t TDCFlags2;
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

#define gcSelectedRegListLen 5
extern gcSelectedReg_t gcSelectedRegList[gcSelectedRegListLen];

#define DeviceClockFrequencyAryLen 3
extern float DeviceClockFrequencyAry[DeviceClockFrequencyAryLen];

#define DeviceTemperatureAryLen 13
extern float DeviceTemperatureAry[DeviceTemperatureAryLen];

#define DeviceVoltageAryLen 31
extern float DeviceVoltageAry[DeviceVoltageAryLen];

#define EventNotificationAryLen 33
extern uint32_t EventNotificationAry[EventNotificationAryLen];

#define DeviceFirmwareModuleRevisionAryLen 12
extern int32_t DeviceFirmwareModuleRevisionAry[DeviceFirmwareModuleRevisionAryLen];

// Shared registers write macros
////////////////////////////////////////////////////////////////////////////////
#define GC_SetMemoryBufferMode(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferModeIdx], val)
#define GC_SetMemoryBufferLegacyMode(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferLegacyModeIdx], val)
#define GC_SetMemoryBufferStatus(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferStatusIdx], val)
#define GC_SetMemoryBufferAvailableFreeSpaceHigh(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferAvailableFreeSpaceHighIdx], val)
#define GC_SetMemoryBufferAvailableFreeSpaceLow(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferAvailableFreeSpaceLowIdx], val)
#define GC_SetMemoryBufferFragmentedFreeSpaceHigh(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferFragmentedFreeSpaceHighIdx], val)
#define GC_SetMemoryBufferFragmentedFreeSpaceLow(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferFragmentedFreeSpaceLowIdx], val)
#define GC_SetMemoryBufferTotalSpaceHigh(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferTotalSpaceHighIdx], val)
#define GC_SetMemoryBufferTotalSpaceLow(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferTotalSpaceLowIdx], val)
#define GC_SetMemoryBufferNumberOfImagesMax(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferNumberOfImagesMaxIdx], val)
#define GC_SetMemoryBufferNumberOfSequencesMin(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferNumberOfSequencesMinIdx], val)
#define GC_SetMemoryBufferNumberOfSequencesMax(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferNumberOfSequencesMaxIdx], val)
#define GC_SetMemoryBufferNumberOfSequences(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferNumberOfSequencesIdx], val)
#define GC_SetMemoryBufferSequenceSize(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceSizeIdx], val)
#define GC_SetMemoryBufferSequenceSizeMin(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceSizeMinIdx], val)
#define GC_SetMemoryBufferSequenceSizeMax(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceSizeMaxIdx], val)
#define GC_SetMemoryBufferSequenceSizeInc(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceSizeIncIdx], val)
#define GC_SetMemoryBufferSequencePreMOISize(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequencePreMOISizeIdx], val)
#define GC_SetMemoryBufferSequenceCount(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceCountIdx], val)
#define GC_SetMemoryBufferSequenceSelector(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceSelectorIdx], val)
#define GC_SetMemoryBufferSequenceOffsetX(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceOffsetXIdx], val)
#define GC_SetMemoryBufferSequenceOffsetY(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceOffsetYIdx], val)
#define GC_SetMemoryBufferSequenceWidth(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceWidthIdx], val)
#define GC_SetMemoryBufferSequenceHeight(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceHeightIdx], val)
#define GC_SetMemoryBufferSequenceCalibrationMode(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceCalibrationModeIdx], val)
#define GC_SetMemoryBufferSequenceBadPixelReplacement(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceBadPixelReplacementIdx], val)
#define GC_SetMemoryBufferSequenceFirstFrameID(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceFirstFrameIDIdx], val)
#define GC_SetMemoryBufferSequenceMOIFrameID(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceMOIFrameIDIdx], val)
#define GC_SetMemoryBufferSequenceRecordedSize(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceRecordedSizeIdx], val)
#define GC_SetMemoryBufferSequenceDownloadImageFrameID(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceDownloadImageFrameIDIdx], val)
#define GC_SetMemoryBufferSequenceDownloadFrameID(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceDownloadFrameIDIdx], val)
#define GC_SetMemoryBufferSequenceDownloadFrameCount(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceDownloadFrameCountIdx], val)
#define GC_SetMemoryBufferSequenceDownloadMode(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceDownloadModeIdx], val)
#define GC_SetMemoryBufferSequenceDownloadBitRateMax(val) GC_RegisterWriteFloat(&gcRegsDef[MemoryBufferSequenceDownloadBitRateMaxIdx], val)
#define GC_SetMemoryBufferSequenceDownloadSuggestedFrameImageCount(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceDownloadSuggestedFrameImageCountIdx], val)
#define GC_SetMemoryBufferSequenceClear(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceClearIdx], val)
#define GC_SetMemoryBufferSequenceClearAll(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceClearAllIdx], val)
#define GC_SetMemoryBufferSequenceDefrag(val) GC_RegisterWriteUI32(&gcRegsDef[MemoryBufferSequenceDefragIdx], val)
#define GC_SetDeviceBuiltInTestsResults7(val) GC_RegisterWriteUI32(&gcRegsDef[DeviceBuiltInTestsResults7Idx], val)
#define GC_SetDeviceBuiltInTestsResults8(val) GC_RegisterWriteUI32(&gcRegsDef[DeviceBuiltInTestsResults8Idx], val)

// Locked registers utility macros
////////////////////////////////////////////////////////////////////////////////
#define GC_MemoryBufferBusy ((gcRegsData.MemoryBufferStatus == MBS_Recording) || (gcRegsData.MemoryBufferStatus == MBS_Updating) || (gcRegsData.MemoryBufferStatus == MBS_Transmitting) || (gcRegsData.MemoryBufferStatus == MBS_Defraging))
#define GC_MemoryBufferIsImplemented TDCFlagsTst(MemoryBufferIsImplementedMask)
#define GC_MemoryBufferNotEmpty (GC_MemoryBufferBusy || (gcRegsData.MemoryBufferSequenceCount > 0))
#define GC_MemoryBufferNotEmptyLegacy ((gcRegsData.MemoryBufferLegacyMode == MBLM_On) && GC_MemoryBufferNotEmpty)
#define GC_MemoryBufferWritingProcess ((gcRegsData.MemoryBufferStatus == MBS_Recording) || (gcRegsData.MemoryBufferStatus == MBS_Updating))
#define GC_WaitingForImageCorrection (((/* TDCStatusReg not found */ 0) & 0x00002000) == 0x00002000)

void GC_Registers_Init();
void GC_RestoreDataFactory();

/* AUTO-CODE END */

void GC_UpdateLockedFlag();
void GC_SetDefaultRegsData();
uint32_t GC_GetTimestamp();

#endif // GC_REGISTERS_H
