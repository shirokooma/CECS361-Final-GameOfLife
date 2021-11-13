`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2021 05:31:16 PM
// Design Name: 
// Module Name: clk_div_7seg
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


module clk_div_7seg(
input wire clk,
output reg divided_clk
    );
    
    localparam div_value = 4999;
    integer counter_value = 0;
    
    always@(posedge clk)
    begin 
        if (counter_value == div_value)
            counter_value <= 0; //reset value
        else
            counter_value <= counter_value+1;
    end
    
    always@(posedge clk)
    begin
        if(counter_value == div_value)
            divided_clk <= ~divided_clk;
        else
            divided_clk <= divided_clk;
    end
endmodule
