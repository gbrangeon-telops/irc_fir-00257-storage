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
#include "utils.h"
#include "BufferManager.h"

extern t_bufferManager gBufManager;

/* AUTO-CODE BEGIN */
// Auto-generated GeniCam registers callback functions definition.
// Generated from XML camera definition file version 10.3.0
// using updateGenICamCallback.m Matlab script.

/**
 * GenICam registers callback function initialization.
 */
void GC_Callback_Init()
{
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
       gcRegsData.MemoryBufferNumberOfSequencesMax = MIN(BufferManager_GetNumberOfSequenceMax(), (gcRegsData.MemoryBufferNumberOfImagesMax / gcRegsData.MemoryBufferSequenceSize) );
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
      // Get the number of sequence in memory This register should be poll or trigger by an GCevent
      gcRegsData.MemoryBufferSequenceCount = BufferManager_GetNumSequenceCount(&gBufManager);
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
      if(gcRegsData.MemoryBufferSequencePreMOISize > (gcRegsData.MemoryBufferSequenceSize -1) )
      {
         gcRegsData.MemoryBufferSequencePreMOISize =  (gcRegsData.MemoryBufferSequenceSize -1);
      }
      BufferManager_SetPreMoi(&gBufManager, &gcRegsData);

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
      gcRegsData.MemoryBufferSequenceSizeMax = BufferManager_GetNbImageMax(&gcRegsData);
   }

   if ((phase == GCCP_AFTER) && (access == GCCA_WRITE))
   {
      // After write
   }
}

/* AUTO-CODE END */
