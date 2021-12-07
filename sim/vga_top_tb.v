`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2021 02:11:11 PM
// Design Name: 
// Module Name: vga_top_tb
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


module vga_top_tb();

    reg clk_tb = 0;
    wire hsync_vga_tb;
    wire vsync_vga_tb;
    wire [3:0] r_vga_tb;
    wire [3:0] g_vga_tb;
    wire [3:0] b_vga_tb;
    
    vga_top uut (.clk(clk_tb), .hsync_vga(hsync_vga_tb), .vsync_vga(vsync_vga_tb),
                .r_vga(r_vga_tb), .g_vga(g_vga_tb), .b_vga(b_vga_tb));
    always #10 clk_tb = ~clk_tb;
endmodule
