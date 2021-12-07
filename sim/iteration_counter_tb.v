`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2021 05:49:06 PM
// Design Name: 
// Module Name: iteration_counter_tb
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


module iteration_counter_tb();
    reg counter_clock_signal = 0;
    reg switch = 0;
    wire [7:0] counter;
    
    iteration_counter uut (.counter_clock_signal(counter_clock_signal),.switch(switch),.counter(counter));
  
    always #10 counter_clock_signal = ~counter_clock_signal;
    initial begin
        #50 switch = 0;
        #50 switch = 1;
        #50 switch = 0;
        #50 switch = 1;
        #500;
        $finish;
    end
endmodule
