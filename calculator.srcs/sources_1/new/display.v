`timescale 1ns / 1ps

module displayDec(
    input clk, btnL, btnR,             // Clock and buttons for navigation
    input [28:0] bDot,                 // Binary input for bDot
    input [7:0] aDot,                  // Binary input for aDot
    output reg [6:0] seg,              // 7-segment display segments
    output reg [3:0] an,               // 7-segment display anodes
    output reg [15:0] led,             // Debug LEDs
    output reg dp                      // Decimal point
);
    wire rr;                           // Refresh rate signal
    reg [3:0] refresh_counter;         // Counter for digit multiplexing
    reg [3:0] digit_value;             // Current digit to display
    wire [31:0] bDot_BCD;              // BCD representation of bDot
    wire [7:0] aDot_BCD;               // BCD representation of aDot
    wire [3:0] Unit;                   // Number of digits in the BCD output
    wire sign;                         // Sign of the bDot value
    reg [3:0] index = 4'b0;            // Current index for sliding
    reg [15:0] dp_value;               // Value including the decimal point
    integer i;                         // Loop variable
//    reg [7:0] findex, bindex;
    // Instantiate refresh rate generator
    SegRefreshRate refresh_rate_gen (
        .clk(clk),
        .clk_out(rr)
    );

    // Instantiate BCD_UNIT for binary to BCD conversion
    BCD_UNIT bcd_unit_inst (
        .bDot(bDot),
        .aDot(aDot),
        .sign(sign),
        .bDot_BCD(bDot_BCD),
        .aDot_BCD(aDot_BCD),
        .Unit(Unit)
    );

    // Initialize LEDs and populate initial values
    initial begin
        led = 16'b0;
        for (i = 0; i < 16; i = i + 1) begin
            led[i] = 1'b1;
        end
    end

    // Handle sliding window logic for `index`
    always @(posedge clk) begin
        if (btnL && index > 0) begin
            index <= index - 1; // Slide left
        end else if (btnR && index < (Unit - 1)) begin
            index <= index + 1; // Slide right
        end
    end

    // Calculate `dp_value` based on the current index
    always @(*) begin

        // Populate `dp_value` for display based on the sliding window
        case (index)
            4'b0000: begin
                dp_value <= {
                    sign ? ((Unit > index + 3) ? bDot_BCD[7:4] : 4'b1110) : (bDot_BCD[7:4]),
                    bDot_BCD[3:0],
                    aDot_BCD[7:4],
                    aDot_BCD[3:0]
                };
            end
            4'b0001: begin
                dp_value <= {
                    sign ? ((Unit > index + 3) ? bDot_BCD[8:5] : 4'b1110) : (bDot_BCD[8:5]),
                    bDot_BCD[7:4],
                    bDot_BCD[3:0],
                    aDot_BCD[7:4]
                };
            end
        
   
            default: begin
                dp_value <= {
                    sign ? ((Unit > index + 3) ? bDot_BCD[findex + 4 : bindex + 4] : 4'b1110) : (bDot_BCD[findex + 4 : bindex + 4]),
                    bDot_BCD[findex : bindex],
                    bDot_BCD[findex - 4 : bindex - 4],
                    bDot_BCD[findex - 8 : bindex - 8]
                };
            end
        endcase

        // Clear LEDs for the current index range
//        for (i = bindex; i <= findex; i = i + 1) begin
//            led[i] <= 1'b0;
//        end
    end

    // Refresh counter for digit multiplexing
    always @(posedge rr) begin
        refresh_counter <= (refresh_counter == 4'b0011) ? 4'b0000 : refresh_counter + 1; // Loop through 4 digits
    end

    // Select the current digit to display and handle the decimal point
    always @(*) begin
        dp <= 1'b1; // Default decimal point off
        case (refresh_counter)
            4'b0000: begin
                digit_value <= dp_value[3:0];
                an <= 4'b1110; // Activate first digit
            end
            4'b0001: begin
                digit_value <= dp_value[7:4];
                an <= 4'b1101; // Activate second digit
            end
            4'b0010: begin
                digit_value <= dp_value[11:8];
                an <= 4'b1011; // Activate third digit
                if (index == 4'b0000) dp <= 1'b0; // Activate decimal point for the first index
            end
            4'b0011: begin
                digit_value <= dp_value[15:12];
                an <= 4'b0111; // Activate fourth digit
                if (index == 4'b0001) dp <= 1'b0; // Activate decimal point for the second index
            end
            default: begin
                digit_value <= 4'b0000; // Default blank
                an <= 4'b1111; // Turn off all segments
            end
        endcase
    end

    // 7-segment encoding for the current digit
    always @(*) begin
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
            4'b1110: seg <= 7'b0111111; // -
            default: seg <= 7'b1111111; // Blank
        endcase
    end

endmodule