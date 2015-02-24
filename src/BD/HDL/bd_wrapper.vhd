-------------------------------------------------------------------------------
--
-- Title       : bd_wrapper
-- Design      : FIR_00257
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : d:\Telops\FIR-00251-Proc\aldec\src\bd_wrapper.vhd
-- Generated   : Mon Jan  6 13:43:39 2014
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.TEL2000.all;

entity bd_wrapper is
	port(

    UART_RX : in STD_LOGIC;
    UART_TX : out STD_LOGIC;
   
    ARESETN : out STD_LOGIC;
    clk_100 : out STD_LOGIC;
    clk_160 : out STD_LOGIC;
    clk_50  : out STD_LOGIC;
    SYS_CLK_0_P : in STD_LOGIC;
    SYS_CLK_0_N : in STD_LOGIC;
	SYS_CLK_1_P : in STD_LOGIC;
	SYS_CLK_1_N : in STD_LOGIC;

    
    AXIS_BUF_S2MM_MOSI : in t_axi4_stream_mosi32;
    AXIS_BUF_S2MM_MISO : out t_axi4_stream_miso;
    
    AXIS_BUF_S2MM_CMD_MOSI : in t_axi4_stream_mosi72;
    AXIS_BUF_S2MM_CMD_MISO : out t_axi4_stream_miso;
    
    AXIS_BUF_S2MM_STS_MOSI : out t_axi4_stream_mosi_status;
    AXIS_BUF_S2MM_STS_MISO : in t_axi4_stream_miso;

    AXIS_BUF_MM2S_MOSI : out t_axi4_stream_mosi32;
    AXIS_BUF_MM2S_MISO : in t_axi4_stream_miso;
    
    AXIS_BUF_MM2S_CMD_MOSI : in t_axi4_stream_mosi72;
    AXIS_BUF_MM2S_CMD_MISO : out t_axi4_stream_miso;
    
    AXIS_BUF_MM2S_STS_MOSI : out t_axi4_stream_mosi_status;
    AXIS_BUF_MM2S_STS_MISO : in t_axi4_stream_miso;
    
    DDR3_addr : out STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR3_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR3_cas_n : out STD_LOGIC;
    DDR3_ck_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR3_ck_p : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR3_cke : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR3_cs_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR3_dm : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DDR3_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
    DDR3_dqs_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    DDR3_dqs_p : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    DDR3_odt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR3_ras_n : out STD_LOGIC;
    DDR3_reset_n : out STD_LOGIC;
    DDR3_we_n : out STD_LOGIC;
    
    AXIL_MGT_MOSI : out t_axi4_lite_mosi;
    AXIL_MGT_MISO : in t_axi4_lite_miso;
    
    AXIL_DUT_MOSI : out t_axi4_lite_mosi;
    AXIL_DUT_MISO : in t_axi4_lite_miso;
    
    GPIO : inout STD_LOGIC_VECTOR(3 downto 0)

	);
end bd_wrapper;




architecture bd_wrapper of bd_wrapper is

