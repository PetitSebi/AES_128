----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:03:12 10/22/2008 
-- Design Name: 
-- Module Name:    FSM_key_expand - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_key_expand is
    Port ( resetb_i : in  STD_LOGIC;
           clock_i : in  STD_LOGIC;
           start_i : in  STD_LOGIC;
			  test_key_expand : out STD_LOGIC;
           round_step : out  integer range 0 to 9);
end FSM_key_expand;

architecture Behavioral of FSM_key_expand is

type etat_type is (hold, key_expand, done);
signal etat, etat_suivant : etat_type;

signal sig_round_step : integer range 0 to 9;

begin

sequentiel : process(clock_i,resetb_i)
begin

	if resetb_i = '0' then		--reset actif à 0 sur la maquette
		sig_round_step <= 0;
		etat <= hold;
	elsif (clock_i'event and clock_i = '1') then
		etat <= etat_suivant;
		if (etat = key_expand AND sig_round_step < 9) then
			sig_round_step <= sig_round_step + 1;
		else
			sig_round_step <= 0;
		end if;
	end if;

end process;

combinatoire : process(etat, start_i,sig_round_step)
begin

	case etat is
		when hold =>
				test_key_expand <= '0';
				if start_i = '1' then
					etat_suivant <= key_expand;
				else
					etat_suivant <= hold;
				end if;
		
		when key_expand =>
				test_key_expand <= '1';
				if sig_round_step = 9 then
					etat_suivant <= done;
				else
					etat_suivant <= key_expand;
				end if;
				
		when done =>
				test_key_expand <= '0';
				if start_i = '1' then
					etat_suivant <= key_expand;
				else
					etat_suivant <= done;
				end if;
		
--		when OTHERS =>
--				test_key_expand <= '0';
--				etat_suivant <= hold;
		
	end case;

end process;

round_step <= sig_round_step;

end Behavioral;

