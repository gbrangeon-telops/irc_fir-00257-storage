-------------------------------------------------------------------------------
--
-- Title       : MGT Wrapper
-- Design      : fir_257_Storage
-- Author      : Telops
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- File        : D:\Telops\FIR-00257-Storage\aldec\compile\mgt_block.vhd
-- Generated   : Tue Feb 24 15:59:25 2015
-- From        : D:\Telops\FIR-00257-Storage\src\MGT\HDL\mgt_block.bde
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

use work.tel2000.all;

-- translate_off
library unisim;
use unisim.vcomponents.all; 
-- translate_on

library work;
library work;
library fir_257_storage;
use fir_257_storage.tel2000.all;

-- other libraries declarations
-- synthesis translate_off 
library KINTEX7;
library IEEE;
use IEEE.vital_timing.all;
-- synthesis translate_on 

entity mgt_block is
  port(
       ARESETN : in STD_LOGIC;
       AURORA_CLK_N1 : in STD_ULOGIC;
       AURORA_CLK_P1 : in STD_ULOGIC;
       CLK100MHZ : in STD_LOGIC;
       GT_RESET_IN : in STD_LOGIC;
       INIT_CLK_IN : in STD_LOGIC;
       RESET : in STD_LOGIC;
       AXI4_LITE_MOSI : in t_axi4_lite_mosi;
       EXP_PROC_N : in STD_LOGIC_VECTOR(0 to 1);
       EXP_PROC_P : in STD_LOGIC_VECTOR(0 to 1);
       TO_PROC_IN_MOSI : in t_axi4_stream_mosi64;
       EXP_RX_RESETDONE : out STD_LOGIC;
       EXP_TX_RESETDONE : out STD_LOGIC;
       EXP_USER_CLK : out STD_LOGIC;
       AXI4_LITE_MISO : out t_axi4_lite_miso;
       FROM_PROC_OUT_MOSI : out t_axi4_stream_mosi64;
       PROC_EXP_N : out STD_LOGIC_VECTOR(0 to 1);
       PROC_EXP_P : out STD_LOGIC_VECTOR(0 to 1);
       TO_PROC_IN_MISO : out t_axi4_stream_miso
  );
end mgt_block;

architecture mgt_block of mgt_block is

---- Component declarations -----

component exp_mgt
  port (
       do_cc : in STD_LOGIC;
       drpaddr_in : in STD_LOGIC_VECTOR(8 downto 0);
       drpaddr_in_lane1 : in STD_LOGIC_VECTOR(8 downto 0);
       drpclk_in : in STD_LOGIC;
       drpdi_in : in STD_LOGIC_VECTOR(15 downto 0);
       drpdi_in_lane1 : in STD_LOGIC_VECTOR(15 downto 0);
       drpen_in : in STD_LOGIC;
       drpen_in_lane1 : in STD_LOGIC;
       drpwe_in : in STD_LOGIC;
       drpwe_in_lane1 : in STD_LOGIC;
       gt0_qplllock_in : in STD_LOGIC;
       gt0_qpllrefclklost_in : in STD_LOGIC;
       gt_qpllclk_quad2_in : in STD_LOGIC;
       gt_qpllrefclk_quad2_in : in STD_LOGIC;
       gt_refclk1 : in STD_LOGIC;
       gt_reset : in STD_LOGIC;
       init_clk_in : in STD_LOGIC;
       loopback : in STD_LOGIC_VECTOR(2 downto 0);
       pll_not_locked : in STD_LOGIC;
       power_down : in STD_LOGIC;
       reset : in STD_LOGIC;
       rxn : in STD_LOGIC_VECTOR(0 to 1);
       rxp : in STD_LOGIC_VECTOR(0 to 1);
       s_axi_tx_tdata : in STD_LOGIC_VECTOR(0 to 63);
       s_axi_tx_tkeep : in STD_LOGIC_VECTOR(0 to 7);
       s_axi_tx_tlast : in STD_LOGIC;
       s_axi_tx_tvalid : in STD_LOGIC;
       sync_clk : in STD_LOGIC;
       user_clk : in STD_LOGIC;
       warn_cc : in STD_LOGIC;
       channel_up : out STD_LOGIC;
       drpdo_out : out STD_LOGIC_VECTOR(15 downto 0);
       drpdo_out_lane1 : out STD_LOGIC_VECTOR(15 downto 0);
       drprdy_out : out STD_LOGIC;
       drprdy_out_lane1 : out STD_LOGIC;
       frame_err : out STD_LOGIC;
       gt0_qpllreset_out : out STD_LOGIC;
       hard_err : out STD_LOGIC;
       lane_up : out STD_LOGIC_VECTOR(0 to 1);
       link_reset_out : out STD_LOGIC;
       m_axi_rx_tdata : out STD_LOGIC_VECTOR(0 to 63);
       m_axi_rx_tkeep : out STD_LOGIC_VECTOR(0 to 7);
       m_axi_rx_tlast : out STD_LOGIC;
       m_axi_rx_tvalid : out STD_LOGIC;
       rx_resetdone_out : out STD_LOGIC;
       s_axi_tx_tready : out STD_LOGIC;
       soft_err : out STD_LOGIC;
       sys_reset_out : out STD_LOGIC;
       tx_lock : out STD_LOGIC;
       tx_out_clk : out STD_LOGIC;
       tx_resetdone_out : out STD_LOGIC;
       txn : out STD_LOGIC_VECTOR(0 to 1);
       txp : out STD_LOGIC_VECTOR(0 to 1)
  );
