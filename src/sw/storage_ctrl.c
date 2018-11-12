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
#include "DebugTerminal.h"
#include "storage_init.h"
#include "StackUtils.h"
#include "verbose.h"

#define DEVICE_RUNNING_TIME_REFRESH_PERIOD_US   TIME_ONE_MINUTE_US

/*--------------------------------------------------------------------------------------*/
/* main                                                                                 */
/*--------------------------------------------------------------------------------------*/
int main()  // Defining the standard main() function
{
   extern netIntf_t gNetworkIntf;
   extern ctrlIntf_t gCtrlIntf_OutputFPGA;
   extern debugTerminal_t gDebugTerminal;
   extern IRC_Status_t gDebugTerminalStatus;
   extern t_bufferManager gBufManager;
   uint64_t tic;

   Stack_ConfigStackViolationException();
   Stack_FillRemaining();

   gDebugTerminalStatus = Storage_DebugTerminal_InitPhase1();

   FPGA_PRINT("Storage FPGA starting...\n");

   BuiltInTest_Execute(BITID_BuiltInTestsVerification);

   BuiltInTest_Execute(BITID_TimerInitialization);
   WAIT_US(30);

   BuiltInTest_Execute(BITID_InterruptControllerInitialization);
   BuiltInTest_Execute(BITID_NetworkInterfaceInitialization);
   BuiltInTest_Execute(BITID_DebugTerminalInitialization);
   BuiltInTest_Execute(BITID_GenICamManagerInitialization);
   BuiltInTest_Execute(BITID_QSPIFlashInerfaceInitialization);
   BuiltInTest_Execute(BITID_FirmwareUpdaterInitialization);
   BuiltInTest_Execute(BITID_ADCControllerInitialization);
   BuiltInTest_Execute(BITID_InterruptControllerStartup);
   BuiltInTest_Execute(BITID_MGTInterfaceInitialization);
   BuiltInTest_Execute(BITID_MemoryBufferControllerInitialization);
   BuiltInTest_Execute(BITID_TestPointInitialization);
   BuiltInTest_Execute(BITID_I2CInterfaceInitialization);
   BuiltInTest_Execute(BITID_MemConfCheck);

   GETTIME(&tic);

   // Main loop
   while(1)
   {
      if (elapsed_time_us(tic) > DEVICE_RUNNING_TIME_REFRESH_PERIOD_US)
      {
         GETTIME(&tic);
         FPGA_PRINT("Still Alive\n");
      }

      GC_Manager_SM();
      Firmware_Updater_SM();
      NetIntf_SM(&gNetworkIntf);
      CtrlIntf_Process(&gCtrlIntf_OutputFPGA);
      BufferManager_SM();
      BufferManager_UpdateErrorFlags(&gBufManager);
      TP_TP11_Heartbeat_SM();
      XADC_SM();
      DebugTerminal_Process(&gDebugTerminal);
   }
}
