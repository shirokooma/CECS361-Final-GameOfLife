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
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_div(
    input clk,
    input reset,
    output q
    );
    
    wire d0;
    wire d1;
    reg q0;
    reg q1;
    
    always @(posedge clk or negedge reset) begin
        if (reset)
            q0 <= 1'b0;
        else 
            q0 <= d0;
    end
    assign d0 = ~q0;
    
    always @(posedge q0 or negedge reset) begin
        if (reset)
            q1 <= 1'b0;
        else
            q1 <= d1;
    end
    
    assign d1 =  ~q1;
    assign q = q1;
            
    
endmodule
