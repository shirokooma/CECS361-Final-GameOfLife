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


module vertical_counter(
       input clk,
       input v_count_enable,
       output reg [15:0] v_count = 0
    );
    
    always @ (posedge clk) begin
        if (v_count_enable) begin    //keep counting until 525
                if (v_count < 525)
                    v_count <= v_count + 1;
                else v_count <= 0;                           // reset vert count
        end
    end
endmodule
