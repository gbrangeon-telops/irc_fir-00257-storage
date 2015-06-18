/**
 * @file test_point.h
 * Test point controller header file.
 *
 * This file defines the test point controller interface.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef TEST_POINT_H
#define TEST_POINT_H

/***************************** Include Files ********************************/
#include "xgpio.h"
#include "IRC_Status.h"


/************************** Constant Definitions ****************************/
#define TP_GPIO_CH_ID           1
#define TP_TOGGLE_PER_IN_US     500000


/**************************** Type Definitions ******************************/
/**
 * Test point Id enum. It corresponds to the bit position in GPIO bus.
 */
enum TP_Id_enum {
   TP11 = 0,
   TP12 = 1
};
typedef enum TP_Id_enum t_TP_Id;

/*
 * Test point controller structure.
 */
struct s_TP_Ctrl
{
   XGpio tpGPIO;
   uint32_t tpValue;
};
typedef struct s_TP_Ctrl t_TP_Ctrl;


/************************** Function Prototypes *****************************/
IRC_Status_t TP_Init();
void TP_Set(t_TP_Id tpId);
void TP_Clear(t_TP_Id tpId);
void TP_Toggle(t_TP_Id tpId);
void TP_TP11_Heartbeat_SM();


#endif // TEST_POINT_H
