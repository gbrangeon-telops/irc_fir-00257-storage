/**
 *  @file XADC_Channels.h
 *  XADC and XSysmon monitor channels header.
 *  
 *  This file defines the XADC and XSysmon channels.
 *  
 *  $Rev$
 *  $Author$
 *  $Date$
 *  $Id$
 *  $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef XADC_CHANNELS_H
#define XADC_CHANNELS_H

#include "XADC.h"

// #define XADC_EXTERNAL_CHANNELS_ENABLED

/**
 * XADC internal channels.
 */
enum xadcIntChEnum {
   XIC_TEMP = 0,     /**< On Chip Temperature */
   XIC_VCCINT,       /**< VCCINT */
   XIC_VCCAUX,       /**< VCCAUX */
   XIC_VREFP,        /**< VREFP */
   XIC_VREFN,        /**< VREFN */
   XIC_VBRAM,        /**< VBRAM */
   XIC_COUNT         /**< Number of XADC internal channels */
};

/**
 * XADC internal channels data type.
 */
typedef enum xadcIntChEnum xadcIntCh_t;


extern xadcChannel_t intAdcChannels[XIC_COUNT];

#endif // XADC_CHANNELS_H
