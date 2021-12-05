`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2021 07:09:45 PM
// Design Name: 
// Module Name: clk_div
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Divides 100 MHz clock to 25MHz for 640x480 sample @ 60Hz
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module clk_div(Clk_100M, q);

    input Clk_100M;
    output q;

reg [1:0] m;
initial m = 0;

always @(posedge Clk_100M) begin
    m <= m + 1;
    end
    
    assign q = m[1];
    
endmodule
