`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Everette Esguerra
// Create Date: 12/01/2021 08:03:37 PM
// Design Name: 
// Module Name: BCD_to_7seg
//////////////////////////////////////////////////////////////////////////////////


module BCD_to_7seg(
    input[3:0] digit,
    output reg [7:0] cathode = 0
    );
    always@(*)begin
        case(digit)
            4'b0000 : cathode = 8'b0000_0011; //zero
            4'b0001 : cathode = 8'b1001_1111; //one
            4'b0010 : cathode = 8'b0010_0101; //two
            4'b0011 : cathode = 8'b0000_1101; //three
            4'b0100 : cathode = 8'b1001_1001;//four
            4'b0101 : cathode = 8'b0100_1001; //five
            4'b0110 : cathode = 8'b0100_0001; //six
            4'b0111 : cathode = 8'b0001_1111; //seven
            4'b1000 : cathode = 8'b0000_0001; //eight
            4'b1001 : cathode = 8'b0001_1001; //nine
            default : cathode = 8'b0111_1111; //all other cases
        endcase
    end
endmodule
