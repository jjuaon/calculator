//boom
`timescale 1ns/1ps  

module Unit_Conversion_System(
    input clk,               // Clock input
    input btnC,              // Center button to proceed to the next step
    input btnU,              // Up button
    input btnD,              // Down button
    input btnL,              // Left button
    input btnR,              // Right button
    output [6:0] seg,        // 7-segment display (a-g)
    output [3:0] an          // Enable for each 7-segment digit
);

    // State variable to switch between the two modules
    reg state = 0;           // 0: Type Display, 1: Input Stage

    // Center button flag for edge detection
    reg btnC_prev;

    // Clock divider for a slow clock (e.g., ~1kHz refresh)
    reg [15:0] clk_div = 0;
    wire refresh_clk = clk_div[15];

    always @(posedge clk) begin
        clk_div <= clk_div + 1;
    end

    // Edge detection for the center button
    always @(posedge refresh_clk) begin
        if (btnC && !btnC_prev) begin
            state <= ~state; // Toggle state
        end
        btnC_prev <= btnC;
    end

    // Outputs from the two modules
    wire [6:0] seg_display;
    wire [3:0] an_display;

    wire [6:0] seg_input;
    wire [3:0] an_input;

    // Instantiate the first module (Unit Conversion Type Display)
    Unit_Conversion_Type_Display type_display (
        .clk(clk),
        .btnL(btnL),
        .btnR(btnR),
        .seg(seg_display),
        .an(an_display)
    );

    // Instantiate the second module (Unit Conversion Input)
    Unit_Conversion_Input input_stage (
        .clk(clk),
        .btnC(btnC),
        .btnU(btnU),
        .btnD(btnD),
        .btnL(btnL),
        .btnR(btnR),
        .seg(seg_input),
        .an(an_input)
    );

    // Output selection based on the current state
    assign seg = (state == 0) ? seg_display : seg_input;
    assign an = (state == 0) ? an_display : an_input;

endmodule

module Unit_Conversion_Type_Display(
    input clk,               // Clock input
    input btnL,              // Left button (cycle backward)
    input btnR,              // Right button (cycle forward)
    output reg [6:0] seg,    // 7-segment display (a-g)
    output reg [3:0] an      // Enable for each 7-segment digit
);

    // State variable for the selected type
    reg [1:0] type = 2'b00; // Default to Mass

    // Button press flags
    reg btnL_prev, btnR_prev;

    // 7-segment multiplexing variables
    reg [1:0] digit;        // Current digit being displayed
    reg [6:0] seg_data[3:0]; // Segment data for each digit

    // Clock divider for refreshing the 7-segment display (~1kHz refresh rate)
    reg [15:0] clk_div = 0;
    wire refresh_clk = clk_div[15];

    always @(posedge clk) begin
        clk_div <= clk_div + 1;
    end

    // Button press logic
    always @(posedge refresh_clk) begin
        // Detect button press (edge detection)
        if (btnL && !btnL_prev) begin
            type <= type - 1; // Cycle backward
        end else if (btnR && !btnR_prev) begin
            type <= type + 1; // Cycle forward
        end

        // Wrap the type around (cyclic behavior)
        if (type > 2'b10)
            type <= 2'b00;
        else if (type < 2'b00)
            type <= 2'b10;

        // Update previous button states
        btnL_prev <= btnL;
        btnR_prev <= btnR;
    end

    // Determine 7-segment data based on the type
    always @(*) begin
        // Default pattern for all digits
        seg_data[0] = 7'b0000001; // "-" (Digit 1)
        seg_data[1] = 7'b0000001; // "-" (Digit 2)
        seg_data[2] = 7'b0000001; // "-" (Digit 3)

        case (type)
            2'b00: seg_data[3] = 7'b0111001; // "M" for Mass
            2'b01: seg_data[3] = 7'b0011100; // "L" for Length
            2'b10: seg_data[3] = 7'b0111100; // "T" for Temperature
            default: seg_data[3] = 7'b0000000; // Blank
        endcase
    end

    // 7-segment multiplexing logic
    always @(posedge refresh_clk) begin
        digit <= digit + 1; // Cycle through the digits (0-3)
        case (digit)
            2'b00: begin
                an <= 4'b1110; // Enable Digit 1
                seg <= seg_data[0];
            end
            2'b01: begin
                an <= 4'b1101; // Enable Digit 2
                seg <= seg_data[1];
            end
            2'b10: begin
                an <= 4'b1011; // Enable Digit 3
                seg <= seg_data[2];
            end
            2'b11: begin
                an <= 4'b0111; // Enable Digit 4
                seg <= seg_data[3];
            end
        endcase
    end

endmodule

module Unit_Conversion_Input(
    input clk,               // Clock input
    input btnC,              // Center button to proceed to the next step
    input btnU,              // Up button (increase current digit)
    input btnD,              // Down button (decrease current digit)
    input btnL,              // Left button (move to previous digit)
    input btnR,              // Right button (move to next digit)
    output reg [6:0] seg,    // 7-segment display (a-g)
    output reg [3:0] an      // Enable for each 7-segment digit
);

    // Variables for digit values and selection
    reg [3:0] digits [3:0];   // Four digits to display
    reg [1:0] selected_digit; // Currently selected digit (0-3)

    // Button press flags
    reg btnU_prev, btnD_prev, btnL_prev, btnR_prev;

    // 7-segment multiplexing variables
    reg [1:0] digit;          // Current digit being displayed
    reg [6:0] seg_patterns [9:0]; // Segment patterns for 0-9

    // Clock divider for refreshing the 7-segment display (~1kHz refresh rate)
    reg [15:0] clk_div = 0;
    wire refresh_clk = clk_div[15];

    always @(posedge clk) begin
        clk_div <= clk_div + 1;
    end

    // Initialize segment patterns for digits 0-9
    initial begin
        seg_patterns[0] = 7'b1000000; // "0"
        seg_patterns[1] = 7'b1111001; // "1"
        seg_patterns[2] = 7'b0100100; // "2"
        seg_patterns[3] = 7'b0110000; // "3"
        seg_patterns[4] = 7'b0011001; // "4"
        seg_patterns[5] = 7'b0010010; // "5"
        seg_patterns[6] = 7'b0000010; // "6"
        seg_patterns[7] = 7'b1111000; // "7"
        seg_patterns[8] = 7'b0000000; // "8"
        seg_patterns[9] = 7'b0010000; // "9"
    end

    // Initialize digits and selected digit
    initial begin
        digits[0] = 4'd0;
        digits[1] = 4'd0;
        digits[2] = 4'd0;
        digits[3] = 4'd0;
        selected_digit = 2'd0;
    end

    // Button press logic
    always @(posedge refresh_clk) begin
        // Detect button presses
        if (btnU && !btnU_prev) begin
            digits[selected_digit] <= (digits[selected_digit] == 9) ? 0 : digits[selected_digit] + 1;
        end else if (btnD && !btnD_prev) begin
            digits[selected_digit] <= (digits[selected_digit] == 0) ? 9 : digits[selected_digit] - 1;
        end else if (btnL && !btnL_prev) begin
            selected_digit <= (selected_digit == 0) ? 3 : selected_digit - 1;
        end else if (btnR && !btnR_prev) begin
            selected_digit <= (selected_digit == 3) ? 0 : selected_digit + 1;
        end

        // Update previous button states
        btnU_prev <= btnU;
        btnD_prev <= btnD;
        btnL_prev <= btnL;
        btnR_prev <= btnR;
    end

    // 7-segment multiplexing logic
    always @(posedge refresh_clk) begin
        digit <= digit + 1; // Cycle through the digits (0-3)
        case (digit)
            2'b00: begin
                an <= 4'b1110; // Enable Digit 1
                seg <= seg_patterns[digits[0]];
            end
            2'b01: begin
                an <= 4'b1101; // Enable Digit 2
                seg <= seg_patterns[digits[1]];
            end
            2'b10: begin
                an <= 4'b1011; // Enable Digit 3
                seg <= seg_patterns[digits[2]];
            end
            2'b11: begin
                an <= 4'b0111; // Enable Digit 4
                seg <= seg_patterns[digits[3]];
            end
        endcase
    end

endmodule