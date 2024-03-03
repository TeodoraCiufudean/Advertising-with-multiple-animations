----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:22:48 05/24/2022 
-- Design Name: 
-- Module Name:    Button - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity button is
	port ( clk : in std_logic; 
	btn1,btn2,btn3,btn4 : in std_logic;
	an1,an2,an3,an4 : in std_logic_vector (3 downto 0) ;
	cat1,cat2,cat3,cat4 : in std_logic_vector (6 downto 0); 
	an: out STD_LOGIC_VECTOR (3 downto 0);
	cat: out STD_LOGIC_VECTOR (6 downto 0));
end button;  

architecture Behavioral of button is

begin 
	process (clk) 
	begin
		if (btn1='1') then
			an<=an1; cat<=cat1;
		elsif (btn2='1') then
			an<=an2; cat<=cat2;
		elsif (btn3='1') then
			an<=an3; cat<=cat3;
		elsif (btn4='1') then 
			an<=an4; cat<=cat4;
		else an<="1111";
		end if;
	end process;
end Behavioral;
