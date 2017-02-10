-- Sébastien Dosset 18/12/16
-- AES Final Test Bench

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

entity AES_tb is
end AES_tb;

architecture AES_tb_arch of AES_tb is

	component AES
		port(
		clock_i  : in std_logic;
		resetb_i : in std_logic;
		key_i    : in bit128;
		data_i   : in bit128;
		start_i  : in std_logic;
		data_o   : out bit128;
		aes_on_o : out std_logic);
	end component;

	signal clock_i_s, resetb_i_s : std_logic:='1';
	signal key_i_s, data_i_s, data_o_s : bit128;
	signal start_i_s, aes_on_o_s : std_logic;

begin

	DUT : AES
		port map(
		clock_i  => clock_i_s,
		resetb_i => resetb_i_s,
		key_i    => key_i_s,
		data_i   => data_i_s,
		start_i  => start_i_s,
		data_o   => data_o_s,
		aes_on_o =>aes_on_o_s);

	data_i_s <= x"52445620636520736f69722061203868";
	key_i_s <= x"0123456789abcdef123456789abcdef0";
	
	start_i_s <= '1', '0' after 300 ns;
	resetb_i_s <= '1';
	clock_i_s <= not(clock_i_s) after 50 ns;

end AES_tb_arch;

