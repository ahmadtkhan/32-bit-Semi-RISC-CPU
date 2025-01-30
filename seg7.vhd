LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY seg7 IS
	PORT(bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		  leds, leds2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END seg7;

ARCHITECTURE Behavior OF seg7 IS  
BEGIN
	
	
	PROCESS (bcd)
	BEGIN 
		CASE bcd IS 			--abcdefg
			WHEN "0000" =>leds<= "1000000";
			WHEN "0001" =>leds<= "1111001";
			WHEN "0010" =>leds<= "0100100";
			WHEN "0011" =>leds<= "0110001";
			WHEN "0100" =>leds<= "0011001";
			WHEN "0101" =>leds<= "0010010";
			WHEN "0110" =>leds<= "0000010";
			WHEN "0111" =>leds<= "1111000";
			WHEN "1000" =>leds<= "0000000";
			WHEN "1001" =>leds<= "0011000";
			WHEN "1010" =>leds<= "0001000";
			WHEN "1011" =>leds<= "0000000";
			WHEN "1100" =>leds<= "1000110";
			WHEN "1101" =>leds<= "0100001";
			WHEN "1110" =>leds<= "0001110";
			WHEN "1111" =>leds<= "0001110";
			WHEN OTHERS =>leds<= "-------";
		END CASE;
	END PROCESS;
END Behavior;

