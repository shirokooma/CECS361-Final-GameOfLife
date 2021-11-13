`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2021 05:04:23 PM
// Design Name: 
// Module Name: char_to_cathodes
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


module char_to_cathodes(
    input [3:0] char,
    output reg [7:0] cathode = 0
    );
    
    always@(char)
    begin
        case(char) 
        4'd0:
            cathode = 8'b0000_1001; //g
        4'd1:
            cathode = 8'b1110_0011; //L
        4'd2:
            cathode = 8'b1111_0111; //i   
        4'd3:
            cathode = 8'b1000_0101; //d   
        4'd4:
            cathode = 8'b0110_0001; //E    
        4'd5:
            cathode = 8'b1111_0101; //r       
        4'd6:
            cathode = 8'b1100_0001; //b        
        4'd7:
            cathode = 8'b0001_0001; //A          
        4'd8:
            cathode = 8'b1101_0101; //n
        4'd9:
            cathode = 8'b0101_0001; //k      
        4'd10:
            cathode = 8'b1100_0101; //o           
        4'd11:
            cathode = 8'b1110_0101; //c        
    endcase
end
          
endmodule
