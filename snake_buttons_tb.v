`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Califoria State University, Long Beach
// Engineer: Bronson Garel
// 
// Create Date: 11/11/2024 10:45:38 AM
// Design Name: 
// Module Name: snake_buttons_tb
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


module snake_buttons_tb();

// Inputs
reg clk, reset;
reg btn1, btn2, btn3, btn4;

// Outputs
wire [1:0] direction;

snake_buttons uut(
    .clk(clk), 
    .reset(reset), 
    .btn1(btn1), 
    .btn2(btn2),
    .btn3(btn3),
    .btn4(btn4),
    .direction(direction)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns Clock Period
end

// Testing
initial begin
    reset = 1;
    btn1 = 0;
    btn2 = 0;
    btn3 = 0;
    btn4 = 0;
    
    #20 reset = 0;
    
    // Test UP
    btn1 = 1;
    #50 btn1 = 0;  // Short pulse
    #100;  // Wait to see the direction update
    $display("Direction after UP button: %b", direction);  // Expect UP (00)

    // Test RIGHT
    btn4 = 1;
    #50 btn4 = 0;  // Short pulse
    #100;  // Wait to see the direction update
    $display("Direction after RIGHT button: %b", direction);  // Expect RIGHT (11)

    // Test DOWN
    btn2 = 1;
    #50 btn2 = 0;  // Short pulse
    #100;  // Wait to see the direction update
    $display("Direction after DOWN button: %b", direction);  // Expect DOWN (01)

    // Test LEFT
    btn3 = 1;
    #50 btn3 = 0;  // Short pulse
    #100;  // Wait to see the direction update
    $display("Direction after LEFT button: %b", direction);  // Expect LEFT (10)

    // Test invalid move: LEFT immediately after RIGHT
    btn4 = 1;  // Move RIGHT
    #50 btn4 = 0;
    #100;  // Wait for direction to settle
    btn3 = 1;  // Try moving LEFT
    #50 btn3 = 0;
    #100;
    $display("Direction after invalid LEFT move: %b", direction);  // Should stay RIGHT (11)

    // Test reset functionality
    reset = 1;
    #20 reset = 0;
    #100;
    $display("Direction after reset: %b", direction);  // Expect default direction, likely UP (00)

    $stop;
end
    

endmodule
