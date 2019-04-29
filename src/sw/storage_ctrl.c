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
#include "gpio.h"
#include "BufferManager.h"
#include "CDMA_DefragMem.h"
#include "CtrlInterface.h"
#include "NetworkInterface.h"
#include "FirmwareUpdater.h"
#include "XADC.h"
#include "DebugTerminal.h"
#include "storage_init.h"
#include "StackUtils.h"
#include "IIC.h"
#include "HwIcap.h"
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
   uint64_t tic;

   #if MEMCONF == 16
   if (HwIcap_Init() != XST_FAILURE) {
      if (IIC_Init() != IRC_FAILURE) {
         if (IIC_SPD_Validate() == IRC_FAILURE) {
            HwIcap_Reconfig(HWICAP_BOOT_ADDRESS);
         }
      }
   }
   #endif

   Stack_ConfigStackViolationException();
   Stack_FillRemaining();

   gDebugTerminalStatus = Storage_DebugTerminal_InitPhase1();

   #if MEMCONF == 16
     FPGA_PRINT("16 GB Storage FPGA starting...\n");
   #elif MEMCONF == 32
     FPGA_PRINT("32 GB Storage FPGA starting...\n");
   #endif

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
   BuiltInTest_Execute(BITID_GPIOControllerInitialization);
   BuiltInTest_Execute(BITID_I2CInterfaceInitialization);
   BuiltInTest_Execute(BITID_MemoryConfigurationCheck);

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
      GPIO_TP11_Heartbeat_SM();
      XADC_SM();
      DebugTerminal_Process(&gDebugTerminal);
   }
}
