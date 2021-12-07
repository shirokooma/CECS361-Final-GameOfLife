`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Evan Nguyen & Everette Esguerra
// 
// Create Date: 12/06/2021 07:13:53 PM
// Design Name: 
// Module Name: get_key
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Gets switch input, checks its validity. If VALID, output green LED and output seed number
//              If NOT VALID, out red LED.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module get_key(
    input [3:0] KEY,
    output reg out1,
    output reg [2:0] RGB,
    output reg [7:0] cathode
    );
      
   always @(KEY) begin
    case(KEY)
        4'b0001 : begin 
                    out1 = 1'b1;            // valid
                    RGB = 3'b010;           // green
                    cathode = 8'b10011111; // 1
                 end
        4'b0010 : begin 
                    out1 = 1'b1;            // valid
                    RGB = 3'b010;           // green
                    cathode = 8'b00100101; // 2
                 end
        4'b0100 : begin 
                    out1 = 1'b1;            // valid
                    RGB = 3'b010;           // green
                    cathode = 8'b00001101; // 3
                 end
        4'b1000 : begin 
                    out1 = 1'b1;            // valid
                    RGB = 3'b010;           // green
                    cathode = 8'b10011001; // 4
                 end
        default : begin 
                    out1 = 0;               // any other case is not valid
                    RGB = 3'b001;           // red bc invalid
                    cathode = 8'b00000011;  // 0
                  end
    endcase     
   end
   /*
   always @(*) begin
    if (out1) 
        RGB = 3'b010;
    else 
        RGB = 3'b001;
    end
   */
endmodule
