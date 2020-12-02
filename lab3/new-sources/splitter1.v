`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2020 12:45:59 PM
// Design Name: 
// Module Name: chip_select_splitter
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
    d_in, d_out
    );
    input [0:31] d_in;
    output [0:7] d_out;
    
    assign d_out = d_in[0:7];
endmodule
