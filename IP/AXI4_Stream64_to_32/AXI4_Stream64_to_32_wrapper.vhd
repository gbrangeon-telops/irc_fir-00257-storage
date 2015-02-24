------------------------------------------------------------------
--!   @file AXI4_Stream64_to_32_wrapper.vhd
--!   @brief Wrapper for IP AXI4_Stream64_to_32_wrapper.
--!   @details This component splits 1x 64bit data in 2x 32bit data.
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL: http://einstein/svn/firmware/FIR-00251-Common/trunk/IP/AXI4_Stream64_to_32/AXI4_Stream64_to_32_wrapper.vhd $
------------------------------------------------------------------

--!   Use IEEE standard library.
library IEEE;
--!   Use logic elements package from IEEE library.
use IEEE.STD_LOGIC_1164.all; 
--!   Use TEL2000 package package from work library. 
use work.TEL2000.all;

entity AXI_Stream64_to_32_wrapper is
port(

   ACLK : in std_logic; --! Clock for core logic
   ARESETN : in std_logic; --! Reset active low for core logic

   S_ACLK : in std_logic; --! Clock for slave interface
   S_ARESETN : in std_logic; --! Reset active lower for slave interface 
   S_AXI4S_64_MOSI : in t_axi4_stream_mosi64; --! Input Stream at 64 bit wide 
   S_AXI4S_64_MISO : out t_axi4_stream_miso; --! Input Stream control
   
   M_ACLK : in std_logic; --! Clock for master interface
   M_ARESETN : in std_logic; --! Reset active lower for master interface
   M_AXI4S_32_MOSI : out t_axi4_stream_mosi32; --! Output Stream at 32 bit wide
   M_AXI4S_32_MISO : in t_axi4_stream_miso --! Output Stream control
   );
end AXI_Stream64_to_32_wrapper;

architecture RTL of AXI_Stream64_to_32_wrapper is

COMPONENT AXI4_Stream64_to_32
  PORT (
    ACLK : IN STD_LOGIC;
    ARESETN : IN STD_LOGIC;
    S00_AXIS_ACLK : IN STD_LOGIC;
    S00_AXIS_ARESETN : IN STD_LOGIC;
    S00_AXIS_TVALID : IN STD_LOGIC;
    S00_AXIS_TREADY : OUT STD_LOGIC;
    S00_AXIS_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    S00_AXIS_TSTRB : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S00_AXIS_TKEEP : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S00_AXIS_TLAST : IN STD_LOGIC;
    S00_AXIS_TID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXIS_TDEST : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S00_AXIS_TUSER : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    M00_AXIS_ACLK : IN STD_LOGIC;
    M00_AXIS_ARESETN : IN STD_LOGIC;
    M00_AXIS_TVALID : OUT STD_LOGIC;
    M00_AXIS_TREADY : IN STD_LOGIC;
    M00_AXIS_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    M00_AXIS_TSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M00_AXIS_TKEEP : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M00_AXIS_TLAST : OUT STD_LOGIC;
    M00_AXIS_TID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    M00_AXIS_TDEST : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M00_AXIS_TUSER : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    S00_DECODE_ERR : OUT STD_LOGIC;
    M00_FIFO_DATA_COUNT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
ATTRIBUTE SYN_BLACK_BOX OF AXI4_Stream64_to_32 : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
ATTRIBUTE BLACK_BOX_PAD_PIN OF AXI4_Stream64_to_32 : COMPONENT IS "ACLK,ARESETN,S00_AXIS_ACLK,S00_AXIS_ARESETN,S00_AXIS_TVALID,S00_AXIS_TREADY,S00_AXIS_TDATA[63:0],S00_AXIS_TSTRB[7:0],S00_AXIS_TKEEP[7:0],S00_AXIS_TLAST,S00_AXIS_TID[0:0],S00_AXIS_TDEST[2:0],S00_AXIS_TUSER[15:0],M00_AXIS_ACLK,M00_AXIS_ARESETN,M00_AXIS_TVALID,M00_AXIS_TREADY,M00_AXIS_TDATA[31:0],M00_AXIS_TSTRB[3:0],M00_AXIS_TKEEP[3:0],M00_AXIS_TLAST,M00_AXIS_TID[0:0],M00_AXIS_TDEST[2:0],M00_AXIS_TUSER[7:0],S00_DECODE_ERR,M00_FIFO_DATA_COUNT[31:0]";

begin
   
axi4_stream64_to_32_inst : axi4_stream64_to_32
   port map(
      ACLK => ACLK,
      ARESETN => ARESETN,
      S00_AXIS_ACLK => S_ACLK,
      S00_AXIS_ARESETN => S_ARESETN,
      S00_AXIS_TVALID => S_AXI4S_64_MOSI.TVALID,
      S00_AXIS_TREADY => S_AXI4S_64_MISO.TREADY,
      S00_AXIS_TDATA => S_AXI4S_64_MOSI.TDATA,
      S00_AXIS_TSTRB => S_AXI4S_64_MOSI.TSTRB,
      S00_AXIS_TKEEP => S_AXI4S_64_MOSI.TKEEP,
      S00_AXIS_TLAST => S_AXI4S_64_MOSI.TLAST,
      S00_AXIS_TID => S_AXI4S_64_MOSI.TID,
      S00_AXIS_TDEST => S_AXI4S_64_MOSI.TDEST,
      S00_AXIS_TUSER => S_AXI4S_64_MOSI.TUSER,
      M00_AXIS_ACLK => M_ACLK,
      M00_AXIS_ARESETN => M_ARESETN,
      M00_AXIS_TVALID => M_AXI4S_32_MOSI.TVALID,
      M00_AXIS_TREADY => M_AXI4S_32_MISO.TREADY,
      M00_AXIS_TDATA => M_AXI4S_32_MOSI.TDATA,
      M00_AXIS_TSTRB => M_AXI4S_32_MOSI.TSTRB,
      M00_AXIS_TKEEP => M_AXI4S_32_MOSI.TKEEP,
      M00_AXIS_TLAST => M_AXI4S_32_MOSI.TLAST,
      M00_AXIS_TID => M_AXI4S_32_MOSI.TID,
      M00_AXIS_TDEST => M_AXI4S_32_MOSI.TDEST,
      M00_AXIS_TUSER => M_AXI4S_32_MOSI.TUSER,
      S00_DECODE_ERR => open,
      M00_FIFO_DATA_COUNT => open
   );
   
end RTL;