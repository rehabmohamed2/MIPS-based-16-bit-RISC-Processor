library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  
-- VHDL code for the register file of the MIPS Processor
entity registers is
port (
 clk: in std_logic;
 rs_adder: in std_logic_vector(3 downto 0);
 rt_adder: in std_logic_vector(3 downto 0);
 rd_adder: in std_logic_vector(3 downto 0);
 wr_data: in std_logic_vector(15 downto 0);
 rs: out std_logic_vector(15 downto 0);
 rt: out std_logic_vector(15 downto 0)

);
end registers;

architecture Behavioral of registers is
type registers  is array (0 to 3) of std_logic_vector(15 downto 0);
signaL reg : registers  :=(               --take values form the ,
"0000000011000010" ,
"0000000011010101" ,
"0000000011101011" ,
"0000000001000111"  );
begin
process(clk) 
begin

if  falling_edge(clk) then
	reg (to_integer(unsigned(rd_adder))) <= wr_data;
end if;
end process ; 

rs <= reg(to_integer(unsigned(rs_adder)));
rt <= reg(to_integer(unsigned(rt_adder)));
end Behavioral;