component core_wrapper
  port (
    DDR3_addr : out STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR3_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR3_cas_n : out STD_LOGIC;
    DDR3_ck_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR3_ck_p : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR3_cke : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR3_cs_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR3_dm : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DDR3_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
    DDR3_dqs_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    DDR3_dqs_p : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    DDR3_odt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR3_ras_n : out STD_LOGIC;
    DDR3_reset_n : out STD_LOGIC;
    DDR3_we_n : out STD_LOGIC;
    M_AXIL_DUT_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIL_DUT_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXIL_DUT_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_DUT_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_DUT_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIL_DUT_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXIL_DUT_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_DUT_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_DUT_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_DUT_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXIL_DUT_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_DUT_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIL_DUT_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_DUT_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXIL_DUT_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_DUT_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIL_DUT_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_DUT_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXIL_DUT_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_MGT_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIL_MGT_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXIL_MGT_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_MGT_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_MGT_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIL_MGT_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXIL_MGT_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_MGT_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_MGT_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_MGT_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXIL_MGT_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_MGT_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIL_MGT_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_MGT_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXIL_MGT_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_MGT_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIL_MGT_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIL_MGT_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXIL_MGT_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_MM2S_STS_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXIS_MM2S_STS_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_MM2S_STS_tlast : out STD_LOGIC;
    M_AXIS_MM2S_STS_tready : in STD_LOGIC;
    M_AXIS_MM2S_STS_tvalid : out STD_LOGIC;
    M_AXIS_MM2S_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_MM2S_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXIS_MM2S_tlast : out STD_LOGIC;
    M_AXIS_MM2S_tready : in STD_LOGIC;
    M_AXIS_MM2S_tvalid : out STD_LOGIC;
    M_AXIS_S2MM_STS_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXIS_S2MM_STS_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_S2MM_STS_tlast : out STD_LOGIC;
    M_AXIS_S2MM_STS_tready : in STD_LOGIC;
    M_AXIS_S2MM_STS_tvalid : out STD_LOGIC;
    SYS_CLK_clk_n : in STD_LOGIC;
    SYS_CLK_clk_p : in STD_LOGIC;
    S_AXIS_MM2S_CMD_tdata : in STD_LOGIC_VECTOR ( 71 downto 0 );
    S_AXIS_MM2S_CMD_tready : out STD_LOGIC;
    S_AXIS_MM2S_CMD_tvalid : in STD_LOGIC;
    S_AXIS_S2MM_CMD_tdata : in STD_LOGIC_VECTOR ( 71 downto 0 );
    S_AXIS_S2MM_CMD_tready : out STD_LOGIC;
    S_AXIS_S2MM_CMD_tvalid : in STD_LOGIC;
    S_AXIS_S2MM_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_S2MM_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXIS_S2MM_tlast : in STD_LOGIC;
    S_AXIS_S2MM_tready : out STD_LOGIC;
    S_AXIS_S2MM_tvalid : in STD_LOGIC;
    UART_baudoutn : out STD_LOGIC;
    UART_ctsn : in STD_LOGIC;
    UART_dcdn : in STD_LOGIC;
    UART_ddis : out STD_LOGIC;
    UART_dsrn : in STD_LOGIC;
    UART_dtrn : out STD_LOGIC;
    UART_out1n : out STD_LOGIC;
    UART_out2n : out STD_LOGIC;
    UART_ri : in STD_LOGIC;
    UART_rtsn : out STD_LOGIC;
    UART_rxd : in STD_LOGIC;
    UART_rxrdyn : out STD_LOGIC;
    UART_txd : out STD_LOGIC;
    UART_txrdyn : out STD_LOGIC;
    aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk100 : out STD_LOGIC;
    clk160 : out STD_LOGIC;
    clk50 : out STD_LOGIC;
    gpio_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end component;

signal mux_add : std_logic_vector(4 downto 0);
begin
   
	-- enter your statements here --
core_wrapper_i: component core_wrapper
port map (	

   
    --OEM UART WRAPPER

    UART_txd 			=> UART_TX,
    UART_rxd 			=> UART_RX,
    UART_ctsn           => '0',
    UART_dcdn           => '0',
    UART_dsrn           => '0',
    UART_ri             => '0',
    
    gpio_tri_i          => GPIO,
   
    --Code Mem
    DDR3_addr       => DDR3_addr,
    DDR3_ba         => DDR3_ba,
    DDR3_cas_n      => DDR3_cas_n,
    DDR3_ck_n       => DDR3_ck_n,
    DDR3_ck_p       => DDR3_ck_p,
    DDR3_cke        => DDR3_cke,
    DDR3_dm         => DDR3_dm,
    DDR3_dq         => DDR3_dq,
    DDR3_dqs_n      => DDR3_dqs_n,
    DDR3_dqs_p      => DDR3_dqs_p,
    DDR3_odt        => DDR3_odt,
    DDR3_ras_n      => DDR3_ras_n,
    DDR3_reset_n    => DDR3_reset_n,
    DDR3_we_n       => DDR3_we_n,

    aresetn(0) => ARESETN,
    clk100     => clk_100,     
    clk160     => clk_160,
    clk50     => clk_50,      

	SYS_CLK_clk_n => SYS_CLK_0_N,
    SYS_CLK_clk_p => SYS_CLK_0_P,
     
  
    -- BUFFERING DM INTERFACE
	M_AXIS_MM2S_tvalid => AXIS_BUF_MM2S_MOSI.TVALID,
    M_AXIS_MM2S_tdata => AXIS_BUF_MM2S_MOSI.TDATA,
    M_AXIS_MM2S_tkeep => AXIS_BUF_MM2S_MOSI.TKEEP,
    M_AXIS_MM2S_tlast => AXIS_BUF_MM2S_MOSI.TLAST,
    M_AXIS_MM2S_tready => AXIS_BUF_MM2S_MISO.TREADY,

    S_AXIS_MM2S_CMD_tdata => AXIS_BUF_MM2S_CMD_MOSI.TDATA,
    S_AXIS_MM2S_CMD_tvalid => AXIS_BUF_MM2S_CMD_MOSI.TVALID,
    S_AXIS_MM2S_CMD_tready => AXIS_BUF_MM2S_CMD_MISO.TREADY,

    M_AXIS_MM2S_STS_tready => AXIS_BUF_MM2S_STS_MISO.TREADY,
	M_AXIS_MM2S_STS_tdata => AXIS_BUF_MM2S_STS_MOSI.TDATA,
	M_AXIS_MM2S_STS_tkeep => AXIS_BUF_MM2S_STS_MOSI.TKEEP,
	M_AXIS_MM2S_STS_tlast => AXIS_BUF_MM2S_STS_MOSI.TLAST,
	M_AXIS_MM2S_STS_tvalid => AXIS_BUF_MM2S_STS_MOSI.TVALID,
    
    S_AXIS_S2MM_tdata => AXIS_BUF_S2MM_MOSI.TDATA,
    S_AXIS_S2MM_tkeep => AXIS_BUF_S2MM_MOSI.TKEEP,
    S_AXIS_S2MM_tlast => AXIS_BUF_S2MM_MOSI.TLAST,
    S_AXIS_S2MM_tvalid => AXIS_BUF_S2MM_MOSI.TVALID,
    S_AXIS_S2MM_tready => AXIS_BUF_S2MM_MISO.TREADY,
	
	S_AXIS_S2MM_CMD_tdata => AXIS_BUF_S2MM_CMD_MOSI.TDATA,
    S_AXIS_S2MM_CMD_tvalid => AXIS_BUF_S2MM_CMD_MOSI.TVALID,
    S_AXIS_S2MM_CMD_tready => AXIS_BUF_S2MM_CMD_MISO.TREADY,
	
	M_AXIS_S2MM_STS_tdata => AXIS_BUF_S2MM_STS_MOSI.TDATA,
    M_AXIS_S2MM_STS_tkeep => AXIS_BUF_S2MM_STS_MOSI.TKEEP,
    M_AXIS_S2MM_STS_tlast => AXIS_BUF_S2MM_STS_MOSI.TLAST,
    M_AXIS_S2MM_STS_tvalid => AXIS_BUF_S2MM_STS_MOSI.TVALID,
    M_AXIS_S2MM_STS_tready => AXIS_BUF_S2MM_STS_MISO.TREADY,
    
    M_AXIL_DUT_araddr   =>  AXIL_DUT_MOSI.araddr,
    M_AXIL_DUT_arprot   =>  AXIL_DUT_MOSI.arprot,
    M_AXIL_DUT_arready(0)  =>  AXIL_DUT_MISO.arready,
    M_AXIL_DUT_arvalid(0)  =>  AXIL_DUT_MOSI.arvalid,
    M_AXIL_DUT_awaddr   =>  AXIL_DUT_MOSI.awaddr,
    M_AXIL_DUT_awprot   =>  AXIL_DUT_MOSI.awprot,
    M_AXIL_DUT_awready(0)  =>  AXIL_DUT_MISO.awready,
    M_AXIL_DUT_awvalid(0)  =>  AXIL_DUT_MOSI.awvalid,
    M_AXIL_DUT_bready(0)   =>  AXIL_DUT_MOSI.bready,
    M_AXIL_DUT_bresp    =>  AXIL_DUT_MISO.bresp,
    M_AXIL_DUT_bvalid(0)   =>  AXIL_DUT_MISO.bvalid,
    M_AXIL_DUT_rdata    =>  AXIL_DUT_MISO.rdata,
    M_AXIL_DUT_rready(0)   =>  AXIL_DUT_MOSI.rready,
    M_AXIL_DUT_rresp    =>  AXIL_DUT_MISO.rresp,
    M_AXIL_DUT_rvalid(0)   =>  AXIL_DUT_MISO.rvalid,
    M_AXIL_DUT_wdata    =>  AXIL_DUT_MOSI.wdata,
    M_AXIL_DUT_wready(0)   =>  AXIL_DUT_MISO.wready,
    M_AXIL_DUT_wstrb    =>  AXIL_DUT_MOSI.wstrb,
    M_AXIL_DUT_wvalid(0)   =>  AXIL_DUT_MOSI.wvalid,
    
    
    M_AXIL_MGT_araddr   =>  AXIL_MGT_MOSI.araddr,
    M_AXIL_MGT_arprot   =>  AXIL_MGT_MOSI.arprot,
    M_AXIL_MGT_arready(0)  =>  AXIL_MGT_MISO.arready,
    M_AXIL_MGT_arvalid(0)  =>  AXIL_MGT_MOSI.arvalid,
    M_AXIL_MGT_awaddr   =>  AXIL_MGT_MOSI.awaddr,
    M_AXIL_MGT_awprot   =>  AXIL_MGT_MOSI.awprot,
    M_AXIL_MGT_awready(0)  =>  AXIL_MGT_MISO.awready,
    M_AXIL_MGT_awvalid(0)  =>  AXIL_MGT_MOSI.awvalid,
    M_AXIL_MGT_bready(0)   =>  AXIL_MGT_MOSI.bready,
    M_AXIL_MGT_bresp    =>  AXIL_MGT_MISO.bresp,
    M_AXIL_MGT_bvalid(0)   =>  AXIL_MGT_MISO.bvalid,
    M_AXIL_MGT_rdata    =>  AXIL_MGT_MISO.rdata,
    M_AXIL_MGT_rready(0)   =>  AXIL_MGT_MOSI.rready,
    M_AXIL_MGT_rresp    =>  AXIL_MGT_MISO.rresp,
    M_AXIL_MGT_rvalid(0)   =>  AXIL_MGT_MISO.rvalid,
    M_AXIL_MGT_wdata    =>  AXIL_MGT_MOSI.wdata,
    M_AXIL_MGT_wready(0)   =>  AXIL_MGT_MISO.wready,
    M_AXIL_MGT_wstrb    =>  AXIL_MGT_MOSI.wstrb,
    M_AXIL_MGT_wvalid(0)   =>  AXIL_MGT_MOSI.wvalid
                                
    

);											

end bd_wrapper;
    