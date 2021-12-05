`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 04:50:47 PM
// Design Name: 
// Module Name: top_7seg_tb
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


module top_7seg_tb();
    reg in1;
    reg in0;
    reg [1:0] pattern_a; // Glider
    reg [1:0] pattern_b; // Blinker
    reg [1:0] pattern_c; // Beacon
    reg [1:0] pattern_d;
    wire [7:0] cathode;
    wire [7:0] anode;
    
    localparam period = 50;
    top_7seg uut(.in1(in1),.in0(in0),.pattern_a(pattern_a),.pattern_b(pattern_b),.pattern_c(pattern_c),.pattern_d(pattern_d),.cathode(cathode),.anode(anode));
    
    initial begin
    in1 = 0;
    in0 = 0;
    #period;   

    in1 = 0;
    in0 = 1;
    #period;   

    in1 = 1;
    in0 = 0;
    #period;   

    in1 = 1;
    in0 = 1;
    #period;
    
    end   

endmodule
