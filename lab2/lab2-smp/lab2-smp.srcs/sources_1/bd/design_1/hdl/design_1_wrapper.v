//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
//Date        : Wed Nov  4 15:43:17 2020
//Host        : vivobook running 64-bit Ubuntu 20.04.1 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (CLK_0,
    IPL0_0,
    IPL1_0,
    IPL2_0,
    IRESET_0);
  input CLK_0;
  input IPL0_0;
  input IPL1_0;
  input IPL2_0;
  input IRESET_0;

  wire CLK_0;
  wire IPL0_0;
  wire IPL1_0;
  wire IPL2_0;
  wire IRESET_0;

  design_1 design_1_i
       (.CLK_0(CLK_0),
        .IPL0_0(IPL0_0),
        .IPL1_0(IPL1_0),
        .IPL2_0(IPL2_0),
        .IRESET_0(IRESET_0));
endmodule
