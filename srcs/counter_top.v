`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2021 10:17:39 AM
// Design Name: 
// Module Name: counter_top
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


module counter_top(
    input clk,
    input reset,
    output wire [7:0] anode,
    output wire [7:0] cathode
);
    wire [26:0] counter;
    wire [15:0] displayed_number;
    wire [3:0] digit_bcd;
    wire [19:0] refresh_counter;
    wire [1:0] digit_activating_counter;
    
    
    iteration_counter i_counter(.clk(clk),.reset(reset),.displayed_number(displayed_number),.counter(counter));
    refresh_counter_digit_activate refresh_counter_wrap(.clk(clk),.reset(reset),.refresh_counter(refresh_counter),.digit_activating_counter(digit_activating_counter));
    digit_select select(.digit_activating_counter(digit_activating_counter),.displayed_number(displayed_number),.anode(anode),.digit_bcd(digit_bcd));
    BCD_to_7seg BCD(.digit(digit_activating_counter),.cathode(cathode));


endmodule
