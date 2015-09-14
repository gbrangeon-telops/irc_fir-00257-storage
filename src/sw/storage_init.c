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
#include "xparameters.h"
#include "xil_exception.h"
#include "GC_Manager.h"
#include "GC_Registers.h"
#include "GC_Callback.h"
#include "CtrlInterface.h"
#include "NetworkInterface.h"
#include "FirmwareUpdater.h"

// Global variables
XIntc gStorageIntc;
netIntf_t gNetworkIntf;
ctrlIntf_t gOutputCtrlIntf;
qspiFlash_t gQSPIFlash;


/**
 * Initializes network interface
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_NI_Init()
{
   static networkCommand_t niCmdQueueBuffer[NI_CMD_QUEUE_SIZE];
   static circCmdBuffer_t niCmdQueue = CCB_Ctor(niCmdQueueBuffer, NI_CMD_QUEUE_SIZE);

   return NetIntf_Init(&gNetworkIntf, NIA_STORAGE_FPGA, &niCmdQueue);
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
   static circCmdBuffer_t fuCmdQueue =
         CCB_Ctor(fuCmdQueueBuffer, FU_CMD_QUEUE_SIZE);

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
   static uint8_t outputRxDataBuffer[OUTPUT_CI_UART_RX_BUFFER_SIZE];
   static uint8_t outputRxDataCircBuffer[OUTPUT_CI_UART_RX_CIRC_BUFFER_SIZE];
   static uint8_t outputTxDataBuffer[OUTPUT_CI_UART_TX_BUFFER_SIZE];
   static networkCommand_t outputCtrlIntfCmdQueueBuffer[OUTPUT_CI_CMD_QUEUE_SIZE];
   static circCmdBuffer_t outputCtrlIntfCmdQueue =
         CCB_Ctor(outputCtrlIntfCmdQueueBuffer, OUTPUT_CI_CMD_QUEUE_SIZE);

   static networkCommand_t gcmCmdQueueBuffer[GCM_CMD_QUEUE_SIZE];
   static circCmdBuffer_t gcmCmdQueue = CCB_Ctor(gcmCmdQueueBuffer, GCM_CMD_QUEUE_SIZE);

   IRC_Status_t status;

   // Initialize GenICam registers data pointer
   GC_Registers_Init();

   // Initialize GenICam registers callback function
   GC_Callback_Init();

   // Initialize GenICam register data
   gcRegsData = gcRegsDataFactory;

   // Set default values
   GC_SetDefaultRegsData();

   // Initialize Output FPGA GenICam control interface
   status = CtrlIntf_InitUART(&gOutputCtrlIntf,
         CIP_F1F2_NETWORK,
         XPAR_AXI_UART_FPGA_OUTPUT_DEVICE_ID,
         &gStorageIntc,
         XPAR_INTC_MICROBLAZE_0_AXI_INTC_AXI_UART_FPGA_OUTPUT_IP2INTC_IRPT_INTR,
         outputRxDataBuffer,
         OUTPUT_CI_UART_RX_BUFFER_SIZE,
         outputRxDataCircBuffer,
         OUTPUT_CI_UART_RX_CIRC_BUFFER_SIZE,
         outputTxDataBuffer,
         OUTPUT_CI_UART_TX_BUFFER_SIZE,
         &gNetworkIntf,
         &outputCtrlIntfCmdQueue,
         NIP_UNDEFINED);
   if (status != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   status = UART_Config(&gOutputCtrlIntf.link.uart, 115200, 8, 'N', 1);
   if (status != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   // Initialize GenICam Manager
   if (GC_Manager_Init(&gNetworkIntf, &gcmCmdQueue) != IRC_SUCCESS)
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
   XIntc_Enable(&gStorageIntc, XPAR_INTC_MICROBLAZE_0_AXI_INTC_AXI_UART_FPGA_OUTPUT_IP2INTC_IRPT_INTR);

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
 * @param pMgtCtrl Pointer to the MGT controller instance.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_MGT_Init(t_mgt *pMgtCtrl)
{
   MGT_Init(pMgtCtrl);

   // Disable Data and Video MGT (not used on this board)
   MGT_DisableMGT(pMgtCtrl, DATA_MGT);
   MGT_DisableMGT(pMgtCtrl, VIDEO_MGT);

   // Read statuses
   MGT_ReadCoreStatus(pMgtCtrl);
   MGT_ReadPLLStatus(pMgtCtrl);

   return IRC_SUCCESS;
}


/**
 * Initialize the Buffer Manager interface.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Storage_BufferManager_Init(t_bufferManager *pBufferCtrl)
{
   IRC_Status_t status;

   // Init module and wait for memory to be ready
   status = BufferManager_Init(pBufferCtrl, &gcRegsData);
   BufferManager_WaitMemReady(pBufferCtrl);

   return status;
}
