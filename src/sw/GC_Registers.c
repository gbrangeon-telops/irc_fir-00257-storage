/**
 * @file GC_Registers.c
 * GenICam registers data definition.
 *
 * This file defines the GenICam registers data.
 * 
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "GC_Registers.h"
#include "GenICam.h"
#include "GC_Callback.h"
#include "BuildInfo.h"
#include <string.h>

#define SVN_REVISIONS_INIT {0, 0, 0, 0, 0, 0, 0, 0, SVN_HARDWARE_REV, SVN_SOFTWARE_REV, SVN_BOOTLOADER_REV, SVN_COMMON_REV}

#define DEFAULT_WIDTH 1920
#define DEFAULT_HEIGHT 1536

/* AUTO-CODE BEGIN */
// Auto-generated GeniCam library.
// Generated from XML camera definition file version 13.1.0
// using generateGenICamCLib.m Matlab script.

// GenICam global variables definition
////////////////////////////////////////////////////////////////////////////////

/**
 * Factory registers data
 */
gcRegistersData_t gcRegsDataFactory = {
   /* AcquisitionFrameRate = */ 0.0F,
   /* AcquisitionFrameRateMaxFG = */ 0.0F,
   /* DeviceClockFrequency = */ 0.0F,
   /* DeviceTemperature = */ 0.0F,
   /* DeviceVoltage = */ 0.0F,
   /* MemoryBufferSequenceDownloadBitRateMax = */ 20.0F,
   /* DeviceFirmwareModuleRevision = */ 0,
   /* AcquisitionArm = */ 0,
   /* AcquisitionFrameRateMode = */ 0,
   /* AcquisitionStart = */ 0,
   /* AcquisitionStop = */ 0,
   /* CalibrationMode = */ 0,
   /* ClConfiguration = */ 0,
   /* DeviceBuiltInTestsResults7 = */ 0,
   /* DeviceBuiltInTestsResults8 = */ 0,
   /* DeviceClockSelector = */ 0,
   /* DeviceFirmwareModuleSelector = */ 0,
   /* DeviceTemperatureSelector = */ 0,
   /* DeviceVoltageSelector = */ 0,
   /* EHDRINumberOfExposures = */ 0,
   /* EventError = */ 0,
   /* EventErrorCode = */ 0,
   /* EventErrorTimestamp = */ 0,
   /* EventNotification = */ 0,
   /* EventSelector = */ 0,
   /* EventTelops = */ 0,
   /* EventTelopsCode = */ 0,
   /* EventTelopsTimestamp = */ 0,
   /* FValSize = */ 0,
   /* FWMode = */ 0,
   /* Height = */ 0,
   /* IsActiveFlags = */ 0,
   /* MemoryBufferAvailableFreeSpaceHigh = */ 0,
   /* MemoryBufferAvailableFreeSpaceLow = */ 0,
   /* MemoryBufferFragmentedFreeSpaceHigh = */ 0,
   /* MemoryBufferFragmentedFreeSpaceLow = */ 0,
   /* MemoryBufferLegacyMode = */ MBLM_Off,
   /* MemoryBufferMOIActivation = */ 0,
   /* MemoryBufferMOISource = */ 0,
   /* MemoryBufferMode = */ MBM_Off,
   /* MemoryBufferNumberOfImagesMax = */ 0,
   /* MemoryBufferNumberOfSequences = */ 1,
   /* MemoryBufferNumberOfSequencesMax = */ 0,
   /* MemoryBufferNumberOfSequencesMin = */ 0,
   /* MemoryBufferSequenceClear = */ 0,
   /* MemoryBufferSequenceClearAll = */ 0,
   /* MemoryBufferSequenceCount = */ 0,
   /* MemoryBufferSequenceDefrag = */ 0,
   /* MemoryBufferSequenceDownloadFrameCount = */ 1,
   /* MemoryBufferSequenceDownloadFrameID = */ 0,
   /* MemoryBufferSequenceDownloadFrameImageCount = */ 0,
   /* MemoryBufferSequenceDownloadImageFrameID = */ 0,
   /* MemoryBufferSequenceDownloadMode = */ MBSDM_Off,
   /* MemoryBufferSequenceDownloadSuggestedFrameImageCount = */ 1,
   /* MemoryBufferSequenceFirstFrameID = */ 0,
   /* MemoryBufferSequenceHeight = */ 0,
   /* MemoryBufferSequenceMOIFrameID = */ 0,
   /* MemoryBufferSequenceOffsetX = */ 0,
   /* MemoryBufferSequenceOffsetY = */ 0,
   /* MemoryBufferSequencePreMOISize = */ 0,
   /* MemoryBufferSequenceRecordedSize = */ 0,
   /* MemoryBufferSequenceSelector = */ 0,
   /* MemoryBufferSequenceSize = */ 2,
   /* MemoryBufferSequenceSizeInc = */ 0,
   /* MemoryBufferSequenceSizeMax = */ 0,
   /* MemoryBufferSequenceSizeMin = */ 0,
   /* MemoryBufferSequenceWidth = */ 0,
   /* MemoryBufferStatus = */ MBS_Deactivated,
   /* MemoryBufferTotalSpaceHigh = */ 0,
   /* MemoryBufferTotalSpaceLow = */ 0,
   /* OffsetX = */ 0,
   /* OffsetY = */ 0,
   /* ReverseX = */ 0,
   /* ReverseY = */ 0,
   /* SensorHeight = */ 0,
   /* SensorWidth = */ 0,
   /* TDCFlags = */ 0,
   /* TDCFlags2 = */ 0,
   /* VideoAGC = */ 0,
   /* VideoFreeze = */ 0,
   /* Width = */ 0
};

