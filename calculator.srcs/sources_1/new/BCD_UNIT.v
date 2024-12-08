`timescale 1ns/1ps  // Add time scale directive

module BCD_UNIT(
    input [28:0] bDot,           // 29-bit signed binary input
    input [7:0] aDot,            // 8-bit binary input
    output reg sign,             // Sign of bDot (1 for negative, 0 for positive)
    output reg [31:0] bDot_BCD,  // 32-bit BCD output for bDot
    output reg [7:0] aDot_BCD,   // 8-bit BCD output for aDot
    output reg [3:0] Unit        // Number of BCD digits required (including sign)
);
    // Temporary variables for conversion
    reg [27:0] bDot_abs;
    reg [7:0] aDot_abs;
    reg [31:0] bcd;
    reg [7:0] aDot_bcd;
    integer i;

    // Handle sign bit and absolute value
    always @(*) begin
        sign = bDot[28];
        
        // Take absolute value if negative
        bDot_abs = bDot[27:0];  // Corrected variable name from 'bdot' to 'bDot'
        aDot_abs = aDot;        // Absolute value for aDot (no sign bit)

        // Initialize BCD outputs to zero
        bcd = 32'b0;
        aDot_bcd = 8'b0;

        // Binary to BCD conversion for bDot using shift-and-add-3 algorithm
        for (i = 27; i >= 0; i = i - 1) begin  // Changed to 27 to match bDot_abs width
            // Add 3 to columns >= 5
            if (bcd[3:0] > 4'h4)
                bcd[3:0] = bcd[3:0] + 4'h3;
            if (bcd[7:4] > 4'h4)
                bcd[7:4] = bcd[7:4] + 4'h3;
            if (bcd[11:8] > 4'h4)
                bcd[11:8] = bcd[11:8] + 4'h3;
            if (bcd[15:12] > 4'h4)
                bcd[15:12] = bcd[15:12] + 4'h3;
            if (bcd[19:16] > 4'h4)
                bcd[19:16] = bcd[19:16] + 4'h3;
            if (bcd[23:20] > 4'h4)
                bcd[23:20] = bcd[23:20] + 4'h3;
            if (bcd[27:24] > 4'h4)
                bcd[27:24] = bcd[27:24] + 4'h3;
            if (bcd[31:28] > 4'h4)
                bcd[31:28] = bcd[31:28] + 4'h3;
            
            // Shift left
            bcd = bcd << 1;
            bcd[0] = bDot_abs[i];
        end
        
        // Assign BCD output for bDot
        bDot_BCD = bcd;

        // Unit calculation for bDot:
        // Rule: If bDot is 0, it gets 3 units. If bDot is non-zero, it gets a minimum of 3 units.
        if (bDot_abs == 0) begin
            Unit = 4'd3;  // 0.00 should be 3 units
        end else begin
            // Check number of digits for bDot
            if (bDot_abs < 10) begin
                Unit = 4'd3;  // For small values like 1.01, 3 units
            end else if (bDot_abs < 100) begin
                Unit = 4'd4;  // For values like 12.00, 4 units
            end else if (bDot_abs < 1000) begin
                Unit = 4'd5;  // For values in the hundreds, 5 units
            end else if (bDot_abs < 10000) begin
                Unit = 4'd6;  // For values in the thousands, 6 units
            end else if (bDot_abs < 100000) begin
                Unit = 4'd7;  // For values in the ten-thousands, 7 units
            end else if (bDot_abs < 1000000) begin
                Unit = 4'd8;  // For values in the hundred-thousands, 8 units
            end else if (bDot_abs < 10000000) begin
                Unit = 4'd9;  // For values in the millions, 9 units
            end else if (bDot_abs < 100000000) begin
                Unit = 4'd10;  // For values in the tens of millions, 10 units
            end
        end
        
        // Binary to BCD conversion for aDot using the same algorithm
        for (i = 7; i >= 0; i = i - 1) begin  // Loop for 8-bit aDot
            // Add 3 to columns >= 5 for aDot
            if (aDot_bcd[3:0] > 4'h4)
                aDot_bcd[3:0] = aDot_bcd[3:0] + 4'h3;
            if (aDot_bcd[7:4] > 4'h4)
                aDot_bcd[7:4] = aDot_bcd[7:4] + 4'h3;
            
            // Shift left
            aDot_bcd = aDot_bcd << 1;
            aDot_bcd[0] = aDot_abs[i];
        end
        
        // Assign BCD output for aDot
        aDot_BCD = aDot_bcd;

    end
endmodule
