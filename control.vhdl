library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- VHDL code for cu of the MIPS Processor
entity control is
port(
instr : in std_logic_vector(3 downto 0); 
alu_op: out std_logic_vector(3 downto 0);
reg_dst: out std_logic);
end control;

architecture Behavioral of control is
begin
with instr select
alu_op<="0000" when "0000", 
        "0001" when "0001", 
        "0010" when "0010", 
		  "0011" when "0011", 
        "0100" when "0100", 
        "0101" when "0101", 
		  "0110" when "0110", 
        "0111" when "0111", 
        "1000" when "1000", 
		  "1001" when "1001", 
        "1010" when "1010", 
        "1011" when "1011", 
		  "1100" when "1100", 
        "1101" when "1101", 
        "1110" when "1110", 
        "1111" when others; 
        with instr select
		  reg_dst<='1' when "1111", 
         '0' when others;

end Behavioral;