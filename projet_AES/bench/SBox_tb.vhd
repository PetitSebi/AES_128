-- Sébastien Dosset 29/11/16
-- SBox Test Bench

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

entity SBox_tb is
end SBox_tb;


architecture SBox_tb_arch of SBox_tb is

	component SBox
		port(
		SBox_i : in bit8;
		SBox_o : out bit8);
	end component;	

	signal SBoxi_s : bit8;
	signal SBoxo_s : bit8;

begin

	DUT : SBox
		port map(
		SBox_i => SBoxi_s,
		SBox_o => SBoxo_s);
	
	SBoxi_s <= x"23", x"eb" after 50 ns, x"5f" after 100 ns, x"99" after 150 ns;	-- On teste pour 4 valeurs: 0x23, 0xeb, 0x5f, 0x99	
	
end SBox_tb_arch;
