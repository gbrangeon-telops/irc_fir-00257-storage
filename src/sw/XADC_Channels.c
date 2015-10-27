/**
 *  @file XADC_Channels.c
 *  XADC and XSysmon channels implementation.
 *  
 *  This file implements the XADC and XSysmon channels.
 *  
 *  $Rev$
 *  $Author$
 *  $Date$
 *  $Id$
 *  $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "XADC_Channels.h"
#include "GC_Registers.h"

xadcChannel_t intAdcChannels[XIC_COUNT] =
{
   // {id,        isValid, muxAddr, polarity,      unit,          raw,  voltOffset, voltGain,         voltage, phyOffset,  phyGain,    phyConverter,     p_physical,                               callback}
   {XIC_TEMP,     0,       0xFF,    XCP_UNIPOLAR,  XCU_CELCIUS,   {0},  0.0f,       1.0f / 65536.0f,  0.0F,    -273.15f,   503.975f,   XADC_OGPhyConv,   &DeviceTemperatureAry[DTS_StorageFPGA],    NULL},
   {XIC_VCCINT,   0,       0xFF,    XCP_UNIPOLAR,  XCU_VOLT,      {0},  0.0f,       1.0f / 65536.0f,  0.0F,    0.0f,       3.0f,       XADC_OGPhyConv,   &DeviceVoltageAry[DVS_StorageFPGA_VCCINT], NULL},
   {XIC_VCCAUX,   0,       0xFF,    XCP_UNIPOLAR,  XCU_VOLT,      {0},  0.0f,       1.0f / 65536.0f,  0.0F,    0.0f,       3.0f,       XADC_OGPhyConv,   &DeviceVoltageAry[DVS_StorageFPGA_VCCAUX], NULL},
   {XIC_VREFP,    0,       0xFF,    XCP_UNIPOLAR,  XCU_VOLT,      {0},  0.0f,       1.0f / 65536.0f,  0.0F,    0.0f,       3.0f,       XADC_OGPhyConv,   &DeviceVoltageAry[DVS_StorageFPGA_VREFP],  NULL},
   {XIC_VREFN,    0,       0xFF,    XCP_BIPOLAR,   XCU_VOLT,      {0},  0.0f,       1.0f / 65536.0f,  0.0F,    0.0f,       3.0f,       XADC_OGPhyConv,   &DeviceVoltageAry[DVS_StorageFPGA_VREFN],  NULL},
   {XIC_VBRAM,    0,       0xFF,    XCP_UNIPOLAR,  XCU_VOLT,      {0},  0.0f,       1.0f / 65536.0f,  0.0F,    0.0f,       3.0f,       XADC_OGPhyConv,   &DeviceVoltageAry[DVS_StorageFPGA_VBRAM],  NULL}
};
