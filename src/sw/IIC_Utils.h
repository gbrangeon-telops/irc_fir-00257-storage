/**
 * @file IIC_Utils.h
 * I2C utility module header.
 *
 * This file defines the interface used to manage the I2C bus.
  *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2018 Telops Inc.
 */

#ifndef IIC_UTILS_H
#define IIC_UTILS_H

#include "xil_types.h"
#include "IRC_Status.h"

/* Prototypes */
IRC_Status_t IIC_Init(void);
IRC_Status_t IIC_SPD_Validate(void);
void IIC_SPD_ReadData(u8 Address, u8 IicDevAddress, u8 *BufferPtr, u16 ByteCount);

#endif // IIC_UTILS_H
