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

#include <stdint.h>
#include "tel2000_param.h"
#include "mgt_ctrl.h"
#include "BufferManager.h"


// Global variables
t_mgt gMGT = MGT_Ctor(TEL_PAR_TEL_AXIL_MGT_BASEADDR);
t_bufferManager gBufManager = Buffering_Intf_Ctor(TEL_PAR_TEL_AXIL_BUF_BASEADDR);

/*--------------------------------------------------------------------------------------*/
/* main                                                                                 */
/*--------------------------------------------------------------------------------------*/
int main()  // Defining the standard main() function
{
    uint64_t addr = MEMORY_BUFFER_BASEADDR;
    uint32_t read_data;
    const uint32_t data = 0xAA55AA55;

    // Init MGT module
    MGT_Init(&gMGT);
    MGT_DisableMGT(&gMGT, DATA_MGT);
    MGT_DisableMGT(&gMGT, VIDEO_MGT);
    MGT_ReadCoreStatus(&gMGT);
    MGT_ReadPLLStatus(&gMGT);

    // Init Buffer Manager module
    BufferManager_Init(&gBufManager, &gcRegsData);
    BufferManager_WaitMemReady(&gBufManager);

    while(1)
    {
        BufferManager_UpdateErrorFlags(&gBufManager);
        temp_mem_write(addr, data);
        read_data = 0;
        read_data = temp_mem_read(addr);
        if (read_data != data)
            break;
        addr += 0x100;
        if (addr >= MEMORY_BUFFER_HIGHADDR)
            addr = MEMORY_BUFFER_BASEADDR;
    }
}
