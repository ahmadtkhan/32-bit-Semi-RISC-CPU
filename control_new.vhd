library ieee;
use ieee.std_logic_1164.all;

entity control_new is
port(
		clk, mclk				: in std_logic;
		enable 					: in std_logic;
		statusC, statusZ		: in std_logic;
		inst 						: in std_logic_vector(31 downto 0);
		a_mux, b_mux			: out std_logic;
		im_mux1, reg_mux		: out std_logic;
		im_mux2, data_mux		: out std_logic_vector(1 downto 0);
		ALU_op					: out std_logic_vector(2 downto 0);
		inc_PC, ld_PC			: out	std_logic;
		clr_IR					: out std_logic;
		ld_IR						: out std_logic;
		clr_A, clr_B, clr_C, clr_Z: out std_logic;
		ld_A, ld_B, ld_C, ld_Z: out std_logic;
		T							: out std_logic_vector(2 downto 0);
		wen, en					: out std_logic
); 
end control_new;

architecture implementation of  control_new is
	type statetype is (state_0, state_1, state_2);
	signal present_state: statetype;
	signal instruction_sig:  std_logic_vector(3 downto 0);
	signal instruction_sig2: std_logic_vector(7 downto 0);
begin
	instruction_sig  <= inst(31 downto 28);
	instruction_sig2 <= inst(31 downto 24);
	
	process(present_state, inst, statusC, statusZ, enable, instruction_sig, instruction_sig2)
	begin
		if enable = '1' then
			if present_state = state_0 then
				data_mux <= "00";
				clr_IR 	<= '0';
				ld_IR 	<= '1';
				ld_PC 	<= '0';
				inc_PC 	<= '0';
				clr_A		<= '0';
				ld_A 		<= '0';
				ld_B		<= '0';
				clr_B 	<= '0';
				clr_C		<= '0';
				ld_C		<= '0';
				clr_Z		<= '0';
				ld_Z		<= '0';
				en			<= '0';
				wen		<= '0';
			
			elsif present_state = state_1 then
				clr_IR 	<= '0';
				ld_IR 	<= '1';
				ld_PC 	<= '1';
				inc_PC 	<= '1';
				clr_A		<= '0';
				ld_A 		<= '0';
				ld_B		<= '0';
				clr_B 	<= '0';
				clr_C		<= '0';
				ld_C		<= '0';
				clr_Z		<= '0';
				ld_Z		<= '0';
				en			<= '0';
				wen		<= '0';
			
				if instruction_sig = "0010" then 
					clr_IR 	<= '0';
					ld_IR 	<= '0';
					ld_PC 	<= '1';
					inc_PC 	<= '1';
					clr_A		<= '0';
					ld_A 		<= '0';
					ld_B		<= '0';
					clr_B 	<= '0';
					clr_C		<= '0';
					ld_C		<= '0';
					clr_Z		<= '0';
					ld_Z		<= '0';
					data_mux	<= "00";
					reg_mux 	<= '0';
					en			<= '1';
					wen		<= '1';
				
				elsif instruction_sig = "0011" then
					clr_IR 	<= '0';
					ld_IR 	<= '0';
					ld_PC 	<= '1';
					inc_PC 	<= '1';
					clr_A		<= '0';
					ld_A 		<= '0';
					ld_B		<= '0';
					clr_B 	<= '0';
					clr_C		<= '0';
					ld_C		<= '0';
					clr_Z		<= '0';
					ld_Z		<= '0';
					data_mux <= "00";
					reg_mux  <= '1';
					en			<= '1';
					wen		<= '1';
					
				elsif instruction_sig = "1001" then
					clr_IR 	<= '0';
					ld_IR 	<= '0';
					ld_PC 	<= '1';
					inc_PC 	<= '1';
					clr_A		<= '0';
					ld_A 		<= '1';
					ld_B		<= '0';
					clr_B 	<= '0';
					clr_C		<= '0';
					ld_C		<= '0';
					clr_Z		<= '0';
					ld_Z		<= '0';
					data_mux <= "01";
					a_mux		<= '0';
					en			<= '1';
					wen		<= '0';	
				
				elsif instruction_sig = "1010" then
					clr_IR 	<= '0';
					ld_IR 	<= '0';
					ld_PC 	<= '1';
					inc_PC 	<= '1';
					clr_A		<= '0';
					ld_A 		<= '0';
					ld_B		<= '1';
					clr_B 	<= '0';
					clr_C		<= '0';
					ld_C		<= '0';
					clr_Z		<= '0';
					ld_Z		<= '0';
					data_mux <= "01";
					en			<= '1';
					wen		<= '0';
				end if;
				
			elsif present_state = state_2 then
				if instruction_sig = "0101" then 
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '1';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '0';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '0';
					clr_Z  <= '0';
					ld_Z   <= '0';
				
				elsif instruction_sig = "0110" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '1';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '0';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '0';
					clr_Z  <= '0';
					ld_Z   <= '0';
					
				elsif instruction_sig = "1000" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '1';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '0';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '0';
					clr_Z  <= '0';
					ld_Z   <= '0';
					
				elsif instruction_sig = "1001" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '1';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '0';
					clr_Z  <= '0';
					ld_Z   <= '0';
					A_mux  <= '0';
					data_mux<= "01";
					en 	 <= '1';
					wen    <= '0';
				elsif instruction_sig = "1010" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '0';
					ld_B   <= '1';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '0';
					clr_Z  <= '0';
					ld_Z   <= '0';
					A_mux  <= '0';
					data_mux<= "01";
					en 	 <= '1';
					wen    <= '0';
				elsif instruction_sig = "0010" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '0';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '0';
					clr_Z  <= '0';
					ld_Z   <= '0';
					reg_mux <= '0';
					data_mux<= "00";
					en		 <= '1';
					wen    <= '1';
				elsif instruction_sig = "0010" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '0';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '0';
					clr_Z  <= '0';
					ld_Z   <= '0';
					reg_mux <= '1';
					data_mux<= "00";
					en		 <= '1';
					wen    <= '1';
				elsif instruction_sig = "0000" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '1';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '0';
					clr_Z  <= '0';
					ld_Z   <= '0';
					A_mux  <= '1';
				elsif instruction_sig = "0001" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '0';
					ld_B   <= '1';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '0';
					clr_Z  <= '0';
					ld_Z   <= '0';
					b_mux  <= '1';
				elsif instruction_sig = "0100" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '1';
					ld_B   <= '0';
					clr_B  <= '1';
					clr_C  <= '0';
					ld_C   <= '0';
					clr_Z  <= '0';
					ld_Z   <= '0';	
					ALU_op <= "001";
					A_mux  <= '0';
					data_mux<= "10";
					im_mux1<= '1';
				elsif instruction_sig2 = "01111001" then 
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '1';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '1';
					clr_Z  <= '0';
					ld_Z   <= '1';
					alu_op <= "000";
					a_mux <= '0';
					data_mux <= "10";
					im_mux1 <= '0';
					im_mux2 <= "01";
				elsif instruction_sig2 = "01111110" then 
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '1';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '1';
					clr_Z  <= '0';
					ld_Z   <= '1';
					ALU_op <= "110";
					a_mux <= '0';
					data_mux<= "10";
					im_mux1 <= '0';
					im_mux2 <= "10";
				elsif instruction_sig2 = "01110000" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '1';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '1';
					clr_Z  <= '0';
					ld_Z   <= '1';
					ALU_op <= "010";
					a_mux <= '0';
					data_mux<= "10";
					im_mux1 <= '0';
					im_mux2 <= "00";
				elsif instruction_sig2 = "01110010" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '1';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '1';
					clr_Z  <= '0';
					ld_Z   <= '1';
					ALU_op <= "110";
					a_mux <= '0';
					data_mux<= "10";
					im_mux1 <= '0';
					im_mux2 <= "00";
				elsif instruction_sig2 = "01110011" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '1';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '1';
					clr_Z  <= '0';
					ld_Z   <= '1';
					ALU_op <= "010";
					a_mux <= '0';
					data_mux<= "10";
					im_mux1 <= '0';
					im_mux2 <= "10";
				elsif instruction_sig2 = "01111011" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '1';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '1';
					clr_Z  <= '0';
					ld_Z   <= '1';
					ALU_op <= "000";
					a_mux <= '0';
					data_mux<= "10";
					im_mux1 <= '0';
					im_mux2 <= "00";
				elsif instruction_sig2 = "01110001" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '1';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '1';
					clr_Z  <= '0';
					ld_Z   <= '1';
					ALU_op <= "010";
					a_mux <= '0';
					data_mux<= "10";
					im_mux1 <= '0';
					im_mux2 <= "01";
				elsif instruction_sig2 = "01111101" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '1';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '1';
					clr_Z  <= '0';
					ld_Z   <= '1';
					ALU_op <= "001";
					a_mux <= '0';
					data_mux<= "10";
					im_mux1 <= '0';
					im_mux2 <= "01";
				elsif instruction_sig2 = "01110100" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '1';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '1';
					clr_Z  <= '0';
					ld_Z   <= '1';
					ALU_op <= "100";
					a_mux <= '0';
					data_mux<= "10";
					im_mux1 <= '0';
				elsif instruction_sig2 = "01111111" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '1';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '1';
					clr_Z  <= '0';
					ld_Z   <= '1';
					ALU_op <= "101";
					a_mux <= '0';
					data_mux<= "10";
					im_mux1 <= '0';
				elsif instruction_sig2 = "01110101" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '1';
					ld_A 	 <= '0';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '0';
					clr_Z  <= '0';
					ld_Z   <= '0';
				elsif instruction_sig2 = "01110110" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '0';
					ld_B   <= '0';
					clr_B  <= '1';
					clr_C  <= '0';
					ld_C   <= '0';
					clr_Z  <= '0';
					ld_Z   <= '0';
				elsif instruction_sig = "01110111" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '0';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '1';
					ld_C   <= '0';
					clr_Z  <= '0';
					ld_Z   <= '0';
				elsif instruction_sig2 = "01111000" then
					clr_IR <= '0';
					ld_IR  <= '0';
					ld_PC  <= '0';
					inc_PC <= '0';
					clr_A  <= '0';
					ld_A 	 <= '0';
					ld_B   <= '0';
					clr_B  <= '0';
					clr_C  <= '0';
					ld_C   <= '0';
					clr_Z  <= '1';
					ld_Z   <= '0';
				elsif instruction_sig2 = "01111010" then
					if(statusZ = '1') then
						clr_IR <= '0';
						ld_IR  <= '0';
						ld_PC  <= '1';
						inc_PC <= '1';
						clr_A  <= '0';
						ld_A 	 <= '0';
						ld_B   <= '0';
						clr_B  <= '0';
						clr_C  <= '0';
						ld_C   <= '0';
						clr_Z  <= '0';
						ld_Z   <= '0';
					end if;
				elsif instruction_sig2 = "01111010" then
					if(statusC = '1') then
						clr_IR <= '0';
						ld_IR  <= '0';
						ld_PC  <= '1';
						inc_PC <= '1';
						clr_A  <= '0';
						ld_A 	 <= '0';
						ld_B   <= '0';
						clr_B  <= '0';
						clr_C  <= '0';
						ld_C   <= '0';
						clr_Z  <= '0';
						ld_Z   <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;
	
	process(clk, enable)
	begin
		if enable = '1' then
			if rising_edge(clk) then
				if present_state = state_0 then present_state<= state_1;
				elsif present_state = state_1 then present_state <= state_2;
				else present_state <= state_0;
				end if;
			end if;
		else present_state <= state_0;
		end if;
	end process;
	with present_state select
		T <= "001" when state_0,
			  "010" when state_1,
			  "100" when state_2,
			  "001" when others;
end implementation;
						
					
				