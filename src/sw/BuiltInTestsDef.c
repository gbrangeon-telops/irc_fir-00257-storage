/**
 * @file BuiltInTestsDef.c
 * Built-in tests list implementation.
 *
 * This file implements camera Built-in tests list.
 * 
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "BuiltInTestsdef.h"
#include "BuiltInTests.h"
#include "storage_init.h"
#include "test_point.h"

builtInTest_t builtInTests[BITID_Count] =
{
   {BITID_BuiltInTestsGlobalResult, "", BuiltInTest_UpdateGlobalResult, BITR_Pending},
   {BITID_BuiltInTestsVerification, "", BuiltInTest_Check, BITR_Pending},
   {BITID_TimerInitialization, "", Storage_Timer_Init, BITR_Pending},
   {BITID_InterruptControllerInitialization, "", Storage_Intc_Init, BITR_Pending},
   {BITID_NetworkInterfaceInitialization, "", Storage_NI_Init, BITR_Pending},
   {BITID_GenICamManagerInitialization, "", Storage_GC_Init, BITR_Pending},
   {BITID_QSPIFlashInerfaceInitialization, "", Storage_QSPIFlash_Init, BITR_Pending},
   {BITID_FirmwareUpdaterInitialization, "", Storage_FU_Init, BITR_Pending},
   {BITID_MGTInterfaceInitialization, "", Storage_MGT_Init, BITR_Pending},
   {BITID_ADCControllerInitialization, "", Storage_XADC_Init, BITR_Pending},
   {BITID_MemoryBufferControllerInitialization, "", Storage_BufferManager_Init, BITR_Pending},
   {BITID_InterruptControllerStartup, "", Storage_Intc_Start, BITR_Pending},
   {BITID_TestPointInitialization, "", TP_Init, BITR_Pending},
   {BITID_NetworkHostsSynchronization, "", NULL, BITR_Pending}
};
