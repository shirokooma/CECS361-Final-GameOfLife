`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 07:49:15 AM
// Design Name: 
// Module Name: top_7seg_controller
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


module top_7seg_controller(
    input wire clk,
    input wire [7:0] switch,
    input wire [3:0] button,
    output wire [3:0] anode,
    output wire [7:0] cathode
    );
    
    wire refreshclock;
    wire [1:0] refreshcounter;
    wire [3:0] ONE_DIGIT;
    
    clock_divider_7seg refreshclock_generator(.clk(clk),.divided_clk(refreshclock));
    
    refreshcounter refreshcounter_wrapper(.refresh_clock(refresh_clock),.refreshcounter(refreshcounter));
    
    anode_control anode_control_wrapper(.refreshcounter(refreshcounter),.anode(anode));
    
    BCD_control BCD_control_wrapper(.digit1(),.digit2(),.digit3(),.digit4(),.digit5(),.digit6(),.digit7(),.digit8(),.refreshcounter(refreshcounter),.ONE_DIGIT(ONE_DIGIT));
    
    BCD_to_7seg BCD_to_7seg_wrapper(.Q(ONE_DIGIT),.cathode(cathode));
endmodule
