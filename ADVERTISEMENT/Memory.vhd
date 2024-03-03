----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:23:34 05/24/2022 
-- Design Name: 
-- Module Name:    Memory - Behavioral 
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

entity rom is  
	port ( 
		CS_ROM: in std_logic;
		A_ROM : in std_logic_vector (4 downto 0);
		D_ROM : out std_logic_vector (6 downto 0)) ;		  
end rom;

architecture arch_rom of rom is
type rom_type is array (0 to 26) of std_logic_vector (6 downto 0);
signal M : rom_type := (  "0001000", --A 
						  "1100000", --B
						  "0110001", --C
						  "1000010", --D
						  "0110000", --E
						  "0111000", --F
						  "0100000", --G
						  "1001000", --H
						  "1001111", --I
						  "1000011", --J
						  "1111000", --K
						  "1110001", --L
						  "0000110", --M
						  "1101010", --N
						  "0000001", --O
						  "0011000", --P
						  "0010000", --Q
						  "1111010", --R
						  "0100100", --S
						  "0001111", --T
						  "1100011", --U
						  "1000001", --V
						  "1000000", --W
						  "0110110", --X
						  "1001100", --Y
						  "0010010", --Z			 
						  "1111111" --null  
					   );


begin 
	process (A_ROM, CS_ROM) 
	begin
		if CS_ROM='0' then D_ROM<=M(26);
		else 
			case A_ROM is
				when "00000" => D_ROM<=M(0);
				when "00001" => D_ROM<=M(1);
				when "00010" => D_ROM<=M(2);
				when "00011" => D_ROM<=M(3);
				when "00100" => D_ROM<=M(4);
				when "00101" => D_ROM<=M(5);
				when "00110" => D_ROM<=M(6);
				when "00111" => D_ROM<=M(7);
				when "01000" => D_ROM<=M(8);
				when "01001" => D_ROM<=M(9);
				when "01010" => D_ROM<=M(10);
				when "01011" => D_ROM<=M(11);
				when "01100" => D_ROM<=M(12);
				when "01101" => D_ROM<=M(13);
				when "01110" => D_ROM<=M(14);
				when "01111" => D_ROM<=M(15);
				when "10000" => D_ROM<=M(16);
				when "10001" => D_ROM<=M(17);
				when "10010" => D_ROM<=M(18);
				when "10011" => D_ROM<=M(19);
				when "10100" => D_ROM<=M(20);
				when "10101" => D_ROM<=M(21);
				when "10110" => D_ROM<=M(22);
				when "10111" => D_ROM<=M(23);
				when "11000" => D_ROM<=M(24);
				when "11001" => D_ROM<=M(25);
				when others => D_ROM<=M(26);
			end case;
		end if;
	end process;
end arch_rom;


