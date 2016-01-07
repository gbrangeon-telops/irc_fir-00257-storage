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

#define SVN_REVISIONS_INIT {0, 0, 0, 0, 0, 0, 0, 0, SVN_HARDWARE_REV, SVN_SOFTWARE_REV, 0, SVN_COMMON_REV}

/* AUTO-CODE BEGIN */
// Auto-generated GeniCam library.
// Generated from XML camera definition file version 11.0.4
// using generateGenICamCLib.m Matlab script.

// GenICam global variables definition
////////////////////////////////////////////////////////////////////////////////

/**
 * Factory registers data
 */
gcRegistersData_t gcRegsDataFactory = {
   /* AcquisitionFrameRate = */ 0.0F,
   /* AcquisitionFrameRateMaxFG = */ 0.0F,
   /* DeviceTemperature = */ 0.0F,
   /* DeviceVoltage = */ 0.0F,
   /* MemoryBufferSequenceDownloadBitRateMax = */ 20.0F,
   /* DeviceFirmwareModuleRevision = */ 0,
   /* AcquisitionArm = */ 0,
   /* AcquisitionFrameRateMode = */ 0,
   /* AcquisitionStart = */ 0,
   /* AcquisitionStop = */ 0,
   /* DeviceBuiltInTestsResults5 = */ 0,
   /* DeviceBuiltInTestsResults7 = */ 0,
   /* DeviceBuiltInTestsResults8 = */ 0,
   /* DeviceFirmwareModuleSelector = */ 0,
   /* DeviceTemperatureSelector = */ 0,
   /* DeviceVoltageSelector = */ 0,
   /* EventError = */ 0,
   /* EventErrorCode = */ 0,
   /* EventErrorTimestamp = */ 0,
   /* EventNotification = */ 0,
   /* EventSelector = */ 0,
   /* EventTelops = */ 0,
   /* EventTelopsCode = */ 0,
   /* EventTelopsTimestamp = */ 0,
   /* FValSize = */ 0,
   /* Height = */ 0,
   /* MemoryBufferMode = */ MBM_Off,
   /* MemoryBufferNumberOfImagesMax = */ 0,
   /* MemoryBufferNumberOfSequences = */ 1,
   /* MemoryBufferNumberOfSequencesMax = */ 0,
   /* MemoryBufferSequenceClearAll = */ 0,
   /* MemoryBufferSequenceCount = */ 0,
   /* MemoryBufferSequenceDownloadImageFrameID = */ 0,
   /* MemoryBufferSequenceDownloadMode = */ MBSDM_Off,
   /* MemoryBufferSequenceFirstFrameID = */ 0,
   /* MemoryBufferSequenceMOIFrameID = */ 0,
   /* MemoryBufferSequencePreMOISize = */ 0,
   /* MemoryBufferSequenceRecordedSize = */ 0,
   /* MemoryBufferSequenceSelector = */ 0,
   /* MemoryBufferSequenceSize = */ 2,
   /* MemoryBufferSequenceSizeMax = */ 0,
   /* ReverseX = */ 0,
   /* ReverseY = */ 0,
   /* SensorHeight = */ 0,
   /* SensorWidth = */ 0,
   /* TriggerMode = */ 0,
   /* TriggerSelector = */ 0,
   /* VideoAGC = */ 0,
   /* Width = */ 0
};

/**
 * Registers data
 */
gcRegistersData_t gcRegsData;

/**
 * DeviceTemperature data array
 */
float DeviceTemperatureAry[DeviceTemperatureAryLen] = {0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F};

/**
 * DeviceVoltage data array
 */
float DeviceVoltageAry[DeviceVoltageAryLen] = {0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F, 0.0F};

/**
 * EventNotification data array
 */
uint32_t EventNotificationAry[EventNotificationAryLen] = {0, 0, EN_On, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, EN_On};

/**
 * DeviceFirmwareModuleRevision data array
 */
int32_t DeviceFirmwareModuleRevisionAry[DeviceFirmwareModuleRevisionAryLen] = SVN_REVISIONS_INIT;

/**
 * TriggerMode data array
 */
uint32_t TriggerModeAry[TriggerModeAryLen] = {TM_Off, TM_Off};

/**
 * GenICam registers data pointer initialization.
 */
