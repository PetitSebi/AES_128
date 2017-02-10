-- Sébastien Dosset 05/12/16
-- Subbytes(Substitution de 128 bits) Configuration

library IEEE;
use IEEE.std_logic_1164.all;

configuration Subbytes_conf of Subbytes is
	for Subbytes_arch
		for Lignes
			for Colonnes
				for all : SBox
					use entity lib_sources.SBox(SBox_arch);
				end for;
			end for;
		end for;
	end for;

end Subbytes_conf;
