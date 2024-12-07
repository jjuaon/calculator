module Calculator(
    input clk,                    // System clock input
    input reset,                  // Reset signal
    input up,                     // Button to increase the digit
    input down,                   // Button to decrease the digit
    input left,                   // Button to move left (higher place value)
    input right,                  // Button to move right (lower place value)
    input center,                 // Button to confirm selection (for A, B, or operation)
    output [6:0] segments,        // 7-segment display for active digit
    output reg [7:0] digit_select // Active digit indicator (for 8 digits)
);

    reg [31:0] A, B, ANS;         // 32-bit registers for input A, B, and the result (ANS)
    reg [31:0] active_number;     // Active number (A, B, or ANS) for 8 digits
    reg [2:0] digit_index;        // Points to the current digit (0-7, for 8 digits)
    reg [3:0] current_digit;      // Value of the selected digit
    reg [1:0] state;              // State for the calculator: inputting A, operator, or inputting B
    reg [1:0] operation;          // 00: +, 01: -, 10: *, 11: /
    reg is_negative;              // Flag to indicate if the number is negative
    reg [15:0] clock_divider;     // Clock divider for debounce
    wire slow_clk;                // Slow clock for debouncing and simulation purposes

    // Clock divider for slow clock (debounce)
    always @(posedge clk) begin
        clock_divider <= clock_divider + 1;
    end
    assign slow_clk = clock_divider[15]; // Generate slow clock

    // 7-Segment Decoder for Display (assuming a separate module for segment decoding)
    SevenSegDecoder segment_decoder (
        .binary(current_digit),
        .segments(segments)
    );

    // State machine to control the flow: A input -> operator selection -> B input -> output result
    always @(posedge slow_clk or posedge reset) begin
        if (reset) begin
            A <= 0;
            B <= 0;
            ANS <= 0;
            active_number <= 0;
            digit_index <= 0;
            is_negative <= 0;
            state <= 2'b00;   // Start with inputting A
            operation <= 2'b00; // Default to addition
        end else begin
            case (state)
                2'b00: // Inputting A
                    begin
                        // Update the active number (A)
                        current_digit <= (active_number >> (digit_index * 4)) & 4'b1111;
                        if (up) begin
                            current_digit <= (current_digit == 9) ? 0 : current_digit + 1;
                        end else if (down) begin
                            current_digit <= (current_digit == 0) ? 9 : current_digit - 1;
                        end else if (left) begin
                            digit_index <= (digit_index == 0) ? 7 : digit_index - 1; 
                        end else if (right) begin
                            digit_index <= (digit_index == 7) ? 0 : digit_index + 1;
                        end else if (center) begin
                            // Confirm A and move to operator selection
                            A <= active_number;
                            state <= 2'b01; // Move to operator selection state
                            digit_index <= 0;
                        end
                    end

                2'b01: // Operator selection
                    begin
                        if (left) begin
                            operation <= (operation == 0) ? 3 : operation - 1;
                        end else if (right) begin
                            operation <= (operation == 3) ? 0 : operation + 1;
                        end else if (center) begin
                            // Confirm operation and move to input B
                            state <= 2'b10; // Move to input B state
                            digit_index <= 0;
                        end
                    end

                2'b10: // Inputting B
                    begin
                        // Update the active number (B)
                        current_digit <= (active_number >> (digit_index * 4)) & 4'b1111;
                        if (up) begin
                            current_digit <= (current_digit == 9) ? 0 : current_digit + 1;
                        end else if (down) begin
                            current_digit <= (current_digit == 0) ? 9 : current_digit - 1;
                        end else if (left) begin
                            digit_index <= (digit_index == 0) ? 7 : digit_index - 1;
                        end else if (right) begin
                            digit_index <= (digit_index == 7) ? 0 : digit_index + 1;
                        end else if (center) begin
                            // Confirm B and perform operation
                            B <= active_number;
                            case (operation)
                                2'b00: ANS <= A + B;  // Addition
                                2'b01: ANS <= A - B;  // Subtraction
                                2'b10: ANS <= A * B;  // Multiplication
                                2'b11: ANS <= A / B;  // Division
                            endcase
                            state <= 2'b11; // Move to result state
                            digit_index <= 0;
                        end
                    end

                2'b11: // Output result
                    begin
                        // Update the active number (ANS)
                        current_digit <= (ANS >> (digit_index * 4)) & 4'b1111;
                        if (left) begin
                            digit_index <= (digit_index == 0) ? 7 : digit_index - 1;
                        end else if (right) begin
                            digit_index <= (digit_index == 7) ? 0 : digit_index + 1;
                        end
                    end

                default: state <= 2'b00;
            endcase
        end
    end

    // Seven Segment Decoder module for converting 4-bit binary to 7-segment representation
    module SevenSegDecoder(
        input [3:0] binary,           // 4-bit binary input (current digit)
        output reg [6:0] segments     // 7-segment output
    );
        always @(*) begin
            case (binary)
                4'b0000: segments = 7'b1111110; // 0
                4'b0001: segments = 7'b0110000; // 1
                4'b0010: segments = 7'b1101101; // 2
                4'b0011: segments = 7'b1111001; // 3
                4'b0100: segments = 7'b0110011; // 4
                4'b0101: segments = 7'b1011011; // 5
                4'b0110: segments = 7'b1011111; // 6
                4'b0111: segments = 7'b1110000; // 7
                4'b1000: segments = 7'b1111111; // 8
                4'b1001: segments = 7'b1111011; // 9
                default: segments = 7'b0000000; // Default: all segments off
            endcase
        end
endmodule
