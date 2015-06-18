/**
 * @file test_point.c
 * Test point controller source file.
 *
 * This file implements the test point controller interface.
 * 
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "test_point.h"
#include "xparameters.h"
#include "utils.h"


// Global variables
static t_TP_Ctrl tpCtrl;


/**
 * Initialize the test point controller.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t TP_Init()
{
    XStatus status;

    // Initialize test point GPIO controller
    status = XGpio_Initialize(&tpCtrl.tpGPIO, XPAR_AXI_GPIO_TP_DEVICE_ID);

    // Set GPIO direction (0 for output, 1 for input)
    XGpio_SetDataDirection(&tpCtrl.tpGPIO, TP_GPIO_CH_ID, 0);

    // Set test point initial values
    tpCtrl.tpValue = 0;
    XGpio_DiscreteWrite(&tpCtrl.tpGPIO, TP_GPIO_CH_ID, tpCtrl.tpValue);

    return (status == XST_SUCCESS) ? IRC_SUCCESS : IRC_FAILURE;
}


/**
 * Set test point value.
 *
 * @param tpId Test point Id.
 *
 * @return void.
 */
void TP_Set(t_TP_Id tpId)
{
    // Set the TP value without changing the others
    BitSet(tpCtrl.tpValue, tpId);
    XGpio_DiscreteWrite(&tpCtrl.tpGPIO, TP_GPIO_CH_ID, tpCtrl.tpValue);
}


/**
 * Clear test point value.
 *
 * @param tpId Test point Id.
 *
 * @return void.
 */
void TP_Clear(t_TP_Id tpId)
{
    // Clear the TP value without changing the others
    BitClr(tpCtrl.tpValue, tpId);
    XGpio_DiscreteWrite(&tpCtrl.tpGPIO, TP_GPIO_CH_ID, tpCtrl.tpValue);
}


/**
 * Toggle test point value.
 *
 * @param tpId Test point Id.
 *
 * @return void.
 */
void TP_Toggle(t_TP_Id tpId)
{
    // Toggle the TP value without changing the others
    BitFlp(tpCtrl.tpValue, tpId);
    XGpio_DiscreteWrite(&tpCtrl.tpGPIO, TP_GPIO_CH_ID, tpCtrl.tpValue);
}


/**
 * Heartbeat state machine for TP11.
 *
 * @return void.
 */
void TP_TP11_Heartbeat_SM()
{
    static uint64_t tic = 0;

    // Toggle TP value if period time is reached
    if (elapsed_time_us(tic) >= TP_TOGGLE_PER_IN_US)
    {
        TP_Toggle(TP11);
        GETTIME(&tic);
    }
}
