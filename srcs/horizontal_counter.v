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
module horizontal_counter(
       input clk,
       input use_enable,
       output reg v_count_enable = 0,
       output reg [15:0] h_count = 0
    );
    
    //wire enable;
    //wire use_enable;
    
    //clk_en clk_en(.clk(clk), .en(enable));
    //dff_en dff_en(.DFF_CLK(clk), .clock_en(enable), .Q(use_enable));
    
    always @ (posedge clk) begin
        if (use_enable == 1) begin
            if (h_count < 800)                        // from spec sheet
                begin 
                    h_count <= h_count + 1;
                    v_count_enable <= 0;              // disable vert counter
                end 
            else 
                begin
                    h_count <= 0;                     // reset horiz count
                    v_count_enable <= 1;              // enable vert counter
                end
         end
    end
endmodule
