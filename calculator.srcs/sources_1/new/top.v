`timescale 1ns / 1ps

module top(
    input clk,              
    input btnL,            
    input btnR,            
    input btnC,          
    output [6:0] seg,
    output [3:0] an,
    output dp,
    output [15:0] led
);
    wire rr;
    wire [2:0] mode;
    wire [28:0] bDot;
    wire [7:0] aDot;
    SegRefreshRate gen_rr(clk, rr);


    assign bDot = {1'b1,28'd98778943};
    assign aDot = 8'd25;
    
    main modeSelector (
        .clk(clk),
        .rr(rr),
        .btnL(btnL),
        .btnR(btnR),
        .btnC(btnC),
        .seg(seg),
        .an(an),
        .led(led),
        .mode(mode)
    );
    
    always @(mode) begin
        case (mode)
            3'b001: begin 
                displayDec(clk, btnL, btnR, bDot, aDot, seg, an, led, dp);
            end
            3'b010: begin 
                displayDec(clk, btnL, btnR, bDot, aDot, seg, an, led, dp);
            end
            3'b011: begin
                displayDec(clk, btnL, btnR, bDot, aDot, seg, an, led, dp);
            end
            3'b100: begin
                displayDec(clk, btnL, btnR, bDot, aDot, seg, an, led, dp);
            end
            3'b101: begin
                displayDec(clk, btnL, btnR, bDot, aDot, seg, an, led, dp);
            end
        endcase
    end

endmodule