`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 04:46:08 PM
// Design Name: 
// Module Name: splitter1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module splitter1(
    d_in, out_in, d_out, d_out2
    );
    input [7:0] d_in;
    input [7:0] out_in;
    
    output d_out;
    output [14:0] d_out2;
    assign d_out = d_in[7];
    assign d_out2 = {d_in[6:0],out_in[7:0]} ;
endmodule
