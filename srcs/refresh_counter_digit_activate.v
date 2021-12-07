`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Everette Esguerra
// 
// Create Date: 12/07/2021 08:47:09 AM
// Design Name: 
// Module Name: refresh_counter_digit_activate
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Refresh period is needed as the four seven segments need to continously refresh at about 1KHz-10Hz
//              (1ms-16ms) to avoid discontinuity percieved by human eye after.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module refresh_counter_digit_activate(
    input clk,
    input reset,
    output reg [19:0] refresh_counter, // first 18-bits used to create 2.6 ms digit period, other bits used for digit active signals
    output [1:0] digit_activating_counter //used to select active digits from digit 1 through 4
                                        //  0 - > 1   -> 2   -> 3 
                                        //dig1   dig2   dig3   dig4
    );
    always @(posedge clk or posedge reset) begin
        if (reset)
        refresh_counter <= 0;
        else
        refresh_counter <= refresh_counter + 1;
    end
    assign digit_activating_counter = refresh_counter[19:18];
endmodule