end component;
component exp_mgt_CLOCK_MODULE
  port (
       GT_CLK : in STD_LOGIC;
       GT_CLK_LOCKED : in STD_LOGIC;
       INIT_CLK_I : in STD_LOGIC;
       INIT_CLK_O : out STD_LOGIC;
       PLL_NOT_LOCKED : out STD_LOGIC;
       SYNC_CLK : out STD_LOGIC;
       USER_CLK : out STD_LOGIC
  );
end component;
component exp_mgt_gt_common_wrapper
  generic(
       WRAPPER_SIM_GTRESET_SPEEDUP : STRING := "FALSE"
  );
  port (
       gt0_gtrefclk0_common_in : in STD_LOGIC;
       gt0_qplllockdetclk_in : in STD_LOGIC;
       gt0_qpllreset_in : in STD_LOGIC;
       gt0_qplllock_out : out STD_LOGIC;
       gt0_qpllrefclklost_out : out STD_LOGIC;
       gt_qpllclk_quad2_i : out STD_LOGIC;
       gt_qpllrefclk_quad2_i : out STD_LOGIC
  );
end component;
component exp_mgt_STANDARD_CC_MODULE
  port (
       PLL_NOT_LOCKED : in STD_LOGIC;
       RESET : in STD_LOGIC;
       USER_CLK : in STD_LOGIC;
       DO_CC : out STD_LOGIC;
       WARN_CC : out STD_LOGIC
  );
end component;
component exp_mgt_SUPPORT_RESET_LOGIC
  port (
       GT_RESET_IN : in STD_LOGIC;
       INIT_CLK_IN : in STD_LOGIC;
       RESET : in STD_LOGIC;
       USER_CLK : in STD_LOGIC;
       GT_RESET_OUT : out STD_LOGIC;
       SYSTEM_RESET : out STD_LOGIC
  );
end component;
component MGT_CTRL
  port (
       ARESETN : in STD_LOGIC;
       AXI4_LITE_MOSI : in T_AXI4_LITE_MOSI;
       CHANNEL_UP : in STD_LOGIC_VECTOR(2 downto 0);
       CLK : in STD_LOGIC;
       CLK_DATA : in STD_LOGIC;
       CLK_EXP : in STD_LOGIC;
       CLK_VIDEO : in STD_LOGIC;
       FRAME_ERR : in STD_LOGIC_VECTOR(2 downto 0);
       GT0_QPLLLOCK : in STD_LOGIC_VECTOR(1 downto 0);
       GT0_QPLLREFCLKLOST : in STD_LOGIC_VECTOR(1 downto 0);
       GT0_QPLLRESET : in STD_LOGIC_VECTOR(2 downto 0);
       HARD_ERR : in STD_LOGIC_VECTOR(2 downto 0);
       LANE_UP : in STD_LOGIC_VECTOR(5 downto 0);
       LINK_RESET : in STD_LOGIC_VECTOR(2 downto 0);
       PLL_NOT_LOCK : in STD_LOGIC_VECTOR(2 downto 0);
       RX_RESETDONE : in STD_LOGIC_VECTOR(2 downto 0);
       SOFT_ERR : in STD_LOGIC_VECTOR(2 downto 0);
       TX_OUT_LOCK : in STD_LOGIC_VECTOR(2 downto 0);
       TX_RESETDONE : in STD_LOGIC_VECTOR(2 downto 0);
       AXI4_LITE_MISO : out T_AXI4_LITE_MISO;
       LOOPBACK : out STD_LOGIC_VECTOR(8 downto 0);
       POWER_DOWN : out STD_LOGIC_VECTOR(2 downto 0)
  );
