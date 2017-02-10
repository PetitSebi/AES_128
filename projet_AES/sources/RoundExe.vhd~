-- Sébastien Dosset 13/12/16
-- RoundExe (regroupant Subbytes, ShiftRows, MixColumns, AddRoundKey)

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

entity RoundExe is

	port(
	resetb_i       : in std_logic;
	data_i         : in bit128;
	clock_i        : in std_logic;
	mixValid_i     : in std_logic;
	muxSel_i       : in std_logic;
	dataOutValid_i : in std_logic;
	currentKey_i   : in type_key;
	data_o         : out bit128);

end RoundExe;

architecture RoundExe_arch of RoundExe is

	component Subbytes
		port(
		subBytes_i : in type_state;
		resetb_i   : in std_logic;
		clock_i    : in std_logic;
		subBytes_o : out type_state);
	end component;

	component ShiftRows
		port(
		state_i : in type_state;
		state_o : out type_state);
	end component;
		
	component MixColumns
		port(
		state_i    : in type_state;
		mixValid_i : in std_logic;
		state_o    : out type_state);
	end component;

	component Mux2_1
		port(
		data_i    : in bit128;
		state_i   : in type_state;
		mux_sel_i : in std_logic;
		state_o   : out type_state);
	end component;

	component AddRoundKey
		port(
		state_i        : in type_state;
		CurrentKey_i   : in type_key;
		DataOutValid_i : in std_logic;
		state_o        : out type_state;
		data_o         : out bit128);
	end component;

	-- La convention utilisée est : state_ComposantDépart_to_ComposantDArrivée_s

	signal state_SB_to_SR_s, state_SR_to_MC_s, state_MC_to_MUX_s, state_MUX_to_ARK_s,state_ARK_to_SB_s : type_state; 


begin

	-- On se réfère directement au schéma d'organisation de l'AES pour relier les composants

	Subbytes1 : Subbytes port map ( 
		subBytes_i => state_ARK_to_SB_s,
		resetb_i   => resetb_i,
		clock_i    => clock_i,
		subBytes_o => state_SB_to_SR_s);

	ShiftRows1 : ShiftRows port map ( 
		state_i => state_SB_to_SR_s,
		state_o => state_SR_to_MC_s);

	MixColumns1 : MixColumns port map ( 
		state_i    => state_SR_to_MC_s,
		mixValid_i => mixValid_i,
		state_o    => state_MC_to_MUX_s);		

	Mux2_11 : Mux2_1 port map ( 
		data_i    => data_i,
		state_i   => state_MC_to_MUX_s,
		mux_sel_i => muxSel_i,
		state_o   => state_MUX_to_ARK_s);		

	AddRoundKey1 : AddRoundKey port map (
		state_i        => state_MUX_to_ARK_s,
		currentKey_i   => currentKey_i,
		dataOutValid_i => dataOutValid_i,
		state_o        => state_ARK_to_SB_s,
		data_o         => data_o);

end RoundExe_arch;

