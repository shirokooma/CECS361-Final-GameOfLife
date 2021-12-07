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

//counter based clk div
//div value = 100Mhz/(2*desired freguency) - 1 ==> 10khz ==> 4999
module clock_divider_7seg #(parameter div_value = 4999)(//global parameter
    input clk, //100Mhz
    output reg divided_clk = 0//10 kHz
    );

integer counter_value = 0; //32 bit wide reg bus

//counter
always@(posedge clk)
begin
    //keep counting undtil div val
    if(counter_value == div_value)
        counter_value <= 0; // reset the counter_value
    else
        counter_value <= counter_value +1; //count up
end   

//clock div
always@(posedge clk)
begin
    if(counter_value == div_value)
        divided_clk <= ~divided_clk; //flip signal
    else
        divided_clk <= divided_clk;//store value
end
endmodule