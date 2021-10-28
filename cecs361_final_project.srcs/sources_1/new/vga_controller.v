`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2021 06:37:42 PM
// Design Name: 
// Module Name: vga_controller
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

module vga_controller(
    //640x480 60Hz
    input pixel_clk,
    output reg hsync,
    output reg vsync,
    output reg [9:0] x_pos,
    output reg [8:0] y_pos 
    
    );
    //onboard clk 100Mhz 100T
    //to generate 100Mhz clk divide by 4 to get 25Mhz
endmodule
