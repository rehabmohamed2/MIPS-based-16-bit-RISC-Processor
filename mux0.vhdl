library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.all;
-- VHDL code for cu of the MIPS Processor
entity mux0 is
port(
a : in std_logic_vector(3 downto 0); 
b : in std_logic_vector(3 downto 0); 
sel : in std_logic;
y: out std_logic_vector(3 downto 0)
 );
end mux0;

architecture Behavioral of mux0 is
begin
process(sel , a ,b)
	begin
		if(sel='1') then
		y<=a;
		else
                y<=b;
		end if;
		end process ;
end Behavioral;