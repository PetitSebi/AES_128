-- Sébastien Dosset 05/12/16
-- AddRoundKey

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;


entity AddRoundKey is

	port(
		state_i :        in type_state;
		currentKey_i :   in type_key;
		dataOutValid_i : in std_logic;
		state_o :        out type_state;
		data_o :         out std_logic_vector(127 downto 0));

end AddRoundKey;


architecture AddRoundKey_arch of AddRoundKey is

	signal data_o_s : type_state;

	begin

	-- On effectue l'ajout de clé (le xor) avec le signal d'entrée.
	Colonnes1 : for j in 0 to 3 generate 		
		Lignes1 : for i in 0 to 3 generate
			data_o_s(i)(j) <= state_i(i)(j) xor currentKey_i(j)(i);
		end generate;
	end generate;
	
	-- On recopie le résultat sur la variable d'état de sortie (utilisée pour reboucler sur le SubBytes)
	state_o <= data_o_s;

	-- Dans le cas du dernier round, on convertit le cryptogramme en bit128 et on l'affiche sur la sortie data_o
	Colonnes2 : for j in 0 to 3 generate 
		Lignes2 : for i in 0 to 3 generate
			data_o((127-8*i-32*j)downto(127-8*i-32*j-7)) <= data_o_s(j)(i) when dataOutValid_i ='1' else x"00";
		end generate;
	end generate;

end AddRoundKey_arch;