void GC_Registers_Init()
{
   gcRegsDef[AcquisitionFrameRateIdx].p_data = &gcRegsData.AcquisitionFrameRate;
   gcRegsDef[AcquisitionFrameRateMaxFGIdx].p_data = &gcRegsData.AcquisitionFrameRateMaxFG;
   gcRegsDef[DeviceTemperatureIdx].p_data = &gcRegsData.DeviceTemperature;
   gcRegsDef[DeviceVoltageIdx].p_data = &gcRegsData.DeviceVoltage;
   gcRegsDef[MemoryBufferSequenceDownloadBitRateMaxIdx].p_data = &gcRegsData.MemoryBufferSequenceDownloadBitRateMax;
   gcRegsDef[DeviceFirmwareModuleRevisionIdx].p_data = &gcRegsData.DeviceFirmwareModuleRevision;
   gcRegsDef[AcquisitionArmIdx].p_data = &gcRegsData.AcquisitionArm;
   gcRegsDef[AcquisitionFrameRateModeIdx].p_data = &gcRegsData.AcquisitionFrameRateMode;
   gcRegsDef[AcquisitionStartIdx].p_data = &gcRegsData.AcquisitionStart;
   gcRegsDef[AcquisitionStopIdx].p_data = &gcRegsData.AcquisitionStop;
   gcRegsDef[DeviceBuiltInTestsResults5Idx].p_data = &gcRegsData.DeviceBuiltInTestsResults5;
   gcRegsDef[DeviceBuiltInTestsResults7Idx].p_data = &gcRegsData.DeviceBuiltInTestsResults7;
   gcRegsDef[DeviceBuiltInTestsResults8Idx].p_data = &gcRegsData.DeviceBuiltInTestsResults8;
   gcRegsDef[DeviceFirmwareModuleSelectorIdx].p_data = &gcRegsData.DeviceFirmwareModuleSelector;
   gcRegsDef[DeviceTemperatureSelectorIdx].p_data = &gcRegsData.DeviceTemperatureSelector;
   gcRegsDef[DeviceVoltageSelectorIdx].p_data = &gcRegsData.DeviceVoltageSelector;
   gcRegsDef[EventErrorIdx].p_data = &gcRegsData.EventError;
   gcRegsDef[EventErrorCodeIdx].p_data = &gcRegsData.EventErrorCode;
   gcRegsDef[EventErrorTimestampIdx].p_data = &gcRegsData.EventErrorTimestamp;
   gcRegsDef[EventNotificationIdx].p_data = &gcRegsData.EventNotification;
   gcRegsDef[EventSelectorIdx].p_data = &gcRegsData.EventSelector;
   gcRegsDef[EventTelopsIdx].p_data = &gcRegsData.EventTelops;
   gcRegsDef[EventTelopsCodeIdx].p_data = &gcRegsData.EventTelopsCode;
   gcRegsDef[EventTelopsTimestampIdx].p_data = &gcRegsData.EventTelopsTimestamp;
   gcRegsDef[FValSizeIdx].p_data = &gcRegsData.FValSize;
   gcRegsDef[HeightIdx].p_data = &gcRegsData.Height;
   gcRegsDef[MemoryBufferModeIdx].p_data = &gcRegsData.MemoryBufferMode;
   gcRegsDef[MemoryBufferNumberOfImagesMaxIdx].p_data = &gcRegsData.MemoryBufferNumberOfImagesMax;
   gcRegsDef[MemoryBufferNumberOfSequencesIdx].p_data = &gcRegsData.MemoryBufferNumberOfSequences;
   gcRegsDef[MemoryBufferNumberOfSequencesMaxIdx].p_data = &gcRegsData.MemoryBufferNumberOfSequencesMax;
   gcRegsDef[MemoryBufferSequenceClearAllIdx].p_data = &gcRegsData.MemoryBufferSequenceClearAll;
   gcRegsDef[MemoryBufferSequenceCountIdx].p_data = &gcRegsData.MemoryBufferSequenceCount;
   gcRegsDef[MemoryBufferSequenceDownloadImageFrameIDIdx].p_data = &gcRegsData.MemoryBufferSequenceDownloadImageFrameID;
   gcRegsDef[MemoryBufferSequenceDownloadModeIdx].p_data = &gcRegsData.MemoryBufferSequenceDownloadMode;
   gcRegsDef[MemoryBufferSequenceFirstFrameIDIdx].p_data = &gcRegsData.MemoryBufferSequenceFirstFrameID;
   gcRegsDef[MemoryBufferSequenceMOIFrameIDIdx].p_data = &gcRegsData.MemoryBufferSequenceMOIFrameID;
   gcRegsDef[MemoryBufferSequencePreMOISizeIdx].p_data = &gcRegsData.MemoryBufferSequencePreMOISize;
   gcRegsDef[MemoryBufferSequenceRecordedSizeIdx].p_data = &gcRegsData.MemoryBufferSequenceRecordedSize;
   gcRegsDef[MemoryBufferSequenceSelectorIdx].p_data = &gcRegsData.MemoryBufferSequenceSelector;
   gcRegsDef[MemoryBufferSequenceSizeIdx].p_data = &gcRegsData.MemoryBufferSequenceSize;
   gcRegsDef[MemoryBufferSequenceSizeMaxIdx].p_data = &gcRegsData.MemoryBufferSequenceSizeMax;
   gcRegsDef[ReverseXIdx].p_data = &gcRegsData.ReverseX;
   gcRegsDef[ReverseYIdx].p_data = &gcRegsData.ReverseY;
   gcRegsDef[SensorHeightIdx].p_data = &gcRegsData.SensorHeight;
   gcRegsDef[SensorWidthIdx].p_data = &gcRegsData.SensorWidth;
   gcRegsDef[TriggerModeIdx].p_data = &gcRegsData.TriggerMode;
   gcRegsDef[TriggerSelectorIdx].p_data = &gcRegsData.TriggerSelector;
   gcRegsDef[VideoAGCIdx].p_data = &gcRegsData.VideoAGC;
   gcRegsDef[WidthIdx].p_data = &gcRegsData.Width;
}

