`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2021 12:45:30 PM
// Design Name: 
// Module Name: seven_segment_LED_display_controller
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


module seven_segment_LED_display_controller(
input clock_100Mhz, // 100 Mhz clock source on Basys 3 FPGA
input reset, // reset
output reg [7:0] anode, // anode signals of the 7-segment LED display
output reg [7:0] cathode// cathode patterns of the 7-segment LED display
);
reg [26:0] one_second_counter; // counter for generating 1 second clock enable
wire one_second_enable;// one second enable for counting numbers
reg [15:0] displayed_number; // counting number to be displayed
reg [3:0] LED_BCD;
reg [19:0] refresh_counter; // 20-bit for creating 10.5ms refresh period or 380Hz refresh rate
         // the first 2 MSB bits for creating 4 LED-activating signals with 2.6ms digit period
wire [1:0] LED_activating_counter; 
             // count     0    ->  1  ->  2  ->  3
          // activates    LED1    LED2   LED3   LED4
         // and repeat
always @(posedge clock_100Mhz or posedge reset)
begin
    if(reset==1)
        one_second_counter <= 0;
    else begin
        if(one_second_counter>=99999999) 
             one_second_counter <= 0;
        else
            one_second_counter <= one_second_counter + 1;
    end
end 
assign one_second_enable = (one_second_counter==99999999)?1:0;
always @(posedge clock_100Mhz or posedge reset)
begin
    if(reset==1)
        displayed_number <= 0;
    else if(one_second_enable==1)
        displayed_number <= displayed_number + 1;
end
always @(posedge clock_100Mhz or posedge reset)
begin 
    if(reset==1)
        refresh_counter <= 0;
    else
        refresh_counter <= refresh_counter + 1;
end 
assign LED_activating_counter = refresh_counter[19:18];
// anode activating signals for 4 LEDs, digit period of 2.6ms
// decoder to generate anode signals 
always @(*)
begin
    case(LED_activating_counter)
    2'b00: begin
        anode = 8'b1111_0111; 
        // activate LED1 and Deactivate LED2, LED3, LED4
        LED_BCD = displayed_number/1000;
        // the first digit of the 16-bit number
          end
    2'b01: begin
        anode = 8'b1111_1011;
        // activate LED2 and Deactivate LED1, LED3, LED4
        LED_BCD = (displayed_number % 1000)/100;
        // the second digit of the 16-bit number
          end
    2'b10: begin
        anode = 8'b1111_1101;
        // activate LED3 and Deactivate LED2, LED1, LED4
        LED_BCD = ((displayed_number % 1000)%100)/10;
        // the third digit of the 16-bit number
            end
    2'b11: begin
        anode = 8'b1111_1110; 
        // activate LED4 and Deactivate LED2, LED3, LED1
        LED_BCD = displayed_number[3:0];
        // the fourth digit of the 16-bit number    
           end
    default : begin
        anode = 8'b1111_1110; //defaut to first digit
        LED_BCD = ((displayed_number % 1000)%100)%10;
        end

    endcase
end
// Cathode patterns of the 7-segment LED display 
always @(*)
begin
    case(LED_BCD)
    4'b0000 : cathode = 8'b0000_0011; //zero
    4'b0001 : cathode = 8'b1001_1111; //one
    4'b0010 : cathode = 8'b0010_0101; //two
    4'b0011 : cathode = 8'b0000_1101; //three
    4'b0100 : cathode = 8'b1001_1001;//four
    4'b0101 : cathode = 8'b0100_1001; //five
    4'b0110 : cathode = 8'b0100_0001; //six
    4'b0111 : cathode = 8'b0001_1111; //seven
    4'b1000 : cathode = 8'b0000_0001; //eight
    4'b1001 : cathode = 8'b0001_1001; //nine
    default : cathode = 8'b0111_1111; //all other cases
    endcase
end
endmodule