-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : fir_257_Storage
-- Author      : Patrick Daraiche
-- Company     : Telops inc.
--
-------------------------------------------------------------------------------
--
-- File        : D:\Telops\FIR-00257-Storage\aldec\compile\mgt_wrapper.vhd
-- Generated   : Tue Feb 24 16:04:59 2015
-- From        : D:\Telops\FIR-00257-Storage\src\MGT\HDL\mgt_wrapper.bde
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


library work;
use work.tel2000.all;

library fir_257_storage;
use fir_257_storage.tel2000.all;

-- other libraries declarations
-- synthesis translate_off 
library UNISIM;
library IEEE;
use IEEE.vital_timing.all;
-- synthesis translate_on 

entity mgt_wrapper is
  port(
       ARESETN : in STD_LOGIC;
       AURORA_CLK_N0 : in STD_LOGIC;
       AURORA_CLK_P0 : in STD_LOGIC;
       CLKDATA : in STD_LOGIC;
       CLK_MB : in STD_LOGIC;
       INIT_CLK_IN : in STD_LOGIC;
       AXI4_LITE_MOSI : in t_axi4_lite_mosi;
       EXP_PROC_N : in STD_LOGIC_VECTOR(0 to 1);
       EXP_PROC_P : in STD_LOGIC_VECTOR(0 to 1);
       FROM_PROC_OUT_MISO : in t_axi4_stream_miso;
       TO_PROC_IN_MOSI : in t_axi4_stream_mosi32;
       AXI4_LITE_MISO : out t_axi4_lite_miso;
       FROM_PROC_OUT_MOSI : out t_axi4_stream_mosi32;
       PROC_EXP_N : out STD_LOGIC_VECTOR(0 to 1);
       PROC_EXP_P : out STD_LOGIC_VECTOR(0 to 1);
       TO_PROC_IN_MISO : out t_axi4_stream_miso
  );
end mgt_wrapper;

architecture mgt_wrapper of mgt_wrapper is

---- Component declarations -----

component AXI_Stream32_to_64_wrapper
  port (
       ACLK : in STD_LOGIC;
       ARESETN : in STD_LOGIC;
       M_ACLK : in STD_LOGIC;
       M_ARESETN : in STD_LOGIC;
       M_AXI4S_64_MISO : in T_AXI4_STREAM_MISO;
       S_ACLK : in STD_LOGIC;
       S_ARESETN : in STD_LOGIC;
       S_AXI4S_32_MOSI : in T_AXI4_STREAM_MOSI32;
       M_AXI4S_64_MOSI : out T_AXI4_STREAM_MOSI64;
       S_AXI4S_32_MISO : out T_AXI4_STREAM_MISO
  );
end component;
component AXI_Stream64_to_32_wrapper
  port (
       ACLK : in STD_LOGIC;
       ARESETN : in STD_LOGIC;
       M_ACLK : in STD_LOGIC;
       M_ARESETN : in STD_LOGIC;
       M_AXI4S_32_MISO : in T_AXI4_STREAM_MISO;
       S_ACLK : in STD_LOGIC;
       S_ARESETN : in STD_LOGIC;
       S_AXI4S_64_MOSI : in T_AXI4_STREAM_MOSI64;
       M_AXI4S_32_MOSI : out T_AXI4_STREAM_MOSI32;
       S_AXI4S_64_MISO : out T_AXI4_STREAM_MISO
  );
end component;
component mgt_block
  port (
       ARESETN : in STD_LOGIC;
       AURORA_CLK_N1 : in STD_LOGIC;
       AURORA_CLK_P1 : in STD_LOGIC;
       AXI4_LITE_MOSI : in t_axi4_lite_mosi;
       CLK100MHZ : in STD_LOGIC;
       EXP_PROC_N : in STD_LOGIC_VECTOR(0 to 1);
       EXP_PROC_P : in STD_LOGIC_VECTOR(0 to 1);
       GT_RESET_IN : in STD_LOGIC;
       INIT_CLK_IN : in STD_LOGIC;
       RESET : in STD_LOGIC;
       TO_PROC_IN_MOSI : in t_axi4_stream_mosi64;
       AXI4_LITE_MISO : out t_axi4_lite_miso;
       EXP_RX_RESETDONE : out STD_LOGIC;
       EXP_TX_RESETDONE : out STD_LOGIC;
       EXP_USER_CLK : out STD_LOGIC;
       FROM_PROC_OUT_MOSI : out t_axi4_stream_mosi64;
       PROC_EXP_N : out STD_LOGIC_VECTOR(0 to 1);
       PROC_EXP_P : out STD_LOGIC_VECTOR(0 to 1);
       TO_PROC_IN_MISO : out t_axi4_stream_miso
  );
end component;
component SRLC32E
-- synthesis translate_off
  generic(
       INIT : BIT_VECTOR := X"00000000";
       IS_CLK_INVERTED : STD_ULOGIC := '0'
  );
-- synthesis translate_on
  port (
       A : in STD_LOGIC_VECTOR(4 downto 0) := "00000";
       CE : in STD_ULOGIC;
       CLK : in STD_ULOGIC;
       D : in STD_ULOGIC;
       Q : out STD_ULOGIC;
       Q31 : out STD_ULOGIC
  );
end component;

