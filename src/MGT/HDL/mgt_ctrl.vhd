------------------------------------------------------------------
--!   @file MGT_CTRL.vhd
--!   @brief Control for MGT.
--!   @details This file control and read status of MGT cores.
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL: http://einstein/svn/firmware/FIR-00251-Common/trunk/VHDL/MGT/Hdl/mgt_ctrl.vhd $
------------------------------------------------------------------

--!   Use IEEE standard library.
library IEEE;
--!   Use logic elements package from IEEE library.
use IEEE.STD_LOGIC_1164.all;
--!   Use numeric_std package
use IEEE.numeric_std.all;
--!   Use TEL2000 package package from work library. 
use work.TEL2000.all;

entity MGT_CTRL is
	 port(
		 CLK : in STD_LOGIC; --! Clock at 100MHz
		 ARESETN : in STD_LOGIC; --! Reset active low 
       
       CLK_DATA : STD_LOGIC;
       CLK_VIDEO : STD_LOGIC;
       CLK_EXP : STD_LOGIC;
       
		 --! Interface to access registers
       AXI4_LITE_MOSI : in t_axi4_lite_mosi; 
		 AXI4_LITE_MISO : out t_axi4_lite_miso;

       --! MGT status Signals
       FRAME_ERR : in STD_LOGIC_VECTOR(2 downto 0);
		 HARD_ERR : in STD_LOGIC_VECTOR(2 downto 0);
		 SOFT_ERR : in STD_LOGIC_VECTOR(2 downto 0);
		 CHANNEL_UP : in STD_LOGIC_VECTOR(2 downto 0);
		 LANE_UP : in STD_LOGIC_VECTOR(5 downto 0);
		 RX_RESETDONE : in STD_LOGIC_VECTOR(2 downto 0);
		 TX_RESETDONE : in STD_LOGIC_VECTOR(2 downto 0);
		 PLL_NOT_LOCK : in STD_LOGIC_VECTOR(2 downto 0);
		 TX_OUT_LOCK : in STD_LOGIC_VECTOR(2 downto 0);
		 LINK_RESET : in STD_LOGIC_VECTOR(2 downto 0);
		 GT0_QPLLLOCK : in STD_LOGIC_VECTOR(1 downto 0);
		 GT0_QPLLREFCLKLOST : in STD_LOGIC_VECTOR(1 downto 0);
		 GT0_QPLLRESET : in STD_LOGIC_VECTOR(2 downto 0);
		 
       --! MGT Control Signals
       POWER_DOWN : out STD_LOGIC_VECTOR(2 downto 0);
		 LOOPBACK : out STD_LOGIC_VECTOR(8 downto 0)
	    );
end MGT_CTRL;

--}} End of automatically maintained section

