-- Sébastien Dosset 13/12/16
-- Muxltiplexeur Test Bench Configuration

configuration Mux2_1_tb_conf of Mux2_1_tb is

	for Mux2_1_tb_arch
		for DUT : Mux2_1
			use entity lib_sources.Mux2_1(Mux2_1_arch);
		end for;
	end for;

end Mux2_1_tb_conf;
