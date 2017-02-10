-- Sébastien Dosset 12/12/16
-- FSM MOORE

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_sources;
use lib_sources.crypt_pack.all;

entity FSM_StateController_Moore is

	port(
	start_i : in std_logic;
	resetb_i : in std_logic;
	clock_i : in std_logic;
	aes_on_o : out std_logic;
	key_exp_start_o : out std_logic;
	mux_sel_o : out std_logic;
	mix_valid_o : out std_logic;
	data_out_valid_o : out std_logic);

end FSM_StateController_Moore;



architecture FSM_StateController_Moore_arch of FSM_StateController_Moore is

	type state is (etat0 , etat1 , etat2 , etat3 , etat4);	-- Etats de la machine

	signal etat_present , etat_futur : state;		
	signal cpt : integer:=0;				-- Compteur de round

begin

	-- Implémentation du cadencement de la machine sur front montant d'horloge.
	seq_0 : process (clock_i , resetb_i) 
	begin 
		if resetb_i ='0' then 
			etat_present <= etat0;		-- Le reset renvoie à l'état d'attente
			cpt <= 0;
		elsif clock_i 'event and clock_i = '1' then 
			etat_present <= etat_futur;
			cpt <= cpt +1;			-- Comptage des rounds
		end if; 
	end process seq_0;

	comb0 : process (etat_present , start_i, cpt) 
	begin 
		case etat_present is 
			when etat0 => 
				if start_i = '1' then 		-- Passage à l'état sous condition du start_i
					etat_futur <= etat1;		
				else etat_futur <= etat0; 
				end if;
			when etat1 => 
				etat_futur <= etat2;		-- Passage à l'état 2 sur front montant d'horloge
			when etat2 =>
				if(cpt=10) then			-- Passage à l'état 3 quand on atteint le 10ème round
					etat_futur <= etat3;
				else 
					etat_futur <= etat2;
				end if;
			when etat3 => 				-- Passage à l'état 4 sur front montant d'horloge
				etat_futur <= etat4;
			when etat4 =>
				etat_futur <= etat0;
		end case;
	end process comb0;

	
	comb1 : process (etat_present)
	begin 
		case etat_present is 
			when etat0 => 			-- Etat d'attente
				aes_on_o <='0';
				key_exp_start_o <='1';		
				mux_sel_o <='0';
				mix_valid_o<='0';
				data_out_valid_o<='0';
			when etat1 => 			-- Round 0
				aes_on_o<='1';
				key_exp_start_o<='0';		
				mux_sel_o<='1';
				mix_valid_o<='0';
				data_out_valid_o<='0';
			when etat2 =>			-- Round 1->9
				aes_on_o<='1';
				key_exp_start_o<='0';
				mux_sel_o<='0';
				mix_valid_o<='1';
				data_out_valid_o<='0';
			when etat3 =>			-- Round 10
				aes_on_o<='1';
				key_exp_start_o<='0';
				mux_sel_o<='0';
				mix_valid_o<='0';
				data_out_valid_o<='1';
			when etat4 =>			-- Fin du chiffrement
				 aes_on_o<='0';
				key_exp_start_o<='0';
				mux_sel_o<='0';
				mix_valid_o<='0';
				data_out_valid_o<='0';
		end case;
	end process comb1;

end FSM_StateController_Moore_arch;
