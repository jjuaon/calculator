`timescale 1ns / 1ps

module displayDec(
    input clk, rr, btnL, btnR,             // Clock and buttons for navigation
    input [28:0] bDot,                 // Binary input for bDot
    input [7:0] aDot,                  // Binary input for aDot
    output reg [6:0] seg,              // 7-segment display segments
    output reg [3:0] an,               // 7-segment display anodes
    output reg [15:0] led,             // Debug LEDs
    output reg dp                      // Decimal point
);
    reg [3:0] refresh_counter;         // Counter for digit multiplexing
    reg [3:0] digit_value;             // Current digit to display
    wire [31:0] bDot_BCD;              // BCD representation of bDot
    wire [7:0] aDot_BCD;               // BCD representation of aDot
    wire [3:0] Unit;                   // Number of digits in the BCD output
    wire sign;                         // Sign of the bDot value
    reg [3:0] index = 4'b0;            // Current index for sliding
    reg [15:0] dp_value;               // Value including the decimal point
    integer i;                         // Loop variable
    
    reg [17:0] debounce;      // Debounce counter
    reg btnL_prev, btnR_prev;

    BCD_UNIT bcd_unit_inst (
        .bDot(bDot),
        .aDot(aDot),
        .sign(sign),
        .bDot_BCD(bDot_BCD),
        .aDot_BCD(aDot_BCD),
        .Unit(Unit)
    );

    initial begin
        led = 16'b0;
        for (i = 0; i < 16; i = i + 1) begin
            led[i] = 1'b1;
        end
    end

    always @(posedge clk) begin
        if (debounce == 0) begin
            if (btnL && !btnL_prev) begin
                if (index < (Unit - 3)) begin // Ensure index does not exceed upper bound
                    index <= index + 1;
                end
            end

            if (btnR && !btnR_prev) begin
                if (index > 0) begin // Ensure index does not go below lower bound
                    index <= index - 1;
                end
            end

            btnL_prev <= btnL;
            btnR_prev <= btnR;
        end
    end

    always @(index) begin
        if (sign) begin
            led <= (1 << (Unit+1)) - 1;
        end else begin
            led <= (1 << Unit) - 1;
        end

        case (index)
            4'b0000: begin
                dp_value <= {
                    sign ? ((Unit > index + 3) ? bDot_BCD[7:4] : 4'b1110) : (bDot_BCD[7:4]),
                    bDot_BCD[3:0],
                    aDot_BCD[7:4],
                    aDot_BCD[3:0]
                };
                led[3:0] <= 4'b0000;

            end

            4'b0001: begin
                dp_value <= {
                    sign ? ((Unit > index + 3) ? bDot_BCD[11:8] : 4'b1110) : (bDot_BCD[11:8]),
                    bDot_BCD[7:4],
                    bDot_BCD[3:0],
                    aDot_BCD[7:4]
                };
                led[4:1] <= 4'b0000;

            end
            
            4'b0010: begin
                dp_value <= {
                    sign ? ((Unit > index + 3) ? bDot_BCD[15:12] : 4'b1110) : (bDot_BCD[15:12]),
                    bDot_BCD[11:8],
                    bDot_BCD[7:4],
                    bDot_BCD[3:0]
                };
                led[5:2] <= 4'b0000;

            end
            4'b0011: begin
                dp_value <= {
                    sign ? ((Unit > index + 3) ? bDot_BCD[19:16] : 4'b1110) : (bDot_BCD[19:16]),
                    bDot_BCD[15:12],
                    bDot_BCD[11:8],
                    bDot_BCD[7:4]
                };
                led[6:3] <= 4'b0000;
            end
            
            4'b0100: begin
                dp_value <= {
                    sign ? ((Unit > index + 3) ? bDot_BCD[23:20] : 4'b1110) : (bDot_BCD[23:20]),
                    bDot_BCD[19:16],
                    bDot_BCD[15:12],
                    bDot_BCD[11:8]
                };
                led[7:4] <= 4'b0000;
            end

            4'b0101: begin
                dp_value <= {
                    sign ? ((Unit > index + 3) ? bDot_BCD[27:24] : 4'b1110) : (bDot_BCD[27:24]),
                    bDot_BCD[23:20],
                    bDot_BCD[19:16],
                    bDot_BCD[15:12]
                };
                led[8:5] <= 4'b0000;
            end

            4'b0110: begin
                dp_value <= {
                    sign ? ((Unit > index + 3) ? bDot_BCD[31:28] : 4'b1110) : (bDot_BCD[31:28]),
                    bDot_BCD[27:24],
                    bDot_BCD[23:20],
                    bDot_BCD[19:16]
                };
                led[9:6] <= 4'b0000;
            end

            4'b0111: begin
                dp_value <= {
                    sign ? 4'b1110 : 4'b0000,
                    bDot_BCD[31:28],
                    bDot_BCD[27:24],
                    bDot_BCD[23:20]
                };
                led[10:7] <= 4'b0000;
            end

            default: begin
                dp_value <= {4'b1111,4'b1111,4'b1111,4'b1111};
                led <= 16'b1111111111111111;
            end
        endcase
    end

    always @(posedge rr) begin
        refresh_counter <= (refresh_counter == 4'b0011) ? 4'b0000 : refresh_counter + 1; // Loop through 4 digits
    end

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
                if (index == 4'b0001) dp <= 1'b0; // Activate decimal point for the second index

            end
            4'b0010: begin
                digit_value <= dp_value[11:8];
                an <= 4'b1011; // Activate third digit
                if (index == 4'b0000) dp <= 1'b0; // Activate decimal point for the first index
            end
            4'b0011: begin
                digit_value <= dp_value[15:12];
                an <= 4'b0111; // Activate fourth digit
            end
            default: begin
                digit_value <= 4'b0000; // Default blank
                an <= 4'b1111; // Turn off all segments
            end
        endcase
    end

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
            default: seg <= 7'b0000110; // Blank
        endcase
    end

endmodule
