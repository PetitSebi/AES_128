-- Sébastien Dosset 06/01/17
-- RoundExe Test Bench Configuration

configuration RoundExe_tb_conf of RoundExe_tb is

	for RoundExe_tb_arch
		for DUT : RoundExe
			use configuration lib_sources.RoundExe_conf;
		end for;
	end for;

end RoundExe_tb_conf;
