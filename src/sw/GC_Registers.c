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
// Generated from XML camera definition file version 10.3.0
// using generateGenICamCLib.m Matlab script.

// GenICam global variables definition
////////////////////////////////////////////////////////////////////////////////

/**
 * Factory registers data
 */
gcRegistersData_t gcRegsDataFactory;

/**
 * Registers data
 */
gcRegistersData_t gcRegsData;

/**
 * GenICam registers data pointer initialization.
 */
void GC_Registers_Init()
{
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
