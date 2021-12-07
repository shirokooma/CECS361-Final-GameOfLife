`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 04:27:29 PM
// Design Name: 
// Module Name: top_7seg
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


module top_7seg(
    input in1,
    input in0,
    input [1:0] pattern_a, // Glider
    input [1:0] pattern_b, // Blinker
    input [1:0] pattern_c, // Beacon
    input [1:0] pattern_d,
    output[7:0] cathode,
    output [7:0] anode
    );
    
    assign anode = 8'b1111_1110;
    wire [3:0] Q;
    wire [1:0] out_pattern;
    
    BCD_to_7seg
        BCD(.Q(Q),.cathode(cathode));
    
    pattern_sel
        sel(.in1(in1),.in0(in0),.pattern_a(pattern_a),.pattern_b(pattern_b),.pattern_c(pattern_c),.pattern_d(pattern_d),.Q(Q),.out_pattern(out_pattern));
        
endmodule