----     Constants     -----
constant VCC_CONSTANT   : STD_LOGIC := '1';
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal CLK : STD_LOGIC;
signal CLK100MHZ : STD_LOGIC;
signal DATA_USER_CLK : STD_ULOGIC;
signal EXP_STREAM_IN_MISO : t_axi4_stream_miso;
signal EXP_STREAM_IN_MOSI : t_axi4_stream_mosi32;
signal EXP_STREAM_OUT_MISO : t_axi4_stream_miso;
signal EXP_STREAM_OUT_MOSI : t_axi4_stream_mosi32;
signal EXP_TX_RESET : STD_LOGIC;
signal EXP_USER_CLK : STD_LOGIC;
signal EXT_RX_RESET : STD_LOGIC;
signal FROM_EXP_STREAM_MOSI64 : t_axi4_stream_mosi64;
signal GND : STD_LOGIC;
signal GT_RESET : STD_LOGIC;
signal RESET : STD_LOGIC;
signal TO_EXP_STREAM_MISO64 : t_axi4_stream_miso;
signal TO_EXP_STREAM_MOSI64 : t_axi4_stream_mosi64;
signal VCC : STD_LOGIC;
signal BUS6505 : STD_LOGIC_VECTOR (4 downto 0);

begin

----  Component instantiations  ----

EXP_64_TO_32 : AXI_Stream64_to_32_wrapper
  port map(
       ACLK => CLK,
       ARESETN => ARESETN,
       M_ACLK => CLK,
       M_ARESETN => ARESETN,
       M_AXI4S_32_MISO => EXP_STREAM_OUT_MISO,
       M_AXI4S_32_MOSI => EXP_STREAM_OUT_MOSI,
       S_ACLK => EXP_USER_CLK,
       S_ARESETN => EXT_RX_RESET,
       S_AXI4S_64_MOSI => FROM_EXP_STREAM_MOSI64
  );

SRL_INIT : SRLC32E
-- synthesis translate_off
  generic map (
       INIT => x"FFFFFFFF"
  )
-- synthesis translate_on
  port map(
       A => BUS6505,
       CE => VCC,
       CLK => INIT_CLK_IN,
       D => GND,
       Q31 => GT_RESET
  );

SRL_USER : SRLC32E
-- synthesis translate_off
  generic map (
       INIT => x"FFFFFFFF"
  )
-- synthesis translate_on
  port map(
       A => BUS6505,
       CE => VCC,
       CLK => DATA_USER_CLK,
       D => GND,
       Q31 => RESET
  );

TO_PROC_32_TO_64 : AXI_Stream32_to_64_wrapper
  port map(
       ACLK => CLK,
       ARESETN => ARESETN,
       M_ACLK => EXP_USER_CLK,
       M_ARESETN => EXP_TX_RESET,
       M_AXI4S_64_MISO => TO_EXP_STREAM_MISO64,
       M_AXI4S_64_MOSI => TO_EXP_STREAM_MOSI64,
       S_ACLK => CLK,
       S_ARESETN => ARESETN,
       S_AXI4S_32_MISO => EXP_STREAM_IN_MISO,
       S_AXI4S_32_MOSI => EXP_STREAM_IN_MOSI
  );

U1 : mgt_block
  port map(
       ARESETN => ARESETN,
       AURORA_CLK_N1 => AURORA_CLK_N0,
       AURORA_CLK_P1 => AURORA_CLK_P0,
       AXI4_LITE_MISO => AXI4_LITE_MISO,
       AXI4_LITE_MOSI => AXI4_LITE_MOSI,
       CLK100MHZ => CLK100MHZ,
       EXP_PROC_N => EXP_PROC_P,
       EXP_PROC_P => EXP_PROC_N,
       EXP_RX_RESETDONE => EXT_RX_RESET,
       EXP_TX_RESETDONE => EXP_TX_RESET,
       EXP_USER_CLK => EXP_USER_CLK,
       FROM_PROC_OUT_MOSI => FROM_EXP_STREAM_MOSI64,
       GT_RESET_IN => GT_RESET,
       INIT_CLK_IN => INIT_CLK_IN,
       PROC_EXP_N => PROC_EXP_N,
       PROC_EXP_P => PROC_EXP_P,
       RESET => RESET,
       TO_PROC_IN_MISO => TO_EXP_STREAM_MISO64,
       TO_PROC_IN_MOSI => TO_EXP_STREAM_MOSI64
  );


---- Power , ground assignment ----

VCC <= VCC_CONSTANT;
GND <= GND_CONSTANT;
BUS6505(4) <= GND;
BUS6505(3) <= GND;
BUS6505(2) <= GND;
BUS6505(1) <= GND;
BUS6505(0) <= GND;

---- Terminal assignment ----

    -- Inputs terminals
	CLK <= CLKDATA;
	CLK100MHZ <= CLK_MB;
	EXP_STREAM_OUT_MISO <= FROM_PROC_OUT_MISO;
	EXP_STREAM_IN_MOSI <= TO_PROC_IN_MOSI;

    -- Output\buffer terminals
	FROM_PROC_OUT_MOSI <= EXP_STREAM_OUT_MOSI;
	TO_PROC_IN_MISO <= EXP_STREAM_IN_MISO;


end mgt_wrapper;
