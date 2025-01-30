library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux2to1 is
	port (s: in std_logic;
			w0, w1 : std_logic_vector(31 downto 0);
			f : out std_logic_vector(31 downto 0));
end mux2to1;

architecture behaviour of mux2to1 is 
begin
	with s select 
		f <= w0 when '0',
			w1 when others;
end behaviour;