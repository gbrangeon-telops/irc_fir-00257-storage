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
    CLK_MB : out STD_LOGIC;
    CLK_DATA : out STD_LOGIC;	
    CLK_FLOW_CTRLER : out STD_LOGIC;
    CLK_MGT_INIT  : out STD_LOGIC;
    DIMM0_CLK_P : in STD_LOGIC;
    DIMM0_CLK_N : in STD_LOGIC;
     DIMM1_CLK_P : in STD_LOGIC;
     DIMM1_CLK_N : in STD_LOGIC;
    
    AXIS_BUF_S2MM_MOSI : in t_axi4_stream_mosi128;
    AXIS_BUF_S2MM_MISO : out t_axi4_stream_miso;
    
    AXIS_BUF_S2MM_CMD_MOSI : in t_axi4_stream_mosi_cmd64;
    AXIS_BUF_S2MM_CMD_MISO : out t_axi4_stream_miso;
    
    AXIS_BUF_S2MM_STS_MOSI : out t_axi4_stream_mosi_status;
    AXIS_BUF_S2MM_STS_MISO : in t_axi4_stream_miso;

    AXIS_BUF_MM2S_MOSI : out t_axi4_stream_mosi64;
    AXIS_BUF_MM2S_MISO : in t_axi4_stream_miso;
    
    AXIS_BUF_MM2S_CMD_MOSI : in t_axi4_stream_mosi_cmd64;
    AXIS_BUF_MM2S_CMD_MISO : out t_axi4_stream_miso;
    
    AXIS_BUF_MM2S_STS_MOSI : out t_axi4_stream_mosi_status;
    AXIS_BUF_MM2S_STS_MISO : in t_axi4_stream_miso;
    
    DIMM0_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DIMM0_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DIMM0_cas_n : out STD_LOGIC;
    DIMM0_ck_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DIMM0_ck_p : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DIMM0_cke : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DIMM0_cs_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DIMM0_dm : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DIMM0_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
    DIMM0_dqs_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    DIMM0_dqs_p : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    DIMM0_odt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DIMM0_ras_n : out STD_LOGIC;
    DIMM0_reset_n : out STD_LOGIC;
    DIMM0_we_n : out STD_LOGIC;
    
    DIMM1_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DIMM1_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DIMM1_cas_n : out STD_LOGIC;
    DIMM1_ck_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DIMM1_ck_p : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DIMM1_cke : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DIMM1_cs_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DIMM1_dm : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DIMM1_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
    DIMM1_dqs_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    DIMM1_dqs_p : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    DIMM1_odt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DIMM1_ras_n : out STD_LOGIC;
    DIMM1_reset_n : out STD_LOGIC;
    DIMM1_we_n : out STD_LOGIC;
    
    AXIL_PERIPHERAL_MOSI : out t_axi4_lite_mosi;
    AXIL_PERIPHERAL_MISO : in t_axi4_lite_miso;
    
    AXIL_MEM_OUT_MOSI : out t_axi4_lite_mosi;
    AXIL_MEM_OUT_MISO : in t_axi4_lite_miso;
    MEM_ADDR_MSB  : out STD_LOGIC_VECTOR ( 4 downto 0 );
    AXIL_MEM_IN_MOSI : in t_axi4_lite_a64_mosi;
    AXIL_MEM_IN_MISO : out t_axi4_lite_miso;
    
    QSPI    :   inout STD_LOGIC_VECTOR ( 3 downto 0 );
    QSPI_SS    :   inout STD_LOGIC;
    
    --debug
    TEST_POINT :   OUT STD_LOGIC_VECTOR ( 1 downto 0 );
    INIT_CALIB_COMPLETE :   OUT STD_LOGIC;
    
    --IIC
    IIC_SCL : inout STD_LOGIC;
    IIC_SDA : inout STD_LOGIC

    );
end bd_wrapper;




architecture bd_wrapper of bd_wrapper is

