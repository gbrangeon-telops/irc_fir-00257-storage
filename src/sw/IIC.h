/**
 * @file IIC.h
 * I2C bus module header.
 *
 * This file defines the interface used to manage the I2C bus.
  *
 * $Rev: 22458 $
 * $Author: elarouche $
 * $Date: 2018-11-08 16:01:22 -0500 (jeu., 08 nov. 2018) $
 * $Id: IIC_Utils.h 22458 2018-11-08 21:01:22Z elarouche $
 * $URL: http://einstein/svn/firmware/FIR-00257-Storage/trunk/src/sw/IIC_Utils.h $
 *
 * (c) Copyright 2018 Telops Inc.
 */

#ifndef IIC_H
#define IIC_H

#include "xil_types.h"
#include "IRC_Status.h"

/* Prototypes */
IRC_Status_t IIC_Init(void);
IRC_Status_t IIC_SPD_Validate(void);
void IIC_SPD_ReadData(u8 Address, u8 IicDevAddress, u8 *BufferPtr, u16 ByteCount);

#endif // IIC_UTILS_H
