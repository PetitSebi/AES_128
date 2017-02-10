-- Sébastien Dosset 12/12/16
-- FSM MOORE Test Bench

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;


entity FSM_StateController_Moore_tb is
end FSM_StateController_Moore_tb;

architecture FSM_StateController_Moore_tb_arch of FSM_StateController_Moore_tb is

	component FSM_StateController_Moore
		port(
		start_i : in std_logic;
		resetb_i : in std_logic;
		clock_i : in std_logic;
		aes_on_o : out std_logic;
		key_exp_start_o : out std_logic;
		mux_sel_o : out std_logic;
		mix_valid_o : out std_logic;
		data_out_valid_o : out std_logic); 
	end component;

signal start_s, resetb_s, clock_s : std_logic :='0'; 
signal aes_on_s, key_exp_start_s, mux_sel_s, mix_valid_s, data_out_valid_s : std_logic;

begin 

	DUT : FSM_StateController_Moore 
		port map ( 
		start_i          => start_s, 
		resetb_i         => resetb_s, 
		clock_i          => clock_s, 
		aes_on_o         => aes_on_s, 
		key_exp_start_o  => key_exp_start_s,
		mux_sel_o        => mux_sel_s,
		mix_valid_o      => mix_valid_s,
		data_out_valid_o => data_out_valid_s);

	start_s <= '0', '1' after 50 ns; 
	resetb_s <= '0', '1' after 130 ns;
	clock_s <= not(clock_s) after 100 ns;

end FSM_StateController_Moore_tb_arch;
