-------------------------------------------------------------------------------
--
-- Title       : memory_access_handler
-- Author      : Olivier Dionne
-- Company     : Telops
--
-------------------------------------------------------------------------------
-- $Author$
-- $LastChangedDate$
-- $Revision$ 
-------------------------------------------------------------------------------
--
-- Description : This file implements the AXI Lite access to the memory.
--               The 64-bit address is obtained with a 32-bit address and GPIOs
--
-------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.TEL2000.all;

entity memory_access_handler is
   port(
      AXIL_IN_ADDR_WIDTH: in  integer := 31;   --AXIL base address is 0x8000_0000 so we don't keep the msb
      AXIL_32B_IN_MOSI  : in  t_axi4_lite_mosi;
      AXIL_32B_IN_MISO  : out t_axi4_lite_miso;
      ADDR_MSB          : in  STD_LOGIC_VECTOR ( 4 downto 0 );
      
      AXIL_64B_OUT_MOSI : out t_axi4_lite_a64_mosi;
      AXIL_64B_OUT_MISO : in  t_axi4_lite_miso
   );
end memory_access_handler;


architecture rtl of memory_access_handler is

   signal awaddr : unsigned(63 downto 0) := (others => '0');
   signal araddr : unsigned(63 downto 0) := (others => '0');

begin
   --Address handling
   with AXIL_IN_ADDR_WIDTH select
      awaddr <= 
         --keep only the lsb
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(AXIL_IN_ADDR_WIDTH-1 downto 0)), awaddr'length) when 1 to AXIL_32B_IN_MOSI.AWADDR'length-1,
         --keep all bits
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR), awaddr'length) when others;

   with AXIL_IN_ADDR_WIDTH select
      araddr <= 
         --keep only the lsb
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(AXIL_IN_ADDR_WIDTH-1 downto 0)), araddr'length) when 1 to AXIL_32B_IN_MOSI.ARADDR'length-1,
         --keep all bits
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR), araddr'length) when others;
   
   --MOSI output
   AXIL_64B_OUT_MOSI.AWVALID  <= AXIL_32B_IN_MOSI.AWVALID;
   AXIL_64B_OUT_MOSI.AWADDR   <= std_logic_vector(awaddr);
   AXIL_64B_OUT_MOSI.AWPROT   <= AXIL_32B_IN_MOSI.AWPROT;
   AXIL_64B_OUT_MOSI.WVALID   <= AXIL_32B_IN_MOSI.WVALID;
   AXIL_64B_OUT_MOSI.WDATA    <= AXIL_32B_IN_MOSI.WDATA;
   AXIL_64B_OUT_MOSI.WSTRB    <= AXIL_32B_IN_MOSI.WSTRB;
   AXIL_64B_OUT_MOSI.BREADY   <= AXIL_32B_IN_MOSI.BREADY;
   AXIL_64B_OUT_MOSI.ARVALID  <= AXIL_32B_IN_MOSI.ARVALID;
   AXIL_64B_OUT_MOSI.ARADDR   <= std_logic_vector(araddr);
   AXIL_64B_OUT_MOSI.ARPROT   <= AXIL_32B_IN_MOSI.ARPROT;
   AXIL_64B_OUT_MOSI.RREADY   <= AXIL_32B_IN_MOSI.RREADY;
   
   --MISO output
   AXIL_32B_IN_MISO <= AXIL_64B_OUT_MISO;

end rtl;
    