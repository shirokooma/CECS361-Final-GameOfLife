`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 05:02:02 PM
// Design Name: 
// Module Name: clock_divider_7seg_tb
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


module clock_divider_7seg_tb();
    reg clk = 0; //100Mhz
    wire divided_clk; //10 kHz
    
    //clk div wrapper
    clock_divider_7seg uut (.clk(clk),.divided_clk(divided_clk));
    
    always #5 clk = ~clk; //every 5ns signal flips => 10 ns period => 100Mhz    
endmodule
