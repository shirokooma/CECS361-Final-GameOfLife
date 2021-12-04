`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2021 07:09:45 PM
// Design Name: 
// Module Name: clk_div
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Divides 100 MHz clock to 25MHz for 640x480 sample @ 60Hz
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module clk_div ( 
                input clk,
                input reset,
                output q
);
    
     
    reg [1:0] r_reg;
    wire [1:0] r_nxt;
    reg clk_track;
     
    always @(posedge clk or posedge reset)
     
    begin
      if (reset)
         begin
            r_reg <= 3'b0;
        clk_track <= 1'b0;
         end
     
      else if (r_nxt == 2'b10)
           begin
             r_reg <= 0;
             clk_track <= ~clk_track;
           end
     
      else 
          r_reg <= r_nxt;
    end
 
 assign r_nxt = r_reg+1;   	      
 assign clk_out = clk_track;
 
endmodule
