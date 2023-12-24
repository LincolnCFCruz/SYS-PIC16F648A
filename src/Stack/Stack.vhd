library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Stack IS
	PORT (
		--ENTRADAS
		nrst: IN STD_LOGIC;
		clk_in: IN STD_LOGIC;
		stack_in: IN STD_LOGIC_VECTOR(12 DOWNTO 0);
		stack_push: IN STD_LOGIC;
		stack_pop: IN STD_LOGIC;
		--SAIDAS
		stack_out: OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE arch of Stack IS
	TYPE mem_type IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(12 DOWNTO 0);
	SIGNAL mem_reg: mem_type;
BEGIN
	PROCESS (nrst, clk_in)
	BEGIN
		IF nrst = '0' THEN
			mem_reg <= (OTHERS => (OTHERS => '0'));
		ELSIF RISING_EDGE(clk_in) THEN
			IF stack_push = '1' THEN
				mem_reg(7)<= mem_reg(6);
				mem_reg(6)<= mem_reg(5);
				mem_reg(5)<= mem_reg(4);
				mem_reg(4)<= mem_reg(3);
				mem_reg(3)<= mem_reg(2);
				mem_reg(2)<= mem_reg(1);
				mem_reg(1)<= mem_reg(0);
				mem_reg(0)<= stack_in;
			ELSIF stack_pop = '1' THEN
				mem_reg(0)<= mem_reg(1);
				mem_reg(1)<= mem_reg(2);
				mem_reg(2)<= mem_reg(3);
				mem_reg(3)<= mem_reg(4);
				mem_reg(4)<= mem_reg(5);
				mem_reg(5)<= mem_reg(6);
				mem_reg(6)<= mem_reg(7);
				mem_reg(7)<= "0000000000000";
			END IF;
		END IF;
	END PROCESS;
	stack_out <= mem_reg(0);
END arch;
				
			


