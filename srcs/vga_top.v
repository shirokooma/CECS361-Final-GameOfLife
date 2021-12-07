`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Evan Nguyen
// 
// Create Date: 12/04/2021 01:47:44 PM
// Design Name: 
// Module Name: horizontal_counter
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

module vga_top (
        input clk,
        input use_enable,
        output hsync_vga,
        output vsync_vga,
        output [3:0] r_vga, 
        output [3:0] g_vga,
        output [3:0] b_vga
    );

    wire v_count_enable_vga;
    wire [15:0] h_count_vga;
    wire [15:0] v_count_vga;
    
    // USE A UNIVERSAL CLK, in all POSEDGE. Drive each ALWAYS block with
    // the use of CLOCK_ENABLE to drive its action.
    //wire enable;
    
    //clk_en clk_en(.clk(clk), .en(use_enable));
    //clk_div div(.clk(clk), .en(use_enable));
    //dff_en dff_en(.DFF_CLK(clk), .clock_en(enable), .Q(use_enable));
    
    horizontal_counter  vga_horiz(.clk(clk), .use_enable(use_enable), .v_count_enable(v_count_enable_vga), .h_count(h_count_vga));
    vertical_counter    vga_vert(.clk(clk),  .use_enable(use_enable), .v_count_enable(v_count_enable_vga), .v_count(v_count_vga));
    
    // outputs
    assign hsync_vga = (h_count_vga < 96) ? 1'b1 : 1'b0; // as soon as hco
    assign vsync_vga = (v_count_vga < 2) ? 1'b1 : 1'b0;
    // colors
    assign r_vga = (h_count_vga < 784 && h_count_vga > 143 && v_count_vga < 515 && v_count_vga > 34) ? 4'hF : 4'h0;
    assign b_vga = (h_count_vga < 784 && h_count_vga > 143 && v_count_vga < 515 && v_count_vga > 34) ? 4'hF : 4'h0;
    assign g_vga = (h_count_vga < 784 && h_count_vga > 143 && v_count_vga < 515 && v_count_vga > 34) ? 4'hF : 4'h0;

endmodule