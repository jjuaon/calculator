`timescale 1ns / 1ps

module button_debounce_sci(
    input clk,
    input btn_in,
    output reg btn_out
);
    reg [20:0] debounce_counter = 0;
    reg btn_prev = 0;
    
    always @(posedge clk) begin
        if (btn_in != btn_prev) begin
            debounce_counter <= 0;
            btn_prev <= btn_in;
        end
        else if (debounce_counter < 21'd2_000_000) begin  // 20ms at 100MHz
            debounce_counter <= debounce_counter + 1;
        end
        else begin
            btn_out <= btn_prev;
        end
    end
endmodule

module Sci(
    input enSci,              // Enable signal for Scientific mode
    input clk,                // System clock
    input rr,                 // Refresh rate signal
    input btnU,               // Up button
    input btnD,               // Down button
    input btnL,               // Left button
    input btnR,               // Right button
    input btnC,               // Center button
    output reg [6:0] seg,     // 7-segment display segments
    output reg [3:0] an,      // 7-segment display anodes
    output reg [28:0] bDot,   // Binary output for display
    output reg [7:0] aDot,    // Additional display output
    output reg return_to_main // Signal to return to main menu
);
    // State definitions
    localparam STATE_FUNC_SEL = 2'b00;
    localparam STATE_INPUT = 2'b01;
    localparam STATE_RESULT = 2'b10;

    // Function definitions
    localparam FUNC_SIN = 2'b00;
    localparam FUNC_COS = 2'b01;
    localparam FUNC_TAN = 2'b10;

    // Button debouncing
    wire btnU_db, btnD_db, btnL_db, btnR_db, btnC_db;
    
    button_debounce_sci db_btnU(.clk(clk), .btn_in(btnU), .btn_out(btnU_db));
    button_debounce_sci db_btnD(.clk(clk), .btn_in(btnD), .btn_out(btnD_db));
    button_debounce_sci db_btnL(.clk(clk), .btn_in(btnL), .btn_out(btnL_db));
    button_debounce_sci db_btnR(.clk(clk), .btn_in(btnR), .btn_out(btnR_db));
    button_debounce_sci db_btnC(.clk(clk), .btn_in(btnC), .btn_out(btnC_db));

    // State and function tracking
    reg [1:0] current_state = STATE_FUNC_SEL;
    reg [1:0] selected_func = FUNC_SIN;
    
    // Input related registers
    reg [15:0] input_value = 16'd0;
    reg [1:0] current_digit = 2'b00;
    
    // Calculation result
    reg [15:0] calc_result = 16'd0;
    
    // Button state tracking
    reg btnU_prev = 0;
    reg btnD_prev = 0;
    reg btnL_prev = 0;
    reg btnR_prev = 0;
    reg btnC_prev = 0;

    // Display multiplexing
    reg [1:0] display_pos = 2'b00;

    // Trigonometric function approximation
    function [15:0] trig_calc;
        input [1:0] func;
        input [7:0] value;
        reg [15:0] angle_rad; // Fixed-point representation of angle in radians
        reg [15:0] result;
        begin
            // Convert degrees to radians (crude approximation)
            // π radians = 180 degrees
            // Use fixed-point representation (multiplied by 256 for precision)
            angle_rad = (value * 16'd256 * 16'd314) / (16'd180 * 16'd100);
            
            case(func)
                FUNC_SIN: begin
                    // Simplified sine approximation using first few terms of Taylor series
                    // sin(x) ≈ x - x³/3! + x⁵/5! - x⁷/7!
                    result = angle_rad - 
                             ((angle_rad * angle_rad * angle_rad) / (16'd6)) + 
                             ((angle_rad * angle_rad * angle_rad * angle_rad * angle_rad) / (16'd120)) -
                             ((angle_rad * angle_rad * angle_rad * angle_rad * angle_rad * angle_rad * angle_rad) / (16'd5040));
                    trig_calc = result;
                end
                
                FUNC_COS: begin
                    // Simplified cosine approximation
                    // cos(x) ≈ 1 - x²/2! + x⁴/4! - x⁶/6!
                    result = (16'd256) - 
                             ((angle_rad * angle_rad) / (16'd2)) + 
                             ((angle_rad * angle_rad * angle_rad * angle_rad) / (16'd24)) -
                             ((angle_rad * angle_rad * angle_rad * angle_rad * angle_rad * angle_rad) / (16'd720));
                    trig_calc = result;
                end
                
                FUNC_TAN: begin
                    // tan(x) = sin(x) / cos(x)
                    // Simplified approximation
                    result = (trig_calc(FUNC_SIN, value) * 16'd256) / trig_calc(FUNC_COS, value);
                    trig_calc = result;
                end
                
                default: trig_calc = 16'd0;
            endcase
        end
    endfunction

    // Function display patterns
    reg [6:0] func_display;
    always @(*) begin
        case(selected_func)
            FUNC_SIN:  func_display = 7'b0010010; // "S"
            FUNC_COS:  func_display = 7'b1000110; // "C"
            FUNC_TAN:  func_display = 7'b0000111; // "t"
            default:   func_display = 7'b1111111; // Blank
        endcase
    end

    // Main state machine
    always @(posedge clk) begin
        if (!enSci) begin
            // Reset all states
            current_state <= STATE_FUNC_SEL;
            selected_func <= FUNC_SIN;
            input_value <= 8'd0;
            current_digit <= 2'b00;
            calc_result <= 16'd0;
            bDot <= 29'd0;
            aDot <= 8'd0;
            return_to_main <= 0;
            
            // Reset button states
            btnU_prev <= 0;
            btnD_prev <= 0;
            btnL_prev <= 0;
            btnR_prev <= 0;
            btnC_prev <= 0;
        end
        else if (rr) begin
            // Update button previous states
            btnU_prev <= btnU_db;
            btnD_prev <= btnD_db;
            btnL_prev <= btnL_db;
            btnR_prev <= btnR_db;
            btnC_prev <= btnC_db;
            return_to_main <= 0;
            
            // Update display position
            display_pos <= display_pos + 1;

            case (current_state)
                STATE_FUNC_SEL: begin
                    // Function selection
                    if (btnR_db && !btnR_prev) begin
                        selected_func <= (selected_func == 2'b10) ? 2'b00 : selected_func + 1;
                    end
                    if (btnL_db && !btnL_prev) begin
                        selected_func <= (selected_func == 2'b00) ? 2'b10 : selected_func - 1;
                    end
                    
                    // Display function
                    seg <= func_display;
                    an <= 4'b1110;
                    
                    // Transition to input
                    if (btnC_db && !btnC_prev) begin
                        current_state <= STATE_INPUT;
                        input_value <= 8'd0;
                        current_digit <= 2'b00;
                    end
                end

                STATE_INPUT: begin
                    // Digit input logic for 4 digits
                    if (btnU_db && !btnU_prev) begin
                        case (current_digit)
                            2'b11: begin // First digit (thousands)
                                if (input_value[15:12] < 4'd9) 
                                    input_value[15:12] <= input_value[15:12] + 1;
                            end
                            2'b10: begin // Second digit (hundreds)
                                if (input_value[11:8] < 4'd9) 
                                    input_value[11:8] <= input_value[11:8] + 1;
                            end
                            2'b01: begin // Third digit (tens)
                                if (input_value[7:4] < 4'd9) 
                                    input_value[7:4] <= input_value[7:4] + 1;
                            end
                            2'b00: begin // Fourth digit (ones)
                                if (input_value[3:0] < 4'd9) 
                                    input_value[3:0] <= input_value[3:0] + 1;
                            end
                        endcase
                    end
                
                    if (btnD_db && !btnD_prev) begin
                        case (current_digit)
                            2'b11: begin // First digit (thousands)
                                if (input_value[15:12] > 4'd0) 
                                    input_value[15:12] <= input_value[15:12] - 1;
                            end
                            2'b10: begin // Second digit (hundreds)
                                if (input_value[11:8] > 4'd0) 
                                    input_value[11:8] <= input_value[11:8] - 1;
                            end
                            2'b01: begin // Third digit (tens)
                                if (input_value[7:4] > 4'd0) 
                                    input_value[7:4] <= input_value[7:4] - 1;
                            end
                            2'b00: begin // Fourth digit (ones)
                                if (input_value[3:0] > 4'd0) 
                                    input_value[3:0] <= input_value[3:0] - 1;
                            end
                        endcase
                    end
                
                    // Navigate between digits
                    if (btnL_db && !btnL_prev) begin
                        if (current_digit < 2'b11) 
                            current_digit <= current_digit + 1;
                        else 
                            current_digit <= 2'b00;
                    end
                
                    if (btnR_db && !btnR_prev) begin
                        if (current_digit > 2'b00) 
                            current_digit <= current_digit - 1;
                        else 
                            current_digit <= 2'b11;
                    end
                
                    // Explicit display logic for input state
                    case (display_pos)
                        2'b00: begin
                            // Display thousands digit
                            case (input_value[15:12])
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
                                default: seg = 7'b1111111;
                            endcase
                            an = 4'b0111; // Enable first digit from left
                        end
                
                        2'b01: begin
                            // Display hundreds digit
                            case (input_value[11:8])
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
                                default: seg = 7'b1111111;
                            endcase
                            an = 4'b1011; // Enable second digit from left
                        end
                
                        2'b10: begin
                            // Display tens digit
                            case (input_value[7:4])
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
                                default: seg = 7'b1111111;
                            endcase
                            an = 4'b1101; // Enable third digit from left
                        end
                
                        2'b11: begin
                            // Display ones digit
                            case (input_value[3:0])
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
                                default: seg = 7'b1111111;
                            endcase
                            an = 4'b1110; // Enable fourth digit from left (rightmost)
                        end
                    endcase
                
                    // Transition to result state
                    if (btnC_db && !btnC_prev) begin
                        // Perform trigonometric calculation
                        calc_result <= trig_calc(selected_func, input_value[7:0]);
                        
                        // Update display outputs
                        bDot <= calc_result;
                        aDot <= {4'd0, selected_func, 2'd0};
                        
                        // Move to result state
                        current_state <= STATE_RESULT;
                    end
                end

                STATE_RESULT: begin
                    // Display result based on display position
                    case (display_pos)
                        2'b00: begin
                            // First digit (MSB)
                            case (calc_result[15:12])
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
                                default: seg = 7'b1111111; // Blank
                            endcase
                            an = 4'b0111; // First digit from left
                        end
                
                        2'b01: begin
                            // Second digit
                            case (calc_result[11:8])
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
                                default: seg = 7'b1111111; // Blank
                            endcase
                            an = 4'b1011; // Second digit from left
                        end
                
                        2'b10: begin
                            // Third digit
                            case (calc_result[7:4])
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
                                default: seg = 7'b1111111; // Blank
                            endcase
                            an = 4'b1101; // Third digit from left
                        end
                
                        2'b11: begin
                            // Fourth digit (LSB)
                            case (calc_result[3:0])
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
                                default: seg = 7'b1111111; // Blank
                            endcase
                            an = 4'b1110; // Fourth digit from left (rightmost)
                        end
                    endcase
                
                    // Add return to function selection state logic
                    if (btnC_db && !btnC_prev) begin
                        return_to_main <= 1;
                        current_state <= STATE_FUNC_SEL;
                        calc_result <= 16'd0;
                        bDot <= 29'd0;
                        aDot <= 8'd0;
                    end
                end
            endcase
        end
    end
endmodule