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
#include "GC_Registers.h"
#include "CircularByteBuffer.h"
#include "IRC_Status.h"
#include "utils.h"
#include <string.h>

static IRC_Status_t DebugTerminalParseHLP(circByteBuffer_t *cbuf);
static IRC_Status_t DebugTerminalParseBUF(circByteBuffer_t *cbuf);
static IRC_Status_t DebugTerminalParsePBT(circByteBuffer_t *cbuf);

debugTerminalCommand_t gDebugTerminalCommands[] =
{
   {"BUF", DebugTerminalParseBUF},
   {"RDM", DebugTerminalParseRDM},
   {"WRM", DebugTerminalParseWRM},
   {"NET", DebugTerminalParseNET},
   {"STACK", DebugTerminalParseSTACK},
   {"CI", DebugTerminalParseCI},
   {"PBT", DebugTerminalParsePBT},
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
   DT_PRINTF("  Print Buffer Table: PBT");
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
   DT_PRINTF("buf.status        = 0x%08X", gcRegsData.MemoryBufferStatus);

   return IRC_SUCCESS;
}

/**
 * Print Buffer Table command parser
 * This parser is used to parse and validate Print Buffer Table
 * command arguments and to execute the command.
 *
 * @param cbuf is the pointer to the circular buffer containing the data to be parsed.
 *
 * @return IRC_SUCCESS when Print Buffer Table command was successfully executed.
 * @return IRC_FAILURE otherwise.
 */
static IRC_Status_t DebugTerminalParsePBT(circByteBuffer_t *cbuf)
{
   extern t_memoryTable gMemoryTable;
   uint32_t i;

   DT_PRINTF("Buffer Table:");
   for (i = 0; i < gMemoryTable.NbValidSequences; i++)
   {
      uint64_t addr = (uint64_t)gMemoryTable.data[i].startAddress << BM_ADDRBITS_ALIGN;
      DT_PRINTF("Seq %u: startAddr=0x%08x%08x, bufLen=%u, width=%u, height=%u, offX=%u, offY=%u, "
                "start=%u, stop=%u, moi=%u",
                i, (uint32_t) (addr >> 32),  (uint32_t) (addr & 0x00000000ffffffffull),
                gMemoryTable.data[i].bufferLength,
                gMemoryTable.data[i].imageWidth,  gMemoryTable.data[i].imageHeight,
                gMemoryTable.data[i].OffsetX,  gMemoryTable.data[i].OffsetY,
                gMemoryTable.data[i].bufImgIdx.start_img, gMemoryTable.data[i].bufImgIdx.stop_img,
                gMemoryTable.data[i].bufImgIdx.moi_img);
   }

   return IRC_SUCCESS;
}
