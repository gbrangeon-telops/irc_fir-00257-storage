/**
 * @file GC_Callback.c
 * GenICam registers callback functions definition.
 *
 * This file defines the GenICam registers callback functions.
 * 
 * Callback functions are alphabetically ordered to ease searches.
 * 
 * Once a default callback function has been generated using the matlab script, 
 * callback function header and body can be manually modified. The script
 * performs a backup of existing callback functions and rewrite them if needed.
 * It is suggested to carefully inspect generated code to ensure that there is
 * no source code lost. In case unused code need to be kept for future, be sure
 * to copy that code outside AUTO-CODE tags.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "GC_Callback.h"
#include "GC_Registers.h"
#include "GC_Events.h"
#include "utils.h"
#include "BufferManager.h"
#include "BuiltInTests.h"

extern t_bufferManager gBufManager;

/* AUTO-CODE BEGIN */
// Auto-generated GeniCam registers callback functions definition.
// Generated from XML camera definition file version 12.5.1
// using updateGenICamCallback.m Matlab script.

/**
 * GenICam registers callback function initialization.
 */
void GC_Callback_Init()
{
   gcRegsDef[AcquisitionArmIdx].callback =                           &GC_AcquisitionArmCallback;
   gcRegsDef[AcquisitionFrameRateIdx].callback =                     &GC_AcquisitionFrameRateCallback;
   gcRegsDef[AcquisitionFrameRateMaxFGIdx].callback =                &GC_AcquisitionFrameRateMaxFGCallback;
   gcRegsDef[AcquisitionFrameRateModeIdx].callback =                 &GC_AcquisitionFrameRateModeCallback;
   gcRegsDef[AcquisitionStartIdx].callback =                         &GC_AcquisitionStartCallback;
   gcRegsDef[AcquisitionStopIdx].callback =                          &GC_AcquisitionStopCallback;
   gcRegsDef[CalibrationModeIdx].callback =                          &GC_CalibrationModeCallback;
   gcRegsDef[ClConfigurationIdx].callback =                          &GC_ClConfigurationCallback;
   gcRegsDef[DeviceBuiltInTestsResults7Idx].callback =               &GC_DeviceBuiltInTestsResults7Callback;
   gcRegsDef[DeviceBuiltInTestsResults8Idx].callback =               &GC_DeviceBuiltInTestsResults8Callback;
   gcRegsDef[DeviceClockFrequencyIdx].callback =                     &GC_DeviceClockFrequencyCallback;
   gcRegsDef[DeviceClockSelectorIdx].callback =                      &GC_DeviceClockSelectorCallback;
   gcRegsDef[DeviceFirmwareModuleRevisionIdx].callback =             &GC_DeviceFirmwareModuleRevisionCallback;
   gcRegsDef[DeviceFirmwareModuleSelectorIdx].callback =             &GC_DeviceFirmwareModuleSelectorCallback;
   gcRegsDef[DeviceTemperatureIdx].callback =                        &GC_DeviceTemperatureCallback;
   gcRegsDef[DeviceTemperatureSelectorIdx].callback =                &GC_DeviceTemperatureSelectorCallback;
   gcRegsDef[DeviceVoltageIdx].callback =                            &GC_DeviceVoltageCallback;
   gcRegsDef[DeviceVoltageSelectorIdx].callback =                    &GC_DeviceVoltageSelectorCallback;
   gcRegsDef[EHDRINumberOfExposuresIdx].callback =                   &GC_EHDRINumberOfExposuresCallback;
   gcRegsDef[EventErrorIdx].callback =                               &GC_EventErrorCallback;
   gcRegsDef[EventErrorCodeIdx].callback =                           &GC_EventErrorCodeCallback;
   gcRegsDef[EventErrorTimestampIdx].callback =                      &GC_EventErrorTimestampCallback;
   gcRegsDef[EventNotificationIdx].callback =                        &GC_EventNotificationCallback;
   gcRegsDef[EventSelectorIdx].callback =                            &GC_EventSelectorCallback;
   gcRegsDef[EventTelopsIdx].callback =                              &GC_EventTelopsCallback;
   gcRegsDef[EventTelopsCodeIdx].callback =                          &GC_EventTelopsCodeCallback;
   gcRegsDef[EventTelopsTimestampIdx].callback =                     &GC_EventTelopsTimestampCallback;
   gcRegsDef[FValSizeIdx].callback =                                 &GC_FValSizeCallback;
   gcRegsDef[FWModeIdx].callback =                                   &GC_FWModeCallback;
   gcRegsDef[HeightIdx].callback =                                   &GC_HeightCallback;
   gcRegsDef[IsActiveFlagsIdx].callback =                            &GC_IsActiveFlagsCallback;
   gcRegsDef[MemoryBufferAvailableFreeSpaceHighIdx].callback =       &GC_MemoryBufferAvailableFreeSpaceHighCallback;
   gcRegsDef[MemoryBufferAvailableFreeSpaceLowIdx].callback =        &GC_MemoryBufferAvailableFreeSpaceLowCallback;
   gcRegsDef[MemoryBufferFragmentedFreeSpaceHighIdx].callback =      &GC_MemoryBufferFragmentedFreeSpaceHighCallback;
   gcRegsDef[MemoryBufferFragmentedFreeSpaceLowIdx].callback =       &GC_MemoryBufferFragmentedFreeSpaceLowCallback;
   gcRegsDef[MemoryBufferLegacyModeIdx].callback =                   &GC_MemoryBufferLegacyModeCallback;
   gcRegsDef[MemoryBufferMOIActivationIdx].callback =                &GC_MemoryBufferMOIActivationCallback;
   gcRegsDef[MemoryBufferMOISourceIdx].callback =                    &GC_MemoryBufferMOISourceCallback;
   gcRegsDef[MemoryBufferModeIdx].callback =                         &GC_MemoryBufferModeCallback;
   gcRegsDef[MemoryBufferNumberOfImagesMaxIdx].callback =            &GC_MemoryBufferNumberOfImagesMaxCallback;
   gcRegsDef[MemoryBufferNumberOfSequencesIdx].callback =            &GC_MemoryBufferNumberOfSequencesCallback;
   gcRegsDef[MemoryBufferNumberOfSequencesMaxIdx].callback =         &GC_MemoryBufferNumberOfSequencesMaxCallback;
   gcRegsDef[MemoryBufferSequenceClearIdx].callback =                &GC_MemoryBufferSequenceClearCallback;
   gcRegsDef[MemoryBufferSequenceClearAllIdx].callback =             &GC_MemoryBufferSequenceClearAllCallback;
   gcRegsDef[MemoryBufferSequenceCountIdx].callback =                &GC_MemoryBufferSequenceCountCallback;
   gcRegsDef[MemoryBufferSequenceDefragIdx].callback =               &GC_MemoryBufferSequenceDefragCallback;
   gcRegsDef[MemoryBufferSequenceDownloadBitRateMaxIdx].callback =   &GC_MemoryBufferSequenceDownloadBitRateMaxCallback;
   gcRegsDef[MemoryBufferSequenceDownloadFrameCountIdx].callback =   &GC_MemoryBufferSequenceDownloadFrameCountCallback;
   gcRegsDef[MemoryBufferSequenceDownloadFrameIDIdx].callback =      &GC_MemoryBufferSequenceDownloadFrameIDCallback;
   gcRegsDef[MemoryBufferSequenceDownloadImageFrameIDIdx].callback = &GC_MemoryBufferSequenceDownloadImageFrameIDCallback;
   gcRegsDef[MemoryBufferSequenceDownloadModeIdx].callback =         &GC_MemoryBufferSequenceDownloadModeCallback;
   gcRegsDef[MemoryBufferSequenceFirstFrameIDIdx].callback =         &GC_MemoryBufferSequenceFirstFrameIDCallback;
   gcRegsDef[MemoryBufferSequenceHeightIdx].callback =               &GC_MemoryBufferSequenceHeightCallback;
   gcRegsDef[MemoryBufferSequenceMOIFrameIDIdx].callback =           &GC_MemoryBufferSequenceMOIFrameIDCallback;
   gcRegsDef[MemoryBufferSequenceOffsetXIdx].callback =              &GC_MemoryBufferSequenceOffsetXCallback;
   gcRegsDef[MemoryBufferSequenceOffsetYIdx].callback =              &GC_MemoryBufferSequenceOffsetYCallback;
   gcRegsDef[MemoryBufferSequencePreMOISizeIdx].callback =           &GC_MemoryBufferSequencePreMOISizeCallback;
   gcRegsDef[MemoryBufferSequenceRecordedSizeIdx].callback =         &GC_MemoryBufferSequenceRecordedSizeCallback;
   gcRegsDef[MemoryBufferSequenceSelectorIdx].callback =             &GC_MemoryBufferSequenceSelectorCallback;
   gcRegsDef[MemoryBufferSequenceSizeIdx].callback =                 &GC_MemoryBufferSequenceSizeCallback;
   gcRegsDef[MemoryBufferSequenceSizeIncIdx].callback =              &GC_MemoryBufferSequenceSizeIncCallback;
   gcRegsDef[MemoryBufferSequenceSizeMaxIdx].callback =              &GC_MemoryBufferSequenceSizeMaxCallback;
   gcRegsDef[MemoryBufferSequenceSizeMinIdx].callback =              &GC_MemoryBufferSequenceSizeMinCallback;
   gcRegsDef[MemoryBufferSequenceWidthIdx].callback =                &GC_MemoryBufferSequenceWidthCallback;
   gcRegsDef[MemoryBufferStatusIdx].callback =                       &GC_MemoryBufferStatusCallback;
   gcRegsDef[MemoryBufferTotalSpaceHighIdx].callback =               &GC_MemoryBufferTotalSpaceHighCallback;
   gcRegsDef[MemoryBufferTotalSpaceLowIdx].callback =                &GC_MemoryBufferTotalSpaceLowCallback;
   gcRegsDef[OffsetXIdx].callback =                                  &GC_OffsetXCallback;
   gcRegsDef[OffsetYIdx].callback =                                  &GC_OffsetYCallback;
   gcRegsDef[ReverseXIdx].callback =                                 &GC_ReverseXCallback;
   gcRegsDef[ReverseYIdx].callback =                                 &GC_ReverseYCallback;
   gcRegsDef[SensorHeightIdx].callback =                             &GC_SensorHeightCallback;
   gcRegsDef[SensorWidthIdx].callback =                              &GC_SensorWidthCallback;
   gcRegsDef[TDCStatusIdx].callback =                                &GC_TDCStatusCallback;
   gcRegsDef[VideoAGCIdx].callback =                                 &GC_VideoAGCCallback;
   gcRegsDef[VideoFreezeIdx].callback =                              &GC_VideoFreezeCallback;
   gcRegsDef[WidthIdx].callback =                                    &GC_WidthCallback;
}

