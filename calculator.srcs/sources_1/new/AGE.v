`timescale 1ns / 1ps

module AgeCalculator(
    input enAge,
    input clk,                // Clock input
    input btnL,            
    input btnR,            
    input btnC,
    input btnU,          
    input btnD,               // Move to the previous digit
    output reg [28:0] bDot,   // Binary input for bDot
    output reg [7:0] aDot,     // Binary input for aDot
    output reg dpFlag
);
    initial begin
        dpFlag <= 0;
    end
    reg [28:0] curr_year = 29'd2024; // Current year (hardcoded for now)
    reg [28:0] birth_year= 29'd2006;         // Birth year extracted from bDot
    reg [7:0] age;                  // Calculated age

    always @(*) begin
        if (enAge) begin
            bDot = curr_year - birth_year; 
            aDot = 8'd0;
            if (birth_year > curr_year) begin
                bDot = 29'b0;
            end
            dpFlag <= 1;
        end 
//        else begin
//            bDot = {1'b0, 28'd98778943};
//            aDot = 8'd0;
//        end
    end
    
endmodule
