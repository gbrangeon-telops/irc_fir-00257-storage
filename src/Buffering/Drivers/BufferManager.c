/**
 * @file BufferManager.c
 * Buffer Manager module source file.
 * 
 * Buffer Manager controls the start/stop of the buffering mode and
 * the sequence reading and deleting commands.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "BufferManager.h"
#include "xparameters.h"
#include "GenICam.h"
#include "xgpio.h"
#include "tel2000_param.h"
#include "irc_status.h"
#include "mb_axi4l_bridge.h"
#include "utils.h"
#include "IRCamHeader.h"
#include <math.h>


// Global variables
static XGpio memAddrGPIO;
static t_bufferManagerError gBufManagerError;


// Private function prototypes
static t_bufferTable BufferManager_ReadBufferTable(uint32_t SequenceID);
static uint32_t BufferManager_GetFrameId(t_bufferManager *pBufferCtrl, uint32_t SequenceID, uint32_t ImageLocation);
static IRC_Status_t BufferManager_MemAddrGPIO_Init();
static uint32_t BufferManager_MemAddrGPIO_Handler(uint64_t memAddr);


/**
 * Initialize the Buffer Manager module.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t BufferManager_Init(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs)
{
   // Reset error flags
   gBufManagerError = (t_bufferManagerError)0;

   // Default control values
   pBufferCtrl->Mem0_base_addr = MEM0_BUFFER_BASEADDR; // Mem0 Base ADDR used by Buffering FSM
   pBufferCtrl->Mem1_base_addr = MEM1_BUFFER_BASEADDR; // Mem1 Base ADDR used by Buffering FSM
   pBufferCtrl->nbSequenceMax = 1;
   pBufferCtrl->FrameSize = pGCRegs->Width*(pGCRegs->Height+2); // In pixel (+2 for header lines)
   pBufferCtrl->HDR_Size = pGCRegs->Width*4; // In bytes (2 lines * 2 bytes/pixel)
   pBufferCtrl->IMG_Size = pGCRegs->Width*pGCRegs->Height*2; // In bytes (2 bytes/pixel)
   pBufferCtrl->nbImagePerSeq = 1;
   pBufferCtrl->BufferMode = BM_OFF;
   pBufferCtrl->nb_img_pre = 0;
   pBufferCtrl->nb_img_post = pBufferCtrl->nbImagePerSeq;
   pBufferCtrl->rd_sequence_id = 0;
   pBufferCtrl->rd_start_img = 0;
   pBufferCtrl->rd_stop_img = 0;
   pBufferCtrl->clear_memory = 0;
   pBufferCtrl->acq_stop = 0;
   pBufferCtrl->ConfigValid = 0;
   pBufferCtrl->axilMemAddrWidth = (uint32_t)log2((double)AXIL_MEM_ADDR_SPACE);

   // Write values
   WriteStruct(pBufferCtrl);

   // Init memory address GPIO
   return BufferManager_MemAddrGPIO_Init();
}


/**
 * Wait for Mem Ready signal from Buffer Manager module.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 *
 * @return void.
 */
void BufferManager_WaitMemReady(t_bufferManager *pBufferCtrl)
{
   const uint32_t loop_time_in_us = 1000;
   uint32_t loop_cnt = MEM_READY_TIMEOUT_IN_S * TIME_ONE_SECOND_US / loop_time_in_us;

   // Set error flag by default
   BitMaskSet(gBufManagerError, memReadyErrMask);

   while (loop_cnt--)
   {
      WAIT_US(loop_time_in_us);

      // Get Mem Ready signal from Buffer Manager module
      if ( AXI4L_read32(pBufferCtrl->ADD + BM_MEM_READY) == 1 )
      {
         // Clear error flag and exit
         BitMaskClr(gBufManagerError, memReadyErrMask);
         return;
      }
   }
}


/**
 * Update error flags with values from Buffer Manager module.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 *
 * @return void.
 */
