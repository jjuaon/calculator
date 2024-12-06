`timescale 1ns / 1ps

module main(
    input clk,              // Clock input
    input btnL,             // Left button to navigate left
    input btnR,             // Right button to navigate right
    input btnC,             // Center button to select mode
    output reg [6:0] seg,   // Segments for 7-segment display
    output reg [3:0] an,     // Enable signals for 4-digit display
    output reg [15:0] led
);
    reg [2:0] state = 3'b000;  // State for text selection (0 to 5)
    reg [1:0] digit_select = 2'b00;  // To cycle through 4 digits
    reg [6:0] char_map [3:0];       // Array to hold patterns for the current text
    wire refresh_clk;               // Slower clock for refreshing 7-segment
    SegRefreshRate refresher (clk, refresh_clk); // Use refresh clock
   
    // Button debounce registers
    reg btnL_prev = 0, btnR_prev = 0, btnC_prev = 0;
    reg [31:0] btnC_counter = 0; // Counter to track button press duration
    reg btnC_state = 0; // State to track if btnC is pressed

    // State control for buttons
    always @(posedge clk) begin
        // Debounce buttons
        if (btnL && !btnL_prev && state > 3'b000) begin
            state <= state - 1; // Move left
        end
        if (btnR && !btnR_prev && state < 3'b101) begin
            state <= state + 1; // Move right
        end
        
        // Track btnC press duration
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

        if (btnC_state == 1 && btnC_counter >= 120000000) begin // 3 seconds at 30MHz clock (30M cycles = 3s)
            state <= 3'b000; // Reset state
            led[0] <= 0;
        end

        // On btnC press, trigger action based on selected mode (not including the reset condition)
        if (btnC && !btnC_prev && btnC_state == 0) begin
            case (state)
                3'b001: begin 
                //call calc module
                    led[0] <= 1;
                end
                3'b010: begin 
                    led[0] <= 0;
                end
                3'b011: begin
                    led[0] <= 1;
                end
                3'b100: begin
                    led[0] <= 0;
                end
                3'b101: begin
                    led[0] <= 1;
                end
                default: begin
                end
            endcase
        end 

        btnL_prev <= btnL;
        btnR_prev <= btnR;
        btnC_prev <= btnC;
    end
    
    // Text mappings for different states
    always @(state) begin
        case (state)
            3'b000: begin // "FUNC"
                char_map[3] = 7'b1000110; // 'C'
                char_map[2] = 7'b1001000; // 'N'
                char_map[1] = 7'b1000001; // 'U'
                char_map[0] = 7'b0001110; // 'F'
            end
            3'b001: begin // "calc"
                char_map[3] = 7'b1000110; // 'c'
                char_map[2] = 7'b1000111; // 'l'
                char_map[1] = 7'b0001000; // 'a'
                char_map[0] = 7'b1000110; // 'c'
            end
            3'b010: begin // "scie"
                char_map[3] = 7'b0000110; // 'e'
                char_map[2] = 7'b1001111; // 'i'
                char_map[1] = 7'b1000110; // 'c'
                char_map[0] = 7'b0010010; // 's'
            end
            3'b011: begin // "logi"
                char_map[3] = 7'b1001111; // 'i'
                char_map[2] = 7'b0000010; // 'g'
                char_map[1] = 7'b1000000; // 'o'
                char_map[0] = 7'b1000111; // 'l'
            end
            3'b100: begin // "UNIt"
                char_map[3] = 7'b0000111; // 't'
                char_map[2] = 7'b1001111; // 'i'
                char_map[1] = 7'b1001000; // 'n'
                char_map[0] = 7'b1000001; // "u"
            end
            3'b101: begin // "AGE"
                char_map[3] = 7'b0000110; // 'E'
                char_map[2] = 7'b0000010; // 'G'
                char_map[1] = 7'b0001000; // 'A'
                char_map[0] = 7'b1111111; // Blank
            end
            default: begin // Default to "FUNC"
                char_map[3] = 7'b1000110; // 'C'
                char_map[2] = 7'b1001000; // 'N'
                char_map[1] = 7'b1000001; // 'U'
                char_map[0] = 7'b0001110; // 'F'
            end
        endcase
    end

    // Anode control to enable each digit
    always @(posedge refresh_clk) begin
        digit_select <= digit_select + 1;

        case (digit_select)
            2'b00: begin
                seg <= char_map[3]; // Most significant digit
                an <= 4'b1110;      // Enable digit 1
            end
            2'b01: begin
                seg <= char_map[2]; // Second digit
                an <= 4'b1101;      // Enable digit 2
            end
            2'b10: begin
                seg <= char_map[1]; // Third digit
                an <= 4'b1011;      // Enable digit 3
            end
            2'b11: begin
                seg <= char_map[0]; // Least significant digit
                an <= 4'b0111;      // Enable digit 4
            end
        endcase
    end

endmodule