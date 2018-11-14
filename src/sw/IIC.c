/**
 * @file IIC.c
 * I2C bus module implementation.
 *
 * This file implements the interface used to manage the I2C bus.
  *
 * $Rev: 22466 $
 * $Author: elarouche $
 * $Date: 2018-11-12 09:15:33 -0500 (lun., 12 nov. 2018) $
 * $Id: IIC_Utils.c 22466 2018-11-12 14:15:33Z elarouche $
 * $URL: http://einstein/svn/firmware/FIR-00257-Storage/trunk/src/sw/IIC_Utils.c $
 *
 * (c) Copyright 2018 Telops Inc.
 */
#include "IIC.h"
#include "xparameters.h"
#include "xiic.h"
#include "tel2000_param.h"

#define IIC_BASE_ADDRESS         XPAR_IIC_0_BASEADDR
#define IIC_DEVICE_ID            XPAR_IIC_0_DEVICE_ID
#define EEPROM_SODIMM0_ADDR      0x50
#define EEPROM_SODIMM1_ADDR      0x51
#define EEPROM_SODIMM0_BASEADDR  0x00
#define EEPROM_SODIMM1_BASEADDR  0x00
#define EEPROM_SODIMM_LENGTH     10

static XIic IicInstance; /* The instance of the IIC device. */


/**
 * Initializes I2C Interface.
 *
 * @return IRC_SUCCESS if successfully initialized
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t IIC_Init(void)
{
   XStatus Status;
   Status = XIic_Initialize(&IicInstance, XPAR_IIC_0_DEVICE_ID);
   return (Status == XST_SUCCESS ? IRC_SUCCESS : IRC_FAILURE);
}

/**
 * Validates SODIMM memory module
 * Validates the installed SODIMM memory modules by reading the data
 * from the EEPROM SPD and checking against expected density.
 *
 * @return IRC_SUCCESS if validation passes.
 * @return IRC_FAILURE if validation fails.
 */
IRC_Status_t IIC_SPD_Validate(void)
{
   static u8 sodimm0_spd_data[EEPROM_SODIMM_LENGTH];
   static u8 sodimm1_spd_data[EEPROM_SODIMM_LENGTH];

   IIC_SPD_ReadData(EEPROM_SODIMM0_BASEADDR, EEPROM_SODIMM0_ADDR, sodimm0_spd_data, EEPROM_SODIMM_LENGTH);
   IIC_SPD_ReadData(EEPROM_SODIMM1_BASEADDR, EEPROM_SODIMM1_ADDR, sodimm1_spd_data, EEPROM_SODIMM_LENGTH);

   #if MEMCONF == 16
     if (sodimm0_spd_data[4] == 0x04 && sodimm1_spd_data[4] == 0x04)
        return IRC_SUCCESS;
     else
        return IRC_FAILURE;
   #endif
   #if MEMCONF == 32
     if (sodimm0_spd_data[4] == 0x05 && sodimm1_spd_data[4] == 0x05)
        return IRC_SUCCESS;
     else
        return IRC_FAILURE;
   #endif
}


/*****************************************************************************/
/**
* This function reads a number of bytes from the IIC serial EEPROM into a
* specified buffer.
*
* @param Address contains the address into the EEPROM to read from.
* @param IicDevAddress contains the device address on the I2C bus
* @param BufferPtr contains the pointer into the data buffer to be filled.
* @param ByteCount contains the number of bytes in the buffer to be read.
*
* @return The number of bytes read. A value less than the specified input
*         value indicates an error.
*
****************************************************************************/
void IIC_SPD_ReadData(u8 Address, u8 IicDevAddress, u8 *BufferPtr, u16 ByteCount)
{
   unsigned ReceivedByteCount;
   u16 StatusReg;

   /*
    * Set the address register to the specified address by writing
    * the address to the device, this must be tried until it succeeds
    * because a previous write to the device could be pending and it
    * will not ack until that write is complete.
    */
   do {
      StatusReg = XIic_ReadReg(IIC_BASE_ADDRESS, XIIC_SR_REG_OFFSET);
      if(!(StatusReg & XIIC_SR_BUS_BUSY_MASK)) {
         ReceivedByteCount = XIic_Send(IIC_BASE_ADDRESS,
                     IicDevAddress,
                     (u8 *)&Address,
                     sizeof(Address),
                     XIIC_STOP);

         if (ReceivedByteCount != sizeof(Address)) {

            /* Send is aborted so reset Tx FIFO */
            XIic_WriteReg(IIC_BASE_ADDRESS,
                  XIIC_CR_REG_OFFSET,
                  XIIC_CR_TX_FIFO_RESET_MASK);
            XIic_WriteReg(IIC_BASE_ADDRESS,
                  XIIC_CR_REG_OFFSET,
                  XIIC_CR_ENABLE_DEVICE_MASK);
         }
      }

   } while (ReceivedByteCount != sizeof(Address));

   /*
    * Read the number of bytes at the specified address from the EEPROM.
    */
   ReceivedByteCount = XIic_Recv(IIC_BASE_ADDRESS, IicDevAddress,
               BufferPtr, ByteCount, XIIC_STOP);
}
