`timescale 1ns / 1ps

// Button debouncer module
module button_debounce_calc(
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

module BasicCalculator(
    input enCalc,
    input clk,           
    input rr,            
    input btnL, 
    input btnR, 
    input btnC,
    input btnU,
    input btnD,          
    output reg [6:0] seg,
    output reg [3:0] an,
    output reg [28:0] bDot, //{1bit sign bit, 28bit} 
    output reg [7:0] aDot,   
    output reg return_to_main,
    output reg sign,
    output wire dp
);

    // State definitions
    localparam STATE_INPUT_NUM1 = 3'b000;
    localparam STATE_INPUT_OP = 3'b001;
    localparam STATE_INPUT_NUM2 = 3'b010;
    localparam STATE_CALCULATE = 3'b011;
    localparam STATE_DISPLAY = 3'b100;
    
    // Button debouncing
    wire btnU_db, btnD_db, btnL_db, btnR_db, btnC_db;
    
    button_debounce_calc db_btnU(.clk(clk), .btn_in(btnU), .btn_out(btnU_db));
    button_debounce_calc db_btnD(.clk(clk), .btn_in(btnD), .btn_out(btnD_db));
    button_debounce_calc db_btnL(.clk(clk), .btn_in(btnL), .btn_out(btnL_db));
    button_debounce_calc db_btnR(.clk(clk), .btn_in(btnR), .btn_out(btnR_db));
    button_debounce_calc db_btnC(.clk(clk), .btn_in(btnC), .btn_out(btnC_db));
    
    reg dpFlag = 0;

    // Internal signals
    reg [2:0] current_state;
    reg [28:0] num1;
    reg [28:0] num2;
    reg [1:0] operator; // 00:+, 01:-, 10:*, 11:/
    reg [28:0] result;

    // Display and input handling
    reg [3:0] digits [3:0];        // Store values for all 4 digits (0-9)
    reg [1:0] current_digit;       // Currently selected digit (0-3)
    reg [19:0] refresh_counter;    // Counter for display refresh
    reg btnU_prev, btnD_prev, btnL_prev, btnR_prev, btnC_prev;
    reg [1:0] display_digit;
    reg [28:0] decoder_out;

    // Display module signals
    wire [6:0] seg_display;
    wire [3:0] an_display;
    wire dp_display;

    // Instantiate displayDec module
    displayDec display_calc(
        .dpFlag(dpFlag), 
        .clk(clk), 
        .rr(rr), 
        .btnL(btnL_db), 
        .btnR(btnR_db), 
        .bDot(bDot), 
        .aDot(aDot), 
        .seg(seg_display), 
        .an(an_display),
        .dp(dp_display)
    );

    assign dp = dp_display;

    // Initialize all registers
    initial begin
        current_state = STATE_INPUT_NUM1;
        num1 = 0;
        num2 = 0;
        operator = 0;
        result = 0;
        return_to_main = 0;
        dpFlag = 0;
        bDot = 0;
        aDot = 0;
        
        digits[0] = 4'd0;
        digits[1] = 4'd0;
        digits[2] = 4'd0;
        digits[3] = 4'd0;
        current_digit = 2'd0;
        display_digit = 2'd0;
        refresh_counter = 0;
        decoder_out = 29'd0;
        
        btnU_prev = 0;
        btnD_prev = 0;
        btnL_prev = 0;
        btnR_prev = 0;
        btnC_prev = 0;
        
        sign = 0;
    end

    // Refresh counter for display scanning
    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
        display_digit <= refresh_counter[19:18];
    end

    // Main state machine and input handling
    always @(posedge clk) begin
        if (!enCalc) begin
            current_state <= STATE_INPUT_NUM1;
            return_to_main <= 0;
            // Reset all registers to initial values
            num1 <= 0;
            num2 <= 0;
            operator <= 0;
            result <= 0;
            dpFlag <= 0;
            bDot <= 0;
            aDot <= 0;
            
            digits[0] <= 4'd0;
            digits[1] <= 4'd0;
            digits[2] <= 4'd0;
            digits[3] <= 4'd0;
            current_digit <= 2'd0;
            
            btnU_prev <= 0;
            btnD_prev <= 0;
            btnL_prev <= 0;
            btnR_prev <= 0;
            btnC_prev <= 0;
            
            sign <= 0;
        end 
        else begin
            // Update button states
            btnU_prev <= btnU_db;
            btnD_prev <= btnD_db;
            btnL_prev <= btnL_db;
            btnR_prev <= btnR_db;
            btnC_prev <= btnC_db;

            case (current_state)
                STATE_INPUT_NUM1: begin
                    dpFlag <= 0;
                    // Handle digit input for num1
                    if (btnU_db && !btnU_prev) begin
                        if (digits[current_digit] < 9) 
                            digits[current_digit] <= digits[current_digit] + 1;
                    end
                    if (btnD_db && !btnD_prev) begin
                        if (digits[current_digit] > 0) 
                            digits[current_digit] <= digits[current_digit] - 1;
                        else if (digits[current_digit] == 0 && current_digit == 3) begin
                            sign <= !sign;
                            digits[3] <= 4'd0;
                        end
                    end
                    // Move between digits
                    if (btnL_db && !btnL_prev) begin
                        if (current_digit < 3) 
                            current_digit <= current_digit + 1;
                        else 
                            current_digit <= 0;
                    end
                    if (btnR_db && !btnR_prev) begin
                        if (current_digit > 0) 
                            current_digit <= current_digit - 1;
                        else 
                            current_digit <= 3;
                    end

                    decoder_out <= (sign ? -1 : 1) * ((digits[3] * 1000) + (digits[2] * 100) + 
                                 (digits[1] * 10) + digits[0]);

                    if (btnC_db && !btnC_prev) begin
                        num1 <= decoder_out;
                        current_state <= STATE_INPUT_OP;
                        // Reset digits for next input
                        digits[0] <= 4'd0;
                        digits[1] <= 4'd0;
                        digits[2] <= 4'd0;
                        digits[3] <= 4'd0;
                        current_digit <= 2'd0;
                        sign <= 0;
                    end
                end

                STATE_INPUT_OP: begin
                    // Use Up/Down buttons to cycle through operators
                    if (btnU_db && !btnU_prev) begin
                        if (operator < 2'b11)
                            operator <= operator + 1;
                        else
                            operator <= 2'b00;
                    end
                    if (btnD_db && !btnD_prev) begin
                        if (operator > 2'b00)
                            operator <= operator - 1;
                        else
                            operator <= 2'b11;
                    end
                    
                    if (btnC_db && !btnC_prev) begin
                        current_state <= STATE_INPUT_NUM2;
                    end
                end

                STATE_INPUT_NUM2: begin
                    // Similar input handling as num1
                    if (btnU_db && !btnU_prev) begin
                        if (digits[current_digit] < 9) 
                            digits[current_digit] <= digits[current_digit] + 1;
                    end
                    if (btnD_db && !btnD_prev) begin
                        if (digits[current_digit] > 0) 
                            digits[current_digit] <= digits[current_digit] - 1;
                        else if (digits[current_digit] == 0 && current_digit == 3) begin
                            sign <= !sign;
                            digits[3] <= 4'd0;
                        end
                    end
                    if (btnL_db && !btnL_prev) begin
                        if (current_digit < 3) 
                            current_digit <= current_digit + 1;
                        else 
                            current_digit <= 0;
                    end
                    if (btnR_db && !btnR_prev) begin
                        if (current_digit > 0) 
                            current_digit <= current_digit - 1;
                        else 
                            current_digit <= 3;
                    end

                    decoder_out <= (sign ? -1 : 1) * ((digits[3] * 1000) + (digits[2] * 100) + 
                                 (digits[1] * 10) + digits[0]);

                    if (btnC_db && !btnC_prev) begin
                        num2 <= decoder_out;
                        current_state <= STATE_CALCULATE;
                    end
                end

                STATE_CALCULATE: begin
                    case (operator)
                        2'b00: result <= num1 + num2;  // Addition
                        2'b01: result <= num1 - num2; // Subtraction
                        2'b10: begin  // Multiplication
                            if (num1 * num2 > 29'h1FFFFFFF)  // Check for overflow
                                result <= 29'h1FFFFFFF;
                            else
                                result <= num1 * num2;
                        end
                        2'b11: begin  // Division
                            if (num2 != 0)
                                result <= num1 / num2;
                            else
                                result <= 29'h1FFFFFFF;  // Division by zero error
                        end
                    endcase
                    
                    // Short delay before updating display
                    #1;
                    
                    // Update display values
                    bDot <= result;  // Display the result value
                    aDot <= 8'd0;    // No decimal places needed
                    dpFlag <= 1;      // Enable display module
                    
                    // Move to display state
                    current_state <= STATE_DISPLAY;
                end

                STATE_DISPLAY: begin
                    // Keep displaying the result
                    dpFlag <= 1;
                    bDot <= result;
                    
                    if (btnC_db && !btnC_prev) begin
                        return_to_main <= 1;
                        current_state <= STATE_INPUT_NUM1;
                        // Reset all values for next calculation
                        num1 <= 0;
                        num2 <= 0;
                        operator <= 0;
                        result <= 0;
                        dpFlag <= 0;
                        bDot <= 0;
                        aDot <= 0;
                        digits[0] <= 4'd0;
                        digits[1] <= 4'd0;
                        digits[2] <= 4'd0;
                        digits[3] <= 4'd0;
                        current_digit <= 2'd0;
                        sign <= 0;
                    end
                end
            endcase
        end
    end

    // Display decoder logic
    always @(*) begin
        if (current_state == STATE_INPUT_NUM1 || current_state == STATE_INPUT_NUM2) begin
            case (digits[display_digit])
                4'd0: begin  
                    if (current_digit == 3 && sign)
                        seg = 7'b0111111; // - sign
                    else
                        seg = 7'b1000000; // 0
                end
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
            
            an = 4'b1111;          // All digits off
            an[display_digit] = 0;  // Enable current digit
        end
        else if (current_state == STATE_INPUT_OP) begin
            // Display operator text
            case (operator)
                2'b00: begin // PLUS
                    case (display_digit)
                        2'd3: seg = 7'b0001100; // P
                        2'd2: seg = 7'b1000111; // L
                        2'd1: seg = 7'b1000001; // U
                        2'd0: seg = 7'b0010010; // S
                    endcase
                end
                2'b01: begin // DIFF
                    case (display_digit)
                        2'd3: seg = 7'b0100001; // D
                        2'd2: seg = 7'b1001111; // I
                        2'd1: seg = 7'b0001110; // F
                        2'd0: seg = 7'b0001110; // F
                    endcase
                end
                2'b10: begin // PrOd
                    case (display_digit)
                        2'd3: seg = 7'b0001100; // P
                        2'd2: seg = 7'b1001110; // r
                        2'd1: seg = 7'b1000000; // O
                        2'd0: seg = 7'b0100001; // d
                    endcase
                end
                2'b11: begin // Divi
                    case (display_digit)
                        2'd3: seg = 7'b0100001; // D
                        2'd2: seg = 7'b1001111; // i
                        2'd1: seg = 7'b1000110; // v
                        2'd0: seg = 7'b1001111; // i
                    endcase
                end
                default: seg = 7'b1111111;
            endcase
            
            an = 4'b1111;          // All digits off
            an[display_digit] = 0;  // Enable current digit
        end
        else begin
            seg = seg_display;
            an = an_display;
        end
    end

endmodule