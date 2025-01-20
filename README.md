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

Directory for the C baremetal code is in [/tr_vitis_workspace/temp_reader/src/](tr_vitis_workspace/temp_reader/src), with [main.c](tr_vitis_workspace/temp_reader/src/main.c) as the entry point.
