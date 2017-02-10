-- Sébastien Dosset 17/12/16
-- AES Final

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

entity AES is
	
	port(
	clock_i  : in std_logic;
	resetb_i : in std_logic;
	key_i    : in bit128;
	data_i   : in bit128;
	start_i  : in std_logic;
	data_o   : out bit128;
	aes_on_o : out std_logic);

end AES;


architecture AES_arch of AES is

	component FSM_StateController_Moore
		port(
		start_i          : in std_logic;
		resetb_i         : in std_logic;
		clock_i          : in std_logic;
		aes_on_o         : out std_logic;
		key_exp_start_o  : out std_logic;
		mux_sel_o        : out std_logic;
		mix_valid_o      : out std_logic;
		data_out_valid_o : out std_logic);
	end component;

	component KeyExpander_I_O
		port(
		clock_i     : in  STD_LOGIC;
           	resetb_i     : in  STD_LOGIC;
    		--key_load_i : in  STD_LOGIC;
           	start_i     : in  STD_LOGIC;
           	key_i       : in  bit128;
           	round_key_o : out type_key);
	end component;

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

	-- La convention utilisée est : natureDuSignal_ComposantDépart_ComposantDArrivée_s

	signal key_FSM_to_KeyExp_s, mux_FSM_to_Round_s, mixV_FSM_to_Round_s, dataOut_FSM_to_Round_s : std_logic;
	signal roundKey_KeyExp_to_Round_s : type_key;

begin

	FSM_StateController_Moore1 : FSM_StateController_Moore port map ( 
		start_i          => start_i,
		resetb_i         => resetb_i,
		clock_i          => clock_i,
		aes_on_o         => aes_on_o,
		key_exp_start_o  => key_FSM_to_KeyExp_s,
		mux_sel_o        => mux_FSM_to_Round_s,
		mix_valid_o      => mixV_FSM_to_Round_s,
		data_out_valid_o => dataOut_FSM_to_Round_s);

	KeyExpander_I_O1 : KeyExpander_I_O port map ( 
		clock_i     => clock_i,
           	resetb_i    => resetb_i,
    		--key_load_i
           	start_i     => key_FSM_to_KeyExp_s,
           	key_i       => key_i,
           	round_key_o => roundKey_KeyExp_to_Round_s);

	RoundExe1 : RoundExe port map (
		resetb_i       => resetb_i,
		data_i         => data_i,
		clock_i        => clock_i,
		mixValid_i     => mixV_FSM_to_Round_s,
		muxSel_i       => mux_FSM_to_Round_s,
		dataOutValid_i => dataOut_FSM_to_Round_s,
		currentKey_i   => roundKey_KeyExp_to_Round_s,
		data_o         => data_o);

end AES_arch;
