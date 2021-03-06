-- Sébastien Dosset 13/12/16
-- RoundExe Configuration

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

configuration RoundExe_conf of RoundExe is

	for RoundExe_arch
		for Subbytes1 : Subbytes
			use configuration lib_sources.Subbytes_conf; 
		end for; 
		for ShiftRows1 : ShiftRows
			use entity lib_sources.ShiftRows(ShiftRows_arch);
		end for;
		for MixColumns1 : MixColumns
			use entity lib_sources.MixColumns(MixColumns_arch);
		end for;
		for Mux2_11 : Mux2_1
			use entity lib_sources.Mux2_1(Mux2_1_arch);
		end for;
		for AddRoundKey1 : AddRoundKey
			use entity lib_sources.AddRoundKey(AddRoundKey_arch);
		end for;
	end for;

end RoundExe_conf;

