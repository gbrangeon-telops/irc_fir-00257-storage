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
#include "xparameters.h"
#include "mb_axi4l_bridge.h"


/*--------------------------------------------------------------------------------------*/
/* main                                                                                 */
/*--------------------------------------------------------------------------------------*/
int main()  // Defining the standard main() function
{
    uint32_t cnt = 0;
    uint32_t read_data;

    while(1)
    {
        AXI4L_write32(cnt, XPAR_MEMORYBUFFER_DIMM0_CTRL_BASEADDR + cnt);
        read_data = AXI4L_read32(cnt);
        cnt += 4;
    }
}
