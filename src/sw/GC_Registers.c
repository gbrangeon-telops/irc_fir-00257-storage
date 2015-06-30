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


/* AUTO-CODE BEGIN */
// Auto-generated GeniCam library.
// Generated from XML camera definition file version 10.6.0
// using generateGenICamCLib.m Matlab script.

// GenICam global variables definition
////////////////////////////////////////////////////////////////////////////////

/**
 * Factory registers data
 */
gcRegistersData_t gcRegsDataFactory = {
   /* AcquisitionFrameRate = */ 0.0F,
   /* AcquisitionStart = */ 0,
   /* AcquisitionStop = */ 0,
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
   /* MemoryBufferSequenceSize = */ 1,
   /* MemoryBufferSequenceSizeMax = */ 0,
   /* Width = */ 0
};

/**
 * Registers data
 */
gcRegistersData_t gcRegsData;

/**
 * GenICam registers data pointer initialization.
 */
void GC_Registers_Init()
{
   gcRegsDef[AcquisitionFrameRateIdx].p_data = &gcRegsData.AcquisitionFrameRate;
   gcRegsDef[AcquisitionStartIdx].p_data = &gcRegsData.AcquisitionStart;
   gcRegsDef[AcquisitionStopIdx].p_data = &gcRegsData.AcquisitionStop;
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
   gcRegsDef[WidthIdx].p_data = &gcRegsData.Width;
}

/* AUTO-CODE END */

/**
 * Update GenICam registers lock flag.
 * This function is called everytime a write is performed and updates the locked
 * flag for ALL registers.
 */
void GC_UpdateLockedFlag()
{
}

void GC_UpdateMemoryBufferSequenceSizeLimits()
{
   if( gcRegsData.MemoryBufferSequenceSize > gcRegsData.MemoryBufferNumberOfImagesMax  )
   {
      gcRegsData.MemoryBufferSequenceSize = gcRegsData.MemoryBufferNumberOfImagesMax;
   }

   // Limit the number of sequences
   if( (gcRegsData.MemoryBufferNumberOfSequences * gcRegsData.MemoryBufferSequenceSize) > gcRegsData.MemoryBufferNumberOfImagesMax  )
   {
      gcRegsData.MemoryBufferNumberOfSequences = gcRegsData.MemoryBufferNumberOfImagesMax / gcRegsData.MemoryBufferSequenceSize;
   }
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
      gcRegsData.MemoryBufferSequenceSize = gcRegsData.MemoryBufferNumberOfImagesMax / gcRegsData.MemoryBufferNumberOfSequences;
   }
}