/**
 * AcquisitionArm GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_AcquisitionArmCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * AcquisitionFrameRate GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_AcquisitionFrameRateCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * AcquisitionFrameRateMaxFG GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_AcquisitionFrameRateMaxFGCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * AcquisitionFrameRateMode GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_AcquisitionFrameRateModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * AcquisitionStart GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_AcquisitionStartCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   extern uint8_t gAcquisitionStarted;

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      if (gcRegsData.AcquisitionStart)
      {
         if(!BM_MemoryBufferRead)
            gAcquisitionStarted = 1;
         BufferManager_OnAcquisitionStart(&gBufManager, &gcRegsData);
      }
   }
}

/**
 * AcquisitionStop GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_AcquisitionStopCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   extern uint8_t gAcquisitionStarted;

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      if (gcRegsData.AcquisitionStop)
      {
         gAcquisitionStarted = 0;
         BufferManager_OnAcquisitionStop(&gBufManager, &gcRegsData);
      }
   }
}

/**
 * CalibrationMode GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_CalibrationModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * ClConfiguration GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_ClConfigurationCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * DeviceBuiltInTestsResults7 GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_DeviceBuiltInTestsResults7Callback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      BuiltInTest_Execute(BITID_BuiltInTestsGlobalResult);
      gcRegsData.DeviceBuiltInTestsResults7 = BuiltInTest_FillResultRegister(0);
   }
}

/**
 * DeviceBuiltInTestsResults8 GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_DeviceBuiltInTestsResults8Callback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      gcRegsData.DeviceBuiltInTestsResults8 = BuiltInTest_FillResultRegister(1);
   }
}

/**
 * DeviceClockFrequency GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_DeviceClockFrequencyCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      gcRegsData.DeviceClockFrequency = DeviceClockFrequencyAry[gcRegsData.DeviceClockSelector];
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      DeviceClockFrequencyAry[gcRegsData.DeviceClockSelector] = gcRegsData.DeviceClockFrequency;
   }
}

/**
 * DeviceClockSelector GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_DeviceClockSelectorCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * DeviceFirmwareModuleRevision GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_DeviceFirmwareModuleRevisionCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      gcRegsData.DeviceFirmwareModuleRevision = DeviceFirmwareModuleRevisionAry[gcRegsData.DeviceFirmwareModuleSelector];
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      DeviceFirmwareModuleRevisionAry[gcRegsData.DeviceFirmwareModuleSelector] = gcRegsData.DeviceFirmwareModuleRevision;
   }
}

/**
 * DeviceFirmwareModuleSelector GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_DeviceFirmwareModuleSelectorCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * DeviceTemperature GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_DeviceTemperatureCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      gcRegsData.DeviceTemperature = DeviceTemperatureAry[gcRegsData.DeviceTemperatureSelector];
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      DeviceTemperatureAry[gcRegsData.DeviceTemperatureSelector] = gcRegsData.DeviceTemperature;
   }
}

/**
 * DeviceTemperatureSelector GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_DeviceTemperatureSelectorCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * DeviceVoltage GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_DeviceVoltageCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      gcRegsData.DeviceVoltage = DeviceVoltageAry[gcRegsData.DeviceVoltageSelector];
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      DeviceVoltageAry[gcRegsData.DeviceVoltageSelector] = gcRegsData.DeviceVoltage;
   }
}

/**
 * DeviceVoltageSelector GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_DeviceVoltageSelectorCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * EHDRINumberOfExposures GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_EHDRINumberOfExposuresCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * EventError GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_EventErrorCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_READ))
   {
      // After read
      gcRegsData.EventError = 0;
      GC_NextEventError();
   }
}

/**
 * EventErrorCode GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_EventErrorCodeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_READ))
   {
      // After read
      gcRegsData.EventErrorCode = EECD_NoError;
      GC_NextEventError();
   }
}

/**
 * EventErrorTimestamp GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_EventErrorTimestampCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_READ))
   {
      // After read
      gcRegsData.EventErrorTimestamp = 0;
      GC_NextEventError();
   }
}

/**
 * EventNotification GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_EventNotificationCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      gcRegsData.EventNotification = EventNotificationAry[gcRegsData.EventSelector];
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      EventNotificationAry[gcRegsData.EventSelector] = gcRegsData.EventNotification;
   }
}

/**
 * EventSelector GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_EventSelectorCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      gcRegsData.EventSelector = MIN(gcRegsData.EventSelector, EventNotificationAryLen - 1);
   }
}

/**
 * EventTelops GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_EventTelopsCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_READ))
   {
      // After read
      gcRegsData.EventTelops = 0;
      GC_NextEventTelops();
   }
}

/**
 * EventTelopsCode GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_EventTelopsCodeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_READ))
   {
      // After read
      gcRegsData.EventTelopsCode = ETCD_NoEvent;
      GC_NextEventTelops();
   }
}

/**
 * EventTelopsTimestamp GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_EventTelopsTimestampCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_READ))
   {
      // After read
      gcRegsData.EventTelopsTimestamp = 0;
      GC_NextEventTelops();
   }
}

/**
 * FValSize GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_FValSizeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * FWMode GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_FWModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * Height GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_HeightCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   static bool firstRegConfig = true;

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      gcRegsData.Height -= 2; // Remove 2 header lines (added for the NTx-Mini)

      BufferManager_UpdateSequenceMaxParameters(&gcRegsData);
      if(firstRegConfig)
      {
         BufferManager_OnWindowSizeInit(&gcRegsData);
         firstRegConfig = false;
      }
   }
}

/**
 * IsActiveFlags GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_IsActiveFlagsCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferAvailableFreeSpaceHigh GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferAvailableFreeSpaceHighCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferAvailableFreeSpaceLow GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferAvailableFreeSpaceLowCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferFragmentedFreeSpaceHigh GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferFragmentedFreeSpaceHighCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferFragmentedFreeSpaceLow GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferFragmentedFreeSpaceLowCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferLegacyMode GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferLegacyModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferMOIActivation GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferMOIActivationCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferMOISource GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferMOISourceCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   extern uint8_t gAcquisitionStarted;
   static uint32_t prevSource;

   if ((phase == GCCP_BEFORE) && (access == GCCA_WRITE))
   {
      // Before write
      prevSource = gcRegsData.MemoryBufferMOISource;
   }
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      if ((gcRegsData.MemoryBufferSequenceDownloadMode == MBSDM_Off) && GC_AcquisitionStarted)
      {
         if ((prevSource != MBMOIS_None) && (gcRegsData.MemoryBufferMOISource == MBMOIS_None))
            BufferManager_OnAcquisitionStop(&gBufManager, &gcRegsData);
         else if ((prevSource == MBMOIS_None) && (gcRegsData.MemoryBufferMOISource != MBMOIS_None))
            BufferManager_OnAcquisitionStart(&gBufManager, &gcRegsData);
      }

      if (gcRegsData.MemoryBufferMOISource == MBMOIS_None)
         MemoryBufferStatusSet(MemoryBufferHoldingMask);
      else
         MemoryBufferStatusClr(MemoryBufferHoldingMask);
   }
}

/**
 * MemoryBufferMode GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      if (gcRegsData.MemoryBufferMode == MBM_Off)
         MemoryBufferStatusSet(MemoryBufferDeactivatedMask);
      else
         MemoryBufferStatusClr(MemoryBufferDeactivatedMask);
   }
}

/**
 * MemoryBufferNumberOfImagesMax GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferNumberOfImagesMaxCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   // Obsolete register
}

/**
 * MemoryBufferNumberOfSequences GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferNumberOfSequencesCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      BufferManager_NumberOfSequencesLimits(&gcRegsData);
   }
}

/**
 * MemoryBufferNumberOfSequencesMax GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferNumberOfSequencesMaxCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferSequenceClear GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceClearCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      if (gcRegsData.MemoryBufferSequenceClear)
      {
         BufferManager_OnSequenceClearSelected(&gcRegsData);
      }
   }
}

/**
 * MemoryBufferSequenceClearAll GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceClearAllCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      if(gcRegsData.MemoryBufferSequenceClearAll)
      {
         BufferManager_OnSequenceClearAll(&gBufManager, &gcRegsData);
      }
   }
}

/**
 * MemoryBufferSequenceCount GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceCountCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferSequenceDefrag GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceDefragCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      if(gcRegsData.MemoryBufferSequenceDefrag)
      {
         BufferManager_OnDefrag(&gBufManager, &gcRegsData);
      }
   }
}

/**
 * MemoryBufferSequenceDownloadBitRateMax GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceDownloadBitRateMaxCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferSequenceDownloadFrameCount GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceDownloadFrameCountCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      BufferManager_SequenceDownloadLimits(&gcRegsData);
   }
}

/**
 * MemoryBufferSequenceDownloadFrameID GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceDownloadFrameIDCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      BufferManager_SequenceDownloadLimits(&gcRegsData);
   }
}

/**
 * MemoryBufferSequenceDownloadImageFrameID GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceDownloadImageFrameIDCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      if(BufferManager_SequenceDownloadLimits(&gcRegsData))
      {
         if(BM_MemoryBufferImage)
            BufferManager_OnAcquisitionStart(&gBufManager, &gcRegsData);
      }
   }
}

/**
 * MemoryBufferSequenceDownloadMode GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceDownloadModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferSequenceFirstFrameID GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceFirstFrameIDCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferSequenceHeight GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceHeightCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferSequenceMOIFrameID GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceMOIFrameIDCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferSequenceOffsetX GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceOffsetXCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferSequenceOffsetY GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceOffsetYCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferSequencePreMOISize GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequencePreMOISizeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      BufferManager_SequencePreMOISizeLimits(&gcRegsData);
   }
}

/**
 * MemoryBufferSequenceRecordedSize GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceRecordedSizeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferSequenceSelector GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceSelectorCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   static uint32_t prevSelector;

   if ((phase == GCCP_BEFORE) && (access == GCCA_WRITE))
   {
      // Before Write
      prevSelector = gcRegsData.MemoryBufferSequenceSelector;
   }
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      // Call update function only when selector has changed because it resets download default frame IDs
      if(gcRegsData.MemoryBufferSequenceSelector != prevSelector)
         BufferManager_UpdateSelectedSequenceParameters(&gcRegsData);
   }
}

/**
 * MemoryBufferSequenceSize GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceSizeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      BufferManager_SequenceSizeLimits(&gcRegsData);
   }
}

/**
 * MemoryBufferSequenceSizeInc GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceSizeIncCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferSequenceSizeMax GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceSizeMaxCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferSequenceSizeMin GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceSizeMinCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferSequenceWidth GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceWidthCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferStatus GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferStatusCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferTotalSpaceHigh GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferTotalSpaceHighCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * MemoryBufferTotalSpaceLow GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferTotalSpaceLowCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * OffsetX GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_OffsetXCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * OffsetY GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_OffsetYCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * ReverseX GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_ReverseXCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * ReverseY GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_ReverseYCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * SensorHeight GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_SensorHeightCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * SensorWidth GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_SensorWidthCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * TDCStatus GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_TDCStatusCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * VideoAGC GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_VideoAGCCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * VideoFreeze GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_VideoFreezeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * Width GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_WidthCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   static bool firstRegConfig = true;

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      BufferManager_UpdateSequenceMaxParameters(&gcRegsData);
      if(firstRegConfig)
      {
         BufferManager_OnWindowSizeInit(&gcRegsData);
         firstRegConfig = false;
      }
   }
}

/* AUTO-CODE END */
