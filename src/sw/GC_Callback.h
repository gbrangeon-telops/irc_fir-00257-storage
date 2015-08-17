/**
 * @file GC_Callback.h
 * GenICam registers callback functions declaration.
 *
 * This file declares the GenICam registers callback functions.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef GC_CALLBACK_H
#define GC_CALLBACK_H

#include "GenICam.h"

/* AUTO-CODE BEGIN */
// Auto-generated GeniCam registers callback functions definition.
// Generated from XML camera definition file version 10.9.0
// using updateGenICamCallback.m Matlab script.

void GC_Callback_Init();

void GC_AcquisitionArmCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_AcquisitionFrameRateCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_AcquisitionFrameRateModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_AcquisitionStartCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_AcquisitionStopCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_HeightCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferNumberOfImagesMaxCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferNumberOfSequencesCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferNumberOfSequencesMaxCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferSequenceClearAllCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferSequenceCountCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferSequenceDownloadImageFrameIDCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferSequenceDownloadModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferSequenceFirstFrameIDCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferSequenceMOIFrameIDCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferSequencePreMOISizeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferSequenceRecordedSizeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferSequenceSelectorCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferSequenceSizeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_MemoryBufferSequenceSizeMaxCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_TriggerModeCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_TriggerSelectorCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);
void GC_WidthCallback(gcCallbackPhase_t phase, gcCallbackAccess_t access);

/* AUTO-CODE END */

#endif // GC_CALLBACK_H
