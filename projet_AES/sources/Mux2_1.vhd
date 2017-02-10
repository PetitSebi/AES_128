-- Sébastien Dosset 13/12/16
-- Multiplexeur 2 vers 1

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

entity Mux2_1 is

	port(
	data_i : in bit128;
	state_i : in type_state;
	mux_sel_i : in std_logic;
	state_o : out type_state);

end Mux2_1;

architecture Mux2_1_arch of Mux2_1 is

begin

	-- Dans le cas '1' on récupère le message data_i en le convertissant de bit128 à type_state.
	-- Dans le cas '0' on recopie l'entrée state_i sur la sortie state_o
	Colonnes : for j in 0 to 3 generate 
		Lignes : for i in 0 to 3 generate
			state_o(j)(i) <= state_i(j)(i) when mux_sel_i='0' else data_i((127-8*i-32*j) downto (127-8*i-32*j-7));
		end generate;
	end generate;

end Mux2_1_arch;
