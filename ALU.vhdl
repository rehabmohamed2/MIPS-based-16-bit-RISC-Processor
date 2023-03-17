library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.all;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
-- VHDL code for ALU of the MIPS Processor
entity ALU is
port(
op : in std_logic_vector(3 downto 0); 
rs : in std_logic_vector(15 downto 0); 
rt : in std_logic_vector(15 downto 0); 
rd : out std_logic_vector(15 downto 0)
 );
end ALU;

architecture Behavioral of ALU is 
signal result :  std_logic_vector(15 downto 0);
begin
process(op,rs,rt)
	begin
		if( ieee.std_logic_unsigned."=" (op , "0000")) then
		result<= rs and rt;
		elsif( ieee.std_logic_unsigned."=" (op , "0001")) then
		result<= rs or rt;
		elsif( ieee.std_logic_unsigned."=" (op , "0010")) then
		result<= rs xor rt;
		elsif(ieee.std_logic_unsigned."=" (op , "0011")) then
		result<= rs nor rt;
		
		elsif( ieee.std_logic_unsigned."=" (op , "0100")) then
		result<= not rs ;
		elsif( ieee.std_logic_unsigned."=" (op , "0101")) then
	   result<= rs nand rt;
		elsif( ieee.std_logic_unsigned."=" (op , "0110")) then
		result<= std_logic_vector(to_unsigned((to_integer(unsigned(rs)) * to_integer(unsigned(rt))),16)) ;
		elsif( ieee.std_logic_unsigned."=" (op , "0111")) then
		result<= std_logic_vector(to_unsigned((to_integer(unsigned(rs)) / to_integer(unsigned(rt))),16)) ; 
		
		elsif( ieee.std_logic_unsigned."=" (op , "1000")) then
		result<=  std_logic_vector(unsigned(rs) + unsigned(rt));
		elsif( ieee.std_logic_unsigned."=" (op , "1001")) then
		result<=  std_logic_vector(unsigned(rs) - unsigned(rt));
		elsif( ieee.std_logic_unsigned."=" (op , "1010")) then
		if( (unsigned(rs) = unsigned(rt))) then
		result<= "0000000000000001";
		else result<= "0000000000000000";
		end if;
		elsif( ieee.std_logic_unsigned."=" (op , "1011")) then
		if( (unsigned(rs) > unsigned(rt))) then
		result<= "0000000000000001";
		else result<= "0000000000000000";
		end if;
		
		end if;
		end process ;
rd<= result ;
end Behavioral;