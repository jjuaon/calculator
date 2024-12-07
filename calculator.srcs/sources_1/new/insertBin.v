`timescale 1ns / 1ps
module insertBin(
    input clk,
    input rr,                 // External refresh rate input
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    input btnC,
    output reg [3:0] bin,
    output reg [6:0] seg_out,
    output reg [3:0] an_out
);
    reg [3:0] current_value = 4'b0000;
    reg [1:0] digit_pos = 2'b00;
    
    always @(posedge clk) begin
        if (rr) begin  // Only update on refresh rate pulse
            // Handle button inputs
            if (btnU && !btnD) begin
                if (current_value[digit_pos] == 0)
                    current_value[digit_pos] <= 1;
            end
            else if (btnD && !btnU) begin
                if (current_value[digit_pos] == 1)
                    current_value[digit_pos] <= 0;
            end
            
            // Handle digit position movement
            if (btnL && !btnR) begin
                if (digit_pos < 2'b11)
                    digit_pos <= digit_pos + 1;
            end
            else if (btnR && !btnL) begin
                if (digit_pos > 2'b00)
                    digit_pos <= digit_pos - 1;
            end
            
            // Save value when btnC is pressed
            if (btnC) begin
                bin <= current_value;
            end
            
            // Display control
            case (digit_pos)
                2'b00: begin
                    an_out <= 4'b1110;
                    seg_out <= current_value[0] ? 7'b1111001 : 7'b1111110;
                end
                2'b01: begin
                    an_out <= 4'b1101;
                    seg_out <= current_value[1] ? 7'b1111001 : 7'b1111110;
                end
                2'b10: begin
                    an_out <= 4'b1011;
                    seg_out <= current_value[2] ? 7'b1111001 : 7'b1111110;
                end
                2'b11: begin
                    an_out <= 4'b0111;
                    seg_out <= current_value[3] ? 7'b1111001 : 7'b1111110;
                end
            endcase
        end
    end
endmodule