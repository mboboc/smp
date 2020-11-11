`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 03:42:15 PM
// Design Name: 
// Module Name: test
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


module test();
    reg IRESET_0, IPL0_0, IPL1_0, IPL2_0, CLK_0, PA7_0, H1_0, PC0_0, PC1_0;

    design_1_wrapper sim_lab1
    (CLK_0,
    H1_0,
    IPL0_0,
    IPL1_0,
    IPL2_0,
    IRESET_0,
    PA7_0,
    PC0_0,
    PC1_0);
    
    initial begin
	   CLK_0 = 0;
	   IRESET_0 = 1;
	   IPL0_0 = 0;
	   IPL1_0 = 0;
	   IPL2_0 = 0;
	   PA7_0 = 0;
	   H1_0 = 0;
	   PC0_0 = 0;
	   PC1_0 = 0;
	   
	   #10;
	   IRESET_0 = 0;
	   
	   #20;
	   H1_0 = 1;
	   PC1_0 = 1;
	   	   
	   #60;
	   PC1_0 = 0;
	   
	   #60;
	   H1_0 = 0;
	   PC1_0 = 0;
	   
	   #100 $stop;
	   
    end
    
    always #5 CLK_0 = ~CLK_0;
endmodule
