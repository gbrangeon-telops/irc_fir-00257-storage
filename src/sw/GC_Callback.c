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
extern bool gBufferStartDownloadTrigger;
/* AUTO-CODE BEGIN */
// Auto-generated GeniCam registers callback functions definition.
// Generated from XML camera definition file version 12.2.1
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
   gcRegsDef[DeviceBuiltInTestsResults7Idx].callback =               &GC_DeviceBuiltInTestsResults7Callback;
   gcRegsDef[DeviceBuiltInTestsResults8Idx].callback =               &GC_DeviceBuiltInTestsResults8Callback;
   gcRegsDef[DeviceFirmwareModuleRevisionIdx].callback =             &GC_DeviceFirmwareModuleRevisionCallback;
   gcRegsDef[DeviceFirmwareModuleSelectorIdx].callback =             &GC_DeviceFirmwareModuleSelectorCallback;
   gcRegsDef[DeviceTemperatureIdx].callback =                        &GC_DeviceTemperatureCallback;
   gcRegsDef[DeviceTemperatureSelectorIdx].callback =                &GC_DeviceTemperatureSelectorCallback;
   gcRegsDef[DeviceVoltageIdx].callback =                            &GC_DeviceVoltageCallback;
   gcRegsDef[DeviceVoltageSelectorIdx].callback =                    &GC_DeviceVoltageSelectorCallback;
   gcRegsDef[EventErrorIdx].callback =                               &GC_EventErrorCallback;
   gcRegsDef[EventErrorCodeIdx].callback =                           &GC_EventErrorCodeCallback;
   gcRegsDef[EventErrorTimestampIdx].callback =                      &GC_EventErrorTimestampCallback;
   gcRegsDef[EventNotificationIdx].callback =                        &GC_EventNotificationCallback;
   gcRegsDef[EventSelectorIdx].callback =                            &GC_EventSelectorCallback;
   gcRegsDef[EventTelopsIdx].callback =                              &GC_EventTelopsCallback;
   gcRegsDef[EventTelopsCodeIdx].callback =                          &GC_EventTelopsCodeCallback;
   gcRegsDef[EventTelopsTimestampIdx].callback =                     &GC_EventTelopsTimestampCallback;
   gcRegsDef[FValSizeIdx].callback =                                 &GC_FValSizeCallback;
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
   gcRegsDef[TriggerModeIdx].callback =                              &GC_TriggerModeCallback;
   gcRegsDef[TriggerSelectorIdx].callback =                          &GC_TriggerSelectorCallback;
   gcRegsDef[VideoAGCIdx].callback =                                 &GC_VideoAGCCallback;
   gcRegsDef[VideoAGCFractionMaxIdx].callback =                      &GC_VideoAGCFractionMaxCallback;
   gcRegsDef[VideoAGCFractionMinIdx].callback =                      &GC_VideoAGCFractionMinCallback;
   gcRegsDef[VideoAGCResponseTimeIdx].callback =                     &GC_VideoAGCResponseTimeCallback;
   gcRegsDef[VideoColorMapIdx].callback =                            &GC_VideoColorMapCallback;
   gcRegsDef[VideoColorMapMaxIdx].callback =                         &GC_VideoColorMapMaxCallback;
   gcRegsDef[VideoColorMapMinIdx].callback =                         &GC_VideoColorMapMinCallback;
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
   extern bool gBufferStartDownloadTrigger;
   extern bool gBufferAcqStartedTrigger;
   extern uint8_t gAcquisitionStarted;

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      if (gcRegsData.AcquisitionStart)
      {
         gBufferAcqStartedTrigger = 1;
         // Check if it is a buffer read
         if ((gcRegsData.MemoryBufferMode == MBM_On) && (gcRegsData.MemoryBufferSequenceDownloadMode != MBSDM_Off))
         {
            gBufferStartDownloadTrigger = 1;
         }
         else
         {
            gAcquisitionStarted = 1;
         }
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
   extern bool gBufferStopDownloadTrigger;
   extern uint8_t gAcquisitionStarted;

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      if (gcRegsData.AcquisitionStop)
      {
         gAcquisitionStarted = 0;

         // interrupt a buffer transfer, if any
         gBufferStopDownloadTrigger = 1;
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
 * Height GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_HeightCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      // Remove 2 header lines (added for the NTx-Mini)
      gcRegsData.Height -= 2;

      // Update Memory Buffer params
      GC_MemoryBufferModeCallback(GCCP_AFTER, GCCA_WRITE);
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
   }
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
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
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
      if(gcRegsData.MemoryBufferMode == MBM_Off)
      {
         BufferManager_SetBufferMode(&gBufManager, BM_OFF,  &gcRegsData);
      }
      else if(gcRegsData.MemoryBufferMode == MBM_On && gcRegsData.MemoryBufferSequenceDownloadMode == MBSDM_Off)
      {
         BufferManager_SetBufferMode(&gBufManager, BM_WRITE,  &gcRegsData);
      }
      else
      {
         BufferManager_SetBufferMode(&gBufManager, BM_READ,  &gcRegsData);
      }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      gcRegsData.MemoryBufferNumberOfImagesMax = BufferManager_GetNbImageMax(&gcRegsData);
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read

   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      // Limit number of images per sequence if necessary
      GC_UpdateMemoryBufferNumberOfSequenceLimits();
      // Update sequence parameters
      BufferManager_SetSequenceParams(&gBufManager, &gcRegsData);
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      gcRegsData.MemoryBufferNumberOfSequencesMax = BufferManager_GetNumberOfSequenceMax();
   }
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
      BufferManager_ClearSequence(&gBufManager,    &gcRegsData);
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
      uint32_t sequenceFirstFrameId = BufferManager_GetSequenceFirstFrameId(&gBufManager, gcRegsData.MemoryBufferSequenceSelector);
      uint32_t sequenceFrameCount = BufferManager_GetSequenceLength(&gBufManager, gcRegsData.MemoryBufferSequenceSelector);

      if ((gcRegsData.MemoryBufferSequenceDownloadFrameID - sequenceFirstFrameId) + gcRegsData.MemoryBufferSequenceDownloadFrameCount > sequenceFrameCount)
      {
         // Adjust download frame ID
         gcRegsData.MemoryBufferSequenceDownloadFrameID = (sequenceFrameCount - gcRegsData.MemoryBufferSequenceDownloadFrameCount) + sequenceFirstFrameId;
      }
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
      uint32_t sequenceFirstFrameId = BufferManager_GetSequenceFirstFrameId(&gBufManager, gcRegsData.MemoryBufferSequenceSelector);
      uint32_t sequenceFrameCount = BufferManager_GetSequenceLength(&gBufManager, gcRegsData.MemoryBufferSequenceSelector);

      if ((gcRegsData.MemoryBufferSequenceDownloadFrameID - sequenceFirstFrameId) + gcRegsData.MemoryBufferSequenceDownloadFrameCount > sequenceFrameCount)
      {
         // Adjust download frame count
         gcRegsData.MemoryBufferSequenceDownloadFrameCount = sequenceFrameCount - (gcRegsData.MemoryBufferSequenceDownloadFrameID - sequenceFirstFrameId);
      }
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
      gBufferStartDownloadTrigger = 1;
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
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      GC_MemoryBufferModeCallback(GCCP_AFTER, GCCA_WRITE);
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      gcRegsData.MemoryBufferSequenceFirstFrameID = BufferManager_GetSequenceFirstFrameId(&gBufManager, gcRegsData.MemoryBufferSequenceSelector);
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      gcRegsData.MemoryBufferSequenceMOIFrameID = BufferManager_GetSequenceMOIFrameId(&gBufManager, gcRegsData.MemoryBufferSequenceSelector);
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }
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
      GC_UpdateMemoryBufferSequencePreMOISizeLimits();
      BufferManager_SetSequenceParams(&gBufManager, &gcRegsData);
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      gcRegsData.MemoryBufferSequenceRecordedSize = BufferManager_GetSequenceLength(&gBufManager, gcRegsData.MemoryBufferSequenceSelector);
   }
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
   static uint32_t previousValue;

   if ((phase == GCCP_BEFORE) && (access == GCCA_WRITE))
   {
      // Before write
      previousValue = gcRegsData.MemoryBufferSequenceSelector;
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      if (gcRegsData.MemoryBufferSequenceSelector != previousValue)
      {
         BufferManager_SetSequenceDownloadDefaultParams(&gBufManager, &gcRegsData);
      }
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
      // Limit the number of sequences if necessary
      GC_UpdateMemoryBufferSequenceSizeLimits();
      // Update sequence parameters
      BufferManager_SetSequenceParams(&gBufManager, &gcRegsData);
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      // Since MemoryBufferSequenceSize must be even, make sure MemoryBufferSequenceSizeMax is even too
      gcRegsData.MemoryBufferSequenceSizeMax = roundDown(BufferManager_GetNbImageMax(&gcRegsData), 2);
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
   }
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
   }
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
 * TriggerMode GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_TriggerModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * TriggerSelector GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_TriggerSelectorCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
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
 * VideoAGCFractionMax GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_VideoAGCFractionMaxCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * VideoAGCFractionMin GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_VideoAGCFractionMinCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * VideoAGCResponseTime GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_VideoAGCResponseTimeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * VideoColorMap GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_VideoColorMapCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * VideoColorMapMax GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_VideoColorMapMaxCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
}

/**
 * VideoColorMapMin GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_VideoColorMapMinCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
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
   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      // Update Memory Buffer params
      GC_MemoryBufferModeCallback(GCCP_AFTER, GCCA_WRITE);
   }
}

/* AUTO-CODE END */
