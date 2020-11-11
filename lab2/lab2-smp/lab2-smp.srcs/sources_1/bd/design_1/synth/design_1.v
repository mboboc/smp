//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
//Date        : Wed Nov 11 14:51:31 2020
//Host        : vivobook running 64-bit Ubuntu 20.04.1 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=5,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (CLK_0,
    H1_0,
    IPL0_0,
    IPL1_0,
    IPL2_0,
    IRESET_0,
    PA7_0,
    PC0_0,
    PC1_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN design_1_CLK_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input CLK_0;
  input H1_0;
  input IPL0_0;
  input IPL1_0;
  input IPL2_0;
  input IRESET_0;
  input PA7_0;
  input PC0_0;
  input PC1_0;

  wire CLK_0_1;
  wire Decadd_0_CSo;
  wire H1_0_1;
  wire IPL0_0_1;
  wire IPL1_0_1;
  wire IPL2_0_1;
  wire IRESET_0_1;
  wire [23:1]MC68000_0_A;
  wire [15:0]MC68000_0_D;
  wire MC68000_0_LDS;
  wire MC68000_0_RESET;
  wire MC68000_0_RW;
  wire MC68000_0_UDS;
  wire MC68230_0_DTACKi;
  wire PA7_0_1;
  wire PC0_0_1;
  wire PC1_0_1;
  wire [5:1]REG_0_Ao;
  wire [21:6]REG_0_Ao1;
  wire [7:0]splitter_0_f;

  assign CLK_0_1 = CLK_0;
  assign H1_0_1 = H1_0;
  assign IPL0_0_1 = IPL0_0;
  assign IPL1_0_1 = IPL1_0;
  assign IPL2_0_1 = IPL2_0;
  assign IRESET_0_1 = IRESET_0;
  assign PA7_0_1 = PA7_0;
  assign PC0_0_1 = PC0_0;
  assign PC1_0_1 = PC1_0;
  design_1_Decadd_0_0 Decadd_0
       (.Ai(REG_0_Ao1),
        .CLK(CLK_0_1),
        .CSo(Decadd_0_CSo),
        .LDSi(MC68000_0_LDS),
        .UDSi(MC68000_0_UDS));
  design_1_MC68000_0_1 MC68000_0
       (.A(MC68000_0_A),
        .CLK(CLK_0_1),
        .D(MC68000_0_D),
        .DTACK(MC68230_0_DTACKi),
        .IPL0(IPL0_0_1),
        .IPL1(IPL1_0_1),
        .IPL2(IPL2_0_1),
        .IRESET(IRESET_0_1),
        .LDS(MC68000_0_LDS),
        .RESET(MC68000_0_RESET),
        .RW(MC68000_0_RW),
        .UDS(MC68000_0_UDS));
  design_1_MC68230_0_0 MC68230_0
       (.CLK(CLK_0_1),
        .CS(Decadd_0_CSo),
        .D({splitter_0_f[7],splitter_0_f[6],splitter_0_f[5],splitter_0_f[4],splitter_0_f[3],splitter_0_f[2],splitter_0_f[1],splitter_0_f[0]}),
        .DTACKi(MC68230_0_DTACKi),
        .H1(H1_0_1),
        .PA7(PA7_0_1),
        .PC0(PC0_0_1),
        .PC1(PC1_0_1),
        .PC6(1'b0),
        .RESET(MC68000_0_RESET),
        .RSi(REG_0_Ao),
        .RW(MC68000_0_RW));
  design_1_REG_0_0 REG_0
       (.A(MC68000_0_A),
        .Ao(REG_0_Ao),
        .Ao1(REG_0_Ao1));
  design_1_splitter_0_0 splitter_0
       (.f(splitter_0_f),
        .m(MC68000_0_D));
endmodule
