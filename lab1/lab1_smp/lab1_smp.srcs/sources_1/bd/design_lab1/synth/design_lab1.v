//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Wed Oct 14 15:41:16 2020
//Host        : DESKTOP-PBR6R4O running 64-bit major release  (build 9200)
//Command     : generate_target design_lab1.bd
//Design      : design_lab1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_lab1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_lab1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_lab1.hwdef" *) 
module design_lab1
   ();

  wire bus_0_clk;
  wire bus_0_devsel_l;
  wire bus_0_trdy_l;
  wire [31:0]i21143_0_ad;
  wire [3:0]i21143_0_c_be_l;
  wire i21143_0_frame_l;
  wire i21143_0_irdy_l;

  design_lab1_bus_0_0 bus_0
       (.ad(i21143_0_ad),
        .c_be_l(i21143_0_c_be_l),
        .clk(bus_0_clk),
        .devsel_l(bus_0_devsel_l),
        .frame_l(i21143_0_frame_l),
        .irdy_l(i21143_0_irdy_l),
        .trdy_l(bus_0_trdy_l));
  design_lab1_i21143_0_0 i21143_0
       (.ad(i21143_0_ad),
        .c_be_l(i21143_0_c_be_l),
        .clk(bus_0_clk),
        .devsel_l(bus_0_devsel_l),
        .frame_l(i21143_0_frame_l),
        .irdy_l(i21143_0_irdy_l),
        .trdy_l(bus_0_trdy_l));
endmodule
