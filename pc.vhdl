library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity pc is 
port (clk : in std_logic;
next_instr : out std_logic_vector(2 downto 0));
end pc ;
architecture behave of pc is     --code we want to use it to design 
signal  current_signal: std_logic_vector(2 downto 0):="000"; --initial value of pc 

begin 
process(clk)
begin
if falling_edge(clk) then                --take the current value and add to it "1"
	current_signal<= std_logic_vector(unsigned(current_signal) + to_unsigned(1 ,3 )); -- 3 is the number of bits that means that it takes the decimal number which is '1' and convert it to binary in 3 bits 
	end if ;
end process;
next_instr <= current_signal;


end behave; 