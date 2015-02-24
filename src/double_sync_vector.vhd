---------------------------------------------------------------------------------------------------
--
-- Title       : double_sync_vector
-- Design      : VP7
-- Author      : Patrick Dubois
-- Company     : Telops Inc.
--
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity double_sync_vector is
	port(
		D : in STD_LOGIC_vector;
		Q : out STD_LOGIC_vector;
		CLK : in STD_LOGIC
		);
end double_sync_vector;


architecture RTL of double_sync_vector is
begin
	
	process (CLK)
		variable DQ : std_logic_vector(D'LENGTH-1 downto 0);
	begin		   
		if rising_edge(CLK) then
			Q <= DQ;
			DQ := D;
		end if;
	end process;
	
end RTL;
