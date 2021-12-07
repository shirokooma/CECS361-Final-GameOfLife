`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2021 10:06:38 AM
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
    input clk,
    input reset,
    output reg [15:0] displayed_number,
    output reg [26:0] counter
    );
    
    wire enable;
    
    always @(posedge clk or posedge reset)
    begin
        if(reset==1)
            counter <= 0;
        else begin
            if(counter>=99999999) 
                 counter <= 0;
            else
                counter <= counter + 1;
        end
    end 
    assign enable = (counter==99999999)?1:0;
    always @(posedge clk or posedge reset)
    begin
        if(reset==1)
            displayed_number <= 0; 
        else if(enable==1)
            displayed_number <= displayed_number + 1;
    end
endmodule
