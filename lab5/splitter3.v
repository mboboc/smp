`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 04:46:08 PM
// Design Name: 
// Module Name: splitter3
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


module splitter3(
    d_in, d_out
    );
    input [5:0] d_in;
    output d_out;
    
    assign d_out = d_in[1];
endmodule