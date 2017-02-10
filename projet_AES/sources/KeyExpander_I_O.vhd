----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:06:31 10/22/2008 
-- Design Name: 
-- Module Name:    KeyExpander_I_O - Behavioral 
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
use work.crypt_pack.all;


---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity KeyExpander_I_O is
    Port ( clock_i : in  STD_LOGIC;
           resetb_i : in  STD_LOGIC;
--         key_load_i : in  STD_LOGIC;
           start_i : in  STD_LOGIC;
           key_i : in  bit128;
           round_key_o : out type_key);
end KeyExpander_I_O;

architecture Behavioral of KeyExpander_I_O is

	COMPONENT FSM_key_expand
	PORT(
		resetb_i : IN std_logic;
		clock_i : IN std_logic;
		start_i : IN std_logic;
		test_key_expand : out STD_LOGIC;
		round_step : out integer range 0 to 9
		);
	END COMPONENT;

	COMPONENT BankReg
	PORT(
		clock_i : IN std_logic;
		data_i  : in reg_w;
	   data_o  : out reg_w
		);
	END COMPONENT;

	COMPONENT SBox
	PORT(
		SBox_i  : in  bit8;
		SBox_o : out bit8
		);
	END COMPONENT;

signal sig_round_step : integer range 0 to 9;

signal sig_key_map 	: reg_w;
signal sig_tmp 		: reg_w;
signal sig_bank 		: reg_w;
signal sig_w 			: reg_w;

signal sig_x1			: bit8;
signal sig_x2			: bit8;
signal sig_x3			: bit8;
signal sig_x4			: bit8;

signal tmp1				: bit32;
signal tmp2				: bit32;

signal test_key_expand : std_logic;

begin

--sig_key_map <= key_i
A : for i in 0 to 3 generate
	sig_key_map(i) <= key_i(127-32*i downto 96-32*i);
end generate;

--signal d'entrée du BankReg
sig_tmp <= sig_w when (test_key_expand = '1') else sig_key_map;

	Inst_BankReg: BankReg PORT MAP(
		clock_i => clock_i,
		data_i => sig_tmp,
		data_o => sig_bank
	);

--SubWord
	Inst_SBox1: SBox PORT MAP(
		SBox_i => sig_bank(3)(31 downto 24),
		SBox_o => sig_x1
	);
	Inst_SBox2: SBox PORT MAP(
		SBox_i => sig_bank(3)(23 downto 16),
		SBox_o => sig_x2
	);
	Inst_SBox3: SBox PORT MAP(
		SBox_i => sig_bank(3)(15 downto 8),
		SBox_o => sig_x3
	);
	Inst_SBox4: SBox PORT MAP(
		SBox_i => sig_bank(3)(7 downto 0),
		SBox_o => sig_x4
	);

--RotWord
tmp1 <= sig_x2 & sig_x3 & sig_x4 & sig_x1;

--w[i] = w[i-Nk] xor w[i-1] xor Rcon si modulo Nk=4
tmp2 <= tmp1 xor sig_bank(0) xor (Rcon(sig_round_step) & X"000000");
sig_w(0) <= tmp2;

--w[i] = w[i-Nk] xor w[i-1] si pas modulo Nk=4
sig_w(1) <= sig_w(0) xor sig_bank(1);
sig_w(2) <= sig_w(1) xor sig_bank(2);
sig_w(3) <= sig_w(2) xor sig_bank(3);


	Inst_FSM_key_expand: FSM_key_expand PORT MAP(
		resetb_i => resetb_i,
		clock_i => clock_i,
		start_i => start_i,
		test_key_expand => test_key_expand,
		round_step => sig_round_step
	);
	
--RoundKey Out
B1 : for col in 0 to 3 generate
	B2 : for row in 0 to 3 generate
		--round_key_o(row)(col) <= sig_key_map(col)(31-row*8 downto 24-row*8)
		--								 when (test_key_expand = '0') else 
		--								 sig_w(col)(31-row*8 downto 24-row*8);
		round_key_o(row)(col) <= sig_bank(col)(31-row*8 downto 24-row*8);
	end generate;
end generate;

end Behavioral;

