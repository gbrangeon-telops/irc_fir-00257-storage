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
         --keep nothing
         resize(unsigned(ADDR_MSB), awaddr'length) when 0,
         --keep only the lsb
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(0)), awaddr'length) when 1,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR( 1 downto 0)), awaddr'length) when  2,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR( 2 downto 0)), awaddr'length) when  3,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR( 3 downto 0)), awaddr'length) when  4,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR( 4 downto 0)), awaddr'length) when  5,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR( 5 downto 0)), awaddr'length) when  6,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR( 6 downto 0)), awaddr'length) when  7,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR( 7 downto 0)), awaddr'length) when  8,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR( 8 downto 0)), awaddr'length) when  9,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR( 9 downto 0)), awaddr'length) when 10,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(10 downto 0)), awaddr'length) when 11,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(11 downto 0)), awaddr'length) when 12,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(12 downto 0)), awaddr'length) when 13,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(13 downto 0)), awaddr'length) when 14,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(14 downto 0)), awaddr'length) when 15,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(15 downto 0)), awaddr'length) when 16,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(16 downto 0)), awaddr'length) when 17,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(17 downto 0)), awaddr'length) when 18,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(18 downto 0)), awaddr'length) when 19,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(19 downto 0)), awaddr'length) when 20,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(20 downto 0)), awaddr'length) when 21,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(21 downto 0)), awaddr'length) when 22,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(22 downto 0)), awaddr'length) when 23,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(23 downto 0)), awaddr'length) when 24,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(24 downto 0)), awaddr'length) when 25,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(25 downto 0)), awaddr'length) when 26,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(26 downto 0)), awaddr'length) when 27,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(27 downto 0)), awaddr'length) when 28,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(28 downto 0)), awaddr'length) when 29,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(29 downto 0)), awaddr'length) when 30,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR(30 downto 0)), awaddr'length) when 31,
         --keep all bits
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.AWADDR), awaddr'length) when others;

   with AXIL_IN_ADDR_WIDTH select
      araddr <= 
         --keep nothing
         resize(unsigned(ADDR_MSB), araddr'length) when 0,
         --keep only the lsb
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(0)), araddr'length) when 1,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR( 1 downto 0)), araddr'length) when  2,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR( 2 downto 0)), araddr'length) when  3,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR( 3 downto 0)), araddr'length) when  4,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR( 4 downto 0)), araddr'length) when  5,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR( 5 downto 0)), araddr'length) when  6,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR( 6 downto 0)), araddr'length) when  7,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR( 7 downto 0)), araddr'length) when  8,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR( 8 downto 0)), araddr'length) when  9,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR( 9 downto 0)), araddr'length) when 10,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(10 downto 0)), araddr'length) when 11,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(11 downto 0)), araddr'length) when 12,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(12 downto 0)), araddr'length) when 13,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(13 downto 0)), araddr'length) when 14,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(14 downto 0)), araddr'length) when 15,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(15 downto 0)), araddr'length) when 16,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(16 downto 0)), araddr'length) when 17,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(17 downto 0)), araddr'length) when 18,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(18 downto 0)), araddr'length) when 19,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(19 downto 0)), araddr'length) when 20,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(20 downto 0)), araddr'length) when 21,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(21 downto 0)), araddr'length) when 22,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(22 downto 0)), araddr'length) when 23,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(23 downto 0)), araddr'length) when 24,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(24 downto 0)), araddr'length) when 25,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(25 downto 0)), araddr'length) when 26,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(26 downto 0)), araddr'length) when 27,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(27 downto 0)), araddr'length) when 28,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(28 downto 0)), araddr'length) when 29,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(29 downto 0)), araddr'length) when 30,
         resize(unsigned(ADDR_MSB & AXIL_32B_IN_MOSI.ARADDR(30 downto 0)), araddr'length) when 31,
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
    