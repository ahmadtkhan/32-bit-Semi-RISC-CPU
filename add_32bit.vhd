library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY add_32bit is
port(
	a_in: 		in std_logic_vector(31 downto 0);
	b_in: 		in std_logic_vector(31 downto 0);
	c_in: 			in std_logic;
	result: 	out std_logic_vector(31 downto 0);
	cout: 		out std_logic
	
);
end add_32bit;

architecture add_32_imp of add_32bit is
	component add is
	port (A : in std_logic;
		B : in std_logic;
		cin: in std_logic;
		sum : out std_logic;
		cout: out std_logic
	);
	end component;
	signal wire: std_logic_vector(30 downto 0);
begin
	p1: add port map(a_in(0), b_in(0), c_in, result(0), wire(0));
	p2: add port map(a_in(1), b_in(1), wire(0), result(1), wire(1));
	p3: add port map(a_in(2), b_in(2), wire(1), result(2), wire(2));
	p4: add port map(a_in(3), b_in(3), wire(2), result(3), wire(3));
	p5: add port map(a_in(4), b_in(4), wire(3), result(4), wire(4));
	p6: add port map(a_in(5), b_in(5), wire(4), result(5), wire(5));
	p7: add port map(a_in(6), b_in(6), wire(5), result(6), wire(6));
	p8: add port map(a_in(7), b_in(7), wire(6), result(7), wire(7));
	p9: add port map(a_in(8), b_in(8), wire(7), result(8), wire(8));
	p10: add port map(a_in(9), b_in(9), wire(8), result(9), wire(9));
	p11: add port map(a_in(10), b_in(10), wire(9), result(10), wire(10));
	p12: add port map(a_in(11), b_in(11), wire(10), result(11), wire(11));
	p13: add port map(a_in(12), b_in(12), wire(11), result(12), wire(12));
	p14: add port map(a_in(13), b_in(13), wire(12), result(13), wire(13));
	p15: add port map(a_in(14), b_in(14), wire(13), result(14), wire(14));
	p16: add port map(a_in(15), b_in(15), wire(14), result(15), wire(15));
	p17: add port map(a_in(16), b_in(16), wire(15), result(16), wire(16));
	p18: add port map(a_in(17), b_in(17), wire(16), result(17), wire(17));
	p19: add port map(a_in(18), b_in(18), wire(17), result(18), wire(18));
	p20: add port map(a_in(19), b_in(19), wire(18), result(19), wire(19));
	p21: add port map(a_in(20), b_in(20), wire(19), result(20), wire(20));
	p22: add port map(a_in(21), b_in(21), wire(20), result(21), wire(21));
	p23: add port map(a_in(22), b_in(22), wire(21), result(22), wire(22));
	p24: add port map(a_in(23), b_in(23), wire(22), result(23), wire(23));
	p25: add port map(a_in(24), b_in(24), wire(23), result(24), wire(24));
	p26: add port map(a_in(25), b_in(25), wire(24), result(25), wire(25));
	p27: add port map(a_in(26), b_in(26), wire(25), result(26), wire(26));
	p28: add port map(a_in(27), b_in(27), wire(26), result(27), wire(27));
	p29: add port map(a_in(28), b_in(28), wire(27), result(28), wire(28));
	p30: add port map(a_in(29), b_in(29), wire(28), result(29), wire(29));

	p32: add port map(a_in(31), b_in(31), wire(30), result(31), cout);
end add_32_imp;