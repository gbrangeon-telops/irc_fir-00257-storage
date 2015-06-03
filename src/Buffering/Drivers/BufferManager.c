/**
 * @file BufferManager.h
 * 
 * Buffer Manager control the start stop of the buffering mode and the sequence reading and deleting command
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
#include "Tel2000_param.h"
#include "xil_io.h"
#include "irc_status.h"
#include "utils.h"
#include "hder_inserter.h"
#include "mb_axi4l_bridge.h"
#include "proc_memory.h"


IRC_Status_t BufferManager_Init(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs)
{

	pBufferCtrl->Buffer_base_addr = PROC_MEM_MEMORY_BUFFER_BASEADDR; //DDR Base ADDR + Buffer location offset
	pBufferCtrl->nbSequenceMax = 1;
	pBufferCtrl->FrameSize = pGCRegs->Width*(pGCRegs->Height+2); // In pixel
	pBufferCtrl->HDR_Size = pGCRegs->Width*4; // In bytes
	pBufferCtrl->IMG_Size = pGCRegs->Width*pGCRegs->Height*2; // In bytes
	pBufferCtrl->nbImagePerSeq = BufferManager_GeNbImageMax(pBufferCtrl,pGCRegs);
	pBufferCtrl->BufferMode = BM_OFF;
	pBufferCtrl->nb_img_pre = 0;
	pBufferCtrl->nb_img_post = pBufferCtrl->nbImagePerSeq;
	pBufferCtrl->rd_sequence_id = 0;
	pBufferCtrl->rd_start_img = 0;
	pBufferCtrl->clear_memory = 0;
	pBufferCtrl->switchConfig = BM_SWITCH_INTERNAL_LIVE;
	pBufferCtrl->moiSource = BM_SOFTARE_MOI;
	pBufferCtrl->moiActivation = RISING_EDGE;
	pBufferCtrl->soft_moi = 0;
	pBufferCtrl->acq_stop = 0;
	pBufferCtrl->ConfigValid =0;
	WriteStruct(pBufferCtrl);

	//TODO UPDATE GC PARAMETER
	BUFFERING_INF("Init");
	return IRC_SUCCESS;

}

void BufferManager_SendConfig(t_bufferManager *pBufferCtrl, 		const gcRegistersData_t *pGCRegs)
{
	BufferManager_DisableBuffer(pBufferCtrl);

	//TODO UPDATE and Send config
	pBufferCtrl->Buffer_base_addr = PROC_MEM_MEMORY_BUFFER_BASEADDR; //DDR Base ADDR + Buffer location offset
	pBufferCtrl->nbSequenceMax = pGCRegs->MemoryBufferNumberOfSequences;
	pBufferCtrl->FrameSize = pGCRegs->Width*(pGCRegs->Height+2); // In pixel
	pBufferCtrl->HDR_Size = pGCRegs->Width*4; // In bytes
	pBufferCtrl->IMG_Size = pGCRegs->Width*pGCRegs->Height*2; // In bytes
	pBufferCtrl->nbImagePerSeq = BufferManager_GeNbImageMax(pBufferCtrl,pGCRegs);
	//pBufferCtrl->BufferMode = BM_OFF;
	pBufferCtrl->nb_img_pre = 0;
	pBufferCtrl->nb_img_post = BufferManager_ReturnNumberOfImagePost(pBufferCtrl);
	pBufferCtrl->rd_sequence_id = 0;
	pBufferCtrl->rd_start_img = 0;
	pBufferCtrl->clear_memory = 0;
	pBufferCtrl->switchConfig = BM_SWITCH_INTERNAL_LIVE;
	pBufferCtrl->moiSource = BM_SOFTARE_MOI;
	pBufferCtrl->moiActivation = RISING_EDGE;
	pBufferCtrl->soft_moi = 0;
	pBufferCtrl->acq_stop = 0;
	pBufferCtrl->ConfigValid =0;
	WriteStruct(pBufferCtrl);

	BUFFERING_INF("SendConfig");

}

t_bufferTable BufferManager_ReadBufferTable(uint32_t SequenceID)
{
	t_bufferTable SequenceTable;

	SequenceTable.start_img =  AXI4L_read32( TEL_PAR_TEL_BUFTABLE_BASEADDR + SequenceID*4 + BT_START_IMG_OFFSET);
	SequenceTable.moi_img 	=  AXI4L_read32( TEL_PAR_TEL_BUFTABLE_BASEADDR + SequenceID*4 + BT_MOI_IMG_OFFSET);
	SequenceTable.stop_img 	=  AXI4L_read32( TEL_PAR_TEL_BUFTABLE_BASEADDR + SequenceID*4 + BT_END_IMG_OFFSET);

	BUFFERING_INF("ReadBufferTable");
	return SequenceTable;
}

void BufferManager_ReadSequence(t_bufferManager *pBufferCtrl, 	const gcRegistersData_t *pGCRegs)
{
	t_bufferTable SequenceTable;

	BufferManager_DisableBuffer(pBufferCtrl);
	pBufferCtrl->BufferMode = BM_READ;
	pBufferCtrl->switchConfig = BM_SWITCH_INTERNAL_PLAYBACK;
	pBufferCtrl->rd_sequence_id = pGCRegs->MemoryBufferSequenceSelector;

	SequenceTable = BufferManager_ReadBufferTable(pBufferCtrl->rd_sequence_id);

	pBufferCtrl->rd_start_img = SequenceTable.start_img;
	pBufferCtrl->rd_stop_img = SequenceTable.stop_img;

	AXI4L_write32(pBufferCtrl->BufferMode, 		pBufferCtrl->ADD + BM_BUFFER_MODE);
	AXI4L_write32(pBufferCtrl->switchConfig, 	pBufferCtrl->ADD + BM_SWITCH_CONFIG);
	AXI4L_write32(pBufferCtrl->rd_sequence_id, 	pBufferCtrl->ADD + BM_READ_SEQUENCE_ID);
	AXI4L_write32(pBufferCtrl->rd_start_img, 	pBufferCtrl->ADD + BM_READ_START_ID);
	AXI4L_write32(pBufferCtrl->rd_stop_img, 	pBufferCtrl->ADD + BM_READ_STOP_ID);

	BufferManager_EnableBuffer(pBufferCtrl);
	BUFFERING_INF("ReadSequence");

}

void BufferManager_ReadImage(t_bufferManager *pBufferCtrl, 	const gcRegistersData_t *pGCRegs)
{
	t_bufferTable SequenceTable;
	uint32_t firstFrameId;
	uint32_t img_offset;
	uint32_t download_img_loc;

	BufferManager_DisableBuffer(pBufferCtrl);
	pBufferCtrl->BufferMode = BM_READ;
	pBufferCtrl->switchConfig = BM_SWITCH_INTERNAL_PLAYBACK;
	pBufferCtrl->rd_sequence_id = pGCRegs->MemoryBufferSequenceSelector;

	//Get the buffertable of the sequence
	SequenceTable = BufferManager_ReadBufferTable(pBufferCtrl->rd_sequence_id);

	//Get the firstFrameId
	firstFrameId = BufferManager_GetSequenceFirstFrameId(pBufferCtrl, pBufferCtrl->rd_sequence_id);

	//Get the image location of the RequieredimageFrameID
	img_offset = pGCRegs->MemoryBufferSequenceDownloadImageFrameID - firstFrameId;

	//Find the location of the frame id
	download_img_loc = (img_offset + SequenceTable.start_img) % pBufferCtrl->nbImagePerSeq;


	pBufferCtrl->rd_start_img = download_img_loc;
	pBufferCtrl->rd_stop_img = download_img_loc;

	AXI4L_write32(pBufferCtrl->BufferMode, 		pBufferCtrl->ADD + BM_BUFFER_MODE);
	AXI4L_write32(pBufferCtrl->switchConfig, 	pBufferCtrl->ADD + BM_SWITCH_CONFIG);
	AXI4L_write32(pBufferCtrl->rd_sequence_id, 	pBufferCtrl->ADD + BM_READ_SEQUENCE_ID);
	AXI4L_write32(pBufferCtrl->rd_start_img, 	pBufferCtrl->ADD + BM_READ_START_ID);
	AXI4L_write32(pBufferCtrl->rd_stop_img, 	pBufferCtrl->ADD + BM_READ_STOP_ID);

	BufferManager_EnableBuffer(pBufferCtrl);
	BUFFERING_INF("ReadImage");
}

void BufferManager_ClearSequence(t_bufferManager *pBufferCtrl, 	const gcRegistersData_t *pGCRegs)
{
	BufferManager_DisableBuffer(pBufferCtrl);

	pBufferCtrl->clear_memory = 1;
	AXI4L_write32(pBufferCtrl->clear_memory, 		pBufferCtrl->ADD + BM_CLEAR_MEMORY);

	pBufferCtrl->clear_memory = 0;
	AXI4L_write32(pBufferCtrl->clear_memory, 		pBufferCtrl->ADD + BM_CLEAR_MEMORY);

	//Put back in Write Mode
	BufferManager_SetBufferMode(pBufferCtrl, BM_WRITE , pGCRegs );
	BUFFERING_INF("ClearSequence");
}

void BufferManager_EnableBuffer(t_bufferManager *pBufferCtrl)
{
	pBufferCtrl->ConfigValid = 1;
	AXI4L_write32(pBufferCtrl->ConfigValid, pBufferCtrl->ADD + BM_CONFIG_VALID);
	BUFFERING_INF("EnableBuffer");
}

void BufferManager_DisableBuffer(t_bufferManager *pBufferCtrl)
{
	pBufferCtrl->ConfigValid = 0;
	AXI4L_write32(pBufferCtrl->ConfigValid, pBufferCtrl->ADD + BM_CONFIG_VALID);
//	pBufferCtrl->BufferMode = BM_OFF;
//	AXI4L_write32(pBufferCtrl->BufferMode, pBufferCtrl->ADD + BM_BUFFER_MODE);
//	pBufferCtrl->switchConfig = BM_SWITCH_INTERNAL_LIVE;
//	AXI4L_write32(pBufferCtrl->switchConfig, pBufferCtrl->ADD + BM_SWITCH_CONFIG);

	BUFFERING_INF("DisableBuffer");
}


uint32_t BufferManager_GetBufferSize(t_bufferManager *pBufferCtrl)
{
	BUFFERING_INF("GetBufferSize");

	return PROC_MEM_MEMORY_BUFFER_SIZE; // in bytes
}

uint32_t BufferManager_GeNbImageMax(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs){

	BUFFERING_INF("GeNbImageMax");

	return  BufferManager_GetBufferSize(pBufferCtrl) / (pGCRegs->Width * (pGCRegs->Height+2) *2);
}


uint32_t BufferManager_NumberOfSequenceMax()
{
	BUFFERING_INF("NumberOfSequenceMax");

	return BUF_MAX_SEQUENCE;
}

uint32_t BufferManager_GetNumSequenceCount(t_bufferManager *pBufferCtrl)
{
	BUFFERING_INF("GetNumSequenceCount");

	 return AXI4L_read32( pBufferCtrl->ADD + BM_NB_SEQ_IN_MEM );
}

uint32_t BufferManager_GetFrameId(t_bufferManager *pBufferCtrl, uint32_t SequenceID, uint32_t ImageLocation)
{
	// TODO READ DDR up to the image location then return the FrameId of that image
	uint32_t FrameID;
	uint32_t readAddrLoc;

	//readAddrLoc = BaseAddr + sequence offset + image offset + FrameIdReg offset
	readAddrLoc = pBufferCtrl->Buffer_base_addr + (SequenceID * (pBufferCtrl->FrameSize * 2 * pBufferCtrl->nbImagePerSeq)) + (ImageLocation * pBufferCtrl->FrameSize * 2) + FrameIDHdrAddr; // frame size is in pixel
	FrameID = AXI4L_read32(readAddrLoc);

	BUFFERING_INF("GetFrameId");

	return FrameID;
}

uint32_t BufferManager_GetSequenceFirstFrameId(t_bufferManager *pBufferCtrl, uint32_t SequenceID)
{
	uint32_t ImageLoc, FrameId;

	ImageLoc = AXI4L_read32( TEL_PAR_TEL_BUFTABLE_BASEADDR + SequenceID*4 + BT_START_IMG_OFFSET);

	FrameId = BufferManager_GetFrameId(pBufferCtrl, SequenceID, ImageLoc);

	BUFFERING_INF("GetSequenceFirstFrameId");

	return FrameId;

}

uint32_t BufferManager_GetSequenceMOIFrameId(t_bufferManager *pBufferCtrl, uint32_t SequenceID)
{
	uint32_t ImageLoc, FrameId;

	ImageLoc = AXI4L_read32( TEL_PAR_TEL_BUFTABLE_BASEADDR + SequenceID*4 + BT_MOI_IMG_OFFSET);

	FrameId = BufferManager_GetFrameId(pBufferCtrl, SequenceID, ImageLoc);

	BUFFERING_INF("GetSequenceMOIFrameId");

	return FrameId;
}

uint32_t BufferManager_GetSequenceLength(t_bufferManager *pBufferCtrl, uint32_t SequenceID)
{
	t_bufferTable SequenceTable;
	uint32_t SequenceLength;

	SequenceTable.start_img =  AXI4L_read32( TEL_PAR_TEL_BUFTABLE_BASEADDR + SequenceID*4 + BT_START_IMG_OFFSET);
	SequenceTable.stop_img 	=  AXI4L_read32( TEL_PAR_TEL_BUFTABLE_BASEADDR + SequenceID*4 + BT_END_IMG_OFFSET);

	if(SequenceTable.start_img > SequenceTable.stop_img ) // Buffer Wrap
	{
		SequenceLength = pBufferCtrl->nbImagePerSeq - SequenceTable.start_img + SequenceTable.stop_img + 1;
	}
	else
	{
		SequenceLength = SequenceTable.stop_img - SequenceTable.start_img + 1;
	}

	BUFFERING_INF("GetSequenceLength");
	return SequenceLength;
}

void BufferManager_SetBufferMode(t_bufferManager *pBufferCtrl,t_bufferMode Mode , const gcRegistersData_t *pGCRegs )
{

	BufferManager_DisableBuffer(pBufferCtrl);

	pBufferCtrl->nbSequenceMax = pGCRegs->MemoryBufferNumberOfSequences;
	pBufferCtrl->FrameSize = pGCRegs->Width*(pGCRegs->Height+2); // In pixel
	pBufferCtrl->HDR_Size = pGCRegs->Width*4; // In bytes
	pBufferCtrl->IMG_Size = pGCRegs->Width*pGCRegs->Height*2; // In bytes
	pBufferCtrl->nbImagePerSeq = pGCRegs->MemoryBufferSequenceSize;
	pBufferCtrl->nb_img_pre = pGCRegs->MemoryBufferSequencePreMOISize;
	pBufferCtrl->nb_img_post = BufferManager_ReturnNumberOfImagePost(pBufferCtrl);

	if(TriggerSourceAry[TS_MemoryBufferMOI] == TS_Software)
	{
		pBufferCtrl->moiSource = BM_SOFTARE_MOI;
	}
	else if(TriggerSourceAry[TS_MemoryBufferMOI] == TS_ExternalSignal)
	{
		pBufferCtrl->moiSource = BM_EXTERNAL_MOI;
	}
	else //NO MOI TODO ajouter un enum pour BM_NO_MOI
	{
		pBufferCtrl->moiSource = BM_NO_MOI;
	}

	if(TriggerActivationAry[TS_MemoryBufferMOI] == TA_RisingEdge)
	{
		pBufferCtrl->moiActivation = RISING_EDGE;
	}
	else if(TriggerActivationAry[TS_MemoryBufferMOI] == TA_FallingEdge)
	{
		pBufferCtrl->moiActivation = FALLING_EDGE;
	}
	else if(TriggerActivationAry[TS_MemoryBufferMOI] == TA_AnyEdge)
	{
		pBufferCtrl->moiActivation = ANY_EDGE;
	}
	else
	{
		pBufferCtrl->moiActivation = RISING_EDGE;
	}


	pBufferCtrl->clear_memory = 0;
	pBufferCtrl->ConfigValid =0;

	//TODO CHECK IF EXTERNAL MEMORY BOARD IS PRESENT Then configure switch accordingly
	if( Mode == BM_OFF)
	{
		pBufferCtrl->BufferMode = BM_OFF;
		pBufferCtrl->switchConfig = BM_SWITCH_INTERNAL_LIVE;
		pBufferCtrl->clear_memory = 1;
      AXI4L_write32(pBufferCtrl->clear_memory,     pBufferCtrl->ADD + BM_CLEAR_MEMORY);
      pBufferCtrl->clear_memory = 0;
      AXI4L_write32(pBufferCtrl->clear_memory,     pBufferCtrl->ADD + BM_CLEAR_MEMORY);
	}
	else if(Mode == BM_WRITE)
	{
		pBufferCtrl->BufferMode = BM_WRITE;
		pBufferCtrl->switchConfig = BM_SWITCH_INTERNAL_LIVE;
	}
	else if(Mode == BM_READ)
	{
		pBufferCtrl->BufferMode = BM_READ;
		pBufferCtrl->switchConfig = BM_SWITCH_INTERNAL_PLAYBACK;
		//pBufferCtrl->rd_sequence_id = pGCRegs->MemoryBufferSequenceSelector;
		//pBufferCtrl->rd_start_img = 0;
	}
	WriteStruct(pBufferCtrl);

	if(Mode == BM_WRITE) // Do not enable in read mode wait for ACQ_Start
	{
      BufferManager_EnableBuffer(pBufferCtrl);
	}


	BUFFERING_INF("SetBufferMode");

}

uint32_t BufferManager_GetNumberOfSequenceMax()
{
	BUFFERING_INF("GetNumberOfSequenceMax");
	return BUF_MAX_SEQUENCE;
}

void BufferManager_SetNumberOfSequence(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs )
{
	BufferManager_DisableBuffer(pBufferCtrl);
	pBufferCtrl->nbSequenceMax = pGCRegs->MemoryBufferNumberOfSequences;
	AXI4L_write32(pBufferCtrl->nbSequenceMax, 	pBufferCtrl->ADD + NB_SEQUENCE_MAX);
	BufferManager_EnableBuffer(pBufferCtrl);

	BUFFERING_INF("SetNumberOfSequence");
}

void BufferManager_SetNumberOfImagePerSeq(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs ) {
	BufferManager_DisableBuffer(pBufferCtrl);
	pBufferCtrl->nbImagePerSeq = pGCRegs->MemoryBufferSequenceSize;
	AXI4L_write32(pBufferCtrl->nbImagePerSeq, 	pBufferCtrl->ADD + BM_NB_IMG_PER_SEQ);
	BufferManager_EnableBuffer(pBufferCtrl);

	BUFFERING_INF("SetNumberOfImagePerSeq");
}


void BufferManager_SetPreMoi(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs ){
	BufferManager_DisableBuffer(pBufferCtrl);
	pBufferCtrl->nb_img_pre = pGCRegs->MemoryBufferSequencePreMOISize;
	pBufferCtrl->nb_img_post  = BufferManager_ReturnNumberOfImagePost(pBufferCtrl);
	AXI4L_write32(pBufferCtrl->nb_img_pre, 	pBufferCtrl->ADD + BM_NB_IMG_PRE);
	AXI4L_write32(pBufferCtrl->nb_img_post, 	pBufferCtrl->ADD + BM_NB_IMG_POST);
	BufferManager_EnableBuffer(pBufferCtrl);

	BUFFERING_INF("SetPreMoi");
}

uint32_t BufferManager_ReturnNumberOfImagePost(t_bufferManager *pBufferCtrl){

	return pBufferCtrl->nbImagePerSeq- pBufferCtrl->nb_img_pre;
}

void BufferManager_SendSoftwareMoi(t_bufferManager *pBufferCtrl){
	AXI4L_write32( 1,	pBufferCtrl->ADD + BM_SOFT_MOI_SIG);
	AXI4L_write32( 0, 	pBufferCtrl->ADD + BM_SOFT_MOI_SIG);
}
