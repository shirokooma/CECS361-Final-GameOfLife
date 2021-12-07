`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 04:11:00 PM
// Design Name: 
// Module Name: seven_seg_controller
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



module seven_seg_controller(
    input wire refresh_clk,
    input wire [3:0] ones,
    input wire [3:0] tens,
    input wire [3:0] hundreds,
    output wire [3:0] anode,
    output wire [7:0] cathode
    );
    
    wire [1:0] refresh_counter;
    wire [3:0] ONE_DIGIT;
  
    refreshcounter refreshcounter_wrapper(.refresh_clock(refresh_clock),.refreshcounter(refreshcounter));
    
    anode_control anode_control_wrapper(.refreshcounter(refreshcounter),.anode(anode));
    
    BCD_control BCD_control_wrapper(.digit1(ones),.digit2(tens),.digit3(hundreds),.digit4(4'd0),.refresh_counter(refresh_counter),.ONE_DIGIT(ONE_DIGIT));
    
    BCD_to_7seg BCD_to_7seg_wrapper(.Q(ONE_DIGIT),.cathode(cathode));
endmodule
