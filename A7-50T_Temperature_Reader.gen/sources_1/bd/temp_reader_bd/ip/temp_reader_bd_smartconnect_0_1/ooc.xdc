# aclk {FREQ_HZ 100000000 CLK_DOMAIN temp_reader_bd_CLK100MHZ PHASE 0.0}
# Clock Domain: temp_reader_bd_CLK100MHZ
create_clock -name aclk -period 10.000 [get_ports aclk]
# Generated clocks
