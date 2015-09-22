/**
 * @file BufferManager.h
 * Buffer Manager module header file.
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

#ifndef BUFFERMANAGER_H
#define BUFFERMANAGER_H


/***************************** Include Files ********************************/
#include "GC_Registers.h"
#include "IRC_Status.h"
#include <stdint.h>
#include <stdbool.h>


/************************** Constant Definitions ****************************/
#define BUF_MAX_SEQUENCE        255
#define MEM_ADDR_GPIO_CH_ID     1
#define MEM_READY_TIMEOUT_IN_S  10

/**
 * Memory 0 address map.
 */
#define MEM0_BUFFER_BASEADDR    ((uint64_t)TEL_PAR_TEL_dimm0_ctrl_memaddr_BASEADDR)
#define MEM0_BUFFER_HIGHADDR    ((uint64_t)TEL_PAR_TEL_dimm0_ctrl_memaddr_HIGHADDR)
#define MEM0_BUFFER_SIZE        ((uint64_t)(MEM0_BUFFER_HIGHADDR - MEM0_BUFFER_BASEADDR + 1))

/**
 * Memory 1 address map.
 */
#define MEM1_BUFFER_BASEADDR    ((uint64_t)TEL_PAR_TEL_dimm1_ctrl_memaddr_BASEADDR)
#define MEM1_BUFFER_HIGHADDR    ((uint64_t)TEL_PAR_TEL_dimm1_ctrl_memaddr_HIGHADDR)
#define MEM1_BUFFER_SIZE        ((uint64_t)(MEM0_BUFFER_HIGHADDR - MEM0_BUFFER_BASEADDR + 1))

/**
 * AXI4 Lite memory access address space.
 */
#define AXIL_MEM_ADDR_SPACE     ((uint32_t)(TEL_PAR_TEL_AXIL_MEM_OUT_HIGHADDR - TEL_PAR_TEL_AXIL_MEM_OUT_BASEADDR + 1))

//BUFFER CTRL ADDRESS MAP
#define BM_MEM0_BASE_ADDR_LSB 0x0     //MEMORY 0 BASE ADDR LSB
#define BM_MEM0_BASE_ADDR_MSB 0x4     //MEMORY 0 BASE ADDR MSB
#define BM_MEM1_BASE_ADDR_LSB 0x8     //MEMORY 1 BASE ADDR LSB
#define BM_MEM1_BASE_ADDR_MSB 0xC     //MEMORY 1 BASE ADDR MSB
#define NB_SEQUENCE_MAX			0x10		//SEQUENCE
#define BM_NB_IMG_PER_SEQ 		0x14		//IMAGES
#define BM_FRAME_SIZE 			0x18	//pIXEL
#define BM_BUFFER_MODE			0x1C	//BM_OFF - BMWRITE - BMREAD
#define BM_HDR_SIZE 			   0x20	//BYTES
#define BM_IMG_SIZE 			   0x24	//BYTES
#define BM_NB_IMG_PRE 			0x28	//PRE = 0 -> no PREMOI
#define BM_NB_IMG_POST 			0x2C	//NB image including MOI to the end
#define BM_READ_SEQUENCE_ID 	0x30	//READ seq ID
#define BM_READ_START_ID		0x34	//READ Start image ID(in buffer memory)
#define BM_READ_STOP_ID			0x38	//READ STOP image ID(in buffer memory)
#define BM_CLEAR_MEMORY			0x3C	//Pulse to clear memory
#define BM_ACQ_STOP				0x40	//When acquisition is stop assert this signal.
#define BM_CONFIG_VALID			0x44	//Hold at 1 when valid. Do not change param when valid
#define BM_AXIL_MEM_ADDR_WIDTH  0x48    //nb of bits kept in the AXIL memory address

#define BM_NB_SEQ_IN_MEM		0x4C	//Return number of sequence int the buffer
#define BM_WRITE_ERR 			0x50	//Return write error
#define BM_READ_ERR 			   0x54	//Return read error
#define BM_MEM_READY          0x58  //Return status of memory interface
#define BM_MIN_FRAME_TIME     0x5C  //Configure frame duration in read mode

//BUFFER TABLE ADDRESS MAP
#define BT_START_IMG_OFFSET		0
#define BT_MOI_IMG_OFFSET		1
#define BT_END_IMG_OFFSET		2

