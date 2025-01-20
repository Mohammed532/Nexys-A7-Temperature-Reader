// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Mon Dec 23 23:38:32 2024
// Host        : DESKTOP-4G1O1PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Mo/Documents/A7-50T_Temperature_Reader/A7-50T_Temperature_Reader.gen/sources_1/bd/temp_reader_bd/ip/temp_reader_bd_util_ds_buf_0_0/temp_reader_bd_util_ds_buf_0_0_stub.v
// Design      : temp_reader_bd_util_ds_buf_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a50ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "temp_reader_bd_util_ds_buf_0_0,util_ds_buf,{}" *) (* core_generation_info = "temp_reader_bd_util_ds_buf_0_0,util_ds_buf,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=util_ds_buf,x_ipVersion=2.2,x_ipCoreRevision=7,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_SIZE=1,C_BUF_TYPE=BUFG,C_BUFGCE_DIV=1,C_BUFG_GT_SYNC=0,C_OBUFDS_GTE5_ADV=00,C_REFCLK_ICNTL_TX=00000,C_SIM_DEVICE=VERSAL_AI_CORE_ES1}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "util_ds_buf,Vivado 2024.2" *) 
module temp_reader_bd_util_ds_buf_0_0(BUFG_I, BUFG_O)
/* synthesis syn_black_box black_box_pad_pin="BUFG_I[0:0],BUFG_O[0:0]" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 BUFG_I CLK" *) (* x_interface_mode = "slave BUFG_I" *) (* x_interface_parameter = "XIL_INTERFACENAME BUFG_I, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN temp_reader_bd_CLK100MHZ, INSERT_VIP 0" *) input [0:0]BUFG_I;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 BUFG_O CLK" *) (* x_interface_mode = "master BUFG_O" *) (* x_interface_parameter = "XIL_INTERFACENAME BUFG_O, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN temp_reader_bd_CLK100MHZ, INSERT_VIP 0" *) output [0:0]BUFG_O;
endmodule
