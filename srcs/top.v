`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2021 11:39:23 PM
// Design Name: 
// Module Name: top
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


module top(
           input clk,
           input [3:0] Key,
           output [3:0] r_top, g_top, b_top, // taken as display_grid's output 
           output hsync_top, vsync_top
    );
    
    wire x_pos_top, y_pos_top; // outputted from vga_controler -> input to GOL
    wire r_top, g_top, b_top; // GOL output -> display grid -> outputted to this wire for use in TOP output to VGA
    wire clk_25;
    
    clk_div clk_div(.clk(clk), .reset(), .q(clk_25));
    vga_controller vga(.pixel_clk(clk_25), .reset(), .inside_video(), .hsync(hsync_top), .vsync(vsync_top), .x_pos(x_pos_top), .y_pos(y_pos_top));
    game_of_life gol(.KEY(Key), .CLOCK_25(clk_25), .x(x_pos_top), .y(y_pos_top), .r(r_top), .g(g_top), .b(b_top));
    
endmodule