//BUFFER MANAGER ERROR MASKS
#define bufWriteErrMask         ((t_bufferManagerError)0x0000000F)
#define bufWriteErrBitPos       0
#define bufReadErrMask          ((t_bufferManagerError)0x000000F0)
#define bufReadErrBitPos        4
#define memReadyErrMask         ((t_bufferManagerError)0x00000100)
#define memReadyErrBitPos       8


/**************************** Type Definitions ******************************/
/**
 * BUFFER MANAGER STRUCT
 */
struct s_bufferManagerStruct {
   uint32_t SIZE;      // Number of config elements (uint64_t counts as 2), excluding SIZE and ADD.
   uint32_t ADD;

   uint64_t Mem0_base_addr;  // 32bit-LSB is sent first
   uint64_t Mem1_base_addr;  // 32bit-LSB is sent first
   uint32_t nbSequenceMax;
   uint32_t nbImagePerSeq;
   uint32_t FrameSize;
   uint32_t BufferMode;
   uint32_t HDR_Size;
   uint32_t IMG_Size;
   uint32_t nb_img_pre; //exluding MOI
   uint32_t nb_img_post; //including MOI
   uint32_t rd_sequence_id;
   uint32_t rd_start_img;
   uint32_t rd_stop_img;
   uint32_t clear_memory;
   uint32_t acq_stop;
   uint32_t ConfigValid;
   uint32_t axilMemAddrWidth;
};
typedef struct s_bufferManagerStruct t_bufferManager;

/**
 * BUFFER MODE ENUM
 */
enum BufferMode_enum {
   BM_OFF = 0,
   BM_WRITE = 1,
   BM_READ = 2
};
typedef enum BufferMode_enum t_bufferMode;

/**
 * BUFFER TABLE STRUCT
 */
struct s_bufferTable {
   uint32_t start_img;
   uint32_t moi_img;
   uint32_t stop_img;
};
typedef struct s_bufferTable t_bufferTable;

typedef enum
{
   BMS_IDLE = 0,
   BMS_CFG,
   BMS_READ,
   BMS_WAIT,
   BMS_DONE
} bmState_t;

/**
 * BUFFER MANAGER ERROR TYPE
 */
typedef uint32_t t_bufferManagerError;


/***************** Macros (Inline Functions) Definitions ********************/
#define Buffering_Intf_Ctor(add) {sizeof(t_bufferManager)/4 - 2, add, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}


/************************** Function Prototypes *****************************/
IRC_Status_t BufferManager_Init(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs);
void BufferManager_WaitMemReady(t_bufferManager *pBufferCtrl);
void BufferManager_UpdateErrorFlags(t_bufferManager *pBufferCtrl);
void BufferManager_ReadSequence(t_bufferManager *pBufferCtrl, 	const gcRegistersData_t *pGCRegs);
void BufferManager_ReadImage(t_bufferManager *pBufferCtrl, 	const gcRegistersData_t *pGCRegs);
void BufferManager_ClearSequence(t_bufferManager *pBufferCtrl, 	const gcRegistersData_t *pGCRegs);
void BufferManager_EnableBuffer(t_bufferManager *pBufferCtrl);
void BufferManager_DisableBuffer(t_bufferManager *pBufferCtrl);
void BufferManager_SetBufferMode(t_bufferManager *pBufferCtrl, t_bufferMode Mode, const gcRegistersData_t *pGCRegs );
void BufferManager_SetSequenceParams(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs );

uint32_t BufferManager_GetNbImageMax(const gcRegistersData_t *pGCRegs);
uint32_t BufferManager_GetNumberOfSequenceMax();
uint32_t BufferManager_GetNumSequenceCount(t_bufferManager *pBufferCtrl);
uint32_t BufferManager_GetSequenceFirstFrameId(t_bufferManager *pBufferCtrl, uint32_t SequenceID);
uint32_t BufferManager_GetSequenceMOIFrameId(t_bufferManager *pBufferCtrl, uint32_t SequenceID);
uint32_t BufferManager_GetSequenceLength(t_bufferManager *pBufferCtrl, uint32_t SequenceID);

extern bool gBufferStartDownloadTrigger;
extern bool gBufferStopDownloadTrigger;
void BufferManagerOutput_SM();
void BufferManager_ConfigureMinFrameTime(t_bufferManager *pBufferCtrl, float time_us);
void BufferManager_AcquisitionStop(t_bufferManager *pBufferCtrl, bool flag);

#endif // BUFFERMANAGER_H
