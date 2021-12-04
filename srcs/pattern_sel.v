`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Evan Nguyen
// 
// Create Date: 11/12/2021 12:38:43 PM
// Design Name: 
// Module Name: pattern_sel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Gets a 2 bit user input and outputs a 4 bit signal to choose a pattern. Essentially a 4 to 1 mux
//              where the user controls the select line and chooses 1 of 4 patterns as an input to the algorithm.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pattern_sel(
    input in1, // msb switch 
    input in0,
    input pattern_a, // Glider
    input pattern_b, // Blinker
    input pattern_c, // Beacon
    input pattern_d, // Acorn
    output out_pattern
    );
    
    assign out_pattern = in1 ? ( in0 ? pattern_d : pattern_c) : (in0 ? pattern_b : pattern_a);
    
endmodule