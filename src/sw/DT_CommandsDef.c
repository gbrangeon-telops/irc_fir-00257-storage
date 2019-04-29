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
#include "BufferManager.h"
#include "CircularByteBuffer.h"
#include "IRC_Status.h"
#include "utils.h"
#include <string.h>

static IRC_Status_t DebugTerminalParseHLP(circByteBuffer_t *cbuf);
static IRC_Status_t DebugTerminalParseBUF(circByteBuffer_t *cbuf);

debugTerminalCommand_t gDebugTerminalCommands[] =
{
   {"BUF", DebugTerminalParseBUF},
   {"RDM", DebugTerminalParseRDM},
   {"WRM", DebugTerminalParseWRM},
   {"NET", DebugTerminalParseNET},
   {"STACK", DebugTerminalParseSTACK},
   {"CI", DebugTerminalParseCI},
   {"HLP", DebugTerminalParseHLP}
};

uint32_t gDebugTerminalCommandsCount = NUM_OF(gDebugTerminalCommands);

extern ctrlIntf_t gCtrlIntf_OutputFPGA;

debugTerminalCtrlIntf_t gDebugTerminalCtrlIntfs[] =
{
   {"OUTPUT", &gCtrlIntf_OutputFPGA}
};

uint32_t gDebugTerminalCtrlIntfsCount = NUM_OF(gDebugTerminalCtrlIntfs);

/**
 * Debug terminal Help command parser parser.
 * This parser is used to print debug terminal help.
 *
 * @return IRC_SUCCESS when help command was successfully executed.
 * @return IRC_FAILURE otherwise.
 */
static IRC_Status_t DebugTerminalParseHLP(circByteBuffer_t *cbuf)
{
   // There is supposed to be no remaining bytes in the buffer
   if (!DebugTerminal_CommandIsEmpty(cbuf))
   {
      DT_ERR("Unsupported command arguments");
      return IRC_FAILURE;
   }

   DT_PRINTF("Storage FPGA debug terminal commands:");
   DT_PRINTF("  Buffering status:   BUF");
   DT_PRINTF("  Read memory:        RDM address [c|u8|u16|u32|s8|s16|s32 length]");
   DT_PRINTF("  Write memory:       WRM address value");
   DT_PRINTF("  Network status:     NET [0|1 [port]]");
   DT_PRINTF("  Get Stack Level:    STACK");
   DT_PRINTF("  Ctrl Intf status:   CI [SB|LB OUTPUT 0|1]");
   DT_PRINTF("  Print help:         HLP");

   return IRC_SUCCESS;
}

/**
 * Debug terminal buffering status command parser.
 * This parser is used to parse and validate buffering status command arguments and to
 * execute the command.
 *
 * @return IRC_SUCCESS when buffering status command was successfully executed.
 * @return IRC_FAILURE otherwise.
 */
static IRC_Status_t DebugTerminalParseBUF(circByteBuffer_t *cbuf)
{
   extern t_bufferManager gBufManager;
   t_bufferStatus status;

   // There is supposed to be no remaining bytes in the buffer
   if (!CBB_Empty(cbuf))
   {
      DT_ERR("Unsupported command arguments");
      return IRC_FAILURE;
   }

   BufferManager_GetStatus(&gBufManager, &status);

   DT_PRINTF("buf.error         = 0x%08X", status.error);
   DT_PRINTF("buf.mem_ready     = %d", status.mem_ready);
   DT_PRINTF("buf.ext_buf_prsnt = %d", status.ext_buf_prsnt);

   return IRC_SUCCESS;
}
