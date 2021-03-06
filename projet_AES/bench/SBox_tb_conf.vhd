-- Sébastien Dosset 29/11/16
-- SBox Test Bench Configuration

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;


configuration SBox_tb_conf of SBox_tb is

	for SBox_tb_arch
		for DUT : SBox
			use entity lib_sources.SBox(SBox_arch);
		end for;
	end for;
end SBox_tb_conf;
