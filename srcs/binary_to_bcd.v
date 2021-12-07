`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 08:38:14 AM
// Design Name: 
// Module Name: binary_to_bcd
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


module binary_to_bcd(
    input clk,
    input [7:0] eight_bit_value,
    output reg [3:0] ones = 0,
    output reg [3:0] tens = 0,
    output reg [3:0] hundreds = 0
    );
    
    reg [3:0] i = 0; //keeps track of iteration number in code
    reg [19:0] shift_register = 0;
    //temporary registers
    reg [3:0] temp_hundreds = 0;
    reg [3:0] temp_tens = 0;
    reg [3:0] temp_ones = 0;
    
    reg [7:0] OLD_eight_bit_value = 0; //store [7:0] eight_bit_value here until [7:0] eight_bit_value changes
    
    always@(posedge clk)
    begin
        //if eight_bit_val changes only then execute the following statement
        if (i == 0 & (OLD_eight_bit_value != eight_bit_value)) begin
            shift_register = 20'd0; //initialize shift register to 0
            //assign current eight_bit_value to the OLD_eight_bit_value
            OLD_eight_bit_value = eight_bit_value;
            //out 8-bit counter value into the lower 8 bit range of the shift register
            shift_register [7:0] = eight_bit_value;
            
            temp_hundreds = shift_register[19:16];
            temp_tens = shift_register[15:12];
            temp_ones = shift_register[11:8];
            i = i + 1;
        end
        //double dabble algorithm
        if (i < 9 & i > 0) begin
            //check if temporary ones, tens, or hundreds are greater or equal to 5
            //algorithm implemented so that different 7 segs will display different digits while counting
            if (temp_hundreds >=5) temp_hundreds = temp_hundreds + 3;
            if (temp_tens >=5) temp_tens = temp_tens + 3;
            if (temp_ones >=5) temp_ones = temp_ones + 3;
            
            //put temporary hundreds tens and ones into top 12 bit range of shift register
            shift_register [19:8] = {temp_hundreds, temp_tens, temp_ones};
            //now shift left by 1
            shift_register = shift_register << 1;
            //noew set the new values to temporary hundreds tens and ones again
            temp_hundreds = shift_register[19:16];
            temp_tens = shift_register[15:12];
            temp_ones = shift_register[11:8];
            i = i + 1; //continue until i = 9
        end
        if (i == 9) begin
            i = 0;
            //assign temporary values to actual outputs after binary to BCD conversion is complete
            hundreds = temp_hundreds;
            tens = temp_tens;
            ones = temp_ones;
        end
   end
endmodule
