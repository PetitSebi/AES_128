-- Sébastien Dosset 18/12/16
-- AES Final Test Bench Configuration

configuration AES_tb_conf of AES_tb is

	for AES_tb_arch
		for DUT : AES
			use configuration lib_sources.AES_conf;
		end for;
	end for;

end AES_tb_conf;
