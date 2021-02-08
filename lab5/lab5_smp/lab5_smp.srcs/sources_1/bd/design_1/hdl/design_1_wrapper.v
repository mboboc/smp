//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
//Date        : Wed Jan 20 14:21:01 2021
//Host        : vivobook running 64-bit Ubuntu 20.04.1 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (oe_0);
  input oe_0;

  wire oe_0;

  design_1 design_1_i
       (.oe_0(oe_0));
endmodule
