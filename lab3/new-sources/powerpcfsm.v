
// File        : C:\MicroSys\Lab3_SM\PowerPCInterf\lab3M\compile\powerpcfsm.v
// Generated   : 03/16/05 14:07:12
// From        : C:\MicroSys\Lab3_SM\PowerPCInterf\lab3M\src\powerpcfsm.asf
// By          : FSM2VHDL ver. 3.0.4.1

`timescale 1ns / 1ps

module powerpcfsm (AACK, ARTRY, A, BG, BR, CLK, DBG, DH, DL, TA, TBST, TS, TSIZ, TT, WT);
input   AACK;
input   BG;
input   CLK;
input   DBG;
input   TA;
output  BR;
output  WT;
input   ARTRY;
output   [0:31]A;
output   [0:31]DH;
output   [0:31]DL;
output   TBST;
output   TS;
output   [0:2]TSIZ;
inout   [0:4]TT;

wire    AACK;
tri     ARTRY;
reg     ino_ARTRY;
tri     [0:31]A;
reg     [0:31]ino_A;
wire    BG;
reg     BR;
wire    CLK;
wire    DBG;
tri     [0:31]DH;
reg     [0:31]ino_DH;
tri     [0:31]DL;
reg     [0:31]ino_DL;
wire    TA;
tri     TBST;
reg     ino_TBST;
tri     TS;
reg     ino_TS;
tri     [0:2]TSIZ;
reg     [0:2]ino_TSIZ;
tri     [0:4]TT;
reg     [0:4]ino_TT;
reg     WT;

// BINARY ENCODED state machine: Sreg0
// State codes definitions:
`define Cerere_bus 3'b000
`define Fara_date 3'b001
`define S1 3'b010
`define Transmisie_adresa 3'b011
`define Transmisie_date 3'b100

reg [2:0]CurrState_Sreg0, NextState_Sreg0;

// Diagram actions (continuous assignments allowed only: assign ...)
//diagram ACTIONS


//--------------------------------------------------------------------
// Machine: Sreg0
//--------------------------------------------------------------------
// machine variables declarations
reg  [0:4]Trans;
//----------------------------------
// NextState logic (combinatorial)
//----------------------------------
always @ (TBST or TSIZ or ARTRY or BG or DBG or CurrState_Sreg0)
begin : Sreg0_NextState
	NextState_Sreg0 <= CurrState_Sreg0;
	// Set default values for outputs and signals
	// ... 
	case (CurrState_Sreg0)	// synopsys parallel_case full_case
		`Cerere_bus:
		begin
			BR<=1'b0;
			ino_A <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			ino_DH <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			ino_TT <= "ZZZZZ";
			ino_TBST <= TBST;
			ino_TSIZ <= TSIZ;
			ino_TS <= 1'b1;
			ino_ARTRY <= ARTRY;
			if (BG==1'b0)
				NextState_Sreg0 <= `Transmisie_adresa;
			else if (BG!=1'b0)
				NextState_Sreg0 <= `Cerere_bus;
		end
		`Fara_date:
		begin
			ino_DH <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			BR<=1'bZ;
			NextState_Sreg0 <= `S1;
		end
		`S1:
		begin
			BR<=1'bZ;
			ino_A <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			ino_DH <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			ino_TT <= "ZZZZZ";
			NextState_Sreg0 <= `Cerere_bus;
		end
		`Transmisie_adresa:
		begin
			Trans <= "00010";
			BR<=1'b1;
			ino_TS <= 1'b0;
			ino_A <= "10101010101010101010101010101000";
			ino_DH <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			ino_TT <= "00010";
			ino_TBST <= 1'b1;
			ino_TSIZ <= "001";
			WT<=1'b0;
			if (DBG!=1'b0)
			begin
				NextState_Sreg0 <= `Fara_date;
				BR<=1'b0;
				ino_TS <= 1'b0;
			end
			else if (DBG==1'b0)
			begin
				NextState_Sreg0 <= `Transmisie_date;
				BR<=1'b0;
				ino_TS <= 1'b0;
			end
		end
		`Transmisie_date:
		begin
			 ino_DH <= "10101010000000000000000000000000";
			BR<=1'bZ;
			NextState_Sreg0 <= `S1;
		end
	endcase
end

//----------------------------------
// Current State Logic (sequential)
//----------------------------------
always @ (posedge CLK)
begin : Sreg0_CurrentState
	CurrState_Sreg0 <= NextState_Sreg0;
end

initial CurrState_Sreg0 <= `S1;
// Copy temporary registers to target inout ports
assign A = ino_A;
assign DH = ino_DH;
assign TT = ino_TT;
assign TBST = ino_TBST;
assign TSIZ = ino_TSIZ;
assign TS = ino_TS;
assign ARTRY = ino_ARTRY;

endmodule