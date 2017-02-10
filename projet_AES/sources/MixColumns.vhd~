-- Sébastien Dosset 07/12/16
-- MixColumns 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;


entity MixColumns is

	port(
	state_i : in type_state;
	MixValid_i : in std_logic;
	state_o : out type_state);

end MixColumns;


architecture MixColumns_arch of MixColumns is
	
	-- signal S2_s,S3_s : bit8;

	begin

	-- On découpe le generate en 4 opérations qui correspondent aux 4 équations du mixColumns.
	-- Les équations sont longues à cause des multiplications par 2 et par 3.
	-- Je laisse en commentaire les calculs de S2_s et S3_s qui correspondent respectivement à la multiplication par 2 et par 3. 
	
	G1 : for j in 0 to 3 generate 

			--S2_s <= (state_i(j)(0)(6 downto 0) & '0') xor ("000" & state_i(j)(0)(7) & state_i(j)(0)(7) & '0' & state_i(j)(0)(7) & state_i(j)(0)(7));			
			
			--S3_s <= (state_i(j)(0)(6 downto 0) & '0') xor ("000" & state_i(j)(0)(7) & state_i(j)(0)(7) & '0' & state_i(j)(0)(7) & state_i(j)(0)(7)) xor state_i(j)(0);	

			state_o(j)(0) <= ((state_i(j)(0)(6 downto 0) & '0') xor ("000" & state_i(j)(0)(7) & state_i(j)(0)(7) & '0' & state_i(j)(0)(7) & state_i(j)(0)(7))) xor ((state_i(j)(1)(6 downto 0) & '0') xor ("000" & state_i(j)(1)(7) & state_i(j)(1)(7) & '0' & state_i(j)(1)(7) & state_i(j)(1)(7)) xor state_i(j)(1)) xor state_i(j)(2) xor state_i(j)(3) when MixValid_i = '1' else state_i(j)(0);			
			---------------------------------------------------------------------------------------
			--S2_s <= (state_i(j)(1)(6 downto 0) & '0') xor ("000" & state_i(j)(1)(7) & state_i(j)(1)(7) & '0' & state_i(j)(1)(7) & state_i(j)(1)(7));			
			
			--S3_s <= (state_i(j)(1)(6 downto 0) & '0') xor ("000" & state_i(j)(1)(7) & state_i(j)(1)(7) & '0' & state_i(j)(1)(7) & state_i(j)(1)(7)) xor state_i(j)(1);

			state_o(j)(1) <= state_i(j)(0) xor ((state_i(j)(1)(6 downto 0) & '0') xor ("000" & state_i(j)(1)(7) & state_i(j)(1)(7) & '0' & state_i(j)(1)(7) & state_i(j)(1)(7))) xor ((state_i(j)(2)(6 downto 0) & '0') xor ("000" & state_i(j)(2)(7) & state_i(j)(2)(7) & '0' & state_i(j)(2)(7) & state_i(j)(2)(7)) xor state_i(j)(2)) xor state_i(j)(3) when MixValid_i = '1' else state_i(j)(1);
			---------------------------------------------------------------------------------------
			--S2_s <= (state_i(j)(2)(6 downto 0) & '0') xor ("000" & state_i(j)(2)(7) & state_i(j)(2)(7) & '0' & state_i(j)(2)(7) & state_i(j)(2)(7));			
			
			--S3_s <= (state_i(j)(2)(6 downto 0) & '0') xor ("000" & state_i(j)(2)(7) & state_i(j)(2)(7) & '0' & state_i(j)(2)(7) & state_i(j)(2)(7)) xor state_i(j)(2);

			state_o(j)(2) <= state_i(j)(0) xor state_i(j)(1) xor ((state_i(j)(2)(6 downto 0) & '0') xor ("000" & state_i(j)(2)(7) & state_i(j)(2)(7) & '0' & state_i(j)(2)(7) & state_i(j)(2)(7))) xor ((state_i(j)(3)(6 downto 0) & '0') xor ("000" & state_i(j)(3)(7) & state_i(j)(3)(7) & '0' & state_i(j)(3)(7) & state_i(j)(3)(7)) xor state_i(j)(3)) when MixValid_i = '1' else state_i(j)(2);			
			---------------------------------------------------------------------------------------
			--S2_s <= (state_i(j)(3)(6 downto 0) & '0') xor ("000" & state_i(j)(3)(7) & state_i(j)(3)(7) & '0' & state_i(j)(3)(7) & state_i(j)(3)(7));			
			
			--S3_s <= (state_i(j)(3)(6 downto 0) & '0') xor ("000" & state_i(j)(3)(7) & state_i(j)(3)(7) & '0' & state_i(j)(3)(7) & state_i(j)(3)(7)) xor state_i(j)(3);

			state_o(j)(3) <= ((state_i(j)(0)(6 downto 0) & '0') xor ("000" & state_i(j)(0)(7) & state_i(j)(0)(7) & '0' & state_i(j)(0)(7) & state_i(j)(0)(7)) xor state_i(j)(0)) xor state_i(j)(1) xor state_i(j)(2) xor ((state_i(j)(3)(6 downto 0) & '0') xor ("000" & state_i(j)(3)(7) & state_i(j)(3)(7) & '0' & state_i(j)(3)(7) & state_i(j)(3)(7))) when MixValid_i = '1' else state_i(j)(3);

	end generate;
	
end MixColumns_arch;
