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
#include "xgpio.h"
#include "xparameters.h"
#include "utils.h"


// Global variables
static XGpio tpCtrl;


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
    status = XGpio_Initialize(&tpCtrl, XPAR_AXI_GPIO_TP_DEVICE_ID);

    // Set GPIO direction (0 for output, 1 for input)
    XGpio_SetDataDirection(&tpCtrl, TP_GPIO_CH_ID, 0);

    // Set test point initial values
    XGpio_DiscreteWrite(&tpCtrl, TP_GPIO_CH_ID, 0);

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
    uint32_t tp_val;

    // Set the TP value without changing the others
    tp_val = XGpio_DiscreteRead(&tpCtrl, TP_GPIO_CH_ID);
    BitSet(tp_val, tpId);
    XGpio_DiscreteWrite(&tpCtrl, TP_GPIO_CH_ID, tp_val);
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
    uint32_t tp_val;

    // Clear the TP value without changing the others
    tp_val = XGpio_DiscreteRead(&tpCtrl, TP_GPIO_CH_ID);
    BitClr(tp_val, tpId);
    XGpio_DiscreteWrite(&tpCtrl, TP_GPIO_CH_ID, tp_val);
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
    uint32_t tp_val;

    // Toggle the TP value without changing the others
    tp_val = XGpio_DiscreteRead(&tpCtrl, TP_GPIO_CH_ID);
    BitFlp(tp_val, tpId);
    XGpio_DiscreteWrite(&tpCtrl, TP_GPIO_CH_ID, tp_val);
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
