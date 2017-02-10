-- Sébastien Dosset 06/12/16
-- AddRoundKey Test Bench

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

entity AddRoundKey_tb is
end AddRoundKey_tb;

architecture AddRoundKey_tb_arch of AddRoundKey_tb is

	component AddRoundKey
		port(
		state_i :        in type_state;
		currentKey_i :   in type_key;
		dataOutValid_i : in std_logic;
		state_o :        out type_state;
		data_o :         out std_logic_vector(127 downto 0));
	end component;

	signal state_i_s : type_state;
	signal currentKey_i_s : type_key;
	signal dataOutValid_i_s : std_logic:='0';
	signal state_o_s : type_state;
	signal data_o_s : std_logic_vector(127 downto 0);	

begin

	DUT : AddRoundKey
		port map(
		state_i   => state_i_s,
		currentKey_i => currentKey_i_s,
		dataOutValid_i => dataOutValid_i_s,
		state_o   => state_o_s,
		data_o => data_o_s);

	state_i_s(0)(0) <= x"52";
	state_i_s(1)(0) <= x"44";
	state_i_s(2)(0) <= x"56";
	state_i_s(3)(0) <= x"20";
	state_i_s(0)(1) <= x"63";
	state_i_s(1)(1) <= x"65";
	state_i_s(2)(1) <= x"20";
	state_i_s(3)(1) <= x"73";
	state_i_s(0)(2) <= x"6f";
	state_i_s(1)(2) <= x"69";
	state_i_s(2)(2) <= x"72";
	state_i_s(3)(2) <= x"20";
	state_i_s(0)(3) <= x"61";
	state_i_s(1)(3) <= x"20";
	state_i_s(2)(3) <= x"38";
	state_i_s(3)(3) <= x"68";

	dataOutValid_i_s <= '0', '1' after 300 ns;

	currentKey_i_s(0)(0) <= x"01";
	currentKey_i_s(0)(1) <= x"23";
	currentKey_i_s(0)(2) <= x"45";
	currentKey_i_s(0)(3) <= x"67";
	currentKey_i_s(1)(0) <= x"89";
	currentKey_i_s(1)(1) <= x"ab";
	currentKey_i_s(1)(2) <= x"cd";
	currentKey_i_s(1)(3) <= x"ef";
	currentKey_i_s(2)(0) <= x"12";
	currentKey_i_s(2)(1) <= x"34";
	currentKey_i_s(2)(2) <= x"56";
	currentKey_i_s(2)(3) <= x"78";
	currentKey_i_s(3)(0) <= x"9a";
	currentKey_i_s(3)(1) <= x"bc";
	currentKey_i_s(3)(2) <= x"de";
	currentKey_i_s(3)(3) <= x"f0";

end AddRoundKey_tb_arch;

