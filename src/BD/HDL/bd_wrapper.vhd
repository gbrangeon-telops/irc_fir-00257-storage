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
    DIMM0_CLK_P : in STD_LOGIC;
    DIMM0_CLK_N : in STD_LOGIC;
	DIMM1_CLK_P : in STD_LOGIC;
	DIMM1_CLK_N : in STD_LOGIC;

    
    AXIS_BUF_S2MM_MOSI : in t_axi4_stream_mosi32;
    AXIS_BUF_S2MM_MISO : out t_axi4_stream_miso;
    
    AXIS_BUF_S2MM_CMD_MOSI : in t_axi4_stream_mosi_cmd64;
    AXIS_BUF_S2MM_CMD_MISO : out t_axi4_stream_miso;
    
    AXIS_BUF_S2MM_STS_MOSI : out t_axi4_stream_mosi_status;
    AXIS_BUF_S2MM_STS_MISO : in t_axi4_stream_miso;

    AXIS_BUF_MM2S_MOSI : out t_axi4_stream_mosi16;
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
    
    AXIL_MGT_MOSI : out t_axi4_lite_mosi;
    AXIL_MGT_MISO : in t_axi4_lite_miso;
    
    AXIL_BUF_MOSI : out t_axi4_lite_mosi;
    AXIL_BUF_MISO : in t_axi4_lite_miso;
    
    AXIL_BUF_TABLE_MOSI : out t_axi4_lite_mosi;
    AXIL_BUF_TABLE_MISO : in t_axi4_lite_miso;
    
    AXIL_MEM_OUT_MOSI : out t_axi4_lite_mosi;
    AXIL_MEM_OUT_MISO : in t_axi4_lite_miso;
    MEM_ADDR_MSB  : out STD_LOGIC_VECTOR ( 4 downto 0 );
    AXIL_MEM_IN_MOSI : in t_axi4_lite_a64_mosi;
    AXIL_MEM_IN_MISO : out t_axi4_lite_miso;
    
    
    AXI_S2MM_DM_OUT_MOSI : out t_axi4_a64_d256_write_mosi;
    AXI_S2MM_DM_OUT_MISO : in t_axi4_write_miso;
    AXI_S2MM_DM_IN_MOSI : in t_axi4_a64_d256_write_mosi;
    AXI_S2MM_DM_IN_MISO : out t_axi4_write_miso;
    
    AXI_MM2S_DM_OUT_MOSI : out t_axi4_a64_read_mosi;
    AXI_MM2S_DM_OUT_MISO : in t_axi4_d256_read_miso;
    AXI_MM2S_DM_IN_MOSI : in t_axi4_a64_read_mosi;
    AXI_MM2S_DM_IN_MISO : out t_axi4_d256_read_miso;
    
    QSPI    :   inout STD_LOGIC_VECTOR ( 3 downto 0 );
    QSPI_SS    :   inout STD_LOGIC;
    
    --debug
    INIT_CALIB_COMPLETE :   OUT STD_LOGIC

	);
end bd_wrapper;




architecture bd_wrapper of bd_wrapper is

