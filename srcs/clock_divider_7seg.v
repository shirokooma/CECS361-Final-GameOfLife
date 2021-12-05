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


module clock_divider_7seg(
    input clk, //replace with clk from top
    output reg divided_clk
    );
localparam div_value = 4999;

integer counter_value = 0;

always@(posedge clk)
begin
    if(counter_value == div_value)
        counter_value <= 0;
    else
        counter_value <= counter_value +1;
end   

always@(posedge clk)
begin
    if(counter_value == div_value)
        divided_clk <= ~divided_clk;
    else
        divided_clk <= divided_clk;
end
endmodule