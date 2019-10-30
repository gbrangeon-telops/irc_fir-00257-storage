/**
 *  @file storage_init.c
 *  Storage FPGA initialization source file.
 *  
 *  This file implements the storage FPGA initialization module.
 *  
 *  $Rev$
 *  $Author$
 *  $Date$
 *  $Id$
 *  $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "storage_init.h"
#include "xil_exception.h"
#include "GC_Manager.h"
#include "GC_Registers.h"
#include "GC_Events.h"
#include "GC_Callback.h"
#include "CtrlInterface.h"
#include "UART_Utils.h"
#include "NetworkInterface.h"
#include "FirmwareUpdater.h"
#include "mgt_ctrl.h"
#include "BufferManager.h"
#include "XADC.h"
#include "Timer.h"
#include "mgt_ctrl.h"
#include "DebugTerminal.h"
#include "IIC.h"


// Global variables
XIntc gStorageIntc;
netIntf_t gNetworkIntf;
circularUART_t gCircularUART_OutputFPGA;
debugTerminal_t gDebugTerminal;
IRC_Status_t gDebugTerminalStatus;
ctrlIntf_t gCtrlIntf_OutputFPGA;
qspiFlash_t gQSPIFlash;
t_mgt gMGT = MGT_Ctor(XPAR_MGT_CTRL_BASEADDR);
t_bufferManager gBufManager = Buffering_Intf_Ctor(XPAR_M_BUFFERING_CTRL_BASEADDR);


/**
 * Initializes general purpose 64-bit timer.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_Timer_Init()
{
   return Timer_Init(XPAR_TMRCTR_0_BASEADDR, XPAR_TMRCTR_0_CLOCK_FREQ_HZ);
}


/**
 * Initializes network interface
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_NI_Init()
{
   static networkCommand_t niCmdQueueBuffer[NI_CMD_QUEUE_SIZE];
   static circBuffer_t niCmdQueue =
         CB_Ctor(niCmdQueueBuffer, NI_CMD_QUEUE_SIZE, sizeof(networkCommand_t));

   return NetIntf_Init(&gNetworkIntf, NIA_STORAGE_FPGA, &niCmdQueue);
}

/**
 * Initializes debug terminal (phase 1).
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_DebugTerminal_InitPhase1()
{
   static uint8_t dtTxCircBufferBytes[DT_UART_TX_CIRC_BUFFER_SIZE];
   static circByteBuffer_t dtTxCircBuffer;

   // Initialize debug terminal TX circular buffer
   if (CBB_Init(&dtTxCircBuffer, dtTxCircBufferBytes, DT_UART_TX_CIRC_BUFFER_SIZE) != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   // Initialize debug terminal data structure
   if (DebugTerminal_Init(&gDebugTerminal, NULL, &dtTxCircBuffer) != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;}

/**
 * Initializes debug terminal (phase 2).
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_DebugTerminal_InitPhase2()
{
   static networkCommand_t dtCmdQueueBuffer[DT_CMD_QUEUE_SIZE];
   static circBuffer_t dtCmdQueue =
         CB_Ctor(dtCmdQueueBuffer, DT_CMD_QUEUE_SIZE, sizeof(networkCommand_t));

   // Connect debug terminal to network interface
   if (DebugTerminal_Connect(&gDebugTerminal, &gNetworkIntf, &dtCmdQueue) != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   // Look for global debug terminal initialization tests result
   if (gDebugTerminalStatus != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Initializes firmware updater
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_FU_Init()
{
   static networkCommand_t fuCmdQueueBuffer[FU_CMD_QUEUE_SIZE];
   static circBuffer_t fuCmdQueue =
         CB_Ctor(fuCmdQueueBuffer, FU_CMD_QUEUE_SIZE, sizeof(networkCommand_t));

   // Initialize firmware updater
   if (Firmware_Updater_Init(&gNetworkIntf, &fuCmdQueue, &gQSPIFlash) != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Initialize GenICam manager and GenICam registers.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_GC_Init()
{
   IRC_Status_t status;

   // Initialize GenICam registers data pointer
   GC_Registers_Init();

   // Initialize GenICam registers callback function
   GC_Callback_Init();

   // Initialize GenICam register data
   GC_RestoreDataFactory();

   // Set default values
   GC_SetDefaultRegsData();

   /************************************************************************************
    * Output FPGA Control interface
    ************************************************************************************/

   static uint8_t outputRxCircBufferBytes[OUTPUT_CI_UART_RX_CIRC_BUFFER_SIZE];
   static circByteBuffer_t outputRxCircBuffer;

   static uint8_t outputTxCircBufferBytes[OUTPUT_CI_UART_TX_CIRC_BUFFER_SIZE];
   static circByteBuffer_t outputTxCircBuffer;

   static networkCommand_t outputCtrlIntfCmdQueueBuffer[OUTPUT_CI_CMD_QUEUE_SIZE];
   static circBuffer_t outputCtrlIntfCmdQueue =
         CB_Ctor(outputCtrlIntfCmdQueueBuffer, OUTPUT_CI_CMD_QUEUE_SIZE, sizeof(networkCommand_t));

   // Initialize Output FPGA control interface RX circular buffer
   if (CBB_Init(&outputRxCircBuffer, outputRxCircBufferBytes, OUTPUT_CI_UART_RX_CIRC_BUFFER_SIZE) != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   // Initialize Output FPGA control interface TX circular buffer
   if (CBB_Init(&outputTxCircBuffer, outputTxCircBufferBytes, OUTPUT_CI_UART_TX_CIRC_BUFFER_SIZE) != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   // Initialize Output FPGA control interface
   status = CtrlIntf_Init(&gCtrlIntf_OutputFPGA,
         CIP_F1F2_NETWORK,
         &outputRxCircBuffer,
         &outputTxCircBuffer,
         &gNetworkIntf,
         &outputCtrlIntfCmdQueue,
         NIP_UNDEFINED);
   if (status != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   // Initialize Output FPGA UART serial port
   status = CircularUART_Init(&gCircularUART_OutputFPGA,
         XPAR_AXI_UART_FPGA_OUTPUT_DEVICE_ID,
         &gStorageIntc,
         XPAR_INTC_MICROBLAZE_0_AXI_INTC_AXI_UART_FPGA_OUTPUT_IP2INTC_IRPT_INTR,
         NULL, NULL, Ns550);
   if (status != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   // Configure Output FPGA UART serial port
   if (CircularUART_Config(&gCircularUART_OutputFPGA, 115200, 8, 'N', 1) != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   // Connect Output FPGA UART serial port to Output FPGA control interface
   if (CtrlIntf_SetLink(&gCtrlIntf_OutputFPGA, CILT_CUART, &gCircularUART_OutputFPGA) != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /************************************************************************************
    * GenICam manager
    ************************************************************************************/

   static networkCommand_t gcmCmdQueueBuffer[GCM_CMD_QUEUE_SIZE];
   static circBuffer_t gcmCmdQueue =
         CB_Ctor(gcmCmdQueueBuffer, GCM_CMD_QUEUE_SIZE, sizeof(networkCommand_t));

   // Initialize GenICam Manager
   if (GC_Manager_Init(&gNetworkIntf, &gcmCmdQueue) != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /************************************************************************************
    * GenICam events
    ************************************************************************************/

   static gcEvent_t gcEventErrorQueueBuffer[GC_EVENT_ERROR_QUEUE_SIZE];
   static circBuffer_t gcEventErrorQueue =
         CB_Ctor(gcEventErrorQueueBuffer, GC_EVENT_ERROR_QUEUE_SIZE, sizeof(gcEvent_t));

   // Initialize GenICam Events
   if (GC_Events_Init(&gcEventErrorQueue, NULL) != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Initializes QSPIFlash interface.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_QSPIFlash_Init()
{
   IRC_Status_t status;

   // QSPI flash initialization
   status = QSPIFlash_Init(&gQSPIFlash,
         XPAR_AXI_QUAD_SPI_0_DEVICE_ID,
         &gStorageIntc,
         XPAR_INTC_MICROBLAZE_0_AXI_INTC_AXI_QUAD_SPI_0_IP2INTC_IRPT_INTR);
   if (status != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Initialize interrupt controller.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_Intc_Init()
{
   XStatus status;

   status = XIntc_Initialize(&gStorageIntc, XPAR_INTC_0_DEVICE_ID);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}


/**
 * Start interrupt controller.
 *
 * @return IRC_SUCCESS if successfully started.
 * @return IRC_FAILURE if failed to start.
 */
IRC_Status_t Storage_Intc_Start()
{
   XStatus status;

   /*
    * Start the interrupt controller such that interrupts are enabled for
    * all devices that cause interrupts, specifies real mode so that only
    * hardware interrupts are enabled.
    */
   status = XIntc_Start(&gStorageIntc, XIN_REAL_MODE);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * Enable the interrupt for the UartNs550 driver instances.
    */
   CircularUART_Enable(&gCircularUART_OutputFPGA);

   /*
    * Enable the interrupt for the SPI driver instance.
    */
   XIntc_Enable(&gStorageIntc, XPAR_INTC_MICROBLAZE_0_AXI_INTC_AXI_QUAD_SPI_0_IP2INTC_IRPT_INTR);

   /*
    * Initialize the exception table.
    */
   Xil_ExceptionInit();

   /*
    * Register the interrupt controller handler with the exception table.
    */
   Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
         (Xil_ExceptionHandler)XIntc_InterruptHandler,
         &gStorageIntc);

   /*
    * Enable exceptions.
    */
   Xil_ExceptionEnable();

   return IRC_SUCCESS;
}


/**
 * Initialize MGT interface.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_MGT_Init()
{
   MGT_Init(&gMGT);

   // Disable Data and Video MGT (not used on this board)
   MGT_DisableMGT(&gMGT, DATA_MGT);
   MGT_DisableMGT(&gMGT, VIDEO_MGT);

   // Read statuses
   MGT_ReadCoreStatus(&gMGT);
   MGT_ReadPLLStatus(&gMGT);

   return IRC_SUCCESS;
}


/**
 * Initialize the Buffer Manager interface.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_BufferManager_Init()
{
   return BufferManager_Init(&gBufManager, &gcRegsData);
}

/**
 * Initializes XADC.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_XADC_Init()
{
   return XADC_Init(XPAR_SYSMON_0_DEVICE_ID);
}

/**
 * Initializes I2C interface.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_I2C_Init()
{
   return IIC_Init();
}

/**
 * Verification of installed memory modules
 *
 * @return IRC_SUCCESS if memory configuration is valid.
 * @return IRC_FAILURE if verification failed.
 */
IRC_Status_t Storage_MemConf_Check()
{
   return IIC_SPD_Validate();
}
