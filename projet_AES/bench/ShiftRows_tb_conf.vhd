-- Sébastien Dosset 06/12/16
-- ShiftRows Test Bench Configuration

configuration ShiftRows_tb_conf of ShiftRows_tb is

	for ShiftRows_tb_arch
		for DUT : ShiftRows
			use entity lib_sources.ShiftRows(ShiftRows_arch);
		end for;
	end for;

end ShiftRows_tb_conf;
