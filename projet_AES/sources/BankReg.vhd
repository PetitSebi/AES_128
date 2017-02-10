LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.crypt_pack.ALL;


ENTITY BankReg IS
	PORT(clock_i : in std_logic;
	     data_i  : in reg_w;
	     data_o  : out reg_w
	);
END BankReg;

ARCHITECTURE BankReg_arch of BankReg is
BEGIN
	PROCESS(clock_i)
	BEGIN
	IF clock_i'EVENT AND clock_i = '1' then
		data_o <= data_i;
	END IF;
	END PROCESS;
END BankReg_arch;
