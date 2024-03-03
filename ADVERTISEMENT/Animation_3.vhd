----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:33 05/24/2022 
-- Design Name: 
-- Module Name:    Animation_3 - Behavioral 
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

entity animation_3 is	  -- display from exterior to interior
	port (div1 : in std_logic;
	div2 : in std_logic;
	an3	: out std_logic_vector (3 downto 0);
	cat3 : out std_logic_vector (6 downto 0));
end animation_3; 

architecture anim3 of animation_3 is	

component rom is  
	port ( 
		CS_ROM: in std_logic;
		A_ROM : in std_logic_vector (4 downto 0);
		D_ROM : out std_logic_vector (6 downto 0)) ;		  
end component rom;	


type matrix is array (0 to 19) of std_logic_vector (6 downto 0) ;
signal count : std_logic_vector (1 downto 0) :="00";
signal word : matrix;

begin 
mem31:rom port map('1',"11010",word(0));
mem32:rom port map('1',"11010",word(1));
mem33:rom port map('1',"11010",word(2));  
mem34:rom port map ('1',"11010",word(3));
mem35:rom port map ('1',"01111",word(4));
mem36:rom port map ('1',"11010",word(5));
mem37:rom port map ('1',"11010",word(6));
mem38:rom port map ('1',"11010",word(7));
mem39:rom port map ('1',"01111",word(8));
mem310:rom port map ('1',"11010",word(9));
mem311:rom port map ('1',"11010",word(10));
mem312:rom port map ('1',"00100",word(11));
mem313:rom port map ('1',"01111",word(12));
mem314:rom port map ('1',"00000",word(13));
mem315:rom port map ('1',"11010",word(14));
mem316:rom port map ('1',"00100",word(15));
mem317:rom port map ('1',"01111",word(16));
mem318:rom port map ('1',"00000",word(17));
mem319:rom port map ('1',"00010",word(18));
mem320:rom port map ('1',"00100",word(19));

   process (div1)
	begin
		if (div1='1' and div1'event) then count<=count+1;
		end if;
	end process;
	
	process (count)
	variable i: integer := 0; 
	begin 
		an3<="1111";
		case count is
			when "00" => cat3<=word(i); an3<="0111";
			when "01" => cat3<=word(i+1); an3<="1011";
			when "10" => cat3<=word(i+2); an3<="1101";
			when "11" => cat3<=word(i+3); an3<="1110"; 
			when others => null;
		end case; 
		if (div2 = '1' and div2'event) then i:=i+4; 
		end if;
		if(i=20) then i:=0;
		end if;
	end process;
end anim3;



