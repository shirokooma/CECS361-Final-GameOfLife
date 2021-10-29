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
    reg reset;
    wire clk4;
    
    clk_div uut(.clk(clk),.reset(reset), .q(clk4));
    
    always #10 clk = ~clk;
    
    initial begin
        clk = 0;
        reset = 1;
        #10
        reset = 0;       
    end
endmodule
