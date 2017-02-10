-- Sébastien Dosset 05/12/16
-- Subbytes Test Bench Configuration

configuration Subbytes_tb_conf of Subbytes_tb is

	for Subbytes_tb_arch
		for DUT : Subbytes
			use configuration lib_sources.Subbytes_conf;
		end for;
	end for;

end Subbytes_tb_conf;
