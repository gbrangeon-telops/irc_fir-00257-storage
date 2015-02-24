-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : fir_257_Storage
-- Author      : Telops
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : D:\Telops\FIR-00257-Storage\aldec\compile\fir_257_top.vhd
-- Generated   : Tue Feb 24 16:29:56 2015
-- From        : D:\Telops\FIR-00257-Storage\src\fir_257_top.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.TEL2000.all;

entity fir_257_top is
  port(
       AURORA_CLK_N0 : in STD_LOGIC;
       AURORA_CLK_P0 : in STD_LOGIC;
       SYS_CLK_0_N : in STD_LOGIC;
       SYS_CLK_0_P : in STD_LOGIC;
       SYS_CLK_1_N : in STD_LOGIC;
       SYS_CLK_1_P : in STD_LOGIC;
       UART_RX : in STD_LOGIC;
       EXP_PROC_N : in STD_LOGIC_VECTOR(0 to 1);
       EXP_PROC_P : in STD_LOGIC_VECTOR(0 to 1);
       DDR3_addr : out STD_LOGIC_VECTOR(14 downto 0);
       DDR3_ba : out STD_LOGIC_VECTOR(2 downto 0);
       DDR3_cas_n : out STD_LOGIC;
       DDR3_ck_n : out STD_LOGIC_VECTOR(1 downto 0);
       DDR3_ck_p : out STD_LOGIC_VECTOR(1 downto 0);
       DDR3_cke : out STD_LOGIC_VECTOR(1 downto 0);
       DDR3_cs_n : out STD_LOGIC_VECTOR(1 downto 0);
       DDR3_dm : out STD_LOGIC_VECTOR(7 downto 0);
       DDR3_odt : out STD_LOGIC_VECTOR(1 downto 0);
       DDR3_ras_n : out STD_LOGIC;
       DDR3_reset_n : out STD_LOGIC;
       DDR3_we_n : out STD_LOGIC;
       UART_TX : out STD_LOGIC;
       PROC_EXP_N : out STD_LOGIC_VECTOR(0 to 1);
       PROC_EXP_P : out STD_LOGIC_VECTOR(0 to 1);
       DDR3_dq : inout STD_LOGIC_VECTOR(63 downto 0);
       DDR3_dqs_n : inout STD_LOGIC_VECTOR(7 downto 0);
       DDR3_dqs_p : inout STD_LOGIC_VECTOR(7 downto 0)
  );
end fir_257_top;

architecture fir_257_top of fir_257_top is

---- Component declarations -----

