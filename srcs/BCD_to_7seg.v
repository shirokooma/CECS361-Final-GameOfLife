`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Everette Esguerra
// Create Date: 12/01/2021 08:03:37 PM
// Design Name: 
// Module Name: BCD_to_7seg
//////////////////////////////////////////////////////////////////////////////////


module BCD_to_7seg(
    input[3:0] Q,
    output reg [7:0] cathode = 0
    );
    always@(*)begin
        case(Q)
            4'b0000 : cathode = 8'b11000000; //zero
            4'b0001 : cathode = 8'b11111001; //one
            4'b0010 : cathode = 8'b10100100; //two
            4'b0011 : cathode = 8'b10110000; //three
            4'b0100 : cathode = 8'b10011001;//four
            4'b0101 : cathode = 8'b10010010; //five
            4'b0110 : cathode = 8'b10000010; //six
            4'b0111 : cathode = 8'b11111000; //seven
            4'b1000 : cathode = 8'b10000000; //eight
            4'b1001 : cathode = 8'b10010000; //nine
            default : cathode = 8'b01111111; //all other cases
        endcase
    end
endmodule
