`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 07:23:07 AM
// Design Name: 
// Module Name: BCD_control
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


module BCD_control(
    input [3:0] digit1,
    input [3:0] digit2,
    input [3:0] digit3,
    input [3:0] digit4,
    input [3:0] digit5,
    input [3:0] digit6,
    input [3:0] digit7,
    input [3:0] digit8,
    input [1:0] refreshcounter,
    output reg [3:0] ONE_DIGIT = 0
    );
    
    always@(refreshcounter)
    begin
        case(refreshcounter)
            3'b000:
                ONE_DIGIT = digit1; //digit 1 ON (rightmost digit)
            3'b001:
                ONE_DIGIT = digit2; //digit 2 ON
            3'b010:
                ONE_DIGIT = digit3; //digit 3 ON
            3'b011:
                ONE_DIGIT = digit4; //digit 4 ON
            3'b100:
                ONE_DIGIT = digit5; //digit 5 ON
            3'b101:
                ONE_DIGIT = digit6; //digit 6 ON
            3'b110:
                ONE_DIGIT = digit7; //digit 7 ON
            3'b111:
                ONE_DIGIT = digit8; //digit 9 ON (leftmost character)
        endcase
    end

endmodule
