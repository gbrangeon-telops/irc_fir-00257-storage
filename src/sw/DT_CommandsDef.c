/**
 * @file DT_CommandsDef.c
 *  Debug terminal commands implementation.
 *  
 *  This file implements the debug terminal commands.
 * 
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "DebugTerminal.h"
#include "CircularByteBuffer.h"
#include "IRC_Status.h"
#include <string.h>

static IRC_Status_t DebugTerminalParseHLP(circByteBuffer_t *cbuf);

debugTerminalCommand_t gDebugTerminalCommands[] =
{
   {"RDM", DebugTerminalParseRDM},
   {"WRM", DebugTerminalParseWRM},
   {"NET", DebugTerminalParseNET},
   {"STACK", DebugTerminalParseSTACK},
   {"HLP", DebugTerminalParseHLP}
};

uint32_t gDebugTerminalCommandsCount = NUM_OF(gDebugTerminalCommands);

/**
 * Debug terminal Help command parser parser.
 * This parser is used to print debug terminal help.
 *
 * @return IRC_SUCCESS always.
 */
IRC_Status_t DebugTerminalParseHLP(circByteBuffer_t *cbuf)
{
   extern debugTerminal_t gDebugTerminal;

   // There is supposed to be no remaining bytes in the buffer
   if (!DebugTerminal_CommandIsEmpty(cbuf))
   {
      DT_ERR("Unsupported command arguments");
      return IRC_FAILURE;
   }

   DT_PRINTF("Storage FPGA debug terminal commands: (%d/%d)",
         gDebugTerminal.txCircBuffer->maxLength, gDebugTerminal.txCircBuffer->size);
   DT_PRINTF("  Read memory:        RDM address [c|u8|u16|u32|s8|s16|s32 length]");
   DT_PRINTF("  Write memory:       WRM address value");
   DT_PRINTF("  Network status:     NET [0|1 [port]]");
   DT_PRINTF("  Get Stack Level:    STACK");
   DT_PRINTF("  Print help:         HLP");

   return IRC_SUCCESS;
}

