-- Sébastien Dosset 13/12/16
-- AddRoundKey Test Bench Configuration

configuration AddRoundKey_tb_conf of AddRoundKey_tb is

	for AddRoundKey_tb_arch
		for DUT : AddRoundKey
			use entity lib_sources.AddRoundKey(AddRoundKey_arch);
		end for;
	end for;

end AddRoundKey_tb_conf;
