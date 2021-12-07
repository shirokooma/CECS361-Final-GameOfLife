`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 10:26:52 PM
// Design Name: 
// Module Name: top_counter_7seg_tb
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


module top_counter_7seg_tb();
reg clk = 0; //100Mhz
reg switch = 0;
wire [3:0] anode;
wire [7:0] cathode;

    top_counter_7seg uut (.clk(clk),.switch(switch),.anode(anode),.cathode(cathode));

    always #5 clk = ~clk;

    initial begin
        #500 switch = 1;
    end

endmodule
