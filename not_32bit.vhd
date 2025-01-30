library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity not_32bit is
port(
	x: 	in std_logic_vector(31 downto 0);
	y: 	out std_logic_vector(31 downto 0)
);
end not_32bit;

architecture not_32imp of not_32bit is 
begin
	y <= not x;
end not_32imp;