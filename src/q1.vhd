library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity q1 is
  port (
	A,B,C : in  STD_LOGIC;
	Q : out STD_LOGIC := '0'	);
end entity;

architecture  rtl OF q1 IS

begin
	Q <= (A and B) or (B and C);
	
end architecture;
