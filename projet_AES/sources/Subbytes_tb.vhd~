-- Sébastien Dosset 05/12/16
-- Subbytes Test Bench

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

entity Subbytes_tb is
end Subbytes_tb;

architecture Subbytes_tb_arch of Subbytes_tb is

	component Subbytes
		port(
		Subbytes_i : in type_state;
		resetb_i   : in std_logic;
		clock_i    : in std_logic;
		Subbytes_o : out type_state);
	end component;

	signal Subbytes_i_s : type_state;
	signal resetb_i_s : std_logic :='1';
	signal clock_i_s : std_logic :='0';
	signal Subbytes_o_s : type_state;

begin

	DUT : Subbytes
		port map(
		Subbytes_i   => Subbytes_i_s,
		Subbytes_o => Subbytes_o_s,
		resetb_i     => resetb_i_s,
		clock_i      => clock_i_s);

	Subbytes_i_s(0)(0) <= x"5b";
	Subbytes_i_s(0)(1) <= x"e2";
	Subbytes_i_s(0)(2) <= x"97";
	Subbytes_i_s(0)(3) <= x"7f";
	Subbytes_i_s(1)(0) <= x"5a";
	Subbytes_i_s(1)(1) <= x"f3";
	
	resetb_i_s <= '1', '0' after 200 ns, '1' after 250 ns;
	clock_i_s <= not(clock_i_s) after 100 ns;

end Subbytes_tb_arch;

