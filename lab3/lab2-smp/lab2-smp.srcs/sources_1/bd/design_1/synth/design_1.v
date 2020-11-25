//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
//Date        : Wed Nov 25 17:41:16 2020
//Host        : vivobook running 64-bit Ubuntu 20.04.1 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=5,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (CLK_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN design_1_CLK_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input CLK_0;

  wire CLK_0_1;
  wire mpc106fsm_0_AACK;
  wire mpc106fsm_0_ARTRY;
  wire mpc106fsm_0_BG0;
  wire [0:7]mpc106fsm_0_CS;
  wire mpc106fsm_0_DBG0;
  wire [0:31]mpc106fsm_0_DH;
  wire mpc106fsm_0_SDCAS;
  wire [0:11]mpc106fsm_0_SDMA;
  wire mpc106fsm_0_SDRAS;
  wire mpc106fsm_0_TA;
  wire mpc106fsm_0_WE;
  wire [0:31]powerpcfsm_0_A;
  wire powerpcfsm_0_BR;
  wire [0:31]powerpcfsm_0_DL;
  wire powerpcfsm_0_TBST;
  wire powerpcfsm_0_TS;
  wire [0:2]powerpcfsm_0_TSIZ;
  wire powerpcfsm_0_WT;
  wire split1_0_o7;
  wire [0:7]split2_0_o07;

  assign CLK_0_1 = CLK_0;
  design_1_mpc106fsm_0_0 mpc106fsm_0
       (.A(powerpcfsm_0_A),
        .AACK(mpc106fsm_0_AACK),
        .ARTRY(mpc106fsm_0_ARTRY),
        .BG0(mpc106fsm_0_BG0),
        .BR0(powerpcfsm_0_BR),
        .CLK(CLK_0_1),
        .CS(mpc106fsm_0_CS),
        .DBG0(mpc106fsm_0_DBG0),
        .DH(mpc106fsm_0_DH),
        .DL(powerpcfsm_0_DL),
        .SDCAS(mpc106fsm_0_SDCAS),
        .SDMA(mpc106fsm_0_SDMA),
        .SDRAS(mpc106fsm_0_SDRAS),
        .TA(mpc106fsm_0_TA),
        .TBST(powerpcfsm_0_TBST),
        .TS(powerpcfsm_0_TS),
        .TSIZ(powerpcfsm_0_TSIZ),
        .WE(mpc106fsm_0_WE),
        .WT(powerpcfsm_0_WT));
  design_1_mx9_sdram_0_0 mx9_sdram_0
       (.A(mpc106fsm_0_SDMA),
        .CAS(mpc106fsm_0_SDCAS),
        .CLK(CLK_0_1),
        .CS(split1_0_o7),
        .DQ(split2_0_o07),
        .RAS(mpc106fsm_0_SDRAS),
        .WE(mpc106fsm_0_WE));
  design_1_powerpcfsm_0_0 powerpcfsm_0
       (.A(powerpcfsm_0_A),
        .AACK(mpc106fsm_0_AACK),
        .ARTRY(mpc106fsm_0_ARTRY),
        .BG(mpc106fsm_0_BG0),
        .BR(powerpcfsm_0_BR),
        .CLK(CLK_0_1),
        .DBG(mpc106fsm_0_DBG0),
        .DL(powerpcfsm_0_DL),
        .TA(mpc106fsm_0_TA),
        .TBST(powerpcfsm_0_TBST),
        .TS(powerpcfsm_0_TS),
        .TSIZ(powerpcfsm_0_TSIZ),
        .WT(powerpcfsm_0_WT));
  design_1_split1_0_0 split1_0
       (.data(mpc106fsm_0_CS),
        .o7(split1_0_o7));
  design_1_split2_0_0 split2_0
       (.data(mpc106fsm_0_DH),
        .o07(split2_0_o07));
endmodule