void BufferManager_UpdateErrorFlags(t_bufferManager *pBufferCtrl)
{
   // Reset error flags
   BitMaskClr(gBufManagerError, bufWriteErrMask | bufReadErrMask | memReadyErrMask);

   // Update error flags
   gBufManagerError |= (t_bufferManagerError)(AXI4L_read32(pBufferCtrl->ADD + BM_WRITE_ERR) << bufWriteErrBitPos) & bufWriteErrMask;
   gBufManagerError |= (t_bufferManagerError)(AXI4L_read32(pBufferCtrl->ADD + BM_READ_ERR) << bufReadErrBitPos) & bufReadErrMask;
   if ( AXI4L_read32(pBufferCtrl->ADD + BM_MEM_READY) == 0 )
      BitMaskSet(gBufManagerError, memReadyErrMask);
}


/**
 * Set the Buffer Manager module to read a sequence.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_ReadSequence(t_bufferManager *pBufferCtrl, 	const gcRegistersData_t *pGCRegs)
{
   t_bufferTable SequenceTable;

   // Get sequence info values
   SequenceTable = BufferManager_ReadBufferTable(pGCRegs->MemoryBufferSequenceSelector);

   BufferManager_DisableBuffer(pBufferCtrl);

   // Set read mode control values
   pBufferCtrl->rd_sequence_id = pGCRegs->MemoryBufferSequenceSelector;
   pBufferCtrl->rd_start_img = SequenceTable.start_img;
   pBufferCtrl->rd_stop_img = SequenceTable.stop_img;

   AXI4L_write32(pBufferCtrl->rd_sequence_id, 	pBufferCtrl->ADD + BM_READ_SEQUENCE_ID);
   AXI4L_write32(pBufferCtrl->rd_start_img, 	pBufferCtrl->ADD + BM_READ_START_ID);
   AXI4L_write32(pBufferCtrl->rd_stop_img, 	pBufferCtrl->ADD + BM_READ_STOP_ID);

   //BufferManager_EnableBuffer(pBufferCtrl); // workaround : on doit laisser un peu de temps à la config avant de la réactiver
}


/**
 * Set the Buffer Manager module to read an image.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_ReadImage(t_bufferManager *pBufferCtrl, 	const gcRegistersData_t *pGCRegs)
{
   t_bufferTable SequenceTable;
   uint32_t firstFrameId;
   uint32_t img_offset;
   uint32_t download_img_loc;

   // Get sequence info values
   SequenceTable = BufferManager_ReadBufferTable(pGCRegs->MemoryBufferSequenceSelector);

   // Get the firstFrameId
   firstFrameId = BufferManager_GetFrameId(pBufferCtrl, pGCRegs->MemoryBufferSequenceSelector, SequenceTable.start_img);

   // Get the image location of the RequieredimageFrameID
   img_offset = pGCRegs->MemoryBufferSequenceDownloadImageFrameID - firstFrameId;

   // Find the location of the frame id (modulo to rollover the circular buffer)
   download_img_loc = (img_offset + SequenceTable.start_img) % pBufferCtrl->nbImagePerSeq;

   BufferManager_DisableBuffer(pBufferCtrl);

   // Set read mode control values
   pBufferCtrl->rd_sequence_id = pGCRegs->MemoryBufferSequenceSelector;
   pBufferCtrl->rd_start_img = download_img_loc;
   pBufferCtrl->rd_stop_img = download_img_loc;

   AXI4L_write32(pBufferCtrl->rd_sequence_id, 	pBufferCtrl->ADD + BM_READ_SEQUENCE_ID);
   AXI4L_write32(pBufferCtrl->rd_start_img, 	pBufferCtrl->ADD + BM_READ_START_ID);
   AXI4L_write32(pBufferCtrl->rd_stop_img, 	pBufferCtrl->ADD + BM_READ_STOP_ID);

   //BufferManager_EnableBuffer(pBufferCtrl); // workaround : on doit laisser un peu de temps à la config avant de la réactiver
}


/**
 * Clear the entire memory.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_ClearSequence(t_bufferManager *pBufferCtrl, 	const gcRegistersData_t *pGCRegs)
{
   BufferManager_DisableBuffer(pBufferCtrl);

   pBufferCtrl->clear_memory = 1;
   AXI4L_write32(pBufferCtrl->clear_memory, 		pBufferCtrl->ADD + BM_CLEAR_MEMORY);

   pBufferCtrl->clear_memory = 0;
   AXI4L_write32(pBufferCtrl->clear_memory, 		pBufferCtrl->ADD + BM_CLEAR_MEMORY);

   // Re-enable only in write mode (in read mode wait for read command triggered by acq start)
   if (pBufferCtrl->BufferMode == BM_WRITE)
      BufferManager_EnableBuffer(pBufferCtrl);
}


/**
 * Start the Buffer Manager module.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 *
 * @return void.
 */
