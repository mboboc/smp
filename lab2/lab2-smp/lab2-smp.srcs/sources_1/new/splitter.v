`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 03:13:25 PM
// Design Name: 
// Module Name: splitter
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


module splitter(m, f, l);
input [15:0] m;

output [7:0] f;
output [15:8] l;

assign f = m[7:0];
assign l = m[15:8];

endmodule
