`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2024 02:56:48 PM
// Design Name: 
// Module Name: display
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

module displayBin(
    input clk, btnL, btnR,                
    input [28:0] bDot,         
    input [7:0] aDot,          
    output reg [6:0] seg,      
    output reg [3:0] an,      
    output reg [15:0] led
);
    wire rr;                   // Refresh rate signal for multiplexing
    reg [3:0] refresh_counter; // Counter for digit multiplexing
    reg [3:0] digit_value;     // Current digit to display

    // Instantiate refresh rate generator (assumed module provided)
    SegRefreshRate refresh_rate_gen(clk, rr);

    // Refresh counter for digit multiplexing
    always @(posedge rr) begin
        refresh_counter <= (refresh_counter == 4'b0011) ? 4'b0000 : refresh_counter + 1; // Loop through 4 digits
    end

    // Select the current digit to display
    always @(refresh_counter) begin
            // Display only the last 4 bits of bDot
            case (refresh_counter)
                4'b0000: begin
                    digit_value <= bDot[0];
                    an <= 4'b1110; // Activate first digit
                end
                4'b0001: begin
                    digit_value <= bDot[1];
                    an <= 4'b1101; // Activate second digit
                end
                4'b0010: begin
                    digit_value <= bDot[2];
                    an <= 4'b1011; // Activate third digit
                end
                4'b0011: begin
                    digit_value <= bDot[3];
                    an <= 4'b0111; // Activate fourth digit
                end
                default: begin
                    digit_value <= 4'b0000; // Default blank
                    an <= 4'b1111; // Turn off all segments
                end
            endcase
    end

    // 7-segment encoding for the current digit
    always @(digit_value) begin
        case (digit_value)
            4'b0000: seg <= 7'b1000000; // 0
            4'b0001: seg <= 7'b1111001; // 1
            4'b0010: seg <= 7'b0100100; // 2
            4'b0011: seg <= 7'b0110000; // 3
            4'b0100: seg <= 7'b0011001; // 4
            4'b0101: seg <= 7'b0010010; // 5
            4'b0110: seg <= 7'b0000010; // 6
            4'b0111: seg <= 7'b1111000; // 7
            4'b1000: seg <= 7'b0000000; // 8
            4'b1001: seg <= 7'b0010000; // 9
            default: seg <= 7'b1111111; // Blank
        endcase
    end

endmodule