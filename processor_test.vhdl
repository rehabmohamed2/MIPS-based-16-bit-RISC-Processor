Library ieee;
USE ieee.std_logic_1164.all;

Entity processor_test is 
end processor_test;

architecture behavior of processor_test is 
component processor 
port (
clk : IN std_logic;
value : out std_logic_vector (15 downto 0)
);
end component;

signal clk :std_logic := '0';

signal value :std_logic_vector (15 downto 0);

constant clk_period : time := 10 ns;

begin 

uut: processor port map (
clk => clk,
value  => value 
);
clk_process : process 
begin 
clk <='0';
wait for clk_period /2;
clk <='1';
wait for clk_period/2;
end process;

stim_proc : process 
begin 

wait for 100 ns;
wait for clk_period*10;
wait;
end process;
end; 
