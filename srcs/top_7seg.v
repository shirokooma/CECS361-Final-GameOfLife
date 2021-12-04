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
    output[7:0] cathode,
    output [7:0] anode
    );
    
    assign anode = 8'b1111_1110;
    wire [3:0] Q;
    
    BCD_to_7seg
        BCD(.Q(Q),.cathode(cathode));
    
    pattern_sel
        sel(.in1(in1),.in0(in0),.Q(Q));
endmodule
