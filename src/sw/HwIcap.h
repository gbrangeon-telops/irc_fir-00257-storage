/**
 * @file HwIcap.h
 * HwIcap module header.
 *
 * This file defines the interface used to manage the HWICAP reconfiguration IP.
  *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2018 Telops Inc.
 */

#ifndef HWICAP_H
#define HWICAP_H

#include <stdint.h>

#define HWICAP_BOOT_ADDRESS 0x670000

/* Prototypes */
int HwIcap_Init(void);
void HwIcap_Reconfig(uint32_t addr);

#endif
