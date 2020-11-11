//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
//Date        : Wed Nov 11 14:51:32 2020
//Host        : vivobook running 64-bit Ubuntu 20.04.1 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (CLK_0,
    H1_0,
    IPL0_0,
    IPL1_0,
    IPL2_0,
    IRESET_0,
    PA7_0,
    PC0_0,
    PC1_0);
  input CLK_0;
  input H1_0;
  input IPL0_0;
  input IPL1_0;
  input IPL2_0;
  input IRESET_0;
  input PA7_0;
  input PC0_0;
  input PC1_0;

  wire CLK_0;
  wire H1_0;
  wire IPL0_0;
  wire IPL1_0;
  wire IPL2_0;
  wire IRESET_0;
  wire PA7_0;
  wire PC0_0;
  wire PC1_0;

  design_1 design_1_i
       (.CLK_0(CLK_0),
        .H1_0(H1_0),
        .IPL0_0(IPL0_0),
        .IPL1_0(IPL1_0),
        .IPL2_0(IPL2_0),
        .IRESET_0(IRESET_0),
        .PA7_0(PA7_0),
        .PC0_0(PC0_0),
        .PC1_0(PC1_0));
endmodule
