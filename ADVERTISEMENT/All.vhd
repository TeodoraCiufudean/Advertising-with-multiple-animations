----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:54:32 05/24/2022 
-- Design Name: 
-- Module Name:    All - Behavioral 
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
	cl : out std_logic;	 
	cll : out std_logic;
	ctt : out std_logic);
end component divider; 	

component button is
	port ( clk : in std_logic; 
	btn1,btn2,btn3,btn4 : in std_logic;
	an1,an2,an3,an4 : in std_logic_vector (3 downto 0) ;
	cat1,cat2,cat3,cat4 : in std_logic_vector (6 downto 0));
end component button;

component animation_1 is
	port (cl: in std_logic;
	cll : in std_logic;
	an1 : out std_logic_vector (3 downto 0) ;
	cat1 : out std_logic_vector (6 downto 0));
end component animation_1;	  	 

component animation_2 is
	port ( cl : in std_logic;
	cll : in std_logic;
	an2 : out std_logic_vector (3 downto 0);
	cat2 : out std_logic_vector (6 downto 0));
end component animation_2;				  

component animation_3 is
	port (cl : in std_logic;
	ctt : in std_logic;
	an3	: out std_logic_vector (3 downto 0);
	cat3 : out std_logic_vector (6 downto 0));
end component animation_3;	  	    

component animation_4 is
	port ( cl : in std_logic;
	cl1 : in std_logic;
	an4 : out std_logic_vector (3 downto 0);
	cat4 : out std_logic_vector (6 downto 0));
end component animation4;

signal cl,cl1,ctt : std_logic;
signal cat1,cat2,cat3,cat4: std_logic_vector (6 downto 0);
signal an1,an2,an3,an4 : std_logic_vector (3 downto 0);

begin 
	b: button port map (clk, btn1, btn2, btn3, btn4, an1, an2,an3, an4,an,cat);
	d: divider port map (clk,cl,cl1,ctt);
	a1: animation_1 port map (c1,cl1,an1,cat1);
	a2: animation_2 port map (cl,cl1,an2,cat2);
	a3: animation_3 port map (cl,ctt,an3,cat3);	
	a4: animation_4 port map (cl,cl1,an4,cat4); 
	
end arh_top; 

