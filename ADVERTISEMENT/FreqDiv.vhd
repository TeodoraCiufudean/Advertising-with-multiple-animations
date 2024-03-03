----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:22:02 05/24/2022 
-- Design Name: 
-- Module Name:    FreqDiv - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity divider is
	port ( CLK : in std_logic;
	div1 : out std_logic;	 
	div2: out std_logic);
end divider; 

architecture div of divider is 
signal t:std_logic_vector (25 downto 0):="00000000000000000000000000";
begin 	
	process (CLK)
	begin
		if CLK = '1' and clk'event then t<=t+1;	 
		end if; 
	end process;
	div1<=t(15);
	div2<=t(25);	
end div;
			
