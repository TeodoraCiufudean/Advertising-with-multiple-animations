----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:24:56 05/19/2022 
-- Design Name: 
-- Module Name:    Animation_2 - Behavioral 
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

entity animation_2 is		  --display letter by letter
	port ( div1 : in std_logic;
	div2 : in std_logic;
	an2 : out std_logic_vector (3 downto 0);
	cat2 : out std_logic_vector (6 downto 0));
end animation_2;

architecture anim2 of animation_2 is 

component rom is  
	port ( 
		CS_ROM: in std_logic;
		A_ROM : in std_logic_vector (4 downto 0);
		D_ROM : out std_logic_vector (6 downto 0)) ;		  
end component rom;	



type matrix is array (0 to 19) of std_logic_vector (6 downto 0);
signal count : std_logic_vector (1 downto 0);
signal word : matrix;
begin
mem21:rom port map('1',"11010",word(0));
mem22:rom port map('1',"11010",word(1));
mem23:rom port map('1',"11010",word(2));
mem24:rom port map('1',"11010",word(3));
mem25:rom port map('1',"01111",word(4));
mem26:rom port map('1',"11010",word(5));
mem27:rom port map('1',"11010",word(6));
mem28:rom port map('1',"11010",word(7));
mem29:rom port map('1',"01111",word(8));
mem210:rom port map('1',"00000",word(9));
mem211:rom port map('1',"11010",word(10));
mem212:rom port map('1',"11010",word(11));
mem213:rom port map('1',"01111",word(12));
mem214:rom port map('1',"00000",word(13));
mem215:rom port map('1',"00010",word(14));
mem216:rom port map('1',"11010",word(15));
mem217:rom port map('1',"01111",word(16));
mem218:rom port map('1',"00000",word(17));
mem219:rom port map('1',"00010",word(18));	
mem220:rom port map('1',"00100",word(19));
	process (div1) 
	begin
		if (div1='1' and div1'event) then	count<=count+1;
		end if;
	end process;
	process (count) 
	variable i:integer	:=0;
	begin
		an2<="1111";
		case count is 
			when "00" => cat2 <=word(i);
						an2 <= "0111";		  
			when "01" => cat2 <= word(i+1);
						an2 <= "1011"; 
			when "10" => cat2 <= word(i+2); 
						an2 <= "1101";
			when others  => cat2 <= word (i+3);
						an2 <= "1110";
		end case; 
		if div2'event and div2='1' then i:=i+4;
		end if;
		if i=20 then i:=0;
		end if;
	end process; 
end anim2;
			
			