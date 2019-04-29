/**
 * @file gpio.h
 * GPIO controller header file.
 *
 * This file defines the GPIO controller interface.
 *
 * $Rev: 19372 $
 * $Author: odionne $
 * $Date: 2016-11-01 11:33:59 -0400 (mar., 01 nov. 2016) $
 * $Id: gpio.h 19372 2016-11-01 15:33:59Z odionne $
 * $URL: http://einstein/svn/firmware/FIR-00257-Storage/branchs/2017-03-30%20-%20Bus%204%20pixels%20BufferDefrag%20Branch/src/GPIO/gpio.h $
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef GPIO_H
#define GPIO_H

/***************************** Include Files ********************************/
#include "xgpio.h"
#include "IRC_Status.h"


/************************** Constant Definitions ****************************/
#define GPIO_TP_CH_ID               1
#define GPIO_MEM_ADDR_CH_ID         2
#define GPIO_TP_TOGGLE_PERIOD_US    500000


/**************************** Type Definitions ******************************/
/**
 * GPIO test point Id enum. It corresponds to the bit position in GPIO bus.
 */
enum GPIO_TP_Id_enum {
   GPIO_TP11 = 0,
   GPIO_TP12 = 1
};
typedef enum GPIO_TP_Id_enum t_GPIO_TP_Id;

/*
 * GPIO controller structure.
 */
struct s_GPIO_Ctrl
{
   XGpio GPIO;
   uint32_t tpValue;
};
typedef struct s_GPIO_Ctrl t_GPIO_Ctrl;


/************************** Function Prototypes *****************************/
IRC_Status_t GPIO_Init();
void GPIO_TP_Set(t_GPIO_TP_Id tpId);
void GPIO_TP_Clear(t_GPIO_TP_Id tpId);
void GPIO_TP_Toggle(t_GPIO_TP_Id tpId);
void GPIO_TP11_Heartbeat_SM();
void GPIO_SetMemAddrMsb(uint32_t memAddr);


#endif // GPIO_H
