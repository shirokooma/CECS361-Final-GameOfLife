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
    input wire counter_clock_signal, //replace with clk from top
    input wire switch, //use switch to turn on and off the counter
    output reg [7:0] counter = 0
    );
    
    always@(posedge counter_clock_signal, posedge switch) begin
        if (switch == 0)begin
            counter <= counter;
        end
        if (switch == 1)begin
            counter <= counter + 1;
        end
    end
endmodule
