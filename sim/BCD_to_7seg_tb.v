`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 03:38:06 AM
// Design Name: 
// Module Name: BCD_to_7seg_tb
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


module BCD_to_7seg_tb();
reg [3:0] Q_tb;
wire [7:0] cathode_tb;

BCD_to_7seg uut(.Q(Q_tb),.cathode(cathode_tb));
integer i;

initial begin
	for(i=0;i<11;i=i+1)begin
		Q_tb=i;
		#50;
	end
	$finish;
end
endmodule