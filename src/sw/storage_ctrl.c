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
#include "Timer.h"
#include "utils.h"
#include "storage_init.h"
#include "GC_Manager.h"
#include "test_point.h"
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
    // Init timer
    Timer_Init(XPAR_TMRCTR_0_BASEADDR, XPAR_TMRCTR_0_CLOCK_FREQ_HZ);
    WAIT_US(30);

    // Init interrupt controller
    Storage_Intc_Init();

    // GenICam initialization
    Storage_GC_Init();

    // Start interrupt controller
    Storage_Intc_Start();

    // Init MGT module
    Storage_MGT_Init(&gMGT);

    // Init Buffer Manager module
    // @attention This function contains a wait loop.
    Storage_BufferManager_Init(&gBufManager);

    // Init test point controller
    TP_Init();

    while(1)
    {
        GC_Manager_SM();
        BufferManager_UpdateErrorFlags(&gBufManager);
        TP_TP11_Heartbeat_SM();
    }
}
