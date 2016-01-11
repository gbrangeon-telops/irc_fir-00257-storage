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
// Generated from XML camera definition file version 11.0.5
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
   gcRegsDef[DeviceBuiltInTestsResults5Idx].callback =               &GC_DeviceBuiltInTestsResults5Callback;
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
   gcRegsDef[MemoryBufferModeIdx].callback =                         &GC_MemoryBufferModeCallback;
   gcRegsDef[MemoryBufferNumberOfImagesMaxIdx].callback =            &GC_MemoryBufferNumberOfImagesMaxCallback;
   gcRegsDef[MemoryBufferNumberOfSequencesIdx].callback =            &GC_MemoryBufferNumberOfSequencesCallback;
   gcRegsDef[MemoryBufferNumberOfSequencesMaxIdx].callback =         &GC_MemoryBufferNumberOfSequencesMaxCallback;
   gcRegsDef[MemoryBufferSequenceClearAllIdx].callback =             &GC_MemoryBufferSequenceClearAllCallback;
   gcRegsDef[MemoryBufferSequenceCountIdx].callback =                &GC_MemoryBufferSequenceCountCallback;
   gcRegsDef[MemoryBufferSequenceDownloadBitRateMaxIdx].callback =   &GC_MemoryBufferSequenceDownloadBitRateMaxCallback;
   gcRegsDef[MemoryBufferSequenceDownloadImageFrameIDIdx].callback = &GC_MemoryBufferSequenceDownloadImageFrameIDCallback;
   gcRegsDef[MemoryBufferSequenceDownloadModeIdx].callback =         &GC_MemoryBufferSequenceDownloadModeCallback;
   gcRegsDef[MemoryBufferSequenceFirstFrameIDIdx].callback =         &GC_MemoryBufferSequenceFirstFrameIDCallback;
   gcRegsDef[MemoryBufferSequenceMOIFrameIDIdx].callback =           &GC_MemoryBufferSequenceMOIFrameIDCallback;
   gcRegsDef[MemoryBufferSequencePreMOISizeIdx].callback =           &GC_MemoryBufferSequencePreMOISizeCallback;
   gcRegsDef[MemoryBufferSequenceRecordedSizeIdx].callback =         &GC_MemoryBufferSequenceRecordedSizeCallback;
   gcRegsDef[MemoryBufferSequenceSelectorIdx].callback =             &GC_MemoryBufferSequenceSelectorCallback;
   gcRegsDef[MemoryBufferSequenceSizeIdx].callback =                 &GC_MemoryBufferSequenceSizeCallback;
   gcRegsDef[MemoryBufferSequenceSizeMaxIdx].callback =              &GC_MemoryBufferSequenceSizeMaxCallback;
   gcRegsDef[ReverseXIdx].callback =                                 &GC_ReverseXCallback;
   gcRegsDef[ReverseYIdx].callback =                                 &GC_ReverseYCallback;
   gcRegsDef[SensorHeightIdx].callback =                             &GC_SensorHeightCallback;
   gcRegsDef[SensorWidthIdx].callback =                              &GC_SensorWidthCallback;
   gcRegsDef[TriggerModeIdx].callback =                              &GC_TriggerModeCallback;
   gcRegsDef[TriggerSelectorIdx].callback =                          &GC_TriggerSelectorCallback;
   gcRegsDef[VideoAGCIdx].callback =                                 &GC_VideoAGCCallback;
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
 * AcquisitionFrameRate GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_AcquisitionFrameRateCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
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
 * AcquisitionFrameRateMaxFG GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_AcquisitionFrameRateMaxFGCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
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
 * AcquisitionFrameRateMode GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_AcquisitionFrameRateModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
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

   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      if (gcRegsData.AcquisitionStart)
      {
         gAcquisitionStarted = 1;
         gBufferAcqStartedTrigger = 1;
         // Check if it is a buffer read
         if ((gcRegsData.MemoryBufferMode == MBM_On) && (gcRegsData.MemoryBufferSequenceDownloadMode != MBSDM_Off))
         {
            gBufferStartDownloadTrigger = 1;
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

   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

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
 * DeviceBuiltInTestsResults5 GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_DeviceBuiltInTestsResults5Callback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
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
   }}

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
   }}

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
   }}

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
 * Height GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_HeightCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

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
 * MemoryBufferMode GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

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

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

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
 * MemoryBufferSequenceDownloadBitRateMax GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceDownloadBitRateMaxCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
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
 * MemoryBufferSequenceDownloadImageFrameID GenICam register callback function.
 *
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_MemoryBufferSequenceDownloadImageFrameIDCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   uint32_t firstFrameID, lastFrameID;

   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
      firstFrameID = BufferManager_GetSequenceFirstFrameId(&gBufManager, gcRegsData.MemoryBufferSequenceSelector);
      lastFrameID = firstFrameID + BufferManager_GetSequenceLength(&gBufManager, gcRegsData.MemoryBufferSequenceSelector) - 1;

      if (gcRegsData.MemoryBufferSequenceDownloadImageFrameID < firstFrameID)
         gcRegsData.MemoryBufferSequenceDownloadImageFrameID = firstFrameID;

      if (gcRegsData.MemoryBufferSequenceDownloadImageFrameID > lastFrameID)
         gcRegsData.MemoryBufferSequenceDownloadImageFrameID = lastFrameID;
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      // This parameter has to be set for other actions, so nothing to do for now
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

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

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
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

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

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

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      // This parameter has to be set for other actions, so nothing to do for now
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
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

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
 * ReverseY GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_ReverseYCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
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
 * SensorHeight GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_SensorHeightCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
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
 * SensorWidth GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_SensorWidthCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
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
 * TriggerMode GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_TriggerModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
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
 * TriggerSelector GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_TriggerSelectorCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
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
 * VideoAGC GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_VideoAGCCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
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
 * Width GenICam register callback function.
 * 
 * @param phase indicates whether the function is called before or
 *    after the read or write operation.
 * @param access indicates whether the operation is read or write.
 */
void GC_WidthCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access)
{
   if ((phase == GCCP_BEFORE) && (access == GCCA_READ))
   {
      // Before read
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
      // Update Memory Buffer params
      GC_MemoryBufferModeCallback(GCCP_AFTER, GCCA_WRITE);
   }
}

/* AUTO-CODE END */
