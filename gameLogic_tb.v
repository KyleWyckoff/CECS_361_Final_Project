`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Califoria State University, Long Beach
// Engineer: Bronson Garel
// 
// Create Date: 11/11/2024 11:22:39 AM
// Design Name: 
// Module Name: gameLogic_tb
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

module gameLogic_tb;

    // Testbench signals
    reg clk_tb, reset_tb, up_tb, down_tb, left_tb, right_tb;
    wire game_over_tb;
    wire [499:0] snake_x_flat_tb, snake_y_flat_tb;
    wire [7:0] snakeLength_tb;
    wire [9:0] foodX_tb, foodY_tb;

    // Instantiate 
    gameLogic UUT (
        .clk(clk_tb),
        .reset(reset_tb),
        .up(up_tb),
        .down(down_tb),
        .left(left_tb),
        .right(right_tb),
        .game_over(game_over_tb),
        .snake_x_flat(snake_x_flat_tb),
        .snake_y_flat(snake_y_flat_tb),
        .snakeLength(snakeLength_tb),
        .foodX(foodX_tb),
        .foodY(foodY_tb)
    );

    // Clock generation: 50MHz clock (20ns period)
    initial begin
        clk_tb = 0;
        forever #10 clk_tb = ~clk_tb;  // Toggle every 10ns
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset_tb = 1;  // Assert reset
        up_tb = 0;
        down_tb = 0;
        left_tb = 0;
        right_tb = 0;

        #100;  // Wait for 100ns
        reset_tb = 0;  // De-assert reset

        // Simulate right movement
        #100;
        right_tb = 1;
        #100;
        right_tb = 0;

        // Simulate upward movement
        #100;
        up_tb = 1;
        #100;
        up_tb = 0;

        // Simulate food collection
        #1000;
        // Assuming snake moves to food position at some point

        // Simulate collision with wall for game over
        #2000;  // Let the snake move close to bounds
        $display("Simulating collision with wall...");
        
        // End simulation
        #1000;
        $stop;
    end

    // Monitor key signals
    initial begin
        $monitor("Time: %0dns | game_over: %b | snakeLength: %d | foodX: %d | foodY: %d", 
                 $time, game_over_tb, snakeLength_tb, foodX_tb, foodY_tb);
    end

endmodule
