/**
 *  @file storage_init.h
 *  Storage FPGA initialization header file.
 *  
 *  This file defines the storage FPGA initialization module.
 *  
 *  $Rev$
 *  $Author$
 *  $Date$
 *  $Id$
 *  $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef STORAGE_INIT_H
#define STORAGE_INIT_H

#include "Protocol_F1F2.h"
#include "IRC_Status.h"
#include "mgt_ctrl.h"
#include "BufferManager.h"

// TODO: New defines MAX_LEN for Storage?
#define FPGA_UART_RX_BUFFER_SIZE    (F1F2_MIN_PACKET_SIZE + F1F2_REG_ADDR_SIZE + GC_REG_MAX_OUT_WRITE_LENGTH)
#define FPGA_UART_TX_BUFFER_SIZE    (F1F2_MIN_PACKET_SIZE + F1F2_REG_ADDR_SIZE + GC_REG_MAX_OUT_READ_LENGTH)

IRC_Status_t Storage_GC_Init();
IRC_Status_t Storage_Intc_Init();
IRC_Status_t Storage_Intc_Start();

IRC_Status_t Storage_MGT_Init(t_mgt *pMgtCtrl);
IRC_Status_t Storage_BufferManager_Init(t_bufferManager *pBufferCtrl);

#endif // STORAGE_INIT_H
