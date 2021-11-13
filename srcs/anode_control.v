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
input [2:0] refreshcounter,
output reg [6:0] anode = 0
    );
    
    always@(refreshcounter)
    begin
        case(refreshcounter)
            3'b000:
                anode = 7'b1111110; //character1 (rightmost character)
            3'b001:
                anode = 7'b1111101; //character2
            3'b010:
                anode = 7'b1111011; //character3
            3'b011:
                anode = 7'b1110111; //character4
            3'b100:
                anode = 7'b1101111; //character5
            3'b101:
                anode = 7'b1011111; //character6
            3'b110:
                anode = 7'b0111111; //character7 (leftmost character)
            default:
                anode = 7'b1111111; //no character
        endcase
    end
endmodule
