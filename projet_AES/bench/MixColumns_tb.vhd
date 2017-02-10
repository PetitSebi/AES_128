-- Sébastien Dosset 07/12/16
-- MixColumns Test Bench

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

entity MixColumns_tb is
end MixColumns_tb;

architecture MixColumns_tb_arch of MixColumns_tb is

	component MixColumns
		port(
		state_i : in type_state;
		MixValid_i : in std_logic;
		state_o : out type_state);
	end component;

	signal state_i_s, state_o_s : type_state;
	signal MixValid_s : std_logic;
begin

	DUT : MixColumns
		port map(
		state_i    => state_i_s,
		state_o    => state_o_s,
		MixValid_i => MixValid_s);

	state_i_s(0)(0) <= x"57";
	state_i_s(1)(0) <= x"7e";
	state_i_s(2)(0) <= x"20";
	state_i_s(3)(0) <= x"a2";
	state_i_s(0)(1) <= x"46";
	state_i_s(1)(1) <= x"e5";
	state_i_s(2)(1) <= x"6b";
	state_i_s(3)(1) <= x"6b";
	state_i_s(0)(2) <= x"17";
	state_i_s(1)(2) <= x"05";
	state_i_s(2)(2) <= x"85";
	state_i_s(3)(2) <= x"a5";
	state_i_s(0)(3) <= x"03";
	state_i_s(1)(3) <= x"3b";
	state_i_s(2)(3) <= x"e0";
	state_i_s(3)(3) <= x"a3";
	
	MixValid_s <= '1', '0' after 300 ns;

end MixColumns_tb_arch;

