`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 03:45:39 AM
// Design Name: 
// Module Name: pattern_sel_tb
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


module pattern_sel_tb();
    reg in1;
    reg in0;
    reg [1:0] a;
    reg [1:0] b;
    reg [1:0] c;
    reg [1:0] d;
    wire [3:0] Q;
    wire [1:0] out_pattern;
    
    
    localparam period = 100;
    pattern_sel uut (.in1(in1),.in0(in0),.pattern_a(a),.pattern_b(b),.pattern_c(c),.pattern_d(d),.Q(Q),.out_pattern(out_pattern));
    
    initial begin
        in1 = 0;
        in0 = 0;
        a = 2'b00;
        b = 2'b01;
        c = 2'b10;
        d = 2'b11;
        #period;
        
        in1 = 0;
        in0 = 1;
        a = 2'b00;
        b = 2'b01;
        c = 2'b10;
        d = 2'b11;
        #period;
        
        in1 = 1;
        in0 = 0;
        a = 2'b00;
        b = 2'b01;
        c = 2'b10;
        d = 2'b11;
        #period;
        
        in1 = 1;
        in0 = 1;
        a = 2'b00;
        b = 2'b01;
        c = 2'b10;
        d = 2'b11;
        #period;
        
        $finish;
        
    end

endmodule
