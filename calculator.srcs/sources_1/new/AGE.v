`timescale 1ns / 1ps

module AgeCalculator(
    input clk,                // Clock input
    input btnU,               // Increment button
    input btnD,               // Decrement button
    input btnL,               // Move to the next digit (SWAPPED)
    input btnR,               // Move to the previous digit (SWAPPED)
    output reg [6:0] seg,     // 7-segment display outputs
    output reg [3:0] an       // Enable for 7-segment display
);

    // Internal signals
    reg [3:0] digits [2:0];   // Store values for 3 right digits (0-9)
    reg signed [3:0] left_digit; // Left-most digit [-1 (for '-') to 9]
    reg [1:0] current_digit;  // Currently selected digit (0-3)
    reg [17:0] debounce;      // Debounce counter
    reg btnU_prev, btnD_prev, btnL_prev, btnR_prev;
    reg [1:0] scan_digit;     // Active digit for display scan (0-3)
    wire refresh_clk;         // Refresh clock output from SegRefreshRate

    // Instantiate SegRefreshRate for the refresh clock
    SegRefreshRate refresh_rate (
        .clk(clk),
        .clk_out(refresh_clk)
    );

    // Initialize digits and variables
    initial begin
        digits[0] = 4'd0;
        digits[1] = 4'd0;
        digits[2] = 4'd0;
        left_digit = 0; // Start with 0 for the left-most digit
        current_digit = 2'd0;
        scan_digit = 2'd0;
        debounce = 18'd0;
        btnU_prev = 0;
        btnD_prev = 0;
        btnL_prev = 0;
        btnR_prev = 0;
    end

    // Debounce logic
    always @(posedge clk) begin
        debounce <= debounce + 1;
    end

    // Scanning logic using SegRefreshRate
    always @(posedge refresh_clk) begin
        scan_digit <= scan_digit + 1; // Cycle through the 4 digits
    end

    // Button detection and number update
    always @(posedge clk) begin
        if (debounce == 0) begin
            // Increment or decrement the currently selected digit
            if (btnU && !btnU_prev) begin
                if (current_digit == 3) begin
                    if (left_digit < 9) 
                        left_digit <= left_digit + 1; // Increment left-most digit
                    else 
                        left_digit <= -1; // Wrap to negative sign
                end else if (digits[current_digit] < 9) begin
                    digits[current_digit] <= digits[current_digit] + 1;
                end
            end
            if (btnD && !btnD_prev) begin
                if (current_digit == 3) begin
                    if (left_digit > -1) 
                        left_digit <= left_digit - 1; // Decrement left-most digit
                    else 
                        left_digit <= 9; // Wrap to 9
                end else if (digits[current_digit] > 0) begin
                    digits[current_digit] <= digits[current_digit] - 1;
                end
            end

            // Move to the next digit (btnL -> swapped)
            if (btnL && !btnL_prev) begin
                if (current_digit < 3) 
                    current_digit <= current_digit + 1;
                else 
                    current_digit <= 0; // Wrap around to the first digit
            end

            // Move to the previous digit (btnR -> swapped)
            if (btnR && !btnR_prev) begin
                if (current_digit > 0) 
                    current_digit <= current_digit - 1;
                else 
                    current_digit <= 3; // Wrap around to the last digit
            end

            // Update button previous states
            btnU_prev <= btnU;
            btnD_prev <= btnD;
            btnL_prev <= btnL;
            btnR_prev <= btnR;
        end
    end

    // 7-segment display decoder
    always @(*) begin
        if (scan_digit == 3) begin
            // Handle left-most digit (for the -1 case, we show a '-')
            case (left_digit)
                -1: seg = 7'b1111110; // '-' symbol (middle horizontal segment)
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
        end else begin
            // Handle digits 0-2
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
    end

    // Enable the active digit for display
    always @(*) begin
        an = 4'b1111;          // Default: All digits off
        an[scan_digit] = 0;    // Activate the currently scanned digit
    end

endmodule
