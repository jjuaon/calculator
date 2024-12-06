`timescale 1ns / 1ps

module AgeCalculator(
    input clk,              // Clock signal
    input btnU,             // Button to increase the selected digit
    input btnD,             // Button to decrease the selected digit
    input btnL,             // Button to move to the left digit
    input btnR,             // Button to move to the right digit
    output reg [6:0] seg,   // Segment control for 7-segment display
    output reg [3:0] an     // Anode control for 4-digit display
);

    // Registers to store the digits
    reg [3:0] digits [3:0];    // Array for 4 digits (0-9)
    reg [1:0] current_digit;   // Currently selected digit (0-3)
    reg [17:0] debounce;       // Debounce counter
    reg [15:0] scan_clk;       // Scanning counter
    reg btnU_prev, btnD_prev, btnL_prev, btnR_prev;
    reg [1:0] scan_digit;      // Active digit for display scan

    // Initialize digits and variables
    initial begin
        digits[0] = 4'd0;
        digits[1] = 4'd0;
        digits[2] = 4'd0;
        digits[3] = 4'd0;
        current_digit = 2'd0;
        scan_digit = 2'd0;
        debounce = 18'd0;
        scan_clk = 16'd0;
    end

    // Debounce logic to avoid button bounce issues
    always @(posedge clk) begin
        debounce <= debounce + 1;
    end

    // Scanning logic for selecting which digit to display
    always @(posedge clk) begin
        scan_clk <= scan_clk + 1;
        if (scan_clk == 0) begin
            scan_digit <= scan_digit + 1; // Cycle through digits
        end
    end

    // Button detection and number update logic
    always @(posedge clk) begin
        if (debounce == 0) begin
            // Increment or decrement the currently selected digit
            if (btnU && !btnU_prev) begin
                if (digits[current_digit] < 9) 
                    digits[current_digit] <= digits[current_digit] + 1;
            end
            if (btnD && !btnD_prev) begin
                if (digits[current_digit] > 0) 
                    digits[current_digit] <= digits[current_digit] - 1;
            end

            // Move to the next digit (btnL -> swapped with btnR)
            if (btnL && !btnL_prev) begin
                if (current_digit < 3) 
                    current_digit <= current_digit + 1;
                else 
                    current_digit <= 0; // Wrap around to the first digit
            end

            // Move to the previous digit (btnR -> swapped with btnL)
            if (btnR && !btnR_prev) begin
                if (current_digit > 0) 
                    current_digit <= current_digit - 1;
                else 
                    current_digit <= 3; // Wrap around to the last digit
            end

            // Update button previous states for debounce
            btnU_prev <= btnU;
            btnD_prev <= btnD;
            btnL_prev <= btnL;
            btnR_prev <= btnR;
        end
    end

    // 7-segment display decoder
    always @(*) begin
        case (digits[scan_digit])
            4'd0: seg = 7'b1000000; // 0
            4'd1: seg = 7'b1111001; // 1
            4'd2: seg = 7'b0100100; // 2
            4'd3: seg = 7'b0110000; // 3
            4'd4: seg = 7'b0011001; // 4
            4'd5: seg = 7'b0010010; // 5
            4'd6: seg = 7'b0000010; // 6
            4'd7: seg = 7'b1111000; // 7
            4'd8: seg = 7'b0000000; // 8
            4'd9: seg = 7'b0010000; // 9
            default: seg = 7'b1111111; // All segments off
        endcase
    end

    // Enable the active digit for display
    always @(*) begin
        an = 4'b1111;          // Default: All digits off
        an[scan_digit] = 0;    // Activate the currently scanned digit
    end

endmodule
