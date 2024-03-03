----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:23:06 05/19/2022 
-- Design Name: 
-- Module Name:    Animation_1 - Behavioral 
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

entity animation_1 is		  --flickering
	port (div1: in std_logic;
	div2 : in std_logic;
	an1 : out std_logic_vector (3 downto 0) ;
	cat1 : out std_logic_vector (6 downto 0));
end animation_1;

architecture anim1 of animation_1 is			 

component rom is  
	port ( 
		CS_ROM: in std_logic;
		A_ROM : in std_logic_vector (4 downto 0);
		D_ROM : out std_logic_vector (6 downto 0)) ;		  
end component rom;	   

 

type matrix is array ( 0 to 7 ) of std_logic_vector (6 downto 0) ;
signal word: matrix ;
signal count: std_logic_vector (1 downto 0):="00";
begin 
mem11:rom port map('1',"01111",word(0));
mem12:rom port map('1',"00000",word(1));
mem13:rom port map('1',"00010",word(2));
mem14:rom port map('1',"00100",word(3)); 
mem15:rom port map('1',"11010",word(4));
mem16:rom port map('1',"11010",word(5));
mem17:rom port map('1',"11010",word(6));
mem18:rom port map('1',"11010",word(7));
	process (div1)
	begin 
		if (div1='1' and div1'event) then count<=count+1;
		end if;
	end process;
	process (count)
	variable i:integer :=0;
	begin
		an1<="1111";
		case count is 
			when "00" => cat1 <= word(i+3);
						an1 <= "1110";
			when "01" => cat1<=	word(i+2);
						an1 <= "1101"; 
			when "10" => cat1 <= word (i+1);
						an1 <= "1011";
			when others => cat1 <= word(i);
						  an1 <= "0111";
		end case; 
	if div2='1' and div2'event then i:=i+4;
	end if;
	if i=8 then i :=0;
	end if;	 
	end process;
end anim1;
	