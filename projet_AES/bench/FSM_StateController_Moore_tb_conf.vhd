-- Sébastien Dosset 12/12/16
-- FSM MOORE Test Bench Configuration

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

configuration FSM_StateController_Moore_tb_conf of FSM_StateController_Moore_tb is 

	for FSM_StateController_Moore_tb_arch 
		for DUT : FSM_StateController_Moore
			use entity lib_sources.FSM_StateController_Moore(FSM_StateController_Moore_arch); 
		end for; 
	end for; 

end FSM_StateController_Moore_tb_conf;