architecture MGT_CTRL of MGT_CTRL is

   -- Example-specific design signals
   -- local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
   -- ADDR_LSB is used for addressing 32/64 bit registers/memories
   -- ADDR_LSB = 2 for 32 bits (n downto 2)
   -- ADDR_LSB = 3 for 64 bits (n downto 3)
   constant C_S_AXI_DATA_WIDTH : integer := 32;
   constant C_S_AXI_ADDR_WIDTH : integer := 32;
   constant ADDR_LSB  : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
   constant OPT_MEM_ADDR_BITS : integer := 1; -- Number of supplement bit

   -- Address of registers
   constant MGT_CORE_STATUS_ADR : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(0,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
   constant MGT_PLL_STATUS_ADR : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(4,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
   constant MGT_POWER_DOWN_ADR : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(8,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
   constant MGT_LOOPBACK_ADR : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(12,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));

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

component double_sync_vector
   port (
   D : in STD_LOGIC_vector;
   Q : out STD_LOGIC_vector;
   CLK : in STD_LOGIC
   );
end component;


   --! User Input Register Declarations
   signal core_status_reg : std_logic_vector(31 downto 0); --! Status of the MGT Cores
   signal pll_status_reg : std_logic_vector(31 downto 0); --! Status of PLL
   --! User Output Register Declarations
   signal power_down_reg : std_logic_vector(31 downto 0); --! Power Down Control
   signal loopback_reg : std_logic_vector(31 downto 0); --! Loopback Control

   
   -- Cross domain signal
   signal core_status_i : std_logic_vector(core_status_reg'range); 
   signal pll_status_i : std_logic_vector(pll_status_reg'range);
   signal power_down_sync : std_logic_vector(2 downto 0);
   signal loopback_sync : std_logic_vector(8 downto 0);
   
   
   -- AXI4LITE signals
   signal axi_awaddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
   signal axi_awready	: std_logic;
   signal axi_wready	: std_logic;
   signal axi_bresp	: std_logic_vector(1 downto 0);
   signal axi_bvalid	: std_logic;
   signal axi_araddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
   signal axi_arready	: std_logic;
   signal axi_rdata	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
   signal axi_rresp	: std_logic_vector(1 downto 0);
   signal axi_rvalid	: std_logic;

   signal slv_reg_rden	: std_logic;
   signal slv_reg_wren	: std_logic;
   signal reg_data_out	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
   signal byte_index	: integer;


begin

   -- enter your statements here --
   
   -- Output Register Mapped to Output ports
   POWER_DOWN <= power_down_sync(2 downto 0);
   LOOPBACK <= loopback_sync(8 downto 0);

   -- Input Register Mapped from Input ports
   core_status_i(2 downto 0) <= FRAME_ERR;
   core_status_i(5 downto 3) <= HARD_ERR;
   core_status_i(8 downto 6) <= SOFT_ERR;
   core_status_i(11 downto 9) <= CHANNEL_UP;
   core_status_i(17 downto 12) <= LANE_UP;
   core_status_i(20 downto 18) <= RX_RESETDONE;
   core_status_i(23 downto 21) <= TX_RESETDONE;
   core_status_i(26 downto 24) <= TX_OUT_LOCK;
   core_status_i(29 downto 27) <= LINK_RESET;
   core_status_i(31 downto 30) <= (others => '0');

   pll_status_i(1 downto 0) <= GT0_QPLLLOCK;
   pll_status_i(3 downto 2) <= GT0_QPLLREFCLKLOST;
   pll_status_i(6 downto 4) <= GT0_QPLLRESET;
   pll_status_i(31 downto 7) <= (others => '0');


   -- I/O Connections assignments
   AXI4_LITE_MISO.AWREADY  <= axi_awready;
   AXI4_LITE_MISO.WREADY   <= axi_wready;
   AXI4_LITE_MISO.BRESP	   <= axi_bresp;
   AXI4_LITE_MISO.BVALID   <= axi_bvalid;
   AXI4_LITE_MISO.ARREADY  <= axi_arready;
   AXI4_LITE_MISO.RDATA	   <= axi_rdata;
   AXI4_LITE_MISO.RRESP	   <= axi_rresp;
   AXI4_LITE_MISO.RVALID   <= axi_rvalid;

   -- cross domain synchronisation
   
   core_sync : double_sync_vector
   port map (
      D => core_status_i,
      Q => core_status_reg,
      CLK => CLK
   );
      
   pll_sync : double_sync_vector
   port map (
      D => pll_status_i,
      Q => pll_status_reg,
      CLK => CLK
   );

   data_loopback_sync : double_sync_vector
   port map (
      D => loopback_reg(2 downto 0),
      Q => loopback_sync(2 downto 0),
      CLK => CLK_DATA
   );

   video_loopback_sync : double_sync_vector
   port map (
      D => loopback_reg(5 downto 3),
      Q => loopback_sync(5 downto 3),
      CLK => CLK_VIDEO
   );

   exp_loopback_sync : double_sync_vector
   port map (
      D => loopback_reg(8 downto 6),
      Q => loopback_sync(8 downto 6),
      CLK => CLK_EXP
   );
   
   data_pwrdown_sync : double_sync
     port map(
          CLK => CLK_DATA,
          D => power_down_reg(0),
          Q => power_down_sync(0),
          RESET => '0'
     );

   video_pwrdown_sync : double_sync
     port map(
          CLK => CLK_VIDEO,
          D => power_down_reg(1),
          Q => power_down_sync(1),
          RESET => '0'
     );

   exp_pwrdown_sync : double_sync
     port map(
          CLK => CLK_EXP,
          D => power_down_reg(2),
          Q => power_down_sync(2),
          RESET => '0'
     );
   

--   -- cross domain synchronisation
--   process(CLK_DATA)
--   variable power_down_tmp : std_logic;
--   variable loopback_tmp : std_logic_vector(2 downto 0);
--   begin
--      if rising_edge(CLK_DATA) then
--         power_down_sync(0) <= power_down_tmp;
--         power_down_tmp := power_down_reg(0);
--         loopback_sync(2 downto 0) <= loopback_tmp;
--         loopback_tmp := loopback_reg(2 downto 0);
--      end if;
--   end process;

--   -- cross domain synchronisation
--   process(CLK_VIDEO)
--   variable power_down_tmp : std_logic;
--   variable loopback_tmp : std_logic_vector(2 downto 0);
--   begin
--      if rising_edge(CLK_VIDEO) then
--         power_down_sync(1) <= power_down_tmp;
--         power_down_tmp := power_down_reg(1);
--         loopback_sync(5 downto 3) <= loopback_tmp;
--         loopback_tmp := loopback_reg(5 downto 3);
--      end if;
--   end process;

--   -- cross domain synchronisation
--   process(CLK_EXP)
--   variable power_down_tmp : std_logic;
--   variable loopback_tmp : std_logic_vector(2 downto 0);
--   begin
--      if rising_edge(CLK_EXP) then
--         power_down_sync(2) <= power_down_tmp;
--         power_down_tmp := power_down_reg(2);
--         loopback_sync(8 downto 6) <= loopback_tmp;
--         loopback_tmp := loopback_reg(8 downto 6);
--      end if;
--   end process;

   
   
   
   -- Implement axi_awready generation
   -- axi_awready is asserted for one CLK clock cycle when both
   -- AXI4_LITE_MOSI.AWVALID and AXI4_LITE_MOSI.WVALID are asserted. axi_awready is
   -- de-asserted when reset is low.
   process (CLK)
   begin
      if rising_edge(CLK) then 
         if ARESETN = '0' then
            axi_awready <= '0';
         else
            if (axi_awready = '0' and AXI4_LITE_MOSI.AWVALID = '1' and AXI4_LITE_MOSI.WVALID = '1') then
               -- slave is ready to accept write address when
               -- there is a valid write address and write data
               -- on the write address and data bus. This design 
               -- expects no outstanding transactions. 
               axi_awready <= '1';
            else
               axi_awready <= '0';
            end if;
         end if;
      end if;
   end process;

   -- Implement axi_awaddr latching
   -- This process is used to latch the address when both 
   -- AXI4_LITE_MOSI.AWVALID and AXI4_LITE_MOSI.WVALID are valid. 
   process (CLK)
   begin
      if rising_edge(CLK) then 
         if ARESETN = '0' then
            axi_awaddr <= (others => '0');
         else
            if (axi_awready = '0' and AXI4_LITE_MOSI.AWVALID = '1' and AXI4_LITE_MOSI.WVALID = '1') then
               -- Write Address latching
               axi_awaddr <= AXI4_LITE_MOSI.AWADDR;
            end if;
         end if;
      end if;
   end process; 

   -- Implement axi_wready generation
   -- axi_wready is asserted for one CLK clock cycle when both
   -- AXI4_LITE_MOSI.AWVALID and AXI4_LITE_MOSI.WVALID are asserted. axi_wready is 
   -- de-asserted when reset is low. 
   process (CLK)
   begin
      if rising_edge(CLK) then 
         if ARESETN = '0' then
            axi_wready <= '0';
         else
            if (axi_wready = '0' and AXI4_LITE_MOSI.WVALID = '1' and AXI4_LITE_MOSI.AWVALID = '1') then
               -- slave is ready to accept write data when 
               -- there is a valid write address and write data
               -- on the write address and data bus. This design
               -- expects no outstanding transactions.
               axi_wready <= '1';
            else
               axi_wready <= '0';
            end if;
         end if;
      end if;
   end process; 


   -- Implement memory mapped register select and write logic generation
   -- The write data is accepted and written to memory mapped registers when
   -- axi_awready, AXI4_LITE_MOSI.WVALID, axi_wready and AXI4_LITE_MOSI.WVALID are asserted. Write strobes are used to
   -- select byte enables of slave registers while writing.
   -- These registers are cleared when reset (active low) is applied.
   -- Slave register write enable is asserted when valid address and data are available
   -- and the slave is ready to accept the write address and write data.
   slv_reg_wren <= axi_wready and AXI4_LITE_MOSI.WVALID and axi_awready and AXI4_LITE_MOSI.AWVALID ;

   process (CLK)
   variable loc_addr :std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0); 
   begin
      if rising_edge(CLK) then 
         if ARESETN = '0' then
--            core_status_i <= (others => '0');
--            pll_status_i <= (others => '0');
            power_down_reg <= (others => '0');
            loopback_reg <= (others => '0');
         else
            loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0);
            if (slv_reg_wren = '1') then
               case loc_addr is
--                  when MGT_CORE_STATUS_ADR =>
--                     for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--                        if ( AXI4_LITE_MOSI.WSTRB(byte_index) = '1' ) then
--                           -- Respective byte enables are asserted as per write strobes 
--                           -- slave registor 0
--                           core_status_i(byte_index*8+7 downto byte_index*8) <= AXI4_LITE_MOSI.WDATA(byte_index*8+7 downto byte_index*8);
--                        end if;
--                     end loop;
--                  when MGT_PLL_STATUS_ADR =>
--                     for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--                        if ( AXI4_LITE_MOSI.WSTRB(byte_index) = '1' ) then
--                           -- Respective byte enables are asserted as per write strobes 
--                           -- slave registor 1
--                           pll_status_i(byte_index*8+7 downto byte_index*8) <= AXI4_LITE_MOSI.WDATA(byte_index*8+7 downto byte_index*8);
--                        end if;
--                     end loop;
                  when MGT_POWER_DOWN_ADR =>
                     for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                        if ( AXI4_LITE_MOSI.WSTRB(byte_index) = '1' ) then
                           -- Respective byte enables are asserted as per write strobes 
                           -- slave registor 2
                           power_down_reg(byte_index*8+7 downto byte_index*8) <= AXI4_LITE_MOSI.WDATA(byte_index*8+7 downto byte_index*8);
                        end if;
                     end loop;
                  when MGT_LOOPBACK_ADR =>
                     for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                        if ( AXI4_LITE_MOSI.WSTRB(byte_index) = '1' ) then
                           -- Respective byte enables are asserted as per write strobes 
                           -- slave registor 3
                           loopback_reg(byte_index*8+7 downto byte_index*8) <= AXI4_LITE_MOSI.WDATA(byte_index*8+7 downto byte_index*8);
                        end if;
                     end loop;
                  when others =>
                     --core_status_i <= core_status_i;
                     --pll_status_i <= pll_status_i;
                     power_down_reg <= power_down_reg;
                     loopback_reg <= loopback_reg;
               end case;
            end if;
         end if;
      end if;
   end process; 

   -- Implement write response logic generation
   -- The write response and response valid signals are asserted by the slave 
   -- when axi_wready, AXI4_LITE_MOSI.WVALID, axi_wready and AXI4_LITE_MOSI.WVALID are asserted.  
   -- This marks the acceptance of address and indicates the status of 
   -- write transaction.
   process (CLK)
   begin
      if rising_edge(CLK) then 
         if ARESETN = '0' then
            axi_bvalid  <= '0';
            axi_bresp   <= "00"; --need to work more on the responses
        else
            if (axi_awready = '1' and AXI4_LITE_MOSI.AWVALID = '1' and axi_wready = '1' and AXI4_LITE_MOSI.WVALID = '1' and axi_bvalid = '0'  ) then
               axi_bvalid <= '1';
               axi_bresp  <= "00"; 
            elsif (AXI4_LITE_MOSI.BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
               axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
            end if;
         end if;
      end if;
   end process; 

   -- Implement axi_arready generation
   -- axi_arready is asserted for one CLK clock cycle when
   -- AXI4_LITE_MOSI.ARVALID is asserted. axi_awready is 
   -- de-asserted when reset (active low) is asserted. 
   -- The read address is also latched when AXI4_LITE_MOSI.ARVALID is 
   -- asserted. axi_araddr is reset to zero on reset assertion.
   process (CLK)
   begin
      if rising_edge(CLK) then 
         if ARESETN = '0' then
            axi_arready <= '0';
            axi_araddr  <= (others => '1');
         else
            if (axi_arready = '0' and AXI4_LITE_MOSI.ARVALID = '1') then
               -- indicates that the slave has acceped the valid read address
               axi_arready <= '1';
               -- Read Address latching 
               axi_araddr  <= AXI4_LITE_MOSI.ARADDR;
            else
               axi_arready <= '0';
            end if;
         end if;
      end if;
   end process; 

   -- Implement axi_arvalid generation
   -- axi_rvalid is asserted for one CLK clock cycle when both 
   -- AXI4_LITE_MOSI.ARVALID and axi_arready are asserted. The slave registers 
   -- data are available on the axi_rdata bus at this instance. The 
   -- assertion of axi_rvalid marks the validity of read data on the 
   -- bus and axi_rresp indicates the status of read transaction.axi_rvalid 
   -- is deasserted on reset (active low). axi_rresp and axi_rdata are 
   -- cleared to zero on reset (active low).  
   process (CLK)
   begin
      if rising_edge(CLK) then
         if ARESETN = '0' then
            axi_rvalid <= '0';
            axi_rresp  <= "00";
         else
            if (axi_arready = '1' and AXI4_LITE_MOSI.ARVALID = '1' and axi_rvalid = '0') then
               -- Valid read data is available at the read data bus
               axi_rvalid <= '1';
               axi_rresp  <= "00"; -- 'OKAY' response
            elsif (axi_rvalid = '1' and AXI4_LITE_MOSI.RREADY = '1') then
               -- Read data is accepted by the master
               axi_rvalid <= '0';
            end if;
         end if;
      end if;
   end process;

   -- Implement memory mapped register select and read logic generation
   -- Slave register read enable is asserted when valid address is available
   -- and the slave is ready to accept the read address.
   slv_reg_rden <= axi_arready and AXI4_LITE_MOSI.ARVALID and (not axi_rvalid) ;

   process (core_status_reg, pll_status_reg, power_down_reg, loopback_reg, axi_araddr, ARESETN, slv_reg_rden)
   variable loc_addr :std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0);
   begin
      if ARESETN = '0' then
         reg_data_out  <= (others => '1');
      else
         -- Address decoding for reading registers
         loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0);
         case loc_addr is
            when MGT_CORE_STATUS_ADR =>
               reg_data_out <= core_status_reg;
            when MGT_PLL_STATUS_ADR =>
               reg_data_out <= pll_status_reg;
            when MGT_POWER_DOWN_ADR =>
               reg_data_out <= std_logic_vector(resize(unsigned(power_down_reg), reg_data_out'length));
            when MGT_LOOPBACK_ADR =>
               reg_data_out <= std_logic_vector(resize(unsigned(loopback_reg), reg_data_out'length));
            when others =>
               reg_data_out  <= (others => '0');
         end case;
      end if;
   end process;

   -- Output register or memory read data
   process( CLK ) is
   begin
      if (rising_edge (CLK)) then
         if ( ARESETN = '0' ) then
            axi_rdata  <= (others => '0');
         else
            if (slv_reg_rden = '1') then
               -- When there is a valid read address (AXI4_LITE_MOSI.ARVALID) with 
               -- acceptance of read address by the slave (axi_arready), 
               -- output the read dada 
               -- Read address mux
               axi_rdata <= reg_data_out;     -- register read data
            end if;
         end if;
      end if;
   end process;
    
end MGT_CTRL;
