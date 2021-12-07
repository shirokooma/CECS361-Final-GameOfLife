`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Evan Nguyen & Everette Esguerra
// 
// Create Date: 12/06/2021 08:21:26 PM
// Design Name: 
// Module Name: get_key_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Input driver. Gets switches, and outputs LED and 7seg.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module get_key_top(
    input [3:0] key_top,
    output [7:0] cathode_top,
    output [7:0] anode_top,
    output [2:0] RGB_top
    );
        
    get_key gk(.KEY(key_top), .RGB(RGB_top), .cathode(cathode_top));
    
    assign anode_top = 8'b11111110;

endmodule
