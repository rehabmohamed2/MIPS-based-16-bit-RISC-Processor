library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  
-- VHDL code for the Instruction Memory of the MIPS Processor
entity instruction is
port (
instr_adder :in std_logic_vector(2 downto 0);
op : out  std_logic_vector(3 downto 0);
rs_adder: out std_logic_vector(3 downto 0);
rt_adder: out std_logic_vector(3 downto 0);
rd_adder: out std_logic_vector(3 downto 0)
);
end instruction;

architecture Behavioral of instruction is
type instruction_set  is array (0 to 7) of std_logic_vector(15 downto 0);
constant instr : instruction_set :=(               --take values form the ,
"0110000000000010" ,
"0011000100010001" ,
"0011001000100011" ,
"0001000000010011" ,
"0010001000110000" ,
"0000000000000000" ,
"0000000000000000" ,
"0000000000000000" );

begin 
op <= instr(to_integer(unsigned(instr_adder)))(15 downto 12);--firt output     -- to integer to know the adderss which store in it the value i want
rs_adder <= instr(to_integer(unsigned(instr_adder)))(11 downto 8);
rt_adder <= instr(to_integer(unsigned(instr_adder)))(7 downto 4);
rd_adder <= instr(to_integer(unsigned(instr_adder)))(3 downto 0);


end Behavioral;