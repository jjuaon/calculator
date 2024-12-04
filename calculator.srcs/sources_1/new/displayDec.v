`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2024 11:10:27 PM
// Design Name: 
// Module Name: displayDec
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module displayDec(
    input clk, btnL, btnR,              
    input [28:0] bDot,         // Binary before the decimal point (29 bits, including sign)
    input [7:0] aDot,          // Binary after the decimal point (4 bits for 2 decimal digits)
    output reg [6:0] seg,      // 7-segment display patterns
    output reg [3:0] an,       // 7-segment display digit selector (anodes)
    output reg [15:0] led      // LEDs for debug or other display purposes
    );
    wire rr;                   // Refresh rate signal for multiplexing
    wire sign;                  // Indicates if the number is negative
    reg [3:0] refresh_counter; // Counter for digit multiplexing (max 10 units)
    wire [31:0] bcd_bDot;       // BCD converted value for bDot
    wire [7:0] bcd_aDot;        // BCD converted value for aDot
    wire [3:0] len;
    reg [3:0] cindex = 4'b0000; //start index at 0(show 2 decimal and 2 floating point)
    reg [15:0] display_value;     // Current decimal to display
    reg [3:0] digit_value;     // Current digit to display

    SegRefreshRate(clk, rr);
    BCD_UNIT(bDot,aDot,sign,bcd_bDot,bcd_aDot,len);
     // Initialize display value to show 2 decimal (bDot) and 2 fractional (aDot) digits
     initial begin
        display_value = {bcd_bDot[7:4], bcd_bDot[3:0], bcd_aDot[7:4], bcd_aDot[3:0]};
     end
     
    // Handle button inputs for scrolling and update display_value
    always @(posedge rr) begin
        if (btnL) begin
            // Scroll left (move to the next segment)
            if (cindex < len - 4) // Ensure scrolling does not go out of bounds
                cindex <= cindex + 1;
        end else if (btnR) begin
            // Scroll right (move to the previous segment)
            if (cindex > 0) 
                cindex <= cindex - 1;
        end
    end
    
    // Update display_value based on cindex
    always @(posedge rr) begin
        display_value <= {bcd_bDot[(4 * cindex + 15) -: 16], bcd_aDot[7:0]}; // Dynamically update display
    end
    
    // Update LED outputs based on len and cindex
    reg blink_state = 0; // To control blinking
    integer i;

    always @(posedge rr) begin
        // Toggle blink state for the active index
        blink_state <= ~blink_state;
        
        // Default: Turn off all LEDs
        led <= 16'b0;
    
        // Illuminate LEDs up to `len`
        for (i = 0; i < 16; i = i + 1) begin
            if (i < len) begin
                led[i] <= 1'b1; // Turn on LEDs up to `len`
            end
        end
    
        // Blink the current index
        if (cindex < len) begin
            if (blink_state) 
                led[cindex] <= 1'b0; // Turn off the active index
            else 
                led[cindex] <= 1'b1; // Turn it back on
        end
    end
    
    



    // Extract the digit to display based on the refresh counter and current index
    always @(posedge rr) begin
        case (refresh_counter)
            4'b0000: digit_value <= display_value[(4 * (cindex + 0)) +: 4]; // Digit 1
            4'b0001: digit_value <= display_value[(4 * (cindex + 1)) +: 4]; // Digit 2
            4'b0010: digit_value <= display_value[(4 * (cindex + 2)) +: 4]; // Digit 3
            4'b0011: digit_value <= display_value[(4 * (cindex + 3)) +: 4]; // Digit 4
            default: digit_value <= 4'b1111; // Blank
        endcase
    end

    // Control the 7-segment display pattern based on the digit value
    always @(*) begin
        case (digit_value)
            4'b0000: seg = 7'b1000000; // 0
            4'b0001: seg = 7'b1111001; // 1
            4'b0010: seg = 7'b0100100; // 2
            4'b0011: seg = 7'b0110000; // 3
            4'b0100: seg = 7'b0011001; // 4
            4'b0101: seg = 7'b0010010; // 5
            4'b0110: seg = 7'b0000010; // 6
            4'b0111: seg = 7'b1111000; // 7
            4'b1000: seg = 7'b0000000; // 8
            4'b1001: seg = 7'b0010000; // 9
            default: seg = 7'b1111111; // Blank
        endcase
    end

    // Update anode signals for multiplexing
    always @(posedge rr) begin
        case (refresh_counter)
            4'b0000: an <= 4'b1110; // Enable Digit 1
            4'b0001: an <= 4'b1101; // Enable Digit 2
            4'b0010: an <= 4'b1011; // Enable Digit 3
            4'b0011: an <= 4'b0111; // Enable Digit 4
            default: an <= 4'b1111; // All off
        endcase
        refresh_counter <= refresh_counter + 1; // Increment refresh counter
    end

endmodule
