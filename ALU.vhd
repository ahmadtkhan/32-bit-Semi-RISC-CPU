library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY ALU IS 
PORT(
		a		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		b		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		op 	: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		result: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		carry  : OUT STD_LOGIC;
		zero  : OUT STD_LOGIC
);
END ALU;

ARCHITECTURE behavior of ALU IS
	component add
		port (A : in std_logic;
		B : in std_logic;
		cin: in std_logic;
		cout: out std_logic;
		sum : out std_logic
	);
	end component;
	
	component add_32bit is
	port(
	a_in: 		in std_logic_vector(31 downto 0);
	b_in: 		in std_logic_vector(31 downto 0);
	c_in: 			in std_logic;
	cout: 		out std_logic;
	result: 	out std_logic_vector(31 downto 0)
	);
	end component;
	
	component not_32bit is
	port(
	x: 	in std_logic_vector(31 downto 0);
	y: 	out std_logic_vector(31 downto 0)
	);
	end component;
	
	component mux2to1 is
	port(
		in0, in1: 	in std_logic_vector(31 downto 0);
		sel:			in std_logic;
		y: 			out std_logic_vector(31 downto 0)
	);
	end component;
	signal total_sum	: std_logic_vector(31 downto 0);
	signal bNegOrNot	: 	std_logic_vector(31 downto 0);
	signal bNot			: std_logic_vector(31 downto 0);
	
	begin
		adder: add_32bit port map(a,bNegOrNot,op(2),carry,	total_sum);
		negMux: mux2to1 port map(b,bNot,op(2),bNegOrNot);
		notb 	: not_32bit port map(b, bNot);
	process(a, b, op)
		begin
			case op is
				when "000" => result <= a and b;
				when "001" => result <= a or b;
				when "010" => result <= total_sum;
				when "011" => result <= A - B;
				when "100" =>
					result(31 downto 1) <= a(30 downto 0);
					result(0) <= '0';
				when "101" =>
					result (30 downto 0) <= a(31 downto 1);
					result(31) <= '0';
				when others => NULL;
			end case;
		
		end process;
END behavior;