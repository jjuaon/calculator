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
    reg [7:0] input_value = 8'd0;
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
        begin
            // Simple approximation - replace with more accurate calculation if needed
            case(func)
                FUNC_SIN: trig_calc = (value * 16'd256) / 16'd360; // Simplified sin
                FUNC_COS: trig_calc = ((90 - value) * 16'd256) / 16'd360; // Simplified cos
                FUNC_TAN: trig_calc = (value * 16'd256) / 16'd180; // Simplified tan
                default:  trig_calc = 16'd0;
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
                    // Handle digit input
                    if (btnU_db && !btnU_prev) begin
                        if (input_value[current_digit*2+:2] < 2'd3)
                            input_value[current_digit*2+:2] <= input_value[current_digit*2+:2] + 1;
                    end
                    if (btnD_db && !btnD_prev) begin
                        if (input_value[current_digit*2+:2] > 2'd0)
                            input_value[current_digit*2+:2] <= input_value[current_digit*2+:2] - 1;
                    end
                    
                    // Digit navigation with wrap-around
                    if (btnL_db && !btnL_prev) begin
                        current_digit <= (current_digit == 2'b11) ? 2'b00 : current_digit + 1;
                    end
                    if (btnR_db && !btnR_prev) begin
                        current_digit <= (current_digit == 2'b00) ? 2'b11 : current_digit - 1;
                    end

                    // Simplified digit display logic
                    seg <= (input_value[current_digit*2+:2] == 2'd0) ? 7'b1000000 : 
                           (input_value[current_digit*2+:2] == 2'd1) ? 7'b1111001 :
                           (input_value[current_digit*2+:2] == 2'd2) ? 7'b0100100 : 7'b0110000;
                    
                    // Dynamic anode selection based on current digit
                    an <= 4'b1111;  // Initially disable all
                    an[~current_digit] = 0;  // Enable current digit (note the bit inversion)

                    // Transition to result with center button
                    if (btnC_db && !btnC_prev) begin
                        // Optional: Add input validation if needed
                        if (input_value <= 8'd90) begin  // Limit input to 0-90 degrees
                            calc_result <= trig_calc(selected_func, input_value);
                            bDot <= {13'd0, calc_result};
                            aDot <= 8'd0;
                            current_state <= STATE_RESULT;
                        end
                    end
                end

                STATE_RESULT: begin
                    // Display result
                    seg <= (calc_result[3:0] == 4'd0) ? 7'b1000000 : 
                           (calc_result[3:0] == 4'd1) ? 7'b1111001 :
                           (calc_result[3:0] == 4'd2) ? 7'b0100100 : 7'b0110000;
                    an <= 4'b1110;

                    // Return to function selection or main menu
                    if (btnC_db && !btnC_prev) begin
                        return_to_main <= 1;
                        current_state <= STATE_FUNC_SEL;
                        input_value <= 8'd0;
                        calc_result <= 16'd0;
                        bDot <= 29'd0;
                        aDot <= 8'd0;
                    end
                end
            endcase
        end
    end
endmodule