/**
 *  @file storage_ctrl.c
 *  Storage FPGA main() function.
 *  
 *  This file contains the main() function.
 *  
 *  $Rev$
 *  $Author$
 *  $LastChangedDate$
 *  $Id$
 *  $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "utils.h"
#include "BuiltInTests.h"
#include "GC_Manager.h"
#include "test_point.h"
#include "BufferManager.h"
#include "CtrlInterface.h"
#include "NetworkInterface.h"
#include "FirmwareUpdater.h"
#include "XADC.h"
#include "StackUtils.h"

/*--------------------------------------------------------------------------------------*/
/* main                                                                                 */
/*--------------------------------------------------------------------------------------*/
int main()  // Defining the standard main() function
{
   extern netIntf_t gNetworkIntf;
   extern ctrlIntf_t gOutputCtrlIntf;
   extern t_bufferManager gBufManager;

   Stack_ConfigStackViolationException();
   Stack_FillRemaining();

   BuiltInTest_Execute(BITID_BuiltInTestsVerification);

   BuiltInTest_Execute(BITID_TimerInitialization);
   WAIT_US(30);

   BuiltInTest_Execute(BITID_InterruptControllerInitialization);
   BuiltInTest_Execute(BITID_NetworkInterfaceInitialization);
   BuiltInTest_Execute(BITID_GenICamManagerInitialization);
   BuiltInTest_Execute(BITID_QSPIFlashInerfaceInitialization);
   BuiltInTest_Execute(BITID_FirmwareUpdaterInitialization);
   BuiltInTest_Execute(BITID_ADCControllerInitialization);
   BuiltInTest_Execute(BITID_InterruptControllerStartup);
   BuiltInTest_Execute(BITID_MGTInterfaceInitialization);
   BuiltInTest_Execute(BITID_MemoryBufferControllerInitialization);
   BuiltInTest_Execute(BITID_TestPointInitialization);

   // Main loop
   while(1)
   {
      GC_Manager_SM();
      Firmware_Updater_SM();
      NetIntf_SM(&gNetworkIntf);
      CtrlIntf_Process(&gOutputCtrlIntf);
      BufferManager_SM();
      BufferManager_UpdateErrorFlags(&gBufManager);
      TP_TP11_Heartbeat_SM();
      XADC_SM();
   }
}
