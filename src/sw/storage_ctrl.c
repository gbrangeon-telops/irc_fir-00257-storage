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
#include "storage_init.h"
#include "GC_Manager.h"
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

    // Init interrupt controller
    Storage_Intc_Init();

    // GenICam initialization
    // TODO: De-comment when GC is all coded
    //Storage_GC_Init();

    // Start interrupt controller
    Storage_Intc_Start();

    // Init MGT module
    Storage_MGT_Init(&gMGT);

    // Init Buffer Manager module
    // @attention This function contains a wait loop.
    Storage_BufferManager_Init(&gBufManager);

    while(1)
    {
        // TODO: De-comment when GC is all coded
        //GC_Manager_SM();
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
