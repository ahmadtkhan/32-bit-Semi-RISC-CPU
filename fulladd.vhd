library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fulladd is 
port(
		Cin, x, y	: in std_logic;
		s,cout		: out std_logic
);
end fulladd;

architecture impFullAdd of fulladd is 
begin 
	s <= x xor y xor cin;
	Cout <= (x and y) or (Cin and x) or (Cin and y);
end impFullAdd;