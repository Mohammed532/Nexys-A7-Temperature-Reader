# aclk {FREQ_HZ 50000000 CLK_DOMAIN temp_reader_bd_mig_7series_0_0_ui_clk PHASE 0} aclk1 {FREQ_HZ 100000000 CLK_DOMAIN temp_reader_bd_CLK100MHZ PHASE 0.0}
# Clock Domain: temp_reader_bd_mig_7series_0_0_ui_clk
create_clock -name aclk -period 20.000 [get_ports aclk]
# Clock Domain: temp_reader_bd_CLK100MHZ
create_clock -name aclk1 -period 10.000 [get_ports aclk1]
# Generated clocks
