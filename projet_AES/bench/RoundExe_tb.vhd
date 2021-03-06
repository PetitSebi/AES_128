-- Sébastien Dosset 06/01/17
-- RoundExe Test Bench

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

entity RoundExe_tb is
end RoundExe_tb;

architecture RoundExe_tb_arch of RoundExe_tb is

	component RoundExe
		port(
		resetb_i       : in std_logic;
		data_i         : in bit128;
		clock_i        : in std_logic;
		mixValid_i     : in std_logic;
		muxSel_i       : in std_logic;
		dataOutValid_i : in std_logic;
		currentKey_i   : in type_key;
		data_o         : out bit128);
	end component;

	signal resetb_i_s       :  std_logic;
	signal data_i_s      	:  bit128;
	signal clock_i_s        :  std_logic:='0';
	signal mixValid_i_s     :  std_logic;
	signal muxSel_i_s       :  std_logic;
	signal dataOutValid_i_s :  std_logic;
	signal currentKey_i_s   :  type_key;
	signal data_o_s         :  bit128;

begin

	DUT : RoundExe
		port map(
		resetb_i   	=> resetb_i_s,
		data_i          => data_i_s,
		clock_i         => clock_i_s,
		mixValid_i      => mixValid_i_s,
		muxSel_i        => muxSel_i_s,
		dataOutValid_i  => dataOutValid_i_s,
		currentKey_i    => currentKey_i_s,
		data_o          => data_o_s);

	-- Donnée d'entrée: "52445620636520736f69722061203868"
	
	data_i_s <= x"52445620636520736f69722061203868";	

	-- Clé de Round0: "0123456789ABCDEF123456789ABCDEF0"
	-- Clé de Round1: "b33f8435f3bc623d7f8afd54ac403a77"

	currentKey_i_s(0)(0) <= x"01",x"b3" after 100 ns;
	currentKey_i_s(1)(0) <= x"23",x"3f" after 100 ns;
	currentKey_i_s(2)(0) <= x"45",x"84" after 100 ns;
	currentKey_i_s(3)(0) <= x"67",x"35" after 100 ns;
	currentKey_i_s(0)(1) <= x"89",x"f3" after 100 ns;
	currentKey_i_s(1)(1) <= x"ab",x"bc" after 100 ns;
	currentKey_i_s(2)(1) <= x"cd",x"62" after 100 ns;
	currentKey_i_s(3)(1) <= x"ef",x"3d" after 100 ns;
	currentKey_i_s(0)(2) <= x"12",x"7f" after 100 ns;
	currentKey_i_s(1)(2) <= x"34",x"8a" after 100 ns;
	currentKey_i_s(2)(2) <= x"56",x"fd" after 100 ns;
	currentKey_i_s(3)(2) <= x"78",x"54" after 100 ns;
	currentKey_i_s(0)(3) <= x"9a",x"ac" after 100 ns;
	currentKey_i_s(1)(3) <= x"bc",x"40" after 100 ns;
	currentKey_i_s(2)(3) <= x"de",x"3a" after 100 ns;
	currentKey_i_s(3)(3) <= x"f0",x"77" after 100 ns;

	mixValid_i_s     <= '1';
	muxSel_i_s       <= '1','0' after 100 ns;
	dataOutValid_i_s <= '0', '1' after 300 ns;
		

	resetb_i_s <= '1';
	clock_i_s <= not(clock_i_s) after 100 ns;

end RoundExe_tb_arch;

