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
    input [3:0] digit1, //ones place // right most digit
    input [3:0] digit2, //tens
    input [3:0] digit3, //hundreds
    input [3:0] digit4, //thousands // left most digit
    input [1:0] refresh_counter,
    output reg [3:0] ONE_DIGIT = 0
    );
    
    always@(refresh_counter)
    begin
        case(refresh_counter)
            2'b00:
                ONE_DIGIT = digit1; //digit 1 value (rightmost digit)
            2'b01:
                ONE_DIGIT = digit2; //digit 2 value
            2'b10:
                ONE_DIGIT = digit3; //digit 3 value
            2'b11:
                ONE_DIGIT = digit4; //digit 4 value (leftmost character)
        endcase
    end

endmodule
