`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2024 02:56:48 PM
// Design Name: 
// Module Name: displayBin
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// This module displays a binary number across the 7-segment displays and allows
// sliding through the digits using the btnL and btnR buttons.
//
// Dependencies: SegRefreshRate module
// 
// Revision:
// Revision 0.02 - Added btnL and btnR functionality
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module SevenSegmentSlide(
    input clk, btnL, btnR,              // Clock and button inputs
    input [28:0] bDot,                 // 29-bit binary number input
    input [7:0] aDot,                  // 8-bit binary number input
    output reg [6:0] seg,              // 7-segment display segments
    output reg [3:0] an,               // 7-segment display anode signals
    output reg [15:0] led              // Debug LEDs
);
    wire rr;                           // Refresh rate signal for multiplexing
    reg [3:0] refresh_counter;         // Counter for digit multiplexing
    reg [3:0] digit_value;             // Current digit value to display
    reg [4:0] display_index = 0;       // Current sliding window index
    reg [3:0] active_digit;            // Digit value based on sliding window

    // Concatenate bDot and aDot into a single displayable value
    wire [36:0] full_value = {bDot, aDot}; // 29 + 8 bits = 37 bits total

    // Instantiate refresh rate generator
    SegRefreshRate refresh_rate_gen (
        .clk(clk),
        .clk_out(rr)
    );

    // Refresh counter for digit multiplexing
    always @(posedge rr) begin
        refresh_counter <= (refresh_counter == 4'b0011) ? 4'b0000 : refresh_counter + 1; // Loop through 4 digits
    end

    // Control logic for sliding using btnL and btnR
    always @(posedge clk) begin
        if (btnL && display_index > 0) begin
            display_index <= display_index - 1; // Slide left
        end else if (btnR && display_index < (37 - 4)) begin
            display_index <= display_index + 1; // Slide right
        end
    end

    // Select the current digit to display based on the sliding window
    always @(*) begin
        case (refresh_counter)
            4'b0000: begin
                active_digit = full_value[display_index];
                an = 4'b1110; // Activate first digit
            end
            4'b0001: begin
                active_digit = full_value[display_index + 1];
                an = 4'b1101; // Activate second digit
            end
            4'b0010: begin
                active_digit = full_value[display_index + 2];
                an = 4'b1011; // Activate third digit
            end
            4'b0011: begin
                active_digit = full_value[display_index + 3];
                an = 4'b0111; // Activate fourth digit
            end
            default: begin
                active_digit = 4'b0000; // Default blank
                an = 4'b1111; // Turn off all segments
            end
        endcase
    end

    // 7-segment encoding for the current digit
    always @(active_digit) begin
        case (active_digit)
            4'b0000: seg = 7'b1000000; // 0
            4'b0001: seg = 7'b1111001; // 1
            4'b0010: seg = 7'b0100100; // 2
            4'b0011: seg = 7'b0110000; // 3
            4'b0100: seg = 7'b0011001; // 4
            4'b0101: seg = 7'b0010010; // 5
            4'b0110: seg = 7'b0000010; // 6
            4'b0111: seg = 7'b1111000; // 7
            4'b1000: seg = 7'b0000000; // 8
            4'b1001: seg = 7'b0010000; // 9
            default: seg = 7'b1111111; // Blank
        endcase
    end

    // LED debugging to show current display index
    always @(posedge clk) begin
        led <= {11'b0, display_index};
    end

endmodule
