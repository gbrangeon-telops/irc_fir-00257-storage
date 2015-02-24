-------------------------------------------------------------------------------
--
-- Title       : DUT
-- Design      : fir_257_Storage
-- Author      : Jean-Alexis Boulet 
-- Company     : Telops
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--
-- Description :  This interface is the interface we are going to use for our module
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.tel2000.all;

entity DUT is
port(        
    AXIL_MOSI : in t_axi4_lite_mosi;
    AXIL_MISO : out t_axi4_lite_miso;
    
    AXIS_BUF_S2MM_MOSI : out t_axi4_stream_mosi32;
    AXIS_BUF_S2MM_MISO : in t_axi4_stream_miso;
    
    AXIS_BUF_S2MM_CMD_MOSI : out t_axi4_stream_mosi72;
    AXIS_BUF_S2MM_CMD_MISO : in t_axi4_stream_miso;
    
    AXIS_BUF_S2MM_STS_MOSI : in t_axi4_stream_mosi_status;
    AXIS_BUF_S2MM_STS_MISO : out t_axi4_stream_miso;

    AXIS_BUF_MM2S_MOSI : in t_axi4_stream_mosi32;
    AXIS_BUF_MM2S_MISO : out t_axi4_stream_miso;
    
    AXIS_BUF_MM2S_CMD_MOSI : out t_axi4_stream_mosi72;
    AXIS_BUF_MM2S_CMD_MISO : in t_axi4_stream_miso;
    
    AXIS_BUF_MM2S_STS_MOSI : in t_axi4_stream_mosi_status;
    AXIS_BUF_MM2S_STS_MISO : out t_axi4_stream_miso;
    
    DATA_FROM_PROC_MOSI   : in t_axi4_stream_mosi32;
    DATA_FROM_PROC_MISO   : out t_axi4_stream_miso;
    
    DATA_TO_PROC_MOSI   : out t_axi4_stream_mosi32;
    DATA_TO_PROC_MISO   : in t_axi4_stream_miso;
    
    CLK_DATA : in STD_LOGIC;
    CLK_MB : in STD_LOGIC;
    
    ARESETN : in STD_LOGIC
    );
end DUT;



architecture DUT of DUT is 

begin



end DUT;
