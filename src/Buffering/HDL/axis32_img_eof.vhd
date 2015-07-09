-------------------------------------------------------------------------------
--
-- Title       : axis32_sw_1_2
-- Author      : Jean-Alexis Boulet
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : axis32 Switch (demux) 1 to 2
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.Tel2000.all;

entity axis32_img_eof is
   
   port(
      RX_MOSI  : in  t_axi4_stream_mosi32;
      RX_MISO  : in t_axi4_stream_miso;

      EOF      : out  std_logic 
      );
end axis32_img_eof;


architecture RTL of axis32_img_eof is 
   

   
begin    
   
EOF <= '1' when (RX_MOSI.TLAST = '1' and RX_MOSI.TVALID = '1' and RX_MISO.TREADY = '1') else '0';  


end RTL;
