`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Evan Nguyen
// 
// Create Date: 10/27/2021 06:37:42 PM
// Design Name: 
// Module Name: vga_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generic VGA controller for 640x480 @ 60hz. 
//              TO DO: condense, add more comments by 3rd progress report.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module vga_controller(
    //640x480 60Hz
    input pixel_clk, // get this from clk_div
    input reset,
    output reg hsync,
    output reg vsync,
    output reg inside_video,
    output [9:0] x_pos,
    output [8:0] y_pos 
    
    );
    // sync, backporch, video, front porch
    parameter HACTIVE = 10'd640;
    parameter HFP = 10'd16;
    parameter HSYN = 10'd96;
    parameter HBP = 10'd48;
    parameter HMAX = HACTIVE + HFP + HSYN + HBP;
    
    parameter VACTIVE = 10'd480;
    parameter VFP = 10'd11;
    parameter VSYN = 10'd2;
    parameter VBP = 10'd32;
    parameter VMAX = VACTIVE + VFP + VSYN + VBP;
    
    //onboard clk 100Mhz 100T
    //to generate 100Mhz clk divide by 4 to get 25Mhz
    
    reg [9:0] h_counter = 0;
    reg [9:0] v_counter = 0;
    reg v_enable = 0;
    
    // counters for horizontal and vertical pos
    always @(posedge pixel_clk or posedge reset) begin
        if (reset) begin
            h_counter <= 0;
        end else if (h_counter == HMAX -1) begin
            h_counter <= 0;
            v_enable <= 1;
        end else begin
            h_counter <= h_counter + 1'b1;
            v_enable <= 0;
        end
     end
     
     always @(*) begin
        if (h_counter < HSYN) begin
            hsync = 0;
        end else begin
            hsync = 1;
        end
     end
     
     always @(posedge pixel_clk or posedge reset) begin
        if (reset) begin
            v_counter <= 0;
        end else if (v_enable) begin
                    if (v_counter == VMAX - 1) begin
                        v_counter <= 0;
                    end else begin
                        v_counter <= v_counter + 1'b1;
                    end
        end
     end
     
     always @(*) begin 
        if (v_counter < VSYN) begin
            vsync = 0;
        end else begin
            vsync = 1;
        end
     end
     
     always @(*) begin
        if ((h_counter >= HBP) && (h_counter < HFP) && (v_counter >= VBP) && (v_counter < VFP)) begin
            inside_video = 1;
        end else begin
            inside_video = 0;
        end
     end
     
     assign x_pos = h_counter - HBP;
     assign y_pos = v_counter - VBP;
     
endmodule