/**
 * Registers data
 */
gcRegistersData_t gcRegsData;

/**
 * Selected registers list
 */
gcSelectedReg_t gcSelectedRegList[gcSelectedRegListLen] = {
   {DeviceClockFrequencyIdx, DeviceClockSelectorIdx, 3},
   {DeviceTemperatureIdx, DeviceTemperatureSelectorIdx, 13},
   {DeviceVoltageIdx, DeviceVoltageSelectorIdx, 31},
   {EventNotificationIdx, EventSelectorIdx, 33},
   {DeviceFirmwareModuleRevisionIdx, DeviceFirmwareModuleSelectorIdx, 12}
};

/**
 * DeviceClockFrequency data array
 */
float DeviceClockFrequencyAry[DeviceClockFrequencyAryLen] = {0.0F, 0.0F, 0.0F};
const float DeviceClockFrequencyAryFactory[DeviceClockFrequencyAryLen] = {0.0F, 0.0F, 0.0F};

/**
 * DeviceTemperature data array
 */
float DeviceTemperatureAry[DeviceTemperatureAryLen] = {0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F};
const float DeviceTemperatureAryFactory[DeviceTemperatureAryLen] = {0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F};

/**
 * DeviceVoltage data array
 */
float DeviceVoltageAry[DeviceVoltageAryLen] = {0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F};
const float DeviceVoltageAryFactory[DeviceVoltageAryLen] = {0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F};

/**
 * EventNotification data array
 */
uint32_t EventNotificationAry[EventNotificationAryLen] = {0, 0, EN_On, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, EN_On};
const uint32_t EventNotificationAryFactory[EventNotificationAryLen] = {0, 0, EN_On, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, EN_On};

/**
 * DeviceFirmwareModuleRevision data array
 */
int32_t DeviceFirmwareModuleRevisionAry[DeviceFirmwareModuleRevisionAryLen] = SVN_REVISIONS_INIT;
const int32_t DeviceFirmwareModuleRevisionAryFactory[DeviceFirmwareModuleRevisionAryLen] = SVN_REVISIONS_INIT;

/**
 * GenICam registers data pointer initialization.
 */