end component;
component double_sync
  generic(
       INIT_VALUE : BIT := '0'
  );
  port (
       CLK : in STD_LOGIC;
       D : in STD_LOGIC;
       RESET : in STD_LOGIC;
       Q : out STD_LOGIC := '0'
  );
end component;
component IBUFDS_GTE2
-- synthesis translate_off
  generic(
       CLKCM_CFG : BOOLEAN := TRUE;
       CLKRCV_TRST : BOOLEAN := TRUE;
       CLKSWING_CFG : BIT_VECTOR := "11"
  );
-- synthesis translate_on
  port (
       CEB : in STD_ULOGIC;
       I : in STD_ULOGIC;
       IB : in STD_ULOGIC;
       O : out STD_ULOGIC;
       ODIV2 : out STD_ULOGIC
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal aurora_clk_2 : STD_LOGIC;
signal exp_do_cc_i : STD_LOGIC;
signal exp_tlast : STD_LOGIC;
signal exp_warn_cc_i : STD_LOGIC;
signal GND : STD_LOGIC;
signal gt_qpllclk_quad2_i : STD_LOGIC;
signal gt_qpllrefclk_quad2_i : STD_LOGIC;
signal gt_reset_out : STD_LOGIC;
signal init_clk_i : STD_LOGIC;
signal init_clk_i_2 : STD_LOGIC;
signal lane_up_sync_0 : STD_LOGIC;
signal lane_up_sync_1 : STD_LOGIC;
signal NET29972 : STD_LOGIC;
signal NET30071 : STD_LOGIC;
signal sync_clk_i_2 : STD_LOGIC;
signal sys_rst : STD_LOGIC;
signal tx_clk_out_2 : STD_LOGIC;
signal user_clk_i : STD_LOGIC;
signal user_clk_i_2 : STD_LOGIC;
signal BUS6919 : STD_LOGIC_VECTOR (15 downto 0);
signal CHANNEL_UP : STD_LOGIC_VECTOR (2 downto 0);
signal EXP_TKEEP : STD_LOGIC_VECTOR (7 downto 0);
signal FRAME_ERR : STD_LOGIC_VECTOR (2 downto 0);
signal GT0_QPLLLOCK : STD_LOGIC_VECTOR (1 downto 0);
signal GT0_QPLLREFCLKLOST : STD_LOGIC_VECTOR (1 downto 0);
signal GT0_QPLLRESET : STD_LOGIC_VECTOR (2 downto 0);
signal HARD_ERR : STD_LOGIC_VECTOR (2 downto 0);
signal lane_up : STD_LOGIC_VECTOR (5 downto 0);
signal LINK_RESET : STD_LOGIC_VECTOR (2 downto 0);
signal loopback : STD_LOGIC_VECTOR (8 downto 0);
signal PLL_NOT_LOCK : STD_LOGIC_VECTOR (2 downto 0);
signal POWER_DOWN : STD_LOGIC_VECTOR (2 downto 0);
signal RX_RESETDONE : STD_LOGIC_VECTOR (2 downto 0);
signal SOFT_ERR : STD_LOGIC_VECTOR (2 downto 0);
signal TX_OUT_LOCK : STD_LOGIC_VECTOR (2 downto 0);
signal TX_RESETDONE : STD_LOGIC_VECTOR (2 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

---- User Signal Assignments ----
FROM_PROC_OUT_MOSI.TSTRB <=EXP_TKEEP when exp_tlast = '1' else (others => '1');
FROM_PROC_OUT_MOSI.TID <= (others => '0');
FROM_PROC_OUT_MOSI.TDEST <= (others => '0');
FROM_PROC_OUT_MOSI.TUSER <= (others => '0');
FROM_PROC_OUT_MOSI.TKEEP <= EXP_TKEEP when exp_tlast = '1' else (others => '1');
FROM_PROC_OUT_MOSI.TLAST <= exp_tlast;
pll_not_lock(1) <= '1';

----  Component instantiations  ----

CTRL : MGT_CTRL
  port map(
       ARESETN => aresetn,
       AXI4_LITE_MISO => AXI4_LITE_MISO,
       AXI4_LITE_MOSI => AXI4_LITE_MOSI,
       CHANNEL_UP => CHANNEL_UP,
       CLK => CLK100MHZ,
       CLK_DATA => user_clk_i,
       CLK_EXP => user_clk_i_2,
       CLK_VIDEO => user_clk_i,
       FRAME_ERR => FRAME_ERR,
       GT0_QPLLLOCK => GT0_QPLLLOCK,
       GT0_QPLLREFCLKLOST => GT0_QPLLREFCLKLOST,
       GT0_QPLLRESET => GT0_QPLLRESET,
       HARD_ERR => HARD_ERR,
       LANE_UP => LANE_UP,
       LINK_RESET => LINK_RESET,
       LOOPBACK => LOOPBACK,
       PLL_NOT_LOCK => PLL_NOT_LOCK,
       POWER_DOWN => POWER_DOWN,
       RX_RESETDONE => RX_RESETDONE,
       SOFT_ERR => SOFT_ERR,
       TX_OUT_LOCK => TX_OUT_LOCK,
       TX_RESETDONE => TX_RESETDONE
  );

EXP : exp_mgt
  port map(
       drpaddr_in(0) => BUS6919(7),
       drpaddr_in(1) => BUS6919(8),
       drpaddr_in(2) => BUS6919(9),
       drpaddr_in(3) => BUS6919(10),
       drpaddr_in(4) => BUS6919(11),
       drpaddr_in(5) => BUS6919(12),
       drpaddr_in(6) => BUS6919(13),
       drpaddr_in(7) => BUS6919(14),
       drpaddr_in(8) => BUS6919(15),
       drpaddr_in_lane1(0) => BUS6919(7),
       drpaddr_in_lane1(1) => BUS6919(8),
       drpaddr_in_lane1(2) => BUS6919(9),
       drpaddr_in_lane1(3) => BUS6919(10),
       drpaddr_in_lane1(4) => BUS6919(11),
       drpaddr_in_lane1(5) => BUS6919(12),
       drpaddr_in_lane1(6) => BUS6919(13),
       drpaddr_in_lane1(7) => BUS6919(14),
       drpaddr_in_lane1(8) => BUS6919(15),
       lane_up(0) => lane_up(5),
       lane_up(1) => lane_up(4),
       loopback(0) => loopback(6),
       loopback(1) => loopback(7),
       loopback(2) => loopback(8),
       channel_up => channel_up(2),
       do_cc => exp_do_cc_i,
       drpclk_in => GND,
       drpdi_in => BUS6919,
       drpdi_in_lane1 => BUS6919,
       drpen_in => GND,
       drpen_in_lane1 => GND,
       drpwe_in => GND,
       drpwe_in_lane1 => GND,
       frame_err => frame_err(2),
       gt0_qplllock_in => gt0_qplllock(1),
       gt0_qpllrefclklost_in => gt0_qpllrefclklost(1),
       gt0_qpllreset_out => gt0_qpllreset(2),
       gt_qpllclk_quad2_in => gt_qpllclk_quad2_i,
       gt_qpllrefclk_quad2_in => gt_qpllrefclk_quad2_i,
       gt_refclk1 => aurora_clk_2,
       gt_reset => gt_reset_out,
       hard_err => hard_err(2),
       init_clk_in => init_clk_i_2,
       link_reset_out => link_reset(2),
       m_axi_rx_tdata => FROM_PROC_OUT_MOSI.TDATA,
       m_axi_rx_tkeep => EXP_TKEEP,
       m_axi_rx_tlast => exp_tlast,
       m_axi_rx_tvalid => FROM_PROC_OUT_MOSI.TVALID,
       pll_not_locked => pll_not_lock(2),
       power_down => power_down(2),
       reset => sys_rst,
       rx_resetdone_out => rx_resetdone(2),
       rxn => EXP_PROC_N,
       rxp => EXP_PROC_P,
       s_axi_tx_tdata => TO_PROC_IN_MOSI.TDATA,
       s_axi_tx_tkeep => TO_PROC_IN_MOSI.TKEEP,
       s_axi_tx_tlast => TO_PROC_IN_MOSI.TLAST,
       s_axi_tx_tready => TO_PROC_IN_MISO.TREADY,
       s_axi_tx_tvalid => TO_PROC_IN_MOSI.TVALID,
       soft_err => soft_err(2),
       sync_clk => sync_clk_i_2,
       tx_lock => tx_out_lock(2),
       tx_out_clk => tx_clk_out_2,
       tx_resetdone_out => tx_resetdone(2),
       txn => PROC_EXP_N,
       txp => PROC_EXP_P,
       user_clk => user_clk_i_2,
       warn_cc => exp_warn_cc_i
  );

EXP_CC : exp_mgt_STANDARD_CC_MODULE
  port map(
       DO_CC => exp_do_cc_i,
       PLL_NOT_LOCKED => pll_not_lock(2),
       RESET => NET29972,
       USER_CLK => user_clk_i_2,
       WARN_CC => exp_warn_cc_i
  );

EXP_CLOCK : exp_mgt_CLOCK_MODULE
  port map(
       GT_CLK => tx_clk_out_2,
       GT_CLK_LOCKED => tx_out_lock(2),
       INIT_CLK_I => init_clk_in,
       INIT_CLK_O => init_clk_i_2,
       PLL_NOT_LOCKED => pll_not_lock(2),
       SYNC_CLK => sync_clk_i_2,
       USER_CLK => user_clk_i_2
  );

EXP_COMMON : exp_mgt_gt_common_wrapper
  port map(
       gt0_gtrefclk0_common_in => aurora_clk_2,
       gt0_qplllock_out => gt0_qplllock(1),
       gt0_qplllockdetclk_in => init_clk_i_2,
       gt0_qpllrefclklost_out => gt0_qpllrefclklost(1),
       gt0_qpllreset_in => gt0_qpllreset(2),
       gt_qpllclk_quad2_i => gt_qpllclk_quad2_i,
       gt_qpllrefclk_quad2_i => gt_qpllrefclk_quad2_i
  );

EXP_RESET : exp_mgt_SUPPORT_RESET_LOGIC
  port map(
       GT_RESET_IN => GT_RESET_IN,
       GT_RESET_OUT => gt_reset_out,
       INIT_CLK_IN => init_clk_i,
       RESET => RESET,
       SYSTEM_RESET => sys_rst,
       USER_CLK => user_clk_i
  );

NET29972 <= not(lane_up_sync_1 and lane_up_sync_0);

U5 : IBUFDS_GTE2
  port map(
       CEB => GND,
       I => AURORA_CLK_P1,
       IB => AURORA_CLK_N1,
       O => aurora_clk_2
  );

U8 : double_sync
  port map(
       CLK => user_clk_i_2,
       D => lane_up(4),
       Q => lane_up_sync_0,
       RESET => Dangling_Input_Signal
  );

U9 : double_sync
  port map(
       CLK => user_clk_i_2,
       D => lane_up(5),
       Q => lane_up_sync_1,
       RESET => Dangling_Input_Signal
  );


---- Power , ground assignment ----

GND <= GND_CONSTANT;
BUS6919(15) <= GND;
BUS6919(14) <= GND;
BUS6919(13) <= GND;
BUS6919(12) <= GND;
BUS6919(11) <= GND;
BUS6919(10) <= GND;
BUS6919(9) <= GND;
BUS6919(8) <= GND;
BUS6919(7) <= GND;
BUS6919(6) <= GND;
BUS6919(5) <= GND;
BUS6919(4) <= GND;
BUS6919(3) <= GND;
BUS6919(2) <= GND;
BUS6919(1) <= GND;
BUS6919(0) <= GND;

---- Terminal assignment ----

    -- Output\buffer terminals
	EXP_RX_RESETDONE <= rx_resetdone(2);
	EXP_TX_RESETDONE <= tx_resetdone(2);
	EXP_USER_CLK <= user_clk_i_2;


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end mgt_block;