void BufferManager_EnableBuffer(t_bufferManager *pBufferCtrl)
{
   pBufferCtrl->ConfigValid = 1;
   AXI4L_write32(pBufferCtrl->ConfigValid, pBufferCtrl->ADD + BM_CONFIG_VALID);
}


/**
 * Stop the Buffer Manager module.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 *
 * @return void.
 */
void BufferManager_DisableBuffer(t_bufferManager *pBufferCtrl)
{
   pBufferCtrl->ConfigValid = 0;
   AXI4L_write32(pBufferCtrl->ConfigValid, pBufferCtrl->ADD + BM_CONFIG_VALID);
}


/**
 * Calculate the maximum number of images in memory.
 *
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return Number of images.
 */
uint32_t BufferManager_GetNbImageMax(const gcRegistersData_t *pGCRegs)
{
   const uint32_t FrameSizeInBytes = pGCRegs->Width * (pGCRegs->Height+2) * 2;   //(image + header) * 2 bytes/pixel

   if (FrameSizeInBytes == 0)
      return 0;

   // Integer division on each memory to take care of incomplete frame at the end of each memory
   return (uint32_t)(MEM0_BUFFER_SIZE / FrameSizeInBytes) + (uint32_t)(MEM1_BUFFER_SIZE / FrameSizeInBytes);
}


/**
 * Get number of sequences in memory.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 *
 * @return Number of sequences.
 */
uint32_t BufferManager_GetNumSequenceCount(t_bufferManager *pBufferCtrl)
{
   return AXI4L_read32( pBufferCtrl->ADD + BM_NB_SEQ_IN_MEM );
}


/**
 * Get FrameID value from first image of the sequence.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param SequenceID Number of the sequence where the image is.
 *
 * @return FrameID value.
 */
uint32_t BufferManager_GetSequenceFirstFrameId(t_bufferManager *pBufferCtrl, uint32_t SequenceID)
{
   t_bufferTable SequenceTable;

   // Get sequence info values
   SequenceTable = BufferManager_ReadBufferTable(SequenceID);

   // Get FrameID of sequence start image
   return BufferManager_GetFrameId(pBufferCtrl, SequenceID, SequenceTable.start_img);
}


/**
 * Get FrameID value from MOI image of the sequence.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param SequenceID Number of the sequence where the image is.
 *
 * @return FrameID value.
 */
uint32_t BufferManager_GetSequenceMOIFrameId(t_bufferManager *pBufferCtrl, uint32_t SequenceID)
{
   t_bufferTable SequenceTable;

   // Get sequence info values
   SequenceTable = BufferManager_ReadBufferTable(SequenceID);

   // Get FrameID of sequence start image
   return BufferManager_GetFrameId(pBufferCtrl, SequenceID, SequenceTable.moi_img);
}


/**
 * Get sequence length.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param SequenceID Number of the sequence.
 *
 * @return Sequence length.
 */
uint32_t BufferManager_GetSequenceLength(t_bufferManager *pBufferCtrl, uint32_t SequenceID)
{
   t_bufferTable SequenceTable;
   uint32_t SequenceLength;

   // Get sequence info values
   SequenceTable = BufferManager_ReadBufferTable(SequenceID);

   // Calculate sequence length
   // Check for rollover
   if(SequenceTable.start_img > SequenceTable.stop_img )
      SequenceLength = pBufferCtrl->nbImagePerSeq - SequenceTable.start_img + SequenceTable.stop_img + 1;
   else
      SequenceLength = SequenceTable.stop_img - SequenceTable.start_img + 1;

   return SequenceLength;
}


