`timescale 1ns / 1ps

module main(
    input clk,                  // Clock signal
    input rr,                   // Refresh signal
    input btnL,                 // Left button to navigate left
    input btnR,                 // Right button to navigate right
    input btnC,                 // Center button to select mode
    output reg [6:0] seg,       // Segments for 7-segment display
    output reg [3:0] an,        // Enable signals for 4-digit display
    output reg enCalc,          // Enable for Calculator mode
    output reg enSci,           // Enable for Scientific mode
    output reg enLogi,          // Enable for Logic mode
    output reg enUnit,          // Enable for Unit conversion mode
    output reg enAge            // Enable for Age mode
);

    // State Encoding
    localparam MAIN_MENU = 3'b000;
    localparam CALC = 3'b001;   // Calculator feature
    localparam SCIE = 3'b010;    // Scientific feature
    localparam LOGI = 3'b011;    // Logic feature
    localparam UNIT = 3'b100;    // Unit conversion feature
    localparam AGE = 3'b101;     // Age feature

    // Registers
    reg [2:0] state = MAIN_MENU; // Current state
    reg [1:0] digit_select = 2'b00; // Digit select for display
    reg [6:0] char_map [3:0];    // Character map for 7-segment display
    reg btnL_prev = 0, btnR_prev = 0, btnC_prev = 0; // Button states
    reg [31:0] btnC_counter = 0;  // Counter for button hold
    reg btnC_state = 0;           // State for btnC
    reg [23:0] hold_counter;       // Counter for hold duration
    reg holding;                  // Flag to indicate holding state

    // Parameter for hold time (assuming clk is 30MHz for this example)
    localparam HOLD_TIME = 120000000; // 3 seconds for a 30 MHz clock

    // Initial state setup
    initial begin
        state = MAIN_MENU;
        hold_counter = 0;
        holding = 0;
        enCalc = 0;
        enSci = 0;
        enLogi = 0;
        enUnit = 0;
        enAge = 0;
    end

    // Main processing always block
    always @(posedge clk) begin
        // Handle button presses
        if (btnL && !btnL_prev && state > MAIN_MENU) begin
            state <= state - 1; // Move left
        end
        if (btnR && !btnR_prev && state < AGE) begin
            state <= state + 1; // Move right
        end

        // Handle button C presses
        if (btnC) begin
            if (btnC_state == 0) begin
                btnC_state <= 1; // btnC is now pressed
                btnC_counter <= 0; // Reset counter on new press
            end
            else begin
                btnC_counter <= btnC_counter + 1; // Increment counter while pressed
            end
        end else begin
            if (btnC_state == 1) begin
                btnC_state <= 0; // btnC is released
            end
        end

        // Handle hold time for button C
        if (btnC_state == 1 && btnC_counter >= HOLD_TIME) begin // 3 seconds at 30MHz clock
            state <= MAIN_MENU;
        end

        // Update previous button states
        btnL_prev <= btnL;
        btnR_prev <= btnR;
        btnC_prev <= btnC;

        // FSM process
        case (state)
            MAIN_MENU: begin
                // Reset features
                enCalc <= 0;
                enSci <= 0;
                enLogi <= 0;
                enUnit <= 0;
                enAge <= 0;

                char_map[0] = 7'b1000110; // 'C'
                char_map[1] = 7'b1001000; // 'N'
                char_map[2] = 7'b1000001; // 'U'
                char_map[3] = 7'b0001110; // 'F'
            end

            CALC: begin
                if (btnC && !btnC_prev) begin
                    enCalc <= 1;
                    enSci <= 0;
                    enLogi <= 0;
                    enUnit <= 0;
                    enAge <= 0;
                end

                char_map[0] = 7'b1000110; // 'c'
                char_map[1] = 7'b1000111; // 'l'
                char_map[2] = 7'b0001000; // 'a'
                char_map[3] = 7'b1000110; // 'c'
            end

            SCIE: begin
                if (btnC && !btnC_prev) begin
                    enCalc <= 0;
                    enSci <= 1;
                    enLogi <= 0;
                    enUnit <= 0;
                    enAge <= 0;
                end

                char_map[0] = 7'b0000110; // 'e'
                char_map[1] = 7'b1001111; // 'i'
                char_map[2] = 7'b1000110; // 'c'
                char_map[3] = 7'b0010010; // 's'
            end

            LOGI: begin
                if (btnC && !btnC_prev) begin
                    enCalc <= 0;
                    enSci <= 0;
                    enLogi <= 1;
                    enUnit <= 0;
                    enAge <= 0;
                end

                char_map[0] = 7'b1001111; // 'i'
                char_map[1] = 7'b0000010; // 'g'
                char_map[2] = 7'b1000000; // 'o'
                char_map[3] = 7'b1000111; // 'l'
            end

            UNIT: begin
                if (btnC && !btnC_prev) begin
                    enCalc <= 0;
                    enSci <= 0;
                    enLogi <= 0;
                    enUnit <= 1;
                    enAge <= 0;
                end

                char_map[0] = 7'b0000111; // 't'
                char_map[1] = 7'b1001111; // 'i'
                char_map[2] = 7'b1001000; // 'n'
                char_map[3] = 7'b1000001; // 'u'
            end

            AGE: begin
                if (btnC && !btnC_prev) begin
                    enCalc <= 0;
                    enSci <= 0;
                    enLogi <= 0;
                    enUnit <= 0;
                    enAge <= 1;
                end

                char_map[0] = 7'b0000110; // 'E'
                char_map[1] = 7'b0000010; // 'G'
                char_map[2] = 7'b0001000; // 'A'
                char_map[3] = 7'b1111111; // Blank
            end

            default: begin
                state <= MAIN_MENU; // Fallback state
            end
        endcase
    end

    // 7-segment display logic
    always @(posedge rr) begin
        digit_select <= digit_select + 1; // Cycle through digits
        case (digit_select)
            2'b00: begin
                seg <= char_map[0];
                an <= 4'b1110; // Enable first digit
            end
            2'b01: begin
                seg <= char_map[1];
                an <= 4'b1101; // Enable second digit
            end
            2'b10: begin
                seg <= char_map[2];
                an <= 4'b1011; // Enable third digit
            end
            2'b11: begin
                seg <= char_map[3];
                an <= 4'b0111; // Enable fourth digit
            end
        endcase
    end
endmodule
