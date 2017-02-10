-- Sébastien Dosset 13/12/16
-- Subbyte Test Bench

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

entity Mux2_1_tb is
end Mux2_1_tb;

architecture Mux2_1_tb_arch of Mux2_1_tb is

	component Mux2_1
		port(
		data_i : in bit128;
		state_i : in type_state;
		mux_sel_i : in std_logic;
		state_o : out type_state);
	end component;	

	signal data_i_s : bit128;
	signal state_i_s : type_state;
	signal mux_sel_s : std_logic;
	signal state_o_s : type_state;

begin

	DUT : Mux2_1
		port map(
		data_i   => data_i_s,
		state_i => state_i_s,
		mux_sel_i     => mux_sel_s,
		state_o      => state_o_s);
	
	data_i_s <= x"0123456789ABCDEF123456789ABCDEF0";
	mux_sel_s <= '0', '1' after 100 ns;

end Mux2_1_tb_arch;