/**
 * Set the mode of the Buffer Manager module.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param Mode Value of the mode to set.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_SetBufferMode(t_bufferManager *pBufferCtrl, t_bufferMode Mode, const gcRegistersData_t *pGCRegs )
{
   BufferManager_DisableBuffer(pBufferCtrl);

   // Set control values
   pBufferCtrl->BufferMode = Mode;
   pBufferCtrl->nbSequenceMax = pGCRegs->MemoryBufferNumberOfSequences;
   pBufferCtrl->FrameSize = pGCRegs->Width*(pGCRegs->Height+2); // In pixel (+2 for header lines)
   pBufferCtrl->HDR_Size = pGCRegs->Width*4; // In bytes (2 lines * 2 bytes/pixel)
   pBufferCtrl->IMG_Size = pGCRegs->Width*pGCRegs->Height*2; // In bytes (2 bytes/pixel)
   pBufferCtrl->nbImagePerSeq = pGCRegs->MemoryBufferSequenceSize;
   pBufferCtrl->nb_img_pre = pGCRegs->MemoryBufferSequencePreMOISize;
   pBufferCtrl->nb_img_post = pBufferCtrl->nbImagePerSeq - pBufferCtrl->nb_img_pre;
   pBufferCtrl->clear_memory = 0;

   // Write values
   WriteStruct(pBufferCtrl);

   // Re-enable only in write mode (in read mode wait for read command triggered by acq start)
   if (Mode == BM_WRITE)
      BufferManager_EnableBuffer(pBufferCtrl);
}


/**
 * Get maximum number of sequences.
 *
 * @return Number of sequences.
 */
uint32_t BufferManager_GetNumberOfSequenceMax()
{
   return BUF_MAX_SEQUENCE;
}


/**
 * Set the number of sequences and number of images per sequence of the Buffer Manager module.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_SetSequenceParams(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs )
{
   BufferManager_DisableBuffer(pBufferCtrl);

   pBufferCtrl->nbSequenceMax = pGCRegs->MemoryBufferNumberOfSequences;
   pBufferCtrl->nbImagePerSeq = pGCRegs->MemoryBufferSequenceSize;
   pBufferCtrl->nb_img_pre = pGCRegs->MemoryBufferSequencePreMOISize;
   pBufferCtrl->nb_img_post = pBufferCtrl->nbImagePerSeq - pBufferCtrl->nb_img_pre;
   AXI4L_write32(pBufferCtrl->nbSequenceMax, pBufferCtrl->ADD + NB_SEQUENCE_MAX);
   AXI4L_write32(pBufferCtrl->nbImagePerSeq, pBufferCtrl->ADD + BM_NB_IMG_PER_SEQ);
   AXI4L_write32(pBufferCtrl->nb_img_pre,    pBufferCtrl->ADD + BM_NB_IMG_PRE);
   AXI4L_write32(pBufferCtrl->nb_img_post,   pBufferCtrl->ADD + BM_NB_IMG_POST);

   BufferManager_EnableBuffer(pBufferCtrl);
}


/**
 * Read Buffer Table to get sequence info values.
 *
 * @param SequenceID Number of the sequence to get.
 *
 * @return Sequence info values.
 */
static t_bufferTable BufferManager_ReadBufferTable(uint32_t SequenceID)
{
   t_bufferTable SequenceTable;
   const uint32_t seqAddr = TEL_PAR_TEL_AXIL_BUF_TABLE_BASEADDR + SequenceID*4;

   // Read sequence info values
   SequenceTable.start_img =  AXI4L_read32(seqAddr + BT_START_IMG_OFFSET);
   SequenceTable.moi_img   =  AXI4L_read32(seqAddr + BT_MOI_IMG_OFFSET);
   SequenceTable.stop_img  =  AXI4L_read32(seqAddr + BT_END_IMG_OFFSET);

   return SequenceTable;
}


/**
 * Get FrameID value from an image.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param SequenceID Number of the sequence where the image is.
 * @param ImageLocation Location of the image inside the sequence.
 *
 * @return FrameID value.
 */
