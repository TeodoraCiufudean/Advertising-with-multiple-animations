----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:21:10 05/24/2022 
-- Design Name: 
-- Module Name:    Animation_4 - Behavioral 
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


entity animation_4 is		   --display up to down
	port ( div1 : in std_logic;
	div2 : in std_logic;
	an4 : out std_logic_vector (3 downto 0);
	cat4 : out std_logic_vector (6 downto 0));
end animation_4;

architecture anim4 of animation_4 is			 

component rom is  
	port ( 
		CS_ROM: in std_logic;
		A_ROM : in std_logic_vector (4 downto 0);
		D_ROM : out std_logic_vector (6 downto 0)) ;		  
end component rom;



type matrix is array (0 to 15) of std_logic_vector (6 downto 0);
signal word : matrix :=("0000000","0000000","0000000","0000000","0011101","0011101","0111101","0111101","0011100","0011100","0111101","0111100","0000000","0000000","0000000","0000000") ;
signal count: std_logic_vector (0 to 1):="00";
begin
mem41:rom port map ('1',"11010",word(0));
mem42:rom port map ('1',"11010",word(1));
mem43:rom port map ('1',"11010",word(2));
mem44:rom port map ('1',"11010",word(3));
mem45:rom port map ('1',"01111",word(12));
mem46:rom port map ('1',"00000",word(13));
mem47:rom port map ('1',"00010",word(14));
mem48:rom port map ('1',"00100",word(15));
	process(div1)
	begin
		if div1='1' and div1'event then count<=count+1;
		end if;
	end process;
	process (count)
	variable i:integer:=0;
	begin
		an4<="1111";
		case count is
			when "00" => cat4<=word(i);	
			an4<="0111";
			when "01" => cat4<=word(i+1);
			an4<= "1011";
			when "10" => cat4<=word(i+2);
			an4<="1101";
			when "11" => cat4<=word(i+3);
			an4<="1110";  
			when others =>null;
		end case;
		if div2'event and div2='1' then i:=i+4;
		end if;
		if i=16 then i:=0;
		end if;
	end process;
end anim4;
