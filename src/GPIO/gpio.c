/**
 * @file gpio.c
 * GPIO controller source file.
 *
 * This file implements the GPIO controller interface.
 * 
 * $Rev: 19372 $
 * $Author: odionne $
 * $Date: 2016-11-01 11:33:59 -0400 (mar., 01 nov. 2016) $
 * $Id: gpio.c 19372 2016-11-01 15:33:59Z odionne $
 * $URL: http://einstein/svn/firmware/FIR-00257-Storage/branchs/2017-03-30%20-%20Bus%204%20pixels%20BufferDefrag%20Branch/src/GPIO/gpio.c $
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "gpio.h"
#include "xparameters.h"
#include "utils.h"


// Global variables
static t_GPIO_Ctrl GPIO_Ctrl;


/**
 * Initialize the GPIO controller.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t GPIO_Init()
{
   XStatus status;

   // Initialize GPIO controller
   status = XGpio_Initialize(&GPIO_Ctrl.GPIO, XPAR_AXI_GPIO_DEVICE_ID);

   // Set GPIO direction (0 for output, 1 for input)
   XGpio_SetDataDirection(&GPIO_Ctrl.GPIO, GPIO_TP_CH_ID, 0);
   XGpio_SetDataDirection(&GPIO_Ctrl.GPIO, GPIO_MEM_ADDR_CH_ID, 0);

   // Set GPIO initial values
   GPIO_Ctrl.tpValue = 0;
   XGpio_DiscreteWrite(&GPIO_Ctrl.GPIO, GPIO_TP_CH_ID, GPIO_Ctrl.tpValue);
   XGpio_DiscreteWrite(&GPIO_Ctrl.GPIO, GPIO_MEM_ADDR_CH_ID, 0);

   return (status == XST_SUCCESS) ? IRC_SUCCESS : IRC_FAILURE;
}


/**
 * Set GPIO test point value.
 *
 * @param tpId Test point Id.
 *
 * @return void.
 */
void GPIO_TP_Set(t_GPIO_TP_Id tpId)
{
   // Set the TP value without changing the others
   BitSet(GPIO_Ctrl.tpValue, tpId);
   XGpio_DiscreteWrite(&GPIO_Ctrl.GPIO, GPIO_TP_CH_ID, GPIO_Ctrl.tpValue);
}


/**
 * Clear GPIO test point value.
 *
 * @param tpId Test point Id.
 *
 * @return void.
 */
void GPIO_TP_Clear(t_GPIO_TP_Id tpId)
{
   // Clear the TP value without changing the others
   BitClr(GPIO_Ctrl.tpValue, tpId);
   XGpio_DiscreteWrite(&GPIO_Ctrl.GPIO, GPIO_TP_CH_ID, GPIO_Ctrl.tpValue);
}


/**
 * Toggle GPIO test point value.
 *
 * @param tpId Test point Id.
 *
 * @return void.
 */
void GPIO_TP_Toggle(t_GPIO_TP_Id tpId)
{
   // Toggle the TP value without changing the others
   BitFlp(GPIO_Ctrl.tpValue, tpId);
   XGpio_DiscreteWrite(&GPIO_Ctrl.GPIO, GPIO_TP_CH_ID, GPIO_Ctrl.tpValue);
}


/**
 * Heartbeat state machine for GPIO TP11.
 *
 * @return void.
 */
void GPIO_TP11_Heartbeat_SM()
{
   static uint64_t tic = 0;

   // Toggle TP value if period time is reached
   if (elapsed_time_us(tic) >= GPIO_TP_TOGGLE_PERIOD_US)
   {
      GPIO_TP_Toggle(GPIO_TP11);
      GETTIME(&tic);
   }
}


/**
 * Set GPIO memory address most significant bits.
 *
 * @param memAddrMsb Value to set.
 *
 * @return void.
 */
void GPIO_SetMemAddrMsb(uint32_t memAddrMsb)
{
   XGpio_DiscreteWrite(&GPIO_Ctrl.GPIO, GPIO_MEM_ADDR_CH_ID, memAddrMsb);
}