static uint32_t BufferManager_GetFrameId(t_bufferManager *pBufferCtrl, uint32_t SequenceID, uint32_t ImageLocation)
{
   uint64_t readAddrLoc;
   uint32_t AXI4L_addrVal;
   const uint32_t FrameSizeInBytes = pBufferCtrl->FrameSize * 2;

   //readAddrLoc = BaseAddr + sequence offset + image offset + FrameIdReg offset

   // Memory 0 contains even images and memory 1 contains odd images, so begin with the right base address
   if (ImageLocation % 2) // odd
      readAddrLoc = pBufferCtrl->Mem1_base_addr;
   else // even
      readAddrLoc = pBufferCtrl->Mem0_base_addr;

   // Since sequences are divided in the 2 memories, sequence offset and image offset are divided by 2
   readAddrLoc += (SequenceID * pBufferCtrl->nbImagePerSeq + ImageLocation) / 2 * FrameSizeInBytes + FrameIDHdrAddr;

   // Convert address location to GPIO + AXI4L_32
   AXI4L_addrVal = BufferManager_MemAddrGPIO_Handler(readAddrLoc);

   return AXI4L_read32(AXI4L_addrVal);
}


/**
 * Initialize the memory address GPIO controller.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
static IRC_Status_t BufferManager_MemAddrGPIO_Init()
{
   XStatus status;

   // Initialize memory address GPIO
   status = XGpio_Initialize(&memAddrGPIO, XPAR_AXI_GPIO_MEM_ADDR_DEVICE_ID);

   // Set GPIO direction (0 for output, 1 for input)
   XGpio_SetDataDirection(&memAddrGPIO, MEM_ADDR_GPIO_CH_ID, 0);

   // Set GPIO initial values
   XGpio_DiscreteWrite(&memAddrGPIO, MEM_ADDR_GPIO_CH_ID, 0);

   return (status == XST_SUCCESS) ? IRC_SUCCESS : IRC_FAILURE;
}


/**
 * Manage operations to access memory by AXI4L.
 *
 * @param memAddr Address in the memory.
 *
 * @return Address to use on AXI4L.
 */
static uint32_t BufferManager_MemAddrGPIO_Handler(uint64_t memAddr)
{
   // Take only the part that fits in the address space
   uint32_t AXI4L_addrVal = (uint32_t)(memAddr % AXIL_MEM_ADDR_SPACE + TEL_PAR_TEL_AXIL_MEM_OUT_BASEADDR);

   // Set GPIO values with the part that multiplies the address space
   XGpio_DiscreteWrite(&memAddrGPIO, MEM_ADDR_GPIO_CH_ID, (uint32_t)(memAddr / AXIL_MEM_ADDR_SPACE));

   // Return the address to be used on the AXI4L
   return AXI4L_addrVal;
}

bool gBufferStartDownloadTrigger = false;
bool gBufferStopDownloadTrigger = false;

