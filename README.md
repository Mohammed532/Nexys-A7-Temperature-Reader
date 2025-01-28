# Nexys A7 Tempurature Reader

A baremetal project for reading ambient tempurature using the Nexys A7 FPGA Board. A simple project for learning embedded programming and fpga development.

## Components

- Nexys A7 50T dev board
- Microblaze (soft processor)
- ADT7420 (tempurature sensor onboard)
- Micron MT47H64M16HR-25:H (DDR2 SDRAM onboard)
- Vivado 2024.2
- Vitis 2024.2

## Block Design

Screenshots of the hardware block design.

![Project Block Design](https://github.com/user-attachments/assets/023d03ca-f35b-451e-a33a-858bc6d42c83)
![Project Block Design (Color Coded)](https://github.com/user-attachments/assets/b41b2ae7-3403-4807-8803-819c0313903b)

## Project Navigation

This project is divided into two parts: 
- Hardware Implementation (Microblaze, VHDL)
- Software Implementation (C)

The main focus of this project was to build skills in embedded programming in C, so even though this repository has both the hardware file and software file, most of the work/learning was done for the software side of things (still learned a lot about working with the Microblaze core and implementing Xilinx IP)

### Hardware (HDL)

Hardware was configured through HDL wrapper generated from the block design (see [Block Design](#block-design)). The VHDL code generated isn't really useful beyond the context of the block design, but can still be found [here](A7-50T_Temperature_Reader.gen/sources_1/bd/temp_reader_bd/hdl/temp_reader_bd_wrapper.vhd).


### Software

Directory for the C baremetal code is in [/tr_vitis_workspace/temp_reader/src/](tr_vitis_workspace/temp_reader/src)
- Entry Point: [main.c](tr_vitis_workspace/temp_reader/src/main.c)
- Seven Segment Driver: [sevseg_writer.c](tr_vitis_workspace/temp_reader/src/sevseg_writer.c)
- Tempurature Sensor Driver: [temp_sensor_reader.c](tr_vitis_workspace/temp_reader/src/temp_sensor_reader.c)
