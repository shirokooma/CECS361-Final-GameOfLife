`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 06:44:56 AM
// Design Name: 
// Module Name: iteration_counter
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


module iteration_counter(
    input clk, //replace with clk from top
    output reg [3:0] Q
    );
    
    reg [26:0] counter;
        always@(posedge clk) begin
        if(counter == 27'd100000000)begin
            counter <= 27'b0 ;
            if(Q < 9)
                Q <= Q + 1'b1;
        else
            Q <= 4'b0;
        end
        else
            counter <= counter + 1'b1;
        end
endmodule
