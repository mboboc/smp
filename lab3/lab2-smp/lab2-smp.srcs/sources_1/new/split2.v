`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 03:30:28 PM
// Design Name: 
// Module Name: split2
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


module split2(
    input [0:31]data,
    output [0:7]o07,
    output [0:31]o31
    );
    
    assign o07 = data[0:7];
    assign o31 = data;
endmodule