/* AUTO-CODE END */

uint8_t gAcquisitionStarted = 0;

/**
 * Update GenICam registers lock flag.
 * This function is called everytime a write is performed and updates the locked
 * flag for ALL registers.
 */
#define GC_MemoryBufferNotEmpty  (gcRegsData.MemoryBufferSequenceCount > 0)
void GC_UpdateLockedFlag()
{
   // Lock buffering configuration registers when buffering is in progress
   SetRegLocked(&gcRegsDef[MemoryBufferModeIdx], GC_AcquisitionStarted || GC_MemoryBufferNotEmpty);
   SetRegLocked(&gcRegsDef[MemoryBufferNumberOfSequencesIdx], GC_AcquisitionStarted || GC_MemoryBufferNotEmpty);
   SetRegLocked(&gcRegsDef[MemoryBufferSequenceSizeIdx], GC_AcquisitionStarted || GC_MemoryBufferNotEmpty);
   SetRegLocked(&gcRegsDef[MemoryBufferSequencePreMOISizeIdx], GC_AcquisitionStarted || GC_MemoryBufferNotEmpty);
}


/**
 * Set GenICam registers to default values.
 */
void GC_SetDefaultRegsData()
{
   // We don't know which detector is used so set default to the most restrictive in terms of memory size
   gcRegsData.Width = 1280;
   gcRegsData.Height = 1024;

   // Update memory buffer registers by their callbacks
   GC_MemoryBufferNumberOfImagesMaxCallback(GCCP_BEFORE, GCCA_READ);
   GC_MemoryBufferNumberOfSequencesMaxCallback(GCCP_BEFORE, GCCA_READ);
   GC_MemoryBufferSequenceSizeMaxCallback(GCCP_BEFORE, GCCA_READ);
   gcRegsData.MemoryBufferNumberOfSequences = gcRegsData.MemoryBufferNumberOfSequencesMax;
}

void GC_UpdateMemoryBufferSequenceSizeLimits()
{
   if( gcRegsData.MemoryBufferSequenceSize > gcRegsData.MemoryBufferSequenceSizeMax  )
   {
      gcRegsData.MemoryBufferSequenceSize = gcRegsData.MemoryBufferSequenceSizeMax;
   }

   // Limit the number of sequences
   gcRegsData.MemoryBufferNumberOfSequences = MIN(gcRegsData.MemoryBufferNumberOfImagesMax / gcRegsData.MemoryBufferSequenceSize, gcRegsData.MemoryBufferNumberOfSequencesMax);

   GC_UpdateMemoryBufferSequencePreMOISizeLimits();
}

void GC_UpdateMemoryBufferNumberOfSequenceLimits()
{
   if( gcRegsData.MemoryBufferNumberOfSequences > gcRegsData.MemoryBufferNumberOfSequencesMax  )
   {
      gcRegsData.MemoryBufferNumberOfSequences = gcRegsData.MemoryBufferNumberOfSequencesMax;
   }

   // Limit the number of images per sequence
   if( (gcRegsData.MemoryBufferNumberOfSequences * gcRegsData.MemoryBufferSequenceSize) > gcRegsData.MemoryBufferNumberOfImagesMax  )
   {
      gcRegsData.MemoryBufferSequenceSize = roundDown(gcRegsData.MemoryBufferNumberOfImagesMax / gcRegsData.MemoryBufferNumberOfSequences, 2);
   }

   GC_UpdateMemoryBufferSequencePreMOISizeLimits();
}

void GC_UpdateMemoryBufferSequencePreMOISizeLimits()
{
   //Limit the Pre MOI size
   if(gcRegsData.MemoryBufferSequencePreMOISize > (gcRegsData.MemoryBufferSequenceSize -1) )
   {
      gcRegsData.MemoryBufferSequencePreMOISize =  (gcRegsData.MemoryBufferSequenceSize -1);
   }
}

/**
 * Return a timestamp corresponding to actual POSIX time.
 *
 * @return a timestamp corresponding to actual POSIX time.
 */
uint32_t GC_GetTimestamp()
{
   // Output FPGA does not support POSIX time.
   return 0;
}
