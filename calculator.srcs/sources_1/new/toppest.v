`timescale 1ns / 1ps

module toppest(
    input clk,              // Clock input
    input btnL,             // Left button to navigate left
    input btnR,             // Right button to navigate right
    input btnC,             // Center button to select mode
    output [6:0] seg,   // Segments for 7-segment display
    output [3:0] an,     // Enable signals for 4-digit display
    output [15:0] led,
    output dp
    );
    wire [2:0] mode;
    reg [7:0] aDot;
    reg [28:0] bDot;
   
    displayDec displayDec_inst (
        .clk(clk),
        .btnL(btnL),
        .btnR(btnR),
        .bDot(bDot),
        .aDot(aDot),
        .seg(seg),            // Driven by displayDec
        .an(an),              // Driven by displayDec
        .led(led),            // Driven by displayDec
        .dp(dp)               // Driven by displayDec
    );

    // Instantiate the main module (controls mode only)
    main main_inst (
        .clk(clk),
        .btnL(btnL),
        .btnR(btnR),
        .btnC(btnC),
        .mode(mode)           // Drives the mode wire
    );
    
    always @(mode) begin
        case(mode)
            3'b001: begin 
                bDot = {1'b1, 28'd98778943}; // Example data
                aDot = 8'd25; // Example data            
            end
            3'b010: begin 
                bDot = {1'b1, 28'd98778943}; // Example data
                aDot = 8'd25; // Example data            end
            end
            3'b011: begin
                bDot = {1'b1, 28'd98778943}; // Example data
                aDot = 8'd25; // Example data            end
            
            end
            3'b100: begin
                bDot = {1'b1, 28'd98778943}; // Example data
                aDot = 8'd25; // Example data            end
            
            end
            3'b101: begin
                bDot = {1'b1, 28'd98778943}; // Example data
                aDot = 8'd25; // Example data            end
            
            end
        endcase
    end
endmodule
