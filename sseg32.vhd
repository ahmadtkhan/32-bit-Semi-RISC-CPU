library ieee;
use ieee.std_logic_1164.all;

entity sseg32 is
port(
		data: in std_logic_vector(31 downto 0);
		result7, result6, result5, result4, result3, result2, result1, result0: out std_logic_vector(6 downto 0));
end sseg32;

architecture seg_32imp of sseg32 is
	component seg7 is
	PORT(bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

		  leds: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END component;
	begin
		sseg0: seg7 port map (bcd => data(3 downto 0), leds => result0);
		sseg1: seg7 port map (bcd => data(7 downto 4), leds => result1);
		sseg2: seg7 port map (bcd => data(11 downto 8), leds => result2);
		sseg3: seg7 port map (bcd => data(15 downto 12), leds => result3);
		sseg4: seg7 port map (bcd => data(19 downto 16), leds => result4);
		sseg5: seg7 port map (bcd => data(23 downto 20), leds => result5);
		sseg6: seg7 port map (bcd => data(27 downto 24), leds => result6);
		sseg7: seg7 port map (bcd => data(31 downto 28), leds => result7);
end seg_32imp;