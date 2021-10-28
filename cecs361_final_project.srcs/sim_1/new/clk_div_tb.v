`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2021 07:29:24 PM
// Design Name: 
// Module Name: clk_div_tb
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


module clk_div_tb();
    reg clk;
    wire clk4;
    
    clk_div uut(.clk(clk), .q(clk4));
    
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
        
    end
endmodule
