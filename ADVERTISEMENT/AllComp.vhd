----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:57:59 05/24/2022 
-- Design Name: 
-- Module Name:    AllComp - Behavioral 
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

entity top is 
	port ( clk : in std_logic;
	btn1 : in std_logic; 
	btn2 : in std_logic;
	btn3 : in std_logic;  
	btn4 : in std_logic;
	an : out std_logic_vector (3 downto 0);
	cat : out std_logic_vector (6 downto 0)); 
end top; 

architecture arh_top of top is

component divider is
	port ( CLK : in std_logic;
	div1: out std_logic;	 
	div2: out std_logic);
end component divider; 	

component button is
	port ( clk : in std_logic; 
	btn1,btn2,btn3,btn4 : in std_logic;
	an1,an2,an3,an4 : in std_logic_vector (3 downto 0) ;
	cat1,cat2,cat3,cat4 : in std_logic_vector (6 downto 0);
	an: out STD_LOGIC_VECTOR (3 downto 0);
	cat: out STD_LOGIC_VECTOR (6 downto 0));
end component button;

component animation_1 is
	port (div1: in std_logic;
	div2 : in std_logic;
	an1: out std_logic_vector (3 downto 0) ;
	cat1 : out std_logic_vector (6 downto 0));
end component animation_1;	  	 

component animation_2 is
	port ( div1 : in std_logic;
	div2 : in std_logic;
	an2 : out std_logic_vector (3 downto 0);
	cat2 : out std_logic_vector (6 downto 0));
end component animation_2;				  

component animation_3 is
	port (div1 : in std_logic;
	div2 : in std_logic;
	an3	: out std_logic_vector (3 downto 0);
	cat3 : out std_logic_vector (6 downto 0));
end component animation_3;	  	    

component animation_4 is
	port ( div1 : in std_logic;
	div2 : in std_logic;
	an4 : out std_logic_vector (3 downto 0);
	cat4 : out std_logic_vector (6 downto 0));
end component animation_4;

signal div1,div2,div3 : std_logic;
signal cat1,cat2,cat3,cat4: std_logic_vector (6 downto 0);
signal an1,an2,an3,an4 : std_logic_vector (3 downto 0);

begin 
	b: button port map (clk, btn1, btn2, btn3, btn4, an1, an2,an3, an4,cat1,cat2,cat3,cat4,an,cat);
	d: divider port map (clk,div1,div2);
	a1: animation_1 port map (div1,div2,an1,cat1);
	a2: animation_2 port map (div1,div2,an2,cat2);
	a3: animation_3 port map (div1,div2,an3,cat3);	
	a4: animation_4 port map (div1,div2,an4,cat4); 
	
end arh_top; 

	

