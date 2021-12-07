`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 06:47:08 PM
// Design Name: 
// Module Name: binary_to_bcd_tb
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


module binary_to_bcd_tb();
    reg clk = 0;
    reg [7:0] eight_bit_value = 0;
    wire [3:0] ones;
    wire [3:0] tens;
    wire [3:0] hundreds;
    
    binary_to_bcd uut (.clk(clk),.eight_bit_value(eight_bit_value),.ones(ones),.tens(tens),.hundreds(hundreds));
    
    always #5 clk = ~clk;
    initial begin
        eight_bit_value = 0;
        #500;
        eight_bit_value = 769;
        #500;
        eight_bit_value = 999;
        #500;
        eight_bit_value = 234;
        #500;
        eight_bit_value = 10;
        #500;
        eight_bit_value = 238;
        #500;
        eight_bit_value = 149;
    end

    
    
endmodule
