`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Califoria State University, Long Beach
// Engineer: Bronson Garel
// 
// Create Date: 11/11/2024 11:22:39 AM
// Design Name: 
// Module Name: snakeControl_tb
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


module snakeControl_tb();

reg clk, reset;
reg up, down, left, right;

wire [1:0] direction;

snakeControl uut(
    .clk(clk),
    .reset(reset),
    .up(up),
    .down(down),
    .left(left),
    .right(right),
    .direction(direction)
);

initial begin
    clk = 0;
    forever #50 clk = ~clk;
end

initial begin
    up = 0;
    down = 0;
    left = 0;
    right = 0;
    
    reset = 1;
    #10 reset = 0;
    #10;
    $display("Initial Direction (after reset): %b", direction); // Default set to UP (00)
    
    // Test moving DOWN (Should not change from UP)
    down = 1;
    #10 down = 0;
    #10;
    $display("Direction after DOWN (invalid move): %b", direction); // Expect UP (00)
    
    // Test moving RIGHT (valid move)
    right = 1;
    #10 right = 0;
    #10;
    $display("Direction after RIGHT: %b", direction); // Expect RIGHT (11)
    
    // Test moving LEFT (Should not change from RIGHT)
    left = 1;
    #10 left = 0;
    #10;
    $display("Direction after LEFT (invalid move): %b", direction); // Expect RIGHT (11)
    
    // Test moving DOWN (valid move)
    down = 1;
    #10 down = 0;
    #10;
    $display("Direction after DOWN: %b", direction); // Expect DOWN (01)
    
    // Test moving UP (invalid move)
    up = 1;
    #10 up = 0;
    #10;
    $display("Direction after UP (invalid move): %b", direction); // Expect DOWN (01)

    // Test moving LEFT (valid move)
    left = 1;
    #10 left = 0;
    #10;
    $display("Direction after LEFT: %b", direction); // Expect LEFT (10)
    
    // Test moving RIGHT (invalid move)
    right = 1;
    #10 right = 0;
    #10;
    $display("Direction after RIGHT (invalid move): %b", direction); // Expect LEFT (10)
    
    // Apply Reset, Direction = UP
    reset = 1;
    #10 reset = 0;
    #10;
    $display("Direction after reset: %b", direction); // Expect UP (00)
end

endmodule
