// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module temp_reader_bd (
  ddr2_sdram_dq,
  ddr2_sdram_dqs_p,
  ddr2_sdram_dqs_n,
  ddr2_sdram_addr,
  ddr2_sdram_ba,
  ddr2_sdram_ras_n,
  ddr2_sdram_cas_n,
  ddr2_sdram_we_n,
  ddr2_sdram_ck_p,
  ddr2_sdram_ck_n,
  ddr2_sdram_cke,
  ddr2_sdram_cs_n,
  ddr2_sdram_dm,
  ddr2_sdram_odt,
  CLK100MHZ,
  reset,
  usb_uart_rxd,
  usb_uart_txd,
  dual_seven_seg_led_disp_tri_o,
  seven_seg_led_an_tri_o,
  push_buttons_5bits_tri_i,
  temp_sensor_scl_i,
  temp_sensor_scl_o,
  temp_sensor_scl_t,
  temp_sensor_sda_i,
  temp_sensor_sda_o,
  temp_sensor_sda_t
);

  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram DQ" *)
  (* X_INTERFACE_MODE = "master ddr2_sdram" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ddr2_sdram, CAN_DEBUG false, TIMEPERIOD_PS 1250, MEMORY_TYPE COMPONENTS, DATA_WIDTH 8, CS_ENABLED true, DATA_MASK_ENABLED true, SLOT Single, MEM_ADDR_MAP ROW_COLUMN_BANK, BURST_LENGTH 8, AXI_ARBITRATION_SCHEME TDM, CAS_LATENCY 11, CAS_WRITE_LATENCY 11" *)
  inout [15:0]ddr2_sdram_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram DQS_P" *)
  inout [1:0]ddr2_sdram_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram DQS_N" *)
  inout [1:0]ddr2_sdram_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram ADDR" *)
  output [12:0]ddr2_sdram_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram BA" *)
  output [2:0]ddr2_sdram_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram RAS_N" *)
  output ddr2_sdram_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CAS_N" *)
  output ddr2_sdram_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram WE_N" *)
  output ddr2_sdram_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CK_P" *)
  output [0:0]ddr2_sdram_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CK_N" *)
  output [0:0]ddr2_sdram_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CKE" *)
  output [0:0]ddr2_sdram_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CS_N" *)
  output [0:0]ddr2_sdram_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram DM" *)
  output [1:0]ddr2_sdram_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram ODT" *)
  output [0:0]ddr2_sdram_odt;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK100MHZ CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK100MHZ" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK100MHZ, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN temp_reader_bd_CLK100MHZ, INSERT_VIP 0" *)
  input CLK100MHZ;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *)
  (* X_INTERFACE_MODE = "slave RST.RESET" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
  input reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart RxD" *)
  (* X_INTERFACE_MODE = "master usb_uart" *)
  input usb_uart_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart TxD" *)
  output usb_uart_txd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 dual_seven_seg_led_disp TRI_O" *)
  (* X_INTERFACE_MODE = "master dual_seven_seg_led_disp" *)
  output [7:0]dual_seven_seg_led_disp_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 seven_seg_led_an TRI_O" *)
  (* X_INTERFACE_MODE = "master seven_seg_led_an" *)
  output [7:0]seven_seg_led_an_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 push_buttons_5bits TRI_I" *)
  (* X_INTERFACE_MODE = "master push_buttons_5bits" *)
  input [4:0]push_buttons_5bits_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 temp_sensor SCL_I" *)
  (* X_INTERFACE_MODE = "master temp_sensor" *)
  input temp_sensor_scl_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 temp_sensor SCL_O" *)
  output temp_sensor_scl_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 temp_sensor SCL_T" *)
  output temp_sensor_scl_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 temp_sensor SDA_I" *)
  input temp_sensor_sda_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 temp_sensor SDA_O" *)
  output temp_sensor_sda_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 temp_sensor SDA_T" *)
  output temp_sensor_sda_t;

  // stub module has no contents

endmodule
