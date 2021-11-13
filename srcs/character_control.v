`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2021 04:54:04 PM
// Design Name: 
// Module Name: character_control
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


module character_control(
input [6:0] char1,
input [6:0] char2,
input [6:0] char3,
input [6:0] char4,
input [6:0] char5,
input [6:0] char6,
input [6:0] char7,
input [2:0] refreshcounter,
output reg [3:0] ONE_CHAR = 0
    );
    
    
    always@(refreshcounter)
    begin
        case(refreshcounter)
            3'd0:
                ONE_CHAR = char1; //character1 value(rightmost character)
            3'd1:
                ONE_CHAR = char2; //character2 value
            3'd2:
                ONE_CHAR = char3; //character3 value
            3'd3:
                ONE_CHAR = char4; //character4 value
            3'd4:
                ONE_CHAR = char5; //character5 value
            3'd5:
                ONE_CHAR = char6; //character6 value
            3'd6:
                ONE_CHAR = char7; //character7 value (leftmost character)
        endcase
    end
endmodule