component core_wrapper
  port  (
      ARESETN : out STD_LOGIC_VECTOR ( 0 to 0 );
      AXIL_BUF_TABLE_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_BUF_TABLE_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXIL_BUF_TABLE_arready : in STD_LOGIC;
      AXIL_BUF_TABLE_arvalid : out STD_LOGIC;
      AXIL_BUF_TABLE_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_BUF_TABLE_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXIL_BUF_TABLE_awready : in STD_LOGIC;
      AXIL_BUF_TABLE_awvalid : out STD_LOGIC;
      AXIL_BUF_TABLE_bready : out STD_LOGIC;
      AXIL_BUF_TABLE_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXIL_BUF_TABLE_bvalid : in STD_LOGIC;
      AXIL_BUF_TABLE_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_BUF_TABLE_rready : out STD_LOGIC;
      AXIL_BUF_TABLE_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXIL_BUF_TABLE_rvalid : in STD_LOGIC;
      AXIL_BUF_TABLE_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_BUF_TABLE_wready : in STD_LOGIC;
      AXIL_BUF_TABLE_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
      AXIL_BUF_TABLE_wvalid : out STD_LOGIC;
      AXIL_BUF_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_BUF_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXIL_BUF_arready : in STD_LOGIC;
      AXIL_BUF_arvalid : out STD_LOGIC;
      AXIL_BUF_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_BUF_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXIL_BUF_awready : in STD_LOGIC;
      AXIL_BUF_awvalid : out STD_LOGIC;
      AXIL_BUF_bready : out STD_LOGIC;
      AXIL_BUF_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXIL_BUF_bvalid : in STD_LOGIC;
      AXIL_BUF_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_BUF_rready : out STD_LOGIC;
      AXIL_BUF_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXIL_BUF_rvalid : in STD_LOGIC;
      AXIL_BUF_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_BUF_wready : in STD_LOGIC;
      AXIL_BUF_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
      AXIL_BUF_wvalid : out STD_LOGIC;
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
      AXIL_MGT_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_MGT_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXIL_MGT_arready : in STD_LOGIC;
      AXIL_MGT_arvalid : out STD_LOGIC;
      AXIL_MGT_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_MGT_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXIL_MGT_awready : in STD_LOGIC;
      AXIL_MGT_awvalid : out STD_LOGIC;
      AXIL_MGT_bready : out STD_LOGIC;
      AXIL_MGT_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXIL_MGT_bvalid : in STD_LOGIC;
      AXIL_MGT_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_MGT_rready : out STD_LOGIC;
      AXIL_MGT_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXIL_MGT_rvalid : in STD_LOGIC;
      AXIL_MGT_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXIL_MGT_wready : in STD_LOGIC;
      AXIL_MGT_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
      AXIL_MGT_wvalid : out STD_LOGIC;
      AXI_MM2S_DM_IN_araddr : in STD_LOGIC_VECTOR ( 63 downto 0 );
      AXI_MM2S_DM_IN_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXI_MM2S_DM_IN_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_MM2S_DM_IN_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_MM2S_DM_IN_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
      AXI_MM2S_DM_IN_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
      AXI_MM2S_DM_IN_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
      AXI_MM2S_DM_IN_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_MM2S_DM_IN_arready : out STD_LOGIC;
      AXI_MM2S_DM_IN_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_MM2S_DM_IN_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
      AXI_MM2S_DM_IN_arvalid : in STD_LOGIC;
      AXI_MM2S_DM_IN_rdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
      AXI_MM2S_DM_IN_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_MM2S_DM_IN_rlast : out STD_LOGIC;
      AXI_MM2S_DM_IN_rready : in STD_LOGIC;
      AXI_MM2S_DM_IN_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
      AXI_MM2S_DM_IN_rvalid : out STD_LOGIC;
      AXI_MM2S_DM_OUT_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
      AXI_MM2S_DM_OUT_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
      AXI_MM2S_DM_OUT_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_MM2S_DM_OUT_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_MM2S_DM_OUT_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
      AXI_MM2S_DM_OUT_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXI_MM2S_DM_OUT_arready : in STD_LOGIC;
      AXI_MM2S_DM_OUT_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXI_MM2S_DM_OUT_aruser : out STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_MM2S_DM_OUT_arvalid : out STD_LOGIC;
      AXI_MM2S_DM_OUT_rdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
      AXI_MM2S_DM_OUT_rlast : in STD_LOGIC;
      AXI_MM2S_DM_OUT_rready : out STD_LOGIC;
      AXI_MM2S_DM_OUT_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXI_MM2S_DM_OUT_rvalid : in STD_LOGIC;
      AXI_S2MM_DM_IN_awaddr : in STD_LOGIC_VECTOR ( 63 downto 0 );
      AXI_S2MM_DM_IN_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXI_S2MM_DM_IN_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_S2MM_DM_IN_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_S2MM_DM_IN_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
      AXI_S2MM_DM_IN_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
      AXI_S2MM_DM_IN_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
      AXI_S2MM_DM_IN_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_S2MM_DM_IN_awready : out STD_LOGIC;
      AXI_S2MM_DM_IN_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_S2MM_DM_IN_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
      AXI_S2MM_DM_IN_awvalid : in STD_LOGIC;
      AXI_S2MM_DM_IN_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_S2MM_DM_IN_bready : in STD_LOGIC;
      AXI_S2MM_DM_IN_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
      AXI_S2MM_DM_IN_bvalid : out STD_LOGIC;
      AXI_S2MM_DM_IN_wdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
      AXI_S2MM_DM_IN_wlast : in STD_LOGIC;
      AXI_S2MM_DM_IN_wready : out STD_LOGIC;
      AXI_S2MM_DM_IN_wstrb : in STD_LOGIC_VECTOR ( 31 downto 0 );
      AXI_S2MM_DM_IN_wvalid : in STD_LOGIC;
      AXI_S2MM_DM_OUT_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
      AXI_S2MM_DM_OUT_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
      AXI_S2MM_DM_OUT_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_S2MM_DM_OUT_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_S2MM_DM_OUT_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
      AXI_S2MM_DM_OUT_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXI_S2MM_DM_OUT_awready : in STD_LOGIC;
      AXI_S2MM_DM_OUT_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
      AXI_S2MM_DM_OUT_awuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
      AXI_S2MM_DM_OUT_awvalid : out STD_LOGIC;
      AXI_S2MM_DM_OUT_bready : out STD_LOGIC;
      AXI_S2MM_DM_OUT_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      AXI_S2MM_DM_OUT_bvalid : in STD_LOGIC;
      AXI_S2MM_DM_OUT_wdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
      AXI_S2MM_DM_OUT_wlast : out STD_LOGIC;
      AXI_S2MM_DM_OUT_wready : in STD_LOGIC;
      AXI_S2MM_DM_OUT_wstrb : out STD_LOGIC_VECTOR ( 31 downto 0 );
      AXI_S2MM_DM_OUT_wvalid : out STD_LOGIC;
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
      M_AXIS_MM2S_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
      M_AXIS_MM2S_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
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
      STARTUP_IO_eos : out STD_LOGIC;
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
      clk100 : out STD_LOGIC;
      clk160 : out STD_LOGIC;
      clk_50 : out STD_LOGIC;
      dimm0_init_calib_complete : out STD_LOGIC;
      dimm1_init_calib_complete : out STD_LOGIC;
      mem_addr_msb_tri_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
      qspi_io0_io : inout STD_LOGIC;
      qspi_io1_io : inout STD_LOGIC;
      qspi_io2_io : inout STD_LOGIC;
      qspi_io3_io : inout STD_LOGIC;
      qspi_ss_io : inout STD_LOGIC_VECTOR ( 0 to 0 )
  );
