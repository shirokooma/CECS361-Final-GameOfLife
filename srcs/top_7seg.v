`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2021 05:45:51 PM
// Design Name: 
// Module Name: top_7seg
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


module top_7seg(
input wire clk,
output wire [3:0] anode,
output wire [7:0] cathode
    );
    
    wire refreshclock;
    wire [2:0] refreshcounter;
    wire [3:0] ONE_DIGIT;
    clock_divider refresh_clock_generator(.clk(clk),.divided_clk(refresh_clock));
    
    refreshcounter refresh_counter_wrapper(.refresh_clock(refresh_clock),.refreshcounter(refreshcounter));
    
    anode_control anode_control_wrapper(.refreshcounter(refreshcounter),.anode(anode));
    
    character_control character_control_wrapper(.char1(),.char2(),.char3(),.char4(),.char5(),.char6(),.char7(),.ONE_DIGIT(ONE_DIGIT));
endmodule
