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
#include "xgpio.h"
#include "tel2000_param.h"
#include "irc_status.h"
#include "mb_axi4l_bridge.h"
#include "utils.h"
#include "IRCamHeader.h"


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
    *(uint32_t *)&gBufManagerError = 0;

    // Default control values
    pBufferCtrl->Buffer_base_addr = MEMORY_BUFFER_BASEADDR; // DDR Base ADDR used by Buffering FSM
	pBufferCtrl->nbSequenceMax = 1;
	pBufferCtrl->FrameSize = pGCRegs->Width*(pGCRegs->Height+2); // In pixel (+2 for header lines)
	pBufferCtrl->HDR_Size = pGCRegs->Width*4; // In bytes (2 lines * 2 bytes/pixel)
	pBufferCtrl->IMG_Size = pGCRegs->Width*pGCRegs->Height*2; // In bytes (2 bytes/pixel)
	pBufferCtrl->nbImagePerSeq = BufferManager_GetNbImageMax(pGCRegs);
	pBufferCtrl->BufferMode = BM_OFF;
	pBufferCtrl->nb_img_pre = 0;
	pBufferCtrl->nb_img_post = pBufferCtrl->nbImagePerSeq;
	pBufferCtrl->rd_sequence_id = 0;
	pBufferCtrl->rd_start_img = 0;
	pBufferCtrl->rd_stop_img = 0;
	pBufferCtrl->clear_memory = 0;
	pBufferCtrl->acq_stop = 0;
	pBufferCtrl->ConfigValid = 0;

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
    uint32_t cnt = 100e06;

    // Set error flag by default
    gBufManagerError.memReadyErr = 1;

    // TODO: implement using a real timer

    for (; cnt > 0; cnt--)
    {
        // Get Mem Ready signal from Buffer Manager module
        if ( AXI4L_read32(pBufferCtrl->ADD + BM_MEM_READY) == 1 )
        {
            // Reset error flag and exit
            gBufManagerError.memReadyErr = 0;
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
    // Update error flags
    gBufManagerError.bufWriteErr = AXI4L_read32(pBufferCtrl->ADD + BM_WRITE_ERR);
    gBufManagerError.bufReadErr  = AXI4L_read32(pBufferCtrl->ADD + BM_READ_ERR);
    gBufManagerError.memReadyErr = ( AXI4L_read32(pBufferCtrl->ADD + BM_MEM_READY) == 1 ) ? 0 : 1;
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
	pBufferCtrl->BufferMode = BM_READ;
	pBufferCtrl->rd_sequence_id = pGCRegs->MemoryBufferSequenceSelector;
	pBufferCtrl->rd_start_img = SequenceTable.start_img;
	pBufferCtrl->rd_stop_img = SequenceTable.stop_img;

	AXI4L_write32(pBufferCtrl->BufferMode, 		pBufferCtrl->ADD + BM_BUFFER_MODE);
	AXI4L_write32(pBufferCtrl->rd_sequence_id, 	pBufferCtrl->ADD + BM_READ_SEQUENCE_ID);
	AXI4L_write32(pBufferCtrl->rd_start_img, 	pBufferCtrl->ADD + BM_READ_START_ID);
	AXI4L_write32(pBufferCtrl->rd_stop_img, 	pBufferCtrl->ADD + BM_READ_STOP_ID);

	BufferManager_EnableBuffer(pBufferCtrl);
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
	pBufferCtrl->BufferMode = BM_READ;
    pBufferCtrl->rd_sequence_id = pGCRegs->MemoryBufferSequenceSelector;
	pBufferCtrl->rd_start_img = download_img_loc;
	pBufferCtrl->rd_stop_img = download_img_loc;

	AXI4L_write32(pBufferCtrl->BufferMode, 		pBufferCtrl->ADD + BM_BUFFER_MODE);
	AXI4L_write32(pBufferCtrl->rd_sequence_id, 	pBufferCtrl->ADD + BM_READ_SEQUENCE_ID);
	AXI4L_write32(pBufferCtrl->rd_start_img, 	pBufferCtrl->ADD + BM_READ_START_ID);
	AXI4L_write32(pBufferCtrl->rd_stop_img, 	pBufferCtrl->ADD + BM_READ_STOP_ID);

	BufferManager_EnableBuffer(pBufferCtrl);
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

	// Put back in Write Mode
	BufferManager_SetBufferMode(pBufferCtrl, BM_WRITE , pGCRegs );
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
    return (uint32_t)( MEMORY_BUFFER_SIZE / (pGCRegs->Width * (pGCRegs->Height+2) * 2) );   //(image + header) * 2 bytes/pixel
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

	// Clear the memory if buffering is stopped
	if (Mode == BM_OFF)
	{
		pBufferCtrl->clear_memory = 1;
        AXI4L_write32(pBufferCtrl->clear_memory,     pBufferCtrl->ADD + BM_CLEAR_MEMORY);
	}

	// Reset clear memory signal
	pBufferCtrl->clear_memory = 0;

	// Write values
	WriteStruct(pBufferCtrl);

	// Re-enable only in write mode (in read mode wait for read command)
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
 * Set the number of sequences of the Buffer Manager module.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_SetNumberOfSequence(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs )
{
	BufferManager_DisableBuffer(pBufferCtrl);

	pBufferCtrl->nbSequenceMax = pGCRegs->MemoryBufferNumberOfSequences;
	AXI4L_write32(pBufferCtrl->nbSequenceMax, 	pBufferCtrl->ADD + NB_SEQUENCE_MAX);

	BufferManager_EnableBuffer(pBufferCtrl);
}


/**
 * Set the number of images per sequence of the Buffer Manager module.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_SetNumberOfImagePerSeq(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs )
{
	BufferManager_DisableBuffer(pBufferCtrl);

	pBufferCtrl->nbImagePerSeq = pGCRegs->MemoryBufferSequenceSize;
	AXI4L_write32(pBufferCtrl->nbImagePerSeq, 	pBufferCtrl->ADD + BM_NB_IMG_PER_SEQ);

	BufferManager_EnableBuffer(pBufferCtrl);
}


/**
 * Set the MOI location in the sequence of the Buffer Manager module.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_SetPreMoi(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs )
{
	BufferManager_DisableBuffer(pBufferCtrl);

	pBufferCtrl->nb_img_pre = pGCRegs->MemoryBufferSequencePreMOISize;
	pBufferCtrl->nb_img_post = pBufferCtrl->nbImagePerSeq - pBufferCtrl->nb_img_pre;
	AXI4L_write32(pBufferCtrl->nb_img_pre, 	pBufferCtrl->ADD + BM_NB_IMG_PRE);
	AXI4L_write32(pBufferCtrl->nb_img_post, pBufferCtrl->ADD + BM_NB_IMG_POST);

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

    // readAddrLoc = BaseAddr + sequence offset + image offset + FrameIdReg offset
    readAddrLoc = pBufferCtrl->Buffer_base_addr + (SequenceID * pBufferCtrl->nbImagePerSeq + ImageLocation) * FrameSizeInBytes + FrameIDHdrAddr;

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
    status = XGpio_Initialize(&memAddrGPIO, XPAR_AXI_GPIO_0_DEVICE_ID);

    // Set GPIO direction (0 for output, 1 for input)
    XGpio_SetDataDirection(&memAddrGPIO, GPIO_CHANNEL_ID, 0);

    // Set GPIO initial values
    XGpio_DiscreteWrite(&memAddrGPIO, GPIO_CHANNEL_ID, 0);

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
    // Calculate address space of this peripheral
    const uint32_t AXI4L_addrSpace = TEL_PAR_TEL_AXIL_MEM_OUT_HIGHADDR - TEL_PAR_TEL_AXIL_MEM_OUT_BASEADDR + 1;

    // Take only the part that fits in the address space
    uint32_t AXI4L_addrVal = (uint32_t)(memAddr % AXI4L_addrSpace + TEL_PAR_TEL_AXIL_MEM_OUT_BASEADDR);

    // Set GPIO values with the part that multiplies the address space
    XGpio_DiscreteWrite(&memAddrGPIO, GPIO_CHANNEL_ID, (uint32_t)(memAddr / AXI4L_addrSpace));

    // Return the address to be used on the AXI4L
    return AXI4L_addrVal;
}


void temp_mem_write(uint64_t memAddr, uint32_t data)
{
    uint32_t AXI4L_addrVal;
    AXI4L_addrVal = BufferManager_MemAddrGPIO_Handler(memAddr);
    AXI4L_write32(data, AXI4L_addrVal);
}


uint32_t temp_mem_read(uint64_t memAddr)
{
    uint32_t AXI4L_addrVal;
    AXI4L_addrVal = BufferManager_MemAddrGPIO_Handler(memAddr);
    return AXI4L_read32(AXI4L_addrVal);
}