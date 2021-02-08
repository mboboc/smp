//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
//Date        : Wed Jan 20 14:21:01 2021
//Host        : vivobook running 64-bit Ubuntu 20.04.1 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=9,numReposBlks=9,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=9,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (oe_0);
  input oe_0;

  wire [7:0]Net;
  wire [5:0]Net1;
  wire Net2;
  wire Net3;
  wire [7:0]PIC16F873_0_portc;
  wire T74LS04_0_outt;
  wire [7:0]T74LS373_0_outh;
  wire [7:0]m62256_0_dat;
  wire [7:0]m62256_1_dat;
  wire oe_0_1;
  wire [7:0]select_0_d_out;
  wire [14:0]splitter1_0_d_out2;
  wire splitter2_0_d_out;

  assign oe_0_1 = oe_0;
  design_1_PIC16F873_0_0 PIC16F873_0
       (.porta(Net1),
        .portb(Net),
        .portbw(select_0_d_out),
        .portc(PIC16F873_0_portc));
  design_1_T74LS04_0_0 T74LS04_0
       (.inn(Net3),
        .outt(T74LS04_0_outt));
  design_1_T74LS373_0_0 T74LS373_0
       (.dat(Net),
        .le(splitter2_0_d_out),
        .oe(oe_0_1),
        .outh(T74LS373_0_outh));
  design_1_m62256_0_0 m62256_0
       (.adr(splitter1_0_d_out2),
        .ce(Net3),
        .dat(m62256_0_dat),
        .datw(Net),
        .oe(Net2),
        .we(Net3));
  design_1_m62256_0_1 m62256_1
       (.adr(splitter1_0_d_out2),
        .ce(T74LS04_0_outt),
        .dat(m62256_1_dat),
        .datw(Net),
        .oe(Net2),
        .we(T74LS04_0_outt));
  design_1_select_0_0 select_0
       (.d_in1(m62256_1_dat),
        .d_in2(m62256_0_dat),
        .d_out(select_0_d_out),
        .not_in(T74LS04_0_outt),
        .oe(Net2));
  design_1_splitter1_0_0 splitter1_0
       (.d_in(PIC16F873_0_portc),
        .d_out(Net3),
        .d_out2(splitter1_0_d_out2),
        .out_in(T74LS373_0_outh));
  design_1_splitter2_0_0 splitter2_0
       (.d_in(Net1),
        .d_out(splitter2_0_d_out));
  design_1_splitter3_0_0 splitter3_0
       (.d_in(Net1),
        .d_out(Net2));
endmodule
