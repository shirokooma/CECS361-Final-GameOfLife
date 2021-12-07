`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Evan Nguyen
// 
// Create Date: 12/06/2021 07:42:25 PM
// Design Name: 
// Module Name: get_key_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Input stimuli for get_key module. Includes cathode, rgb color, key, and counter.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module get_key_tb();
    reg [3:0] key;
    wire [2:0] rgb;
    wire [7:0] cathode;
    wire out;
    
    integer i;
    
    get_key uut(.KEY(key), .RGB(rgb), .cathode(cathode));
    
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            key = i;
            #100;
        end
    end
endmodule
