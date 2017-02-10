-- Sébastien Dosset 04/12/16
-- Subbytes(Substitution de 128 bits)

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

entity Subbytes is

	port(
	subBytes_i : in type_state;
	resetb_i   : in std_logic;
	clock_i    : in std_logic;
	subBytes_o : out type_state);

end Subbytes;

architecture Subbytes_arch of Subbytes is

	component SBox
		port(
		SBox_i : in bit8;
		SBox_o : out bit8);
	end component;

	signal state_s : type_state;

begin
	
	P1 : process(resetb_i,clock_i)
	begin
		if(resetb_i='0') then
			state_s <= (others =>(others =>(others=>'0')));			-- Mise à 0 de tous les bits de state_s
		elsif(clock_i'event and clock_i='1') then		-- Condition sur front montant d'horloge
			state_s <= subBytes_i;				
		end if;
	end process;

	Lignes : for i in 0 to 3 generate
		Colonnes : for j in 0 to 3 generate
			inter : SBox port map(			-- Utilisation de la boîte de substitution 16 fois (pour chaque case du type_state d'entrée).
				SBox_i => state_s(i)(j),
				SBox_o => subBytes_o(i)(j));
		end generate Colonnes;
	end generate Lignes;

end Subbytes_arch;