void GC_Registers_Init()
{
   gcRegsDef[AcquisitionFrameRateIdx].p_data = &gcRegsData.AcquisitionFrameRate;
   gcRegsDef[AcquisitionFrameRateMaxFGIdx].p_data = &gcRegsData.AcquisitionFrameRateMaxFG;
   gcRegsDef[DeviceClockFrequencyIdx].p_data = &gcRegsData.DeviceClockFrequency;
   gcRegsDef[DeviceTemperatureIdx].p_data = &gcRegsData.DeviceTemperature;
   gcRegsDef[DeviceVoltageIdx].p_data = &gcRegsData.DeviceVoltage;
   gcRegsDef[MemoryBufferSequenceDownloadBitRateMaxIdx].p_data = &gcRegsData.MemoryBufferSequenceDownloadBitRateMax;
   gcRegsDef[DeviceFirmwareModuleRevisionIdx].p_data = &gcRegsData.DeviceFirmwareModuleRevision;
   gcRegsDef[AcquisitionArmIdx].p_data = &gcRegsData.AcquisitionArm;
   gcRegsDef[AcquisitionFrameRateModeIdx].p_data = &gcRegsData.AcquisitionFrameRateMode;
   gcRegsDef[AcquisitionStartIdx].p_data = &gcRegsData.AcquisitionStart;
   gcRegsDef[AcquisitionStopIdx].p_data = &gcRegsData.AcquisitionStop;
   gcRegsDef[CalibrationModeIdx].p_data = &gcRegsData.CalibrationMode;
   gcRegsDef[ClConfigurationIdx].p_data = &gcRegsData.ClConfiguration;
   gcRegsDef[DeviceBuiltInTestsResults7Idx].p_data = &gcRegsData.DeviceBuiltInTestsResults7;
   gcRegsDef[DeviceBuiltInTestsResults8Idx].p_data = &gcRegsData.DeviceBuiltInTestsResults8;
   gcRegsDef[DeviceClockSelectorIdx].p_data = &gcRegsData.DeviceClockSelector;
   gcRegsDef[DeviceFirmwareModuleSelectorIdx].p_data = &gcRegsData.DeviceFirmwareModuleSelector;
   gcRegsDef[DeviceTemperatureSelectorIdx].p_data = &gcRegsData.DeviceTemperatureSelector;
   gcRegsDef[DeviceVoltageSelectorIdx].p_data = &gcRegsData.DeviceVoltageSelector;
   gcRegsDef[EHDRINumberOfExposuresIdx].p_data = &gcRegsData.EHDRINumberOfExposures;
   gcRegsDef[EventErrorIdx].p_data = &gcRegsData.EventError;
   gcRegsDef[EventErrorCodeIdx].p_data = &gcRegsData.EventErrorCode;
   gcRegsDef[EventErrorTimestampIdx].p_data = &gcRegsData.EventErrorTimestamp;
   gcRegsDef[EventNotificationIdx].p_data = &gcRegsData.EventNotification;
   gcRegsDef[EventSelectorIdx].p_data = &gcRegsData.EventSelector;
   gcRegsDef[EventTelopsIdx].p_data = &gcRegsData.EventTelops;
   gcRegsDef[EventTelopsCodeIdx].p_data = &gcRegsData.EventTelopsCode;
   gcRegsDef[EventTelopsTimestampIdx].p_data = &gcRegsData.EventTelopsTimestamp;
   gcRegsDef[FValSizeIdx].p_data = &gcRegsData.FValSize;
   gcRegsDef[FWModeIdx].p_data = &gcRegsData.FWMode;
   gcRegsDef[HeightIdx].p_data = &gcRegsData.Height;
   gcRegsDef[IsActiveFlagsIdx].p_data = &gcRegsData.IsActiveFlags;
   gcRegsDef[MemoryBufferAvailableFreeSpaceHighIdx].p_data = &gcRegsData.MemoryBufferAvailableFreeSpaceHigh;
   gcRegsDef[MemoryBufferAvailableFreeSpaceLowIdx].p_data = &gcRegsData.MemoryBufferAvailableFreeSpaceLow;
   gcRegsDef[MemoryBufferFragmentedFreeSpaceHighIdx].p_data = &gcRegsData.MemoryBufferFragmentedFreeSpaceHigh;
   gcRegsDef[MemoryBufferFragmentedFreeSpaceLowIdx].p_data = &gcRegsData.MemoryBufferFragmentedFreeSpaceLow;
   gcRegsDef[MemoryBufferLegacyModeIdx].p_data = &gcRegsData.MemoryBufferLegacyMode;
   gcRegsDef[MemoryBufferMOIActivationIdx].p_data = &gcRegsData.MemoryBufferMOIActivation;
   gcRegsDef[MemoryBufferMOISourceIdx].p_data = &gcRegsData.MemoryBufferMOISource;
   gcRegsDef[MemoryBufferModeIdx].p_data = &gcRegsData.MemoryBufferMode;
   gcRegsDef[MemoryBufferNumberOfImagesMaxIdx].p_data = &gcRegsData.MemoryBufferNumberOfImagesMax;
   gcRegsDef[MemoryBufferNumberOfSequencesIdx].p_data = &gcRegsData.MemoryBufferNumberOfSequences;
   gcRegsDef[MemoryBufferNumberOfSequencesMaxIdx].p_data = &gcRegsData.MemoryBufferNumberOfSequencesMax;
   gcRegsDef[MemoryBufferNumberOfSequencesMinIdx].p_data = &gcRegsData.MemoryBufferNumberOfSequencesMin;
   gcRegsDef[MemoryBufferSequenceClearIdx].p_data = &gcRegsData.MemoryBufferSequenceClear;
   gcRegsDef[MemoryBufferSequenceClearAllIdx].p_data = &gcRegsData.MemoryBufferSequenceClearAll;
   gcRegsDef[MemoryBufferSequenceCountIdx].p_data = &gcRegsData.MemoryBufferSequenceCount;
   gcRegsDef[MemoryBufferSequenceDefragIdx].p_data = &gcRegsData.MemoryBufferSequenceDefrag;
   gcRegsDef[MemoryBufferSequenceDownloadFrameCountIdx].p_data = &gcRegsData.MemoryBufferSequenceDownloadFrameCount;
   gcRegsDef[MemoryBufferSequenceDownloadFrameIDIdx].p_data = &gcRegsData.MemoryBufferSequenceDownloadFrameID;
   gcRegsDef[MemoryBufferSequenceDownloadFrameImageCountIdx].p_data = &gcRegsData.MemoryBufferSequenceDownloadFrameImageCount;
   gcRegsDef[MemoryBufferSequenceDownloadImageFrameIDIdx].p_data = &gcRegsData.MemoryBufferSequenceDownloadImageFrameID;
   gcRegsDef[MemoryBufferSequenceDownloadModeIdx].p_data = &gcRegsData.MemoryBufferSequenceDownloadMode;
   gcRegsDef[MemoryBufferSequenceDownloadSuggestedFrameImageCountIdx].p_data = &gcRegsData.MemoryBufferSequenceDownloadSuggestedFrameImageCount;
   gcRegsDef[MemoryBufferSequenceFirstFrameIDIdx].p_data = &gcRegsData.MemoryBufferSequenceFirstFrameID;
   gcRegsDef[MemoryBufferSequenceHeightIdx].p_data = &gcRegsData.MemoryBufferSequenceHeight;
   gcRegsDef[MemoryBufferSequenceMOIFrameIDIdx].p_data = &gcRegsData.MemoryBufferSequenceMOIFrameID;
   gcRegsDef[MemoryBufferSequenceOffsetXIdx].p_data = &gcRegsData.MemoryBufferSequenceOffsetX;
   gcRegsDef[MemoryBufferSequenceOffsetYIdx].p_data = &gcRegsData.MemoryBufferSequenceOffsetY;
   gcRegsDef[MemoryBufferSequencePreMOISizeIdx].p_data = &gcRegsData.MemoryBufferSequencePreMOISize;
   gcRegsDef[MemoryBufferSequenceRecordedSizeIdx].p_data = &gcRegsData.MemoryBufferSequenceRecordedSize;
   gcRegsDef[MemoryBufferSequenceSelectorIdx].p_data = &gcRegsData.MemoryBufferSequenceSelector;
   gcRegsDef[MemoryBufferSequenceSizeIdx].p_data = &gcRegsData.MemoryBufferSequenceSize;
   gcRegsDef[MemoryBufferSequenceSizeIncIdx].p_data = &gcRegsData.MemoryBufferSequenceSizeInc;
   gcRegsDef[MemoryBufferSequenceSizeMaxIdx].p_data = &gcRegsData.MemoryBufferSequenceSizeMax;
   gcRegsDef[MemoryBufferSequenceSizeMinIdx].p_data = &gcRegsData.MemoryBufferSequenceSizeMin;
   gcRegsDef[MemoryBufferSequenceWidthIdx].p_data = &gcRegsData.MemoryBufferSequenceWidth;
   gcRegsDef[MemoryBufferStatusIdx].p_data = &gcRegsData.MemoryBufferStatus;
   gcRegsDef[MemoryBufferTotalSpaceHighIdx].p_data = &gcRegsData.MemoryBufferTotalSpaceHigh;
   gcRegsDef[MemoryBufferTotalSpaceLowIdx].p_data = &gcRegsData.MemoryBufferTotalSpaceLow;
   gcRegsDef[OffsetXIdx].p_data = &gcRegsData.OffsetX;
   gcRegsDef[OffsetYIdx].p_data = &gcRegsData.OffsetY;
   gcRegsDef[ReverseXIdx].p_data = &gcRegsData.ReverseX;
   gcRegsDef[ReverseYIdx].p_data = &gcRegsData.ReverseY;
   gcRegsDef[SensorHeightIdx].p_data = &gcRegsData.SensorHeight;
   gcRegsDef[SensorWidthIdx].p_data = &gcRegsData.SensorWidth;
   gcRegsDef[TDCFlagsIdx].p_data = &gcRegsData.TDCFlags;
   gcRegsDef[TDCFlags2Idx].p_data = &gcRegsData.TDCFlags2;
   gcRegsDef[VideoAGCIdx].p_data = &gcRegsData.VideoAGC;
   gcRegsDef[VideoFreezeIdx].p_data = &gcRegsData.VideoFreeze;
   gcRegsDef[WidthIdx].p_data = &gcRegsData.Width;
}

