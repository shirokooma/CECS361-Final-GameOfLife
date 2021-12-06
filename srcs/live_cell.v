`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Evan Nguyen
// 
// Create Date: 11/30/2021 12:34:16 AM
// Design Name: 
// Module Name: live_cell
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Create a cell with specified neighbors, clock, reset, init state, and current state. Revision
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module live_cell(neighbours, clk, use_enable, Rst, initial_state, state);
    input [7:0] neighbours;
    input clk;
    input use_enable;
    input Rst;
    input initial_state;
    output reg state;
 
    wire [3:0] population;
    wire next_state;

    // population is the count of neighbouring cells that are alive (i.e. on)
    assign population = neighbours[7] + 
                        neighbours[6] +
                        neighbours[5] +
                        neighbours[4] +
                        neighbours[3] +
                        neighbours[2] +
                        neighbours[1] +
                        neighbours[0];
    
    // next_state is the next state (alive or dead) of this cell
    assign next_state = (population == 2 & state) | population == 3;
    
    //wire enable;
    //wire use_enable;
    
    //clk_en clk_en(.clk(clk), .en(enable));
    //dff_en dff_en(.DFF_CLK(clk), .clock_en(enable), .Q(use_enable));
    
    always @(posedge clk or negedge Rst) begin
        if (use_enable == 1) begin
            if (!Rst) begin
                // When reset fires, return this cell to its initial state
                state = initial_state;
            end else begin
                // call dff_w_en
                // When the clock fires, bring this cell to its next state
                state = next_state;
            end
        end
    end
endmodule

