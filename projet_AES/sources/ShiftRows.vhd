-- Sébastien Dosset 05/12/16
-- ShiftRows 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;


entity ShiftRows is

	port(
	state_i : in type_state;
	state_o : out type_state);

end ShiftRows;

architecture ShiftRows_arch of ShiftRows is


begin

	P0:process(state_i)
		begin
		for i in 0 to 3 LOOP -- On effectue le décalage sur chaque ligne (4 itérations)

			state_o(0)(i) <= state_i(0+i)(i);		-- On décale chacun des blocs en fonction de la ligne
			state_o(1)(i) <= state_i((1+i)mod 4)(i);	-- Le modulo 4 nous permet de retomber sur la première colonne lorsque on décale le dernier bloc de la ligne	
			state_o(2)(i) <= state_i((2+i)mod 4)(i);
			state_o(3)(i) <= state_i((3+i)mod 4)(i);

		END LOOP; 
	end process P0;

end ShiftRows_arch;
