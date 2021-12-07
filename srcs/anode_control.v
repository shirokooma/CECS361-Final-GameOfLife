`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2021 04:30:11 PM
// Design Name: 
// Module Name: anode_control
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


module anode_control(
input [1:0] refreshcounter,
output reg [3:0] anode = 0
    );
    
    always@(refreshcounter)
    begin
        case(refreshcounter)
            2'b00:
                anode = 4'b1110; //digit 1 ON (rightmost digit)
            2'b01:
                anode = 4'b1101; //digit 2 ON
            2'b10:
                anode = 4'b1011; //digit 3 ON
            2'b11:
                anode = 4'b0111; //digit 4 ON (leftmost character)
        endcase
    end
endmodule
