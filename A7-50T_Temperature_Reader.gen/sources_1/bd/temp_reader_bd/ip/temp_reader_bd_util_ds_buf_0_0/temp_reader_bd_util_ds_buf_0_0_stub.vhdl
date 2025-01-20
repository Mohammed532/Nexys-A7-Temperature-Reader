-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Mon Dec 23 23:38:32 2024
-- Host        : DESKTOP-4G1O1PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Mo/Documents/A7-50T_Temperature_Reader/A7-50T_Temperature_Reader.gen/sources_1/bd/temp_reader_bd/ip/temp_reader_bd_util_ds_buf_0_0/temp_reader_bd_util_ds_buf_0_0_stub.vhdl
-- Design      : temp_reader_bd_util_ds_buf_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a50ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity temp_reader_bd_util_ds_buf_0_0 is
  Port ( 
    BUFG_I : in STD_LOGIC_VECTOR ( 0 to 0 );
    BUFG_O : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of temp_reader_bd_util_ds_buf_0_0 : entity is "temp_reader_bd_util_ds_buf_0_0,util_ds_buf,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of temp_reader_bd_util_ds_buf_0_0 : entity is "temp_reader_bd_util_ds_buf_0_0,util_ds_buf,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=util_ds_buf,x_ipVersion=2.2,x_ipCoreRevision=7,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_SIZE=1,C_BUF_TYPE=BUFG,C_BUFGCE_DIV=1,C_BUFG_GT_SYNC=0,C_OBUFDS_GTE5_ADV=00,C_REFCLK_ICNTL_TX=00000,C_SIM_DEVICE=VERSAL_AI_CORE_ES1}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of temp_reader_bd_util_ds_buf_0_0 : entity is "yes";
end temp_reader_bd_util_ds_buf_0_0;

architecture stub of temp_reader_bd_util_ds_buf_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "BUFG_I[0:0],BUFG_O[0:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of BUFG_I : signal is "xilinx.com:signal:clock:1.0 BUFG_I CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of BUFG_I : signal is "slave BUFG_I";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of BUFG_I : signal is "XIL_INTERFACENAME BUFG_I, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN temp_reader_bd_CLK100MHZ, INSERT_VIP 0";
  attribute x_interface_info of BUFG_O : signal is "xilinx.com:signal:clock:1.0 BUFG_O CLK";
  attribute x_interface_mode of BUFG_O : signal is "master BUFG_O";
  attribute x_interface_parameter of BUFG_O : signal is "XIL_INTERFACENAME BUFG_O, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN temp_reader_bd_CLK100MHZ, INSERT_VIP 0";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "util_ds_buf,Vivado 2024.2";
begin
end;
