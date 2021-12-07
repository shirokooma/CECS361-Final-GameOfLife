`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 04:19:15 PM
// Design Name: 
// Module Name: top_counter_7seg
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


module top_counter_7seg(
    input wire clk,
    input wire switch,
    output wire [3:0] anode,
    output wire [7:0] cathode
    );
    
    wire refresh_clock;
    wire counter_clock_signal;
    wire [7:0] eight_bit_counter_value;
    wire [3:0] ones;
    wire [3:0] tens;
    wire [3:0] hundreds;
    
    //wrapper for clock divider
    clock_divider_7seg #(4999) refreshclock_generator(.clk(clk),.divided_clk(refresh_clock));
    clock_divider_7seg #(4999999) counterclock_generator(.clk(clk),.divided_clk(counter_clock_signal));
    
    iteration_counter eight_bit_counter (.counter_clock_signal(counter_clock_signal),.switch(switch),.counter(eight_bit_counter_value));
    
    binary_to_bcd convert_binary_to_BCD(.clk(clk),.eight_bit_value(eight_bit_counter_value),.ones(ones),.tens(tens),.hundreds(hundreds));
    
    seven_seg_controller SSD_controller(.refresh_clk(refresh_clock), .ones(ones), .tens(tens), .hundreds(hundreds), .anode(anode), .cathode(cathode));
endmodule