end component core_wrapper;


signal init_calib : std_logic_vector(1 downto 0);

begin

INIT_CALIB_COMPLETE <=  init_calib(0) and init_calib(1);   
    
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
    
    --gpio_tri_i          => GPIO,
   
    --Code Mem
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

    aresetn(0) => ARESETN,
    clk_50     => clk_50,
    clk100     => clk_100,     
    clk160     => clk_160,


	SYS_CLK_0_clk_n => DIMM0_CLK_N,
    SYS_CLK_0_clk_p => DIMM0_CLK_P,
    
	SYS_CLK_1_clk_n => DIMM1_CLK_N,
    SYS_CLK_1_clk_p => DIMM1_CLK_P,    
  
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
    
    AXIL_BUF_araddr     =>  AXIL_BUF_MOSI.araddr,
    AXIL_BUF_arprot     =>  AXIL_BUF_MOSI.arprot,
    AXIL_BUF_arready =>  AXIL_BUF_MISO.arready,
    AXIL_BUF_arvalid =>  AXIL_BUF_MOSI.arvalid,
    AXIL_BUF_awaddr     =>  AXIL_BUF_MOSI.awaddr,
    AXIL_BUF_awprot     =>  AXIL_BUF_MOSI.awprot,
    AXIL_BUF_awready =>  AXIL_BUF_MISO.awready,
    AXIL_BUF_awvalid =>  AXIL_BUF_MOSI.awvalid,
    AXIL_BUF_bready  =>  AXIL_BUF_MOSI.bready,
    AXIL_BUF_bresp      =>  AXIL_BUF_MISO.bresp,
    AXIL_BUF_bvalid  =>  AXIL_BUF_MISO.bvalid,
    AXIL_BUF_rdata      =>  AXIL_BUF_MISO.rdata,
    AXIL_BUF_rready  =>  AXIL_BUF_MOSI.rready,
    AXIL_BUF_rresp      =>  AXIL_BUF_MISO.rresp,
    AXIL_BUF_rvalid  =>  AXIL_BUF_MISO.rvalid,
    AXIL_BUF_wdata      =>  AXIL_BUF_MOSI.wdata,
    AXIL_BUF_wready  =>  AXIL_BUF_MISO.wready,
    AXIL_BUF_wstrb      =>  AXIL_BUF_MOSI.wstrb,
    AXIL_BUF_wvalid  =>  AXIL_BUF_MOSI.wvalid,
    
    AXIL_BUF_TABLE_araddr     =>  AXIL_BUF_TABLE_MOSI.araddr,
    AXIL_BUF_TABLE_arprot     =>  AXIL_BUF_TABLE_MOSI.arprot,
    AXIL_BUF_TABLE_arready =>  AXIL_BUF_TABLE_MISO.arready,
    AXIL_BUF_TABLE_arvalid =>  AXIL_BUF_TABLE_MOSI.arvalid,
    AXIL_BUF_TABLE_awaddr     =>  AXIL_BUF_TABLE_MOSI.awaddr,
    AXIL_BUF_TABLE_awprot     =>  AXIL_BUF_TABLE_MOSI.awprot,
    AXIL_BUF_TABLE_awready =>  AXIL_BUF_TABLE_MISO.awready,
    AXIL_BUF_TABLE_awvalid =>  AXIL_BUF_TABLE_MOSI.awvalid,
    AXIL_BUF_TABLE_bready  =>  AXIL_BUF_TABLE_MOSI.bready,
    AXIL_BUF_TABLE_bresp      =>  AXIL_BUF_TABLE_MISO.bresp,
    AXIL_BUF_TABLE_bvalid  =>  AXIL_BUF_TABLE_MISO.bvalid,
    AXIL_BUF_TABLE_rdata      =>  AXIL_BUF_TABLE_MISO.rdata,
    AXIL_BUF_TABLE_rready  =>  AXIL_BUF_TABLE_MOSI.rready,
    AXIL_BUF_TABLE_rresp      =>  AXIL_BUF_TABLE_MISO.rresp,
    AXIL_BUF_TABLE_rvalid  =>  AXIL_BUF_TABLE_MISO.rvalid,
    AXIL_BUF_TABLE_wdata      =>  AXIL_BUF_TABLE_MOSI.wdata,
    AXIL_BUF_TABLE_wready  =>  AXIL_BUF_TABLE_MISO.wready,
    AXIL_BUF_TABLE_wstrb      =>  AXIL_BUF_TABLE_MOSI.wstrb,
    AXIL_BUF_TABLE_wvalid  =>  AXIL_BUF_TABLE_MOSI.wvalid,
    
    AXIL_MGT_araddr   =>  AXIL_MGT_MOSI.araddr,
    AXIL_MGT_arprot   =>  AXIL_MGT_MOSI.arprot,
    AXIL_MGT_arready  =>  AXIL_MGT_MISO.arready,
    AXIL_MGT_arvalid  =>  AXIL_MGT_MOSI.arvalid,
    AXIL_MGT_awaddr   =>  AXIL_MGT_MOSI.awaddr,
    AXIL_MGT_awprot   =>  AXIL_MGT_MOSI.awprot,
    AXIL_MGT_awready  =>  AXIL_MGT_MISO.awready,
    AXIL_MGT_awvalid  =>  AXIL_MGT_MOSI.awvalid,
    AXIL_MGT_bready   =>  AXIL_MGT_MOSI.bready,
    AXIL_MGT_bresp    =>  AXIL_MGT_MISO.bresp,
    AXIL_MGT_bvalid   =>  AXIL_MGT_MISO.bvalid,
    AXIL_MGT_rdata    =>  AXIL_MGT_MISO.rdata,
    AXIL_MGT_rready  =>  AXIL_MGT_MOSI.rready,
    AXIL_MGT_rresp    =>  AXIL_MGT_MISO.rresp,
    AXIL_MGT_rvalid   =>  AXIL_MGT_MISO.rvalid,
    AXIL_MGT_wdata    =>  AXIL_MGT_MOSI.wdata,
    AXIL_MGT_wready   =>  AXIL_MGT_MISO.wready,
    AXIL_MGT_wstrb    =>  AXIL_MGT_MOSI.wstrb,
    AXIL_MGT_wvalid   =>  AXIL_MGT_MOSI.wvalid,
    
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
    
    AXI_S2MM_DM_OUT_awaddr => AXI_S2MM_DM_OUT_MOSI.awaddr,
    AXI_S2MM_DM_OUT_awburst => AXI_S2MM_DM_OUT_MOSI.awburst,
    AXI_S2MM_DM_OUT_awcache => AXI_S2MM_DM_OUT_MOSI.awcache,
    AXI_S2MM_DM_OUT_awid => AXI_S2MM_DM_OUT_MOSI.awid,
    AXI_S2MM_DM_OUT_awlen => AXI_S2MM_DM_OUT_MOSI.awlen,
    AXI_S2MM_DM_OUT_awprot => AXI_S2MM_DM_OUT_MOSI.awprot,
    AXI_S2MM_DM_OUT_awready => AXI_S2MM_DM_OUT_MISO.awready,
    AXI_S2MM_DM_OUT_awsize => AXI_S2MM_DM_OUT_MOSI.awsize,
    AXI_S2MM_DM_OUT_awuser => open,
    AXI_S2MM_DM_OUT_awvalid => AXI_S2MM_DM_OUT_MOSI.awvalid,
    AXI_S2MM_DM_OUT_bready => AXI_S2MM_DM_OUT_MOSI.bready,
    AXI_S2MM_DM_OUT_bresp => AXI_S2MM_DM_OUT_MISO.bresp,
    AXI_S2MM_DM_OUT_bvalid => AXI_S2MM_DM_OUT_MISO.bvalid,
    AXI_S2MM_DM_OUT_wdata => AXI_S2MM_DM_OUT_MOSI.wdata,
    AXI_S2MM_DM_OUT_wlast => AXI_S2MM_DM_OUT_MOSI.wlast,
    AXI_S2MM_DM_OUT_wready => AXI_S2MM_DM_OUT_MISO.wready,
    AXI_S2MM_DM_OUT_wstrb => AXI_S2MM_DM_OUT_MOSI.wstrb,
    AXI_S2MM_DM_OUT_wvalid => AXI_S2MM_DM_OUT_MOSI.wvalid,
    
    AXI_S2MM_DM_IN_awaddr => AXI_S2MM_DM_IN_MOSI.awaddr,
    AXI_S2MM_DM_IN_awburst => AXI_S2MM_DM_IN_MOSI.awburst,
    AXI_S2MM_DM_IN_awcache => AXI_S2MM_DM_IN_MOSI.awcache,
    AXI_S2MM_DM_IN_awid => AXI_S2MM_DM_IN_MOSI.awid,
    AXI_S2MM_DM_IN_awlen => AXI_S2MM_DM_IN_MOSI.awlen,
    AXI_S2MM_DM_IN_awlock => (others => '0'),
    AXI_S2MM_DM_IN_awprot => AXI_S2MM_DM_IN_MOSI.awprot,
    AXI_S2MM_DM_IN_awqos => (others => '0'),
    AXI_S2MM_DM_IN_awready => AXI_S2MM_DM_IN_MISO.awready,
    AXI_S2MM_DM_IN_awregion => (others => '0'),
    AXI_S2MM_DM_IN_awsize => AXI_S2MM_DM_IN_MOSI.awsize,
    AXI_S2MM_DM_IN_awvalid => AXI_S2MM_DM_IN_MOSI.awvalid,
    AXI_S2MM_DM_IN_bid => open,
    AXI_S2MM_DM_IN_bready => AXI_S2MM_DM_IN_MOSI.bready,
    AXI_S2MM_DM_IN_bresp => AXI_S2MM_DM_IN_MISO.bresp,
    AXI_S2MM_DM_IN_bvalid => AXI_S2MM_DM_IN_MISO.bvalid,
    AXI_S2MM_DM_IN_wdata => AXI_S2MM_DM_IN_MOSI.wdata,
    AXI_S2MM_DM_IN_wlast => AXI_S2MM_DM_IN_MOSI.wlast,
    AXI_S2MM_DM_IN_wready => AXI_S2MM_DM_IN_MISO.wready,
    AXI_S2MM_DM_IN_wstrb => AXI_S2MM_DM_IN_MOSI.wstrb,
    AXI_S2MM_DM_IN_wvalid => AXI_S2MM_DM_IN_MOSI.wvalid,
    
    AXI_MM2S_DM_OUT_araddr => AXI_MM2S_DM_OUT_MOSI.araddr,
    AXI_MM2S_DM_OUT_arburst => AXI_MM2S_DM_OUT_MOSI.arburst,
    AXI_MM2S_DM_OUT_arcache => AXI_MM2S_DM_OUT_MOSI.arcache,
    AXI_MM2S_DM_OUT_arid => AXI_MM2S_DM_OUT_MOSI.arid,
    AXI_MM2S_DM_OUT_arlen => AXI_MM2S_DM_OUT_MOSI.arlen,
    AXI_MM2S_DM_OUT_arprot => AXI_MM2S_DM_OUT_MOSI.arprot,
    AXI_MM2S_DM_OUT_arready => AXI_MM2S_DM_OUT_MISO.arready,
    AXI_MM2S_DM_OUT_arsize => AXI_MM2S_DM_OUT_MOSI.arsize,
    AXI_MM2S_DM_OUT_aruser => open,
    AXI_MM2S_DM_OUT_arvalid => AXI_MM2S_DM_OUT_MOSI.arvalid,
    AXI_MM2S_DM_OUT_rdata => AXI_MM2S_DM_OUT_MISO.rdata,
    AXI_MM2S_DM_OUT_rlast => AXI_MM2S_DM_OUT_MISO.rlast,
    AXI_MM2S_DM_OUT_rready => AXI_MM2S_DM_OUT_MOSI.rready,
    AXI_MM2S_DM_OUT_rresp => AXI_MM2S_DM_OUT_MISO.rresp,
    AXI_MM2S_DM_OUT_rvalid => AXI_MM2S_DM_OUT_MISO.rvalid,
    
    AXI_MM2S_DM_IN_araddr => AXI_MM2S_DM_IN_MOSI.araddr,
    AXI_MM2S_DM_IN_arburst => AXI_MM2S_DM_IN_MOSI.arburst,
    AXI_MM2S_DM_IN_arcache => AXI_MM2S_DM_IN_MOSI.arcache,
    AXI_MM2S_DM_IN_arid => AXI_MM2S_DM_IN_MOSI.arid,
    AXI_MM2S_DM_IN_arlen => AXI_MM2S_DM_IN_MOSI.arlen,
    AXI_MM2S_DM_IN_arlock => (others => '0'),
    AXI_MM2S_DM_IN_arprot => AXI_MM2S_DM_IN_MOSI.arprot,
    AXI_MM2S_DM_IN_arqos => (others => '0'),
    AXI_MM2S_DM_IN_arready => AXI_MM2S_DM_IN_MISO.arready,
    AXI_MM2S_DM_IN_arregion => (others => '0'),
    AXI_MM2S_DM_IN_arsize => AXI_MM2S_DM_IN_MOSI.arsize,
    AXI_MM2S_DM_IN_arvalid => AXI_MM2S_DM_IN_MOSI.arvalid,
    AXI_MM2S_DM_IN_rdata => AXI_MM2S_DM_IN_MISO.rdata,
    AXI_MM2S_DM_IN_rid => open,
    AXI_MM2S_DM_IN_rlast => AXI_MM2S_DM_IN_MISO.rlast,
    AXI_MM2S_DM_IN_rready => AXI_MM2S_DM_IN_MOSI.rready,
    AXI_MM2S_DM_IN_rresp => AXI_MM2S_DM_IN_MISO.rresp,
    AXI_MM2S_DM_IN_rvalid => AXI_MM2S_DM_IN_MISO.rvalid,
                                
    qspi_io0_io => QSPI(0),
    qspi_io1_io => QSPI(1),
    qspi_io2_io => QSPI(2),
    qspi_io3_io => QSPI(3),
    qspi_ss_io(0)  => QSPI_SS,
    
    DIMM0_INIT_CALIB_COMPLETE =>  init_calib(0),
    DIMM1_INIT_CALIB_COMPLETE =>  init_calib(1)

);											

end bd_wrapper;
    