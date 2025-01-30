library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4to1 is
port(
		s 		: in std_logic_vector(1 downto 0);
		x1, x2, x3, x4: in std_logic_vector(31 downto 0);
		f		: out std_logic_vector(31 downto 0)
);
end entity;

architecture impOfmux4to1 of mux4to1 is
begin 
	with s select	
		f <= x1 when "00",
				x2 when "01",
				x3 when "10",
				x4 when "11";
end impOfmux4to1;