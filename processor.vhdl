library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- VHDL code for cu of the MIPS Processor
entity processor is
port(
clk : in std_logic; 
value: out std_logic_vector(15 downto 0));
end processor;

architecture Behavioral of processor is
COMPONENT ALU
port(
op : in std_logic_vector(3 downto 0); 
rs : in std_logic_vector(15 downto 0); 
rt : in std_logic_vector(15 downto 0); 
rd : out std_logic_vector(15 downto 0)
 );
end COMPONENT;

COMPONENT control
port(
instr : in std_logic_vector(3 downto 0); 
alu_op: out std_logic_vector(3 downto 0);
reg_dst: out std_logic);
end COMPONENT;

COMPONENT instruction
port(
instr_adder: in std_logic_vector(2 downto 0); 
op: out std_logic_vector(3 downto 0);
rd_adder: out std_logic_vector(3 downto 0);
rs_adder: out std_logic_vector(3 downto 0);
rt_adder: out std_logic_vector(3 downto 0));
end COMPONENT;



COMPONENT mux0
port(
a : in std_logic_vector(3 downto 0); 
b : in std_logic_vector(3 downto 0); 
sel : in std_logic;
y: out std_logic_vector(3 downto 0));
end COMPONENT;


COMPONENT pc 
port(
clk:in std_logic;
next_instr:out std_logic_vector(2 downto 0));
end COMPONENT;

COMPONENT registers 
port(
clk :in std_logic;
rd_adder:in std_logic_vector(3 downto 0);
rs_adder:in std_logic_vector(3 downto 0);
rt_adder:in std_logic_vector(3 downto 0);
wr_data:in std_logic_vector(15 downto 0);
rs:out std_logic_vector(15 downto 0);
rt:out std_logic_vector(15 downto 0));
end COMPONENT;


SIGNAL WIRE_0 :std_logic_vector(3 downto 0);
SIGNAL WIRE_1 :std_logic_vector(15 downto 0);
SIGNAL WIRE_2 :std_logic_vector(15 downto 0);
SIGNAL WIRE_3 :std_logic_vector(3 downto 0);
SIGNAL WIRE_5 :std_logic;
SIGNAL WIRE_18 :std_logic_vector(3 downto 0);
SIGNAL WIRE_19 :std_logic_vector(3 downto 0);
SIGNAL WIRE_9 :std_logic_vector(15 downto 0);
SIGNAL WIRE_10:std_logic_vector(15 downto 0);
SIGNAL WIRE_12 :std_logic_vector(3 downto 0);
SIGNAL WIRE_13:std_logic_vector(3 downto 0);
SIGNAL WIRE_14:std_logic_vector(2 downto 0);
SIGNAL WIRE_15:std_logic_vector(15 downto 0);

BEGIN 
VALUE<=WIRE_15;
arithmetic_logic_unit: ALU
port map(
op =>WIRE_0, 
rs =>WIRE_1, 
rt =>WIRE_2,
rd =>WIRE_15
 );

control_unit :control
port map(
instr =>WIRE_3,
alu_op=>WIRE_0,
reg_dst=>WIRE_5
);

instruction_memory :instruction
port map(
instr_adder=>WIRE_14,
op=>WIRE_3,
rd_adder=>WIRE_19,
rs_adder=>WIRE_13,
rt_adder=>WIRE_18);

mux_0:mux0
port map(
a =>WIRE_18,
b =>WIRE_19,
sel =>WIRE_5,
y=>WIRE_12);


program_counter:pc 
port map(
clk=>clk,
next_instr=>WIRE_14);

register_file:registers
port map(
clk=>clk,
rd_adder=>WIRE_12,
rs_adder=>WIRE_13,
rt_adder=>WIRE_18,
wr_data=>WIRE_15,
rs=>WIRE_1,
rt=>WIRE_2);


end Behavioral;