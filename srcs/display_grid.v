`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 12:35:34 AM
// Design Name: 
// Module Name: display_grid
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

module display_grid(cells, x, y, r, g, b);
    input [0:64*48-1] cells;
    input [9:0] x, y;
    output [4:0] r, g, b; // this outptus rgb

    // x and y change at a fast rate;
    // the colour of the pixel at the current (x, y) coordinates is determined by RGB
    reg [11:0] RGB;
    always @(x or y) begin
        // row = y / 10
        // column = x / 10
        // cell = (row * 64) + column

        // Find the cell index using `(y / 10) * 64 + (x / 10)`. See pseudocode above.
        if (cells[(y / 10) * 64 + (x / 10)]) begin
            // The cell that covers this (x, y) coordinate is alive, so turn on the pixel on
            RGB = 12'b111111111111;
        end else begin
            // The cell that covers this (x, y) coordinate is dead, so turn on the pixel off
            RGB = 12'b000000000000;
        end
    end
    assign r = RGB[11:8];
    assign g = RGB[7:4];
    assign b = RGB[3:0];

endmodule