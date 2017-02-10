-- Sébastien Dosset 17/12/16
-- AES Final Configuration

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

configuration AES_conf of AES is

	for AES_arch
		for FSM_StateController_Moore1 : FSM_StateController_Moore
			use entity lib_sources.FSM_StateController_Moore(FSM_StateController_Moore_arch); 
		end for; 
		for KeyExpander_I_O1 : KeyExpander_I_O
			use entity lib_sources.KeyExpander_I_O(Behavioral);
		end for;
		for RoundExe1 : RoundExe
			use configuration lib_sources.RoundExe_conf;
		end for;
	end for;

end AES_conf;

