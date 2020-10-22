//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Wed Oct 21 15:08:17 2020
//Host        : DESKTOP-PBR6R4O running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clk_0,
    rst_0,
    rst_1);
  input clk_0;
  inout rst_0;
  inout rst_1;

  wire clk_0;
  wire rst_0;
  wire rst_1;

  design_1 design_1_i
       (.clk_0(clk_0),
        .rst_0(rst_0),
        .rst_1(rst_1));
endmodule
