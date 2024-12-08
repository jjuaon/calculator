`timescale 1ns / 1ps

// Button debouncer module remains unchanged
module button_debounce_age(
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

module AgeCalculator(
    input enAge,
    input clk,           
    input rr,            
    input btnL, 
    input btnR, 
    input btnC,
    input btnU,
    input btnD,          
    output reg [6:0] seg,
    output reg [3:0] an,
    output reg [28:0] bDot,  
    output reg [7:0] aDot,   
    output reg return_to_main,
    output wire dp,
    output wire [15:0] led
);

    // State definitions
    localparam STATE_INPUT = 2'b00;
    localparam STATE_CALCULATE = 2'b01;
    localparam STATE_DISPLAY = 2'b10;
    
    // Button debouncing
    wire btnU_db, btnD_db, btnL_db, btnR_db, btnC_db;
    
    button_debounce_age db_btnU(.clk(clk), .btn_in(btnU), .btn_out(btnU_db));
    button_debounce_age db_btnD(.clk(clk), .btn_in(btnD), .btn_out(btnD_db));
    button_debounce_age db_btnL(.clk(clk), .btn_in(btnL), .btn_out(btnL_db));
    button_debounce_age db_btnR(.clk(clk), .btn_in(btnR), .btn_out(btnR_db));
    button_debounce_age db_btnC(.clk(clk), .btn_in(btnC), .btn_out(btnC_db));
    
    reg dpFlag = 0;

    // Internal signals for state machine
    reg [1:0] current_state;              
    reg [28:0] curr_year;          
    reg [28:0] birth_year;         
    reg [28:0] calculated_age;     

    // Insert decimal logic signals
    reg [3:0] digits [3:0];        // Store values for all 4 digits (0-9)
    reg [1:0] current_digit;       // Currently selected digit (0-3)
    reg [19:0] refresh_counter;    // Counter for display refresh
    reg btnU_prev, btnD_prev, btnL_prev, btnR_prev, btnC_prev;
    reg [1:0] display_digit;       // Active digit for display scan
    reg [28:0] decoder_out;        // Output from number calculation

    // Display module signals
    wire [6:0] seg_display;
    wire [3:0] an_display;
    wire dp_display;
    wire [15:0] led_display;

    // Instantiate displayDec module
    displayDec display_age(
        .dpFlag(dpFlag), 
        .clk(clk), 
        .rr(rr), 
        .btnL(btnL_db), 
        .btnR(btnR_db), 
        .bDot(bDot), 
        .aDot(aDot), 
        .seg(seg_display), 
        .an(an_display), 
        .led(led_display),
        .dp(dp_display)
    );

    // Connect display outputs
    assign led = led_display;
    assign dp = dp_display;

    // Initialize all registers
    initial begin
        current_state = STATE_INPUT;
        curr_year = 29'd2024;      
        birth_year = 29'd0;        
        return_to_main = 0;
        dpFlag = 0;
        calculated_age = 0;
        bDot = 0;
        aDot = 0;
        
        // Initialize input related registers
        digits[0] = 4'd0;
        digits[1] = 4'd0;
        digits[2] = 4'd0;
        digits[3] = 4'd0;
        current_digit = 2'd0;
        display_digit = 2'd0;
        refresh_counter = 0;
        decoder_out = 29'd0;
        
        // Initialize button states
        btnU_prev = 0;
        btnD_prev = 0;
        btnL_prev = 0;
        btnR_prev = 0;
        btnC_prev = 0;
    end

    // Refresh counter for display scanning
    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
    end

    // Display digit selection
    always @(posedge clk) begin
        if (refresh_counter[19:18] != display_digit) begin
            display_digit <= refresh_counter[19:18];
        end
    end

    // Combined state machine and input handling
    always @(posedge clk) begin
        if (!enAge) begin
            // Reset state when module is disabled
            current_state <= STATE_INPUT;
            return_to_main <= 0;
            dpFlag <= 0;
            calculated_age <= 0;
            birth_year <= 0;
            bDot <= 0;
            aDot <= 0;
            
            // Reset input values
            digits[0] <= 4'd0;
            digits[1] <= 4'd0;
            digits[2] <= 4'd0;
            digits[3] <= 4'd0;
            current_digit <= 2'd0;
            
            // Reset button states
            btnU_prev <= 0;
            btnD_prev <= 0;
            btnL_prev <= 0;
            btnR_prev <= 0;
            btnC_prev <= 0;
        end 
        else begin
            // Update button states
            btnU_prev <= btnU_db;
            btnD_prev <= btnD_db;
            btnL_prev <= btnL_db;
            btnR_prev <= btnR_db;
            btnC_prev <= btnC_db;

            case (current_state)
                STATE_INPUT: begin
                    dpFlag <= 0;
                    return_to_main <= 0;
                    bDot <= 29'd0;
                    aDot <= 8'd0;

                    // Handle digit input
                    if (btnU_db && !btnU_prev) begin
                        if (digits[current_digit] < 9) 
                            digits[current_digit] <= digits[current_digit] + 1;
                    end
                    if (btnD_db && !btnD_prev) begin
                        if (digits[current_digit] > 0) 
                            digits[current_digit] <= digits[current_digit] - 1;
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

                    // Calculate the decimal output
                    decoder_out <= (digits[3] * 1000) + (digits[2] * 100) + 
                                 (digits[1] * 10) + digits[0];

                    // Check for state transition
                    if (btnC_db && !btnC_prev) begin
                        birth_year <= decoder_out;
                        current_state <= STATE_CALCULATE;
                    end
                end

                STATE_CALCULATE: begin
                    if (birth_year > curr_year || birth_year == 0) begin
                        calculated_age <= 0;
                        bDot <= 0;
                        aDot <= 0;
                    end
                    else begin
                        calculated_age <= curr_year - birth_year;
                        bDot <= curr_year - birth_year;
                        // Set aDot to show two decimal places (00)
                        aDot <= 8'd0;
                    end
                    current_state <= STATE_DISPLAY;
                    dpFlag <= 1;
                end
                
                STATE_DISPLAY: begin
                    if (btnC_db && !btnC_prev) begin
                        return_to_main <= 1;
                        current_state <= STATE_INPUT;
                        dpFlag <= 0;
                        calculated_age <= 0;
                        birth_year <= 0;
                        bDot <= 0;
                        aDot <= 0;
                        
                        // Reset input values
                        digits[0] <= 4'd0;
                        digits[1] <= 4'd0;
                        digits[2] <= 4'd0;
                        digits[3] <= 4'd0;
                        current_digit <= 2'd0;
                    end
                end
            endcase
        end
    end

    // Display decoder logic
    always @(*) begin
        if (current_state == STATE_INPUT) begin
            case (digits[display_digit])
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
            
            // Enable current digit
            an = 4'b1111;          // All digits off
            an[display_digit] = 0;  // Enable current digit
        end else begin
            seg = seg_display;
            an = an_display;
        end
    end

endmodule