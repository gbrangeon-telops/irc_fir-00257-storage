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
   {BITID_BuiltInTestsVerification, "Verifying built-in tests", BuiltInTest_Check, BITR_Pending},
   {BITID_TimerInitialization, "Initializing timer", Storage_Timer_Init, BITR_Pending},
   {BITID_InterruptControllerInitialization, "Initializing interrupt controller", Storage_Intc_Init, BITR_Pending},
   {BITID_NetworkInterfaceInitialization, "Initializing network controller", Storage_NI_Init, BITR_Pending},
   {BITID_GenICamManagerInitialization, "Initializing GenICam manager", Storage_GC_Init, BITR_Pending},
   {BITID_QSPIFlashInerfaceInitialization, "Initializing QSPI flash interface", Storage_QSPIFlash_Init, BITR_Pending},
   {BITID_FirmwareUpdaterInitialization, "Initializing firmware updater", Storage_FU_Init, BITR_Pending},
   {BITID_MGTInterfaceInitialization, "Initializing MGT interface", Storage_MGT_Init, BITR_Pending},
   {BITID_ADCControllerInitialization, "Initializing ADC controller", Storage_XADC_Init, BITR_Pending},
   {BITID_MemoryBufferControllerInitialization, "Initializing memory buffer manager", Storage_BufferManager_Init, BITR_Pending},
   {BITID_InterruptControllerStartup, "Starting interrupt controller", Storage_Intc_Start, BITR_Pending},
   {BITID_TestPointInitialization, "Initializing test point", TP_Init, BITR_Pending},
   {BITID_NetworkHostsSynchronization, "", NULL, BITR_Pending},
   {BITID_DebugTerminalInitialization, "Initializing debug terminal", Storage_DebugTerminal_InitPhase2, BITR_Pending},
   {BITID_GPIOControllerInitialization, "", NULL, BITR_NotApplicable},
   {BITID_I2CInterfaceInitialization, "Initializing I2C interface", Storage_I2C_Init, BITR_Pending},
   {BITID_MemoryConfigurationCheck, "Verifying memory configuration", Storage_MemConf_Check, BITR_Pending}
};
