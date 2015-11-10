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


#define OUTPUT_CI_UART_RX_BUFFER_SIZE        128
#define OUTPUT_CI_UART_RX_CIRC_BUFFER_SIZE   (2 * F1F2_MAX_NET_PACKET_SIZE)
#define OUTPUT_CI_UART_TX_BUFFER_SIZE        F1F2_MAX_NET_PACKET_SIZE

#define NI_CMD_QUEUE_SIZE           5
#define GCM_CMD_QUEUE_SIZE          1
#define OUTPUT_CI_CMD_QUEUE_SIZE    5
#define FU_CMD_QUEUE_SIZE           1

#define GC_EVENT_ERROR_QUEUE_SIZE   5

IRC_Status_t Storage_NI_Init();
IRC_Status_t Storage_FU_Init();
IRC_Status_t Storage_GC_Init();
IRC_Status_t Storage_QSPIFlash_Init();
IRC_Status_t Storage_Intc_Init();
IRC_Status_t Storage_Intc_Start();
IRC_Status_t Storage_MGT_Init(t_mgt *pMgtCtrl);
IRC_Status_t Storage_BufferManager_Init(t_bufferManager *pBufferCtrl);
IRC_Status_t Storage_XADC_Init();

#endif // STORAGE_INIT_H