void BufferManagerOutput_SM()
{
   extern t_bufferManager gBufManager;
   extern gcRegistersData_t gcRegsData;

   static bmState_t cstate = BMS_IDLE;
   static timerData_t timer;
   static uint32_t frameID, lastFrameID, numFrames;
   static uint32_t frameSize; // frame size, including header [pixels]

   const uint32_t bits_per_pixel = 16;
   const float max_delay_us = 20e6; // 0.05 Hz min
   float maxBandWidth = 10e6; // maximum average bit rate as requested by the client [bps]
   float timeout_delay_us; // configured delay between frames, [us]

   // the external memory buffer overrides internal buffer
   bool enabled = gcRegsData.MemoryBufferMode == MBM_On && gcRegsData.MemoryBufferSequenceDownloadMode != MBSDM_Off;

   if (gBufferStopDownloadTrigger == 1)
   {
      gBufferStopDownloadTrigger = 0;
      if (cstate == BMS_READ)
      {
         BufferManager_AcquisitionStop(&gBufManager, 1);

         cstate = BMS_DONE;
      }
   }

   // preserve consistency among the memory buffer registers
   if (gcRegsData.MemoryBufferSequenceCount == 0)
   {
      gcRegsData.MemoryBufferSequenceDownloadMode = MBSDM_Off;
      gcRegsData.MemoryBufferSequenceSelector = 0;
   }
   else
      gcRegsData.MemoryBufferSequenceSelector = MIN(gcRegsData.MemoryBufferSequenceSelector, gcRegsData.MemoryBufferSequenceCount - 1);

   switch (cstate)
   {
   case BMS_IDLE:
      if (enabled)
      {
         if (gBufferStartDownloadTrigger == 1)
         {
            gBufferStartDownloadTrigger = 0;
            if (gcRegsData.MemoryBufferSequenceCount > 0
                  && gcRegsData.MemoryBufferSequenceSelector >= 0
                  && gcRegsData.MemoryBufferSequenceSelector < gcRegsData.MemoryBufferSequenceCount)
               cstate = BMS_CFG;
         }
      }

      break;

   case BMS_CFG:

      numFrames = BufferManager_GetSequenceLength(&gBufManager, gcRegsData.MemoryBufferSequenceSelector);
      if (gcRegsData.MemoryBufferSequenceDownloadMode == MBSDM_Sequence)
      {
         frameID = BufferManager_GetSequenceFirstFrameId(&gBufManager, gcRegsData.MemoryBufferSequenceSelector);
         lastFrameID = frameID + numFrames - 1;
      }
      else // single image mode
      {
         uint32_t firstID = BufferManager_GetSequenceFirstFrameId(&gBufManager, gcRegsData.MemoryBufferSequenceSelector);
         uint32_t lastID = firstID + numFrames - 1;

         // make sure the requested frame is within bounds
         frameID = gcRegsData.MemoryBufferSequenceDownloadImageFrameID;
         frameID = MAX(MIN(frameID, lastID), firstID);
         lastFrameID = frameID;
         gcRegsData.MemoryBufferSequenceDownloadImageFrameID = frameID;
      }

      maxBandWidth = 20e6; // todo temporaire en attendant d'avoir le registre dédié
      maxBandWidth = MAX(1.0, gcRegsData.AcquisitionFrameRate * 10.0e6); // todo utiliser le bon champ pour ceci!

      frameSize = gcRegsData.Width * (gcRegsData.Height + 2);

      timeout_delay_us = 1.0e6 * frameSize * bits_per_pixel / maxBandWidth;
      timeout_delay_us = MIN(timeout_delay_us, max_delay_us);

      StartTimer(&timer, 10); // workaround for buffer reactivation, the delay should probably be implemented in VHDL

      BufferManager_ConfigureMinFrameTime(&gBufManager, timeout_delay_us);
      if(gcRegsData.MemoryBufferSequenceDownloadMode == MBSDM_Sequence)
      {
         BufferManager_ReadSequence(&gBufManager, &gcRegsData);
         cstate = BMS_READ;
      }
      else if(gcRegsData.MemoryBufferSequenceDownloadMode == MBSDM_Image)
      {
         BufferManager_ReadImage(&gBufManager, &gcRegsData);
         cstate = BMS_DONE;
      }

      cstate = BMS_WAIT;

      break;

   case BMS_READ:

      // live throttling of the average bit rate
      maxBandWidth = 20e6; // todo temporaire en attendant d'avoir le registre dédié
      //maxBandWidth = MAX(1.0, gcRegsData.AcquisitionFrameRate * 10.0e6); // todo utiliser le bon champ pour ceci!

      timeout_delay_us = 1.0e6 * frameSize * bits_per_pixel / maxBandWidth;
      timeout_delay_us = MIN(timeout_delay_us, max_delay_us);

      BufferManager_ConfigureMinFrameTime(&gBufManager, timeout_delay_us);
      break;

   case BMS_WAIT:
      if (TimedOut(&timer))
      {
         BufferManager_EnableBuffer(&gBufManager);
         cstate = BMS_READ;
         break;
      }
      break;

   case BMS_DONE:
      // do some clean up

      BufferManager_AcquisitionStop(&gBufManager, 0);

      cstate = BMS_IDLE;

      break;

   default:
      cstate = BMS_IDLE;
      break;
   };
}

/**
 * Configure the frame duration in read mode.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 *
 * @return void.
 */
void BufferManager_ConfigureMinFrameTime(t_bufferManager *pBufferCtrl, uint32_t time_us)
{
   const uint32_t clk_freq_MHz = 160;
   uint32_t cnt;

   cnt = time_us * clk_freq_MHz;

   AXI4L_write32(cnt, pBufferCtrl->ADD + BM_MIN_FRAME_TIME);
}

void BufferManager_AcquisitionStop(t_bufferManager *pBufferCtrl, bool flag)
{
   AXI4L_write32(flag, pBufferCtrl->ADD + BM_ACQ_STOP);
}
