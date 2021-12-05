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
                anode = 8'b1111_1110; //digit 1 ON (rightmost digit)
            3'b001:
                anode = 8'b1111_1101; //digit 2 ON
            3'b010:
                anode = 8'b1111_1011; //digit 3 ON
            3'b011:
                anode = 8'b1111_0111; //digit 4 ON
            3'b100:
                anode = 8'b1110_1111; //digit 5 ON
            3'b101:
                anode = 8'b1101_1111; //digit 6 ON
            3'b110:
                anode = 8'b1011_1111; //digit 7 ON
            3'b111:
                anode = 8'b0111_1111; //digit 9 ON (leftmost character)
        endcase
    end
endmodule
