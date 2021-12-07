`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Everette Esguerra
// 
// Create Date: 12/07/2021 09:32:50 AM
// Design Name: 
// Module Name: digit_select
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: //Utilizes decoder to pick anode signals that will choose which digit to display.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module digit_select(
    input [1:0] digit_activating_counter,
    input [15:0] displayed_number,
    output reg [7:0] anode,
    output reg [3:0] digit_bcd
    );
    always @(*) begin
        case(digit_activating_counter)
        2'b00: begin
            anode = 8'b1111_1110; //first digit
            digit_bcd = displayed_number[15:11]; //1st digit of 16-bit displayed number
               end
        2'b01: begin
            anode = 8'b1111_1101; //second digit
            digit_bcd = displayed_number[10:8]; //2nd digit of 16-bit displayed number
               end
        2'b10: begin
            anode = 8'b1111_1011; //third digit
            digit_bcd = displayed_number[7:4]; //3rd digit of 16-bit displayed number
               end
        2'b11: begin
            anode = 8'b1111_0111; //fourth digit
            digit_bcd = displayed_number[3:0]; //4th digit of 16-bit displayed number
               end
        default : begin
            anode = 8'b1111_1110; //defaut to first digit
            digit_bcd = displayed_number[15:11];
               end
        endcase
    end
endmodule
