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
#include "BufferManager.h"


// Global variables
t_bufferManager gBufManager = Buffering_Intf_Ctor(TEL_PAR_TEL_AXIL_BUF_BASEADDR);

/*--------------------------------------------------------------------------------------*/
/* main                                                                                 */
/*--------------------------------------------------------------------------------------*/
int main()  // Defining the standard main() function
{
    uint32_t cnt = 0;
    uint32_t read_data;

    while(1)
    {
        //AXI4L_write32(cnt, XPAR_MEMORYBUFFER_DIMM0_CTRL_BASEADDR + cnt);
        //read_data = AXI4L_read32(XPAR_MEMORYBUFFER_DIMM0_CTRL_BASEADDR + cnt);
        cnt += 4;
        if (cnt >= 0xFFFF)
        	cnt = 0;
    }
}
