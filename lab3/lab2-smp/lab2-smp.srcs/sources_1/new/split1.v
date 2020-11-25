`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 03:27:14 PM
// Design Name: 
// Module Name: split1
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


module split1(
    input [0:7]data,
    output [0:7]o07,
    output o7
    );
    
    assign o07 = data;
    assign o7 = data[7];
endmodule