component core_wrapper
  port  (
      ARESETN : out STD_LOGIC_VECTOR ( 0 to 0 );
      AXIL_MEM_IN_araddr : in STD_LOGIC_VECTOR ( 63 downto 0 );
      AXIL_MEM_IN_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
      AXIL_MEM_IN_arready : out STD_LOGIC;
      AXIL_MEM_IN_arvalid : in STD_LOGIC;
      AXIL_MEM_IN_awaddr : in STD_LOGIC_VECTOR ( 63 downto 0 );
      AXIL_MEM_IN_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
      AXIL_MEM_IN_awready : out STD_LOGIC;
      AXIL_MEM_IN_awvalid : in STD_LOGIC;
      AXIL_MEM_IN_bready : in STD_LOGIC;
      AXIL_MEM_IN_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
      AXIL_MEM_IN_bvalid : out STD_LOGIC;
      AXIL_MEM_IN_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_MEM_IN_rready : in STD_LOGIC;
      AXIL_MEM_IN_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
      AXIL_MEM_IN_rvalid : out STD_LOGIC;
      AXIL_MEM_IN_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_MEM_IN_wready : out STD_LOGIC;
      AXIL_MEM_IN_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
      AXIL_MEM_IN_wvalid : in STD_LOGIC;
      AXIL_MEM_OUT_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_MEM_OUT_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXIL_MEM_OUT_arready : in STD_LOGIC;
      AXIL_MEM_OUT_arvalid : out STD_LOGIC;
      AXIL_MEM_OUT_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_MEM_OUT_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXIL_MEM_OUT_awready : in STD_LOGIC;
      AXIL_MEM_OUT_awvalid : out STD_LOGIC;
      AXIL_MEM_OUT_bready : out STD_LOGIC;
      AXIL_MEM_OUT_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXIL_MEM_OUT_bvalid : in STD_LOGIC;
      AXIL_MEM_OUT_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_MEM_OUT_rready : out STD_LOGIC;
      AXIL_MEM_OUT_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXIL_MEM_OUT_rvalid : in STD_LOGIC;
      AXIL_MEM_OUT_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_MEM_OUT_wready : in STD_LOGIC;
      AXIL_MEM_OUT_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
      AXIL_MEM_OUT_wvalid : out STD_LOGIC;
      AXIL_PERIPHERAL_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_PERIPHERAL_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXIL_PERIPHERAL_arready : in STD_LOGIC;
      AXIL_PERIPHERAL_arvalid : out STD_LOGIC;
      AXIL_PERIPHERAL_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_PERIPHERAL_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXIL_PERIPHERAL_awready : in STD_LOGIC;
      AXIL_PERIPHERAL_awvalid : out STD_LOGIC;
      AXIL_PERIPHERAL_bready : out STD_LOGIC;
      AXIL_PERIPHERAL_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXIL_PERIPHERAL_bvalid : in STD_LOGIC;
      AXIL_PERIPHERAL_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_PERIPHERAL_rready : out STD_LOGIC;
      AXIL_PERIPHERAL_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXIL_PERIPHERAL_rvalid : in STD_LOGIC;
      AXIL_PERIPHERAL_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_PERIPHERAL_wready : in STD_LOGIC;
      AXIL_PERIPHERAL_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
      AXIL_PERIPHERAL_wvalid : out STD_LOGIC;
      CLK_DATA : out STD_LOGIC;
      CLK_FLOW_CTRLER : out STD_LOGIC;
      CLK_MB : out STD_LOGIC;
      CLK_MGT_INIT : out STD_LOGIC;
      DIMM0_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
      DIMM0_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
      DIMM0_cas_n : out STD_LOGIC;
      DIMM0_ck_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
      DIMM0_ck_p : out STD_LOGIC_VECTOR ( 1 downto 0 );
      DIMM0_cke : out STD_LOGIC_VECTOR ( 1 downto 0 );
      DIMM0_cs_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
      DIMM0_dm : out STD_LOGIC_VECTOR ( 7 downto 0 );
      DIMM0_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
      DIMM0_dqs_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
      DIMM0_dqs_p : inout STD_LOGIC_VECTOR ( 7 downto 0 );
      DIMM0_odt : out STD_LOGIC_VECTOR ( 1 downto 0 );
      DIMM0_ras_n : out STD_LOGIC;
      DIMM0_reset_n : out STD_LOGIC;
      DIMM0_we_n : out STD_LOGIC;
      DIMM1_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
      DIMM1_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
      DIMM1_cas_n : out STD_LOGIC;
      DIMM1_ck_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
      DIMM1_ck_p : out STD_LOGIC_VECTOR ( 1 downto 0 );
      DIMM1_cke : out STD_LOGIC_VECTOR ( 1 downto 0 );
      DIMM1_cs_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
      DIMM1_dm : out STD_LOGIC_VECTOR ( 7 downto 0 );
      DIMM1_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
      DIMM1_dqs_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
      DIMM1_dqs_p : inout STD_LOGIC_VECTOR ( 7 downto 0 );
      DIMM1_odt : out STD_LOGIC_VECTOR ( 1 downto 0 );
      DIMM1_ras_n : out STD_LOGIC;
      DIMM1_reset_n : out STD_LOGIC;
      DIMM1_we_n : out STD_LOGIC;
      M_AXIS_MM2S_STS_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
      M_AXIS_MM2S_STS_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
      M_AXIS_MM2S_STS_tlast : out STD_LOGIC;
      M_AXIS_MM2S_STS_tready : in STD_LOGIC;
      M_AXIS_MM2S_STS_tvalid : out STD_LOGIC;
      M_AXIS_MM2S_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
      M_AXIS_MM2S_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
      M_AXIS_MM2S_tlast : out STD_LOGIC;
      M_AXIS_MM2S_tready : in STD_LOGIC;
      M_AXIS_MM2S_tvalid : out STD_LOGIC;
      M_AXIS_S2MM_STS_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
      M_AXIS_S2MM_STS_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
      M_AXIS_S2MM_STS_tlast : out STD_LOGIC;
      M_AXIS_S2MM_STS_tready : in STD_LOGIC;
      M_AXIS_S2MM_STS_tvalid : out STD_LOGIC;
      STARTUP_IO_cfgclk : out STD_LOGIC;
      STARTUP_IO_cfgmclk : out STD_LOGIC;
      STARTUP_IO_preq : out STD_LOGIC;
      SYS_CLK_0_clk_n : in STD_LOGIC;
      SYS_CLK_0_clk_p : in STD_LOGIC;
      SYS_CLK_1_clk_n : in STD_LOGIC;
      SYS_CLK_1_clk_p : in STD_LOGIC;
      S_AXIS_MM2S_CMD_tdata : in STD_LOGIC_VECTOR ( 103 downto 0 );
      S_AXIS_MM2S_CMD_tready : out STD_LOGIC;
      S_AXIS_MM2S_CMD_tvalid : in STD_LOGIC;
      S_AXIS_S2MM_CMD_tdata : in STD_LOGIC_VECTOR ( 103 downto 0 );
      S_AXIS_S2MM_CMD_tready : out STD_LOGIC;
      S_AXIS_S2MM_CMD_tvalid : in STD_LOGIC;
      S_AXIS_S2MM_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
      S_AXIS_S2MM_tkeep : in STD_LOGIC_VECTOR ( 15 downto 0 );
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
      dimm0_init_calib_complete : out STD_LOGIC;
      dimm1_init_calib_complete : out STD_LOGIC;
      iic_scl_io : inout STD_LOGIC;
      iic_sda_io : inout STD_LOGIC;
      mem_addr_msb_tri_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
      qspi_io0_io : inout STD_LOGIC;
      qspi_io1_io : inout STD_LOGIC;
      qspi_io2_io : inout STD_LOGIC;
      qspi_io3_io : inout STD_LOGIC;
      qspi_ss_io : inout STD_LOGIC_VECTOR ( 0 to 0 );
      test_point_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end component core_wrapper;


signal init_calib : std_logic_vector(1 downto 0);

begin

INIT_CALIB_COMPLETE <=  init_calib(0) and init_calib(1);   
    
	-- enter your statements here --
core_wrapper_i: component core_wrapper
port map (	

    UART_txd 			=> UART_TX,
    UART_rxd 			=> UART_RX,
    UART_ctsn           => '0',
    UART_dcdn           => '0',
    UART_dsrn           => '0',
    UART_ri             => '0',
   
    DIMM0_addr       => DIMM0_addr,
    DIMM0_ba         => DIMM0_ba,
    DIMM0_cas_n      => DIMM0_cas_n,
    DIMM0_ck_n       => DIMM0_ck_n,
    DIMM0_ck_p       => DIMM0_ck_p,
    DIMM0_cke        => DIMM0_cke,
    DIMM0_cs_n       => DIMM0_cs_n,
    DIMM0_dm         => DIMM0_dm,
    DIMM0_dq         => DIMM0_dq,
    DIMM0_dqs_n      => DIMM0_dqs_n,
    DIMM0_dqs_p      => DIMM0_dqs_p,
    DIMM0_odt        => DIMM0_odt,
    DIMM0_ras_n      => DIMM0_ras_n,
    DIMM0_reset_n    => DIMM0_reset_n,
    DIMM0_we_n       => DIMM0_we_n,
    
    DIMM1_addr       => DIMM1_addr,
    DIMM1_ba         => DIMM1_ba,
    DIMM1_cas_n      => DIMM1_cas_n,
    DIMM1_ck_n       => DIMM1_ck_n,
    DIMM1_ck_p       => DIMM1_ck_p,
    DIMM1_cke        => DIMM1_cke,
    DIMM1_cs_n       => DIMM1_cs_n,
    DIMM1_dm         => DIMM1_dm,
    DIMM1_dq         => DIMM1_dq,
    DIMM1_dqs_n      => DIMM1_dqs_n,
    DIMM1_dqs_p      => DIMM1_dqs_p,
    DIMM1_odt        => DIMM1_odt,
    DIMM1_ras_n      => DIMM1_ras_n,
    DIMM1_reset_n    => DIMM1_reset_n,
    DIMM1_we_n       => DIMM1_we_n,

    aresetn(0)    => ARESETN,
    CLK_MGT_INIT  => CLK_MGT_INIT,
    CLK_MB        => CLK_MB,     
    CLK_DATA      => CLK_DATA,
    CLK_FLOW_CTRLER => CLK_FLOW_CTRLER,

     SYS_CLK_0_clk_n => DIMM0_CLK_N,
    SYS_CLK_0_clk_p => DIMM0_CLK_P,
    
     SYS_CLK_1_clk_n => DIMM1_CLK_N,
    SYS_CLK_1_clk_p => DIMM1_CLK_P,    
  
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
    
    AXIL_PERIPHERAL_araddr   =>  AXIL_PERIPHERAL_MOSI.araddr,
    AXIL_PERIPHERAL_arprot   =>  AXIL_PERIPHERAL_MOSI.arprot,
    AXIL_PERIPHERAL_arready  =>  AXIL_PERIPHERAL_MISO.arready,
    AXIL_PERIPHERAL_arvalid  =>  AXIL_PERIPHERAL_MOSI.arvalid,
    AXIL_PERIPHERAL_awaddr   =>  AXIL_PERIPHERAL_MOSI.awaddr,
    AXIL_PERIPHERAL_awprot   =>  AXIL_PERIPHERAL_MOSI.awprot,
    AXIL_PERIPHERAL_awready  =>  AXIL_PERIPHERAL_MISO.awready,
    AXIL_PERIPHERAL_awvalid  =>  AXIL_PERIPHERAL_MOSI.awvalid,
    AXIL_PERIPHERAL_bready   =>  AXIL_PERIPHERAL_MOSI.bready,
    AXIL_PERIPHERAL_bresp    =>  AXIL_PERIPHERAL_MISO.bresp,
    AXIL_PERIPHERAL_bvalid   =>  AXIL_PERIPHERAL_MISO.bvalid,
    AXIL_PERIPHERAL_rdata    =>  AXIL_PERIPHERAL_MISO.rdata,
    AXIL_PERIPHERAL_rready  =>  AXIL_PERIPHERAL_MOSI.rready,
    AXIL_PERIPHERAL_rresp    =>  AXIL_PERIPHERAL_MISO.rresp,
    AXIL_PERIPHERAL_rvalid   =>  AXIL_PERIPHERAL_MISO.rvalid,
    AXIL_PERIPHERAL_wdata    =>  AXIL_PERIPHERAL_MOSI.wdata,
    AXIL_PERIPHERAL_wready   =>  AXIL_PERIPHERAL_MISO.wready,
    AXIL_PERIPHERAL_wstrb    =>  AXIL_PERIPHERAL_MOSI.wstrb,
    AXIL_PERIPHERAL_wvalid   =>  AXIL_PERIPHERAL_MOSI.wvalid,
    
    AXIL_MEM_OUT_araddr => AXIL_MEM_OUT_MOSI.ARADDR,
    AXIL_MEM_OUT_arprot => AXIL_MEM_OUT_MOSI.ARPROT,
    AXIL_MEM_OUT_arready => AXIL_MEM_OUT_MISO.ARREADY,
    AXIL_MEM_OUT_arvalid => AXIL_MEM_OUT_MOSI.ARVALID,
    AXIL_MEM_OUT_awaddr => AXIL_MEM_OUT_MOSI.AWADDR,
    AXIL_MEM_OUT_awprot => AXIL_MEM_OUT_MOSI.AWPROT,
    AXIL_MEM_OUT_awready => AXIL_MEM_OUT_MISO.AWREADY,
    AXIL_MEM_OUT_awvalid => AXIL_MEM_OUT_MOSI.AWVALID,
    AXIL_MEM_OUT_bready => AXIL_MEM_OUT_MOSI.BREADY,
    AXIL_MEM_OUT_bresp => AXIL_MEM_OUT_MISO.BRESP,
    AXIL_MEM_OUT_bvalid => AXIL_MEM_OUT_MISO.BVALID,
    AXIL_MEM_OUT_rdata => AXIL_MEM_OUT_MISO.RDATA,
    AXIL_MEM_OUT_rready => AXIL_MEM_OUT_MOSI.RREADY,
    AXIL_MEM_OUT_rresp => AXIL_MEM_OUT_MISO.RRESP,
    AXIL_MEM_OUT_rvalid => AXIL_MEM_OUT_MISO.RVALID,
    AXIL_MEM_OUT_wdata => AXIL_MEM_OUT_MOSI.WDATA,
    AXIL_MEM_OUT_wready => AXIL_MEM_OUT_MISO.WREADY,
    AXIL_MEM_OUT_wstrb => AXIL_MEM_OUT_MOSI.WSTRB,
    AXIL_MEM_OUT_wvalid => AXIL_MEM_OUT_MOSI.WVALID,
    
    mem_addr_msb_tri_o => MEM_ADDR_MSB,
    
    AXIL_MEM_IN_araddr => AXIL_MEM_IN_MOSI.ARADDR,
    AXIL_MEM_IN_arprot => AXIL_MEM_IN_MOSI.ARPROT,
    AXIL_MEM_IN_arready => AXIL_MEM_IN_MISO.ARREADY,
    AXIL_MEM_IN_arvalid => AXIL_MEM_IN_MOSI.ARVALID,
    AXIL_MEM_IN_awaddr => AXIL_MEM_IN_MOSI.AWADDR,
    AXIL_MEM_IN_awprot => AXIL_MEM_IN_MOSI.AWPROT,
    AXIL_MEM_IN_awready => AXIL_MEM_IN_MISO.AWREADY,
    AXIL_MEM_IN_awvalid => AXIL_MEM_IN_MOSI.AWVALID,
    AXIL_MEM_IN_bready => AXIL_MEM_IN_MOSI.BREADY,
    AXIL_MEM_IN_bresp => AXIL_MEM_IN_MISO.BRESP,
    AXIL_MEM_IN_bvalid => AXIL_MEM_IN_MISO.BVALID,
    AXIL_MEM_IN_rdata => AXIL_MEM_IN_MISO.RDATA,
    AXIL_MEM_IN_rready => AXIL_MEM_IN_MOSI.RREADY,
    AXIL_MEM_IN_rresp => AXIL_MEM_IN_MISO.RRESP,
    AXIL_MEM_IN_rvalid => AXIL_MEM_IN_MISO.RVALID,
    AXIL_MEM_IN_wdata => AXIL_MEM_IN_MOSI.WDATA,
    AXIL_MEM_IN_wready => AXIL_MEM_IN_MISO.WREADY,
    AXIL_MEM_IN_wstrb => AXIL_MEM_IN_MOSI.WSTRB,
    AXIL_MEM_IN_wvalid => AXIL_MEM_IN_MOSI.WVALID,
    
    qspi_io0_io => QSPI(0),
    qspi_io1_io => QSPI(1),
    qspi_io2_io => QSPI(2),
    qspi_io3_io => QSPI(3),
    qspi_ss_io(0)  => QSPI_SS,
    
    DIMM0_INIT_CALIB_COMPLETE =>  init_calib(0),
    DIMM1_INIT_CALIB_COMPLETE =>  init_calib(1),
    
    test_point_tri_o => TEST_POINT,
    
    iic_scl_io => IIC_SCL,
    iic_sda_io => IIC_SDA

);											

end bd_wrapper;
    