/**
 * Restore GenICam registers data factory values.
 */
void GC_RestoreDataFactory()
{
   gcRegsData = gcRegsDataFactory;
   memcpy(DeviceClockFrequencyAry, DeviceClockFrequencyAryFactory, sizeof(DeviceClockFrequencyAry));
   memcpy(DeviceTemperatureAry, DeviceTemperatureAryFactory, sizeof(DeviceTemperatureAry));
   memcpy(DeviceVoltageAry, DeviceVoltageAryFactory, sizeof(DeviceVoltageAry));
   memcpy(EventNotificationAry, EventNotificationAryFactory, sizeof(EventNotificationAry));
   memcpy(DeviceFirmwareModuleRevisionAry, DeviceFirmwareModuleRevisionAryFactory, sizeof(DeviceFirmwareModuleRevisionAry));
}

/* AUTO-CODE END */

uint8_t gAcquisitionStarted = 0;

/**
 * Update GenICam registers lock flag.
 * This function is called every time a write is performed and updates the locked
 * flag for ALL registers.
 */
void GC_UpdateLockedFlag()
{
/* AUTO-CODE REGLOCKED BEGIN */
   SetRegLocked(&gcRegsDef[MemoryBufferModeIdx], ((GC_MemoryBufferNotEmpty || GC_WaitingForImageCorrection || (GC_MemoryBufferIsImplemented == 0)) || GC_AcquisitionStarted));
   SetRegLocked(&gcRegsDef[MemoryBufferNumberOfSequencesIdx], (GC_MemoryBufferWritingProcess || (gcRegsData.MemoryBufferNumberOfSequencesMax == 0)));
   SetRegLocked(&gcRegsDef[MemoryBufferSequenceSizeIdx], (GC_MemoryBufferNotEmptyLegacy || GC_MemoryBufferWritingProcess || (gcRegsData.MemoryBufferSequenceSizeMax == 0)));
   SetRegLocked(&gcRegsDef[MemoryBufferSequencePreMOISizeIdx], (GC_MemoryBufferWritingProcess || (gcRegsData.MemoryBufferSequenceSizeMax == 0)));
   SetRegLocked(&gcRegsDef[MemoryBufferSequenceSelectorIdx], GC_MemoryBufferBusy);
   SetRegLocked(&gcRegsDef[MemoryBufferSequenceDownloadImageFrameIDIdx], ((gcRegsData.MemoryBufferSequenceDownloadMode != MBSDM_Image) || (gcRegsData.MemoryBufferSequenceRecordedSize == 0)));
   SetRegLocked(&gcRegsDef[MemoryBufferSequenceDownloadFrameIDIdx], ((gcRegsData.MemoryBufferSequenceDownloadMode != MBSDM_Sequence) || (gcRegsData.MemoryBufferSequenceRecordedSize == 0)));
   SetRegLocked(&gcRegsDef[MemoryBufferSequenceDownloadFrameCountIdx], ((gcRegsData.MemoryBufferSequenceDownloadMode != MBSDM_Sequence) || (gcRegsData.MemoryBufferSequenceRecordedSize == 0)));
   SetRegLocked(&gcRegsDef[MemoryBufferSequenceDownloadModeIdx], (GC_MemoryBufferBusy || GC_AcquisitionStarted));
   SetRegLocked(&gcRegsDef[MemoryBufferSequenceDownloadBitRateMaxIdx], (gcRegsData.MemoryBufferSequenceDownloadMode == MBSDM_Off));
   SetRegLocked(&gcRegsDef[MemoryBufferSequenceClearIdx], (GC_MemoryBufferBusy || (gcRegsData.MemoryBufferSequenceRecordedSize == 0)));
   SetRegLocked(&gcRegsDef[MemoryBufferSequenceClearAllIdx], GC_MemoryBufferBusy);
   SetRegLocked(&gcRegsDef[MemoryBufferSequenceDefragIdx], GC_MemoryBufferBusy);
/* AUTO-CODE REGLOCKED END */
}


/**
 * Set GenICam registers to default values.
 */
void GC_SetDefaultRegsData()
{
   // We don't know which detector is used so set default to the most restrictive in terms of memory size
   gcRegsData.Width = DEFAULT_WIDTH;
   gcRegsData.Height = DEFAULT_HEIGHT;
}

/**
 * Return a timestamp corresponding to actual POSIX time.
 *
 * @return a timestamp corresponding to actual POSIX time.
 */
uint32_t GC_GetTimestamp()
{
   // Storage FPGA does not support POSIX time.
   return 0;
}