component bd_wrapper
  port (
       AXIL_DUT_MISO : in T_AXI4_LITE_MISO;
       AXIL_MGT_MISO : in T_AXI4_LITE_MISO;
       AXIS_BUF_MM2S_CMD_MOSI : in T_AXI4_STREAM_MOSI72;
       AXIS_BUF_MM2S_MISO : in T_AXI4_STREAM_MISO;
       AXIS_BUF_MM2S_STS_MISO : in T_AXI4_STREAM_MISO;
       AXIS_BUF_S2MM_CMD_MOSI : in T_AXI4_STREAM_MOSI72;
       AXIS_BUF_S2MM_MOSI : in T_AXI4_STREAM_MOSI32;
       AXIS_BUF_S2MM_STS_MISO : in T_AXI4_STREAM_MISO;
       SYS_CLK_0_N : in STD_LOGIC;
       SYS_CLK_0_P : in STD_LOGIC;
       SYS_CLK_1_N : in STD_LOGIC;
       SYS_CLK_1_P : in STD_LOGIC;
       UART_RX : in STD_LOGIC;
       ARESETN : out STD_LOGIC;
       AXIL_DUT_MOSI : out T_AXI4_LITE_MOSI;
       AXIL_MGT_MOSI : out T_AXI4_LITE_MOSI;
       AXIS_BUF_MM2S_CMD_MISO : out T_AXI4_STREAM_MISO;
       AXIS_BUF_MM2S_MOSI : out T_AXI4_STREAM_MOSI32;
       AXIS_BUF_MM2S_STS_MOSI : out T_AXI4_STREAM_MOSI_STATUS;
       AXIS_BUF_S2MM_CMD_MISO : out T_AXI4_STREAM_MISO;
       AXIS_BUF_S2MM_MISO : out T_AXI4_STREAM_MISO;
       AXIS_BUF_S2MM_STS_MOSI : out T_AXI4_STREAM_MOSI_STATUS;
       DDR3_addr : out STD_LOGIC_VECTOR(14 downto 0);
       DDR3_ba : out STD_LOGIC_VECTOR(2 downto 0);
       DDR3_cas_n : out STD_LOGIC;
       DDR3_ck_n : out STD_LOGIC_VECTOR(1 downto 0);
       DDR3_ck_p : out STD_LOGIC_VECTOR(1 downto 0);
       DDR3_cke : out STD_LOGIC_VECTOR(1 downto 0);
       DDR3_cs_n : out STD_LOGIC_VECTOR(1 downto 0);
       DDR3_dm : out STD_LOGIC_VECTOR(7 downto 0);
       DDR3_odt : out STD_LOGIC_VECTOR(1 downto 0);
       DDR3_ras_n : out STD_LOGIC;
       DDR3_reset_n : out STD_LOGIC;
       DDR3_we_n : out STD_LOGIC;
       UART_TX : out STD_LOGIC;
       clk_100 : out STD_LOGIC;
       clk_160 : out STD_LOGIC;
       clk_50 : out STD_LOGIC;
       DDR3_dq : inout STD_LOGIC_VECTOR(63 downto 0);
       DDR3_dqs_n : inout STD_LOGIC_VECTOR(7 downto 0);
       DDR3_dqs_p : inout STD_LOGIC_VECTOR(7 downto 0);
       GPIO : inout STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component DUT
  port (
       ARESETN : in STD_LOGIC;
       AXIL_MOSI : in T_AXI4_LITE_MOSI;
       AXIS_BUF_MM2S_CMD_MISO : in T_AXI4_STREAM_MISO;
       AXIS_BUF_MM2S_MOSI : in T_AXI4_STREAM_MOSI32;
       AXIS_BUF_MM2S_STS_MOSI : in T_AXI4_STREAM_MOSI_STATUS;
       AXIS_BUF_S2MM_CMD_MISO : in T_AXI4_STREAM_MISO;
       AXIS_BUF_S2MM_MISO : in T_AXI4_STREAM_MISO;
       AXIS_BUF_S2MM_STS_MOSI : in T_AXI4_STREAM_MOSI_STATUS;
       CLK_DATA : in STD_LOGIC;
       CLK_MB : in STD_LOGIC;
       DATA_FROM_PROC_MOSI : in T_AXI4_STREAM_MOSI32;
       DATA_TO_PROC_MISO : in T_AXI4_STREAM_MISO;
       AXIL_MISO : out T_AXI4_LITE_MISO;
       AXIS_BUF_MM2S_CMD_MOSI : out T_AXI4_STREAM_MOSI72;
       AXIS_BUF_MM2S_MISO : out T_AXI4_STREAM_MISO;
       AXIS_BUF_MM2S_STS_MISO : out T_AXI4_STREAM_MISO;
       AXIS_BUF_S2MM_CMD_MOSI : out T_AXI4_STREAM_MOSI72;
       AXIS_BUF_S2MM_MOSI : out T_AXI4_STREAM_MOSI32;
       AXIS_BUF_S2MM_STS_MISO : out T_AXI4_STREAM_MISO;
       DATA_FROM_PROC_MISO : out T_AXI4_STREAM_MISO;
       DATA_TO_PROC_MOSI : out T_AXI4_STREAM_MOSI32
  );
end component;
component mgt_wrapper
  port (
       ARESETN : in STD_LOGIC;
       AURORA_CLK_N0 : in STD_LOGIC;
       AURORA_CLK_P0 : in STD_LOGIC;
       AXI4_LITE_MOSI : in T_AXI4_LITE_MOSI;
       CLKDATA : in STD_LOGIC;
       CLK_MB : in STD_LOGIC;
       EXP_PROC_N : in STD_LOGIC_VECTOR(0 to 1);
       EXP_PROC_P : in STD_LOGIC_VECTOR(0 to 1);
       FROM_PROC_OUT_MISO : in T_AXI4_STREAM_MISO;
       INIT_CLK_IN : in STD_LOGIC;
       TO_PROC_IN_MOSI : in T_AXI4_STREAM_MOSI32;
       AXI4_LITE_MISO : out T_AXI4_LITE_MISO;
       FROM_PROC_OUT_MOSI : out T_AXI4_STREAM_MOSI32;
       PROC_EXP_N : out STD_LOGIC_VECTOR(0 to 1);
       PROC_EXP_P : out STD_LOGIC_VECTOR(0 to 1);
       TO_PROC_IN_MISO : out T_AXI4_STREAM_MISO
  );
end component;

---- Signal declarations used on the diagram ----

signal aresetn : STD_LOGIC;
signal clk100 : STD_LOGIC;
signal clk160 : STD_LOGIC;
signal clk50 : STD_LOGIC;
signal NET1054 : T_AXI4_LITE_MOSI;
signal NET1059 : T_AXI4_LITE_MISO;
signal NET1068 : T_AXI4_LITE_MOSI;
signal NET1084 : T_AXI4_LITE_MISO;
signal NET404 : T_AXI4_STREAM_MISO;
signal NET408 : T_AXI4_STREAM_MOSI32;
signal NET412 : T_AXI4_STREAM_MISO;
signal NET416 : T_AXI4_STREAM_MOSI72;
signal NET420 : T_AXI4_STREAM_MOSI_STATUS;
signal NET424 : T_AXI4_STREAM_MISO;
signal NET428 : T_AXI4_STREAM_MOSI32;
signal NET432 : T_AXI4_STREAM_MISO;
signal NET436 : T_AXI4_STREAM_MISO;
signal NET440 : T_AXI4_STREAM_MOSI72;
signal NET444 : T_AXI4_STREAM_MOSI_STATUS;
signal NET448 : T_AXI4_STREAM_MISO;
signal NET643 : T_AXI4_STREAM_MOSI32;
signal NET647 : T_AXI4_STREAM_MISO;
signal NET651 : T_AXI4_STREAM_MISO;
signal NET655 : T_AXI4_STREAM_MOSI32;

begin

----  Component instantiations  ----

DUT_INST : DUT
  port map(
       ARESETN => aresetn,
       AXIL_MISO => NET1059,
       AXIL_MOSI => NET1054,
       AXIS_BUF_MM2S_CMD_MISO => NET436,
       AXIS_BUF_MM2S_CMD_MOSI => NET440,
       AXIS_BUF_MM2S_MISO => NET432,
       AXIS_BUF_MM2S_MOSI => NET428,
       AXIS_BUF_MM2S_STS_MISO => NET448,
       AXIS_BUF_MM2S_STS_MOSI => NET444,
       AXIS_BUF_S2MM_CMD_MISO => NET412,
       AXIS_BUF_S2MM_CMD_MOSI => NET416,
       AXIS_BUF_S2MM_MISO => NET404,
       AXIS_BUF_S2MM_MOSI => NET408,
       AXIS_BUF_S2MM_STS_MISO => NET424,
       AXIS_BUF_S2MM_STS_MOSI => NET420,
       CLK_DATA => clk160,
       CLK_MB => clk100,
       DATA_FROM_PROC_MISO => NET651,
       DATA_FROM_PROC_MOSI => NET643,
       DATA_TO_PROC_MISO => NET647,
       DATA_TO_PROC_MOSI => NET655
  );

U1 : bd_wrapper
  port map(
       ARESETN => aresetn,
       AXIL_DUT_MISO => NET1059,
       AXIL_DUT_MOSI => NET1054,
       AXIL_MGT_MISO => NET1084,
       AXIL_MGT_MOSI => NET1068,
       AXIS_BUF_MM2S_CMD_MISO => NET436,
       AXIS_BUF_MM2S_CMD_MOSI => NET440,
       AXIS_BUF_MM2S_MISO => NET432,
       AXIS_BUF_MM2S_MOSI => NET428,
       AXIS_BUF_MM2S_STS_MISO => NET448,
       AXIS_BUF_MM2S_STS_MOSI => NET444,
       AXIS_BUF_S2MM_CMD_MISO => NET412,
       AXIS_BUF_S2MM_CMD_MOSI => NET416,
       AXIS_BUF_S2MM_MISO => NET404,
       AXIS_BUF_S2MM_MOSI => NET408,
       AXIS_BUF_S2MM_STS_MISO => NET424,
       AXIS_BUF_S2MM_STS_MOSI => NET420,
       DDR3_addr => DDR3_addr,
       DDR3_ba => DDR3_ba,
       DDR3_cas_n => DDR3_cas_n,
       DDR3_ck_n => DDR3_ck_n,
       DDR3_ck_p => DDR3_ck_p,
       DDR3_cke => DDR3_cke,
       DDR3_cs_n => DDR3_cs_n,
       DDR3_dm => DDR3_dm,
       DDR3_dq => DDR3_dq,
       DDR3_dqs_n => DDR3_dqs_n,
       DDR3_dqs_p => DDR3_dqs_p,
       DDR3_odt => DDR3_odt,
       DDR3_ras_n => DDR3_ras_n,
       DDR3_reset_n => DDR3_reset_n,
       DDR3_we_n => DDR3_we_n,
       SYS_CLK_0_N => SYS_CLK_0_N,
       SYS_CLK_0_P => SYS_CLK_0_P,
       SYS_CLK_1_N => SYS_CLK_1_N,
       SYS_CLK_1_P => SYS_CLK_1_P,
       UART_RX => UART_RX,
       UART_TX => UART_TX,
       clk_100 => clk100,
       clk_160 => clk160,
       clk_50 => clk50
  );

U3 : mgt_wrapper
  port map(
       ARESETN => aresetn,
       AURORA_CLK_N0 => AURORA_CLK_N0,
       AURORA_CLK_P0 => AURORA_CLK_P0,
       AXI4_LITE_MISO => NET1084,
       AXI4_LITE_MOSI => NET1068,
       CLKDATA => clk160,
       CLK_MB => clk100,
       EXP_PROC_N => EXP_PROC_N,
       EXP_PROC_P => EXP_PROC_P,
       FROM_PROC_OUT_MISO => NET651,
       FROM_PROC_OUT_MOSI => NET643,
       INIT_CLK_IN => clk50,
       PROC_EXP_N => PROC_EXP_N,
       PROC_EXP_P => PROC_EXP_P,
       TO_PROC_IN_MISO => NET647,
       TO_PROC_IN_MOSI => NET655
  );


end fir_257_top;
