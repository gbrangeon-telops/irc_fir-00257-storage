/**
 * @file HwIcap.h
 * HwIcap module header.
 *
 * This file implements the interface used to manage the HWICAP reconfiguration IP.
  *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2018 Telops Inc.
 */


#include <xparameters.h>
#include <xhwicap.h>
#include "hwicap.h"

#define WRITE_BUFFER_SIZE  8

static XHwIcap Instance;

int HwIcap_Init(void)
{
   XHwIcap_Config *conf;

   conf = XHwIcap_LookupConfig(XPAR_AXI_HWICAP_0_DEVICE_ID);
   if (XHwIcap_CfgInitialize(&Instance, conf, conf->BaseAddress) == XST_FAILURE)
      return XST_FAILURE;
   return XHwIcap_SelfTest(&Instance);
}

void HwIcap_Reconfig(uint32_t addr)
{
   static uint32_t WriteBuffer[WRITE_BUFFER_SIZE];
   int count = 0;

   /* Fill write buffer */
   WriteBuffer[count++] = 0xffffffff; /* Dummy Word */
   WriteBuffer[count++] = 0xaa995566; /* Sync Word */
   WriteBuffer[count++] = 0x20000000; /* Type 1 NO OP */
   WriteBuffer[count++] = 0x30020001; /* Type 1 Write 1 Words to WBSTAR */
   WriteBuffer[count++] = addr;       /* Warm Boot Start Address */
   WriteBuffer[count++] = 0x30008001; /* Type 1 Write 1 Words to CMD */
   WriteBuffer[count++] = 0x0000000F; /* IPROG Command */
   WriteBuffer[count++] = 0x20000000; /* Type 1 NO OP */

   /* Write to the device */
   XHwIcap_DeviceWrite(&Instance, (u32 *) WriteBuffer, WRITE_BUFFER_SIZE);
}

