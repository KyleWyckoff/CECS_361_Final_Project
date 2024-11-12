`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California State University, Long Beach
// Engineer: Bronson Garel
// 
// Create Date: 11/11/2024 10:45:38 AM
// Design Name: 
// Module Name: button_debouncer_tb
// Project Name: Snake Game
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado 2024.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module button_debouncer_tb();

reg clk, reset;
reg button_in;
wire button_out;

button_debouncer uut(.clk(clk), .reset(reset), .button_in(button_in), .button_out(button_out));

initial begin
    clk = 0;
    forever #50 clk = ~clk; 
end

initial begin

    reset = 1;
    #10 reset = 0;
    #10;
    
    button_in = 0;
    #100;
    
    button_in = 1;
    #100;
    
end


endmodule
