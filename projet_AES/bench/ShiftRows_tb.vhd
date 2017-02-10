-- Sébastien Dosset 06/12/16
-- ShiftRows Test Bench

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

entity ShiftRows_tb is
end ShiftRows_tb;

architecture ShiftRows_tb_arch of ShiftRows_tb is

	component ShiftRows
		port(
		state_i : in type_state;
		state_o : out type_state);
	end component;

	signal state_i_s : type_state;
	signal state_o_s : type_state;

begin

	DUT : ShiftRows
		port map(
		state_i   => state_i_s,
		state_o   => state_o_s);

	state_i_s(0)(0) <= x"57";
	state_i_s(0)(1) <= x"3b";
	state_i_s(0)(2) <= x"85";
	state_i_s(0)(3) <= x"6b";
	state_i_s(1)(0) <= x"46";
	state_i_s(1)(1) <= x"fe";
	state_i_s(1)(2) <= x"e0";
	state_i_s(1)(3) <= x"a5";
	state_i_s(2)(0) <= x"17";
	state_i_s(2)(1) <= x"e5";
	state_i_s(2)(2) <= x"20";
	state_i_s(2)(3) <= x"a3";
	state_i_s(3)(0) <= x"03";
	state_i_s(3)(1) <= x"05";
	state_i_s(3)(2) <= x"6b";
	state_i_s(3)(3) <= x"a2";

end ShiftRows_tb_arch;

