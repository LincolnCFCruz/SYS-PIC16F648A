LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY addr_mux IS
	PORT(
        rp_in : in STD_LOGIC_VECTOR (1 downto 0);
        dir_addr_in : in STD_LOGIC_VECTOR (6 downto 0);
        irp_in : in STD_LOGIC;
        ind_addr_in : in STD_LOGIC_VECTOR (7 downto 0);
        abus_out : out STD_LOGIC_VECTOR (8 downto 0)
    );
END addr_mux;


ARCHITECTURE addr_mux OF addr_mux IS
BEGIN
    WITH dir_addr_in SELECT
        abus_out <= irp_in & ind_addr_in WHEN "0000000",
                     rp_in & dir_addr_in WHEN OTHERS;
END addr_mux;