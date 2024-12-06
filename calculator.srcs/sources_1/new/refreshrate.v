`timescale 1ns / 1ps

module SegRefreshRate(
    input clk,
    output clk_out
    );
    reg elapsed = 0;
    reg [27:0] state = 0; 
    always @ (posedge clk) 
        if (state == 10000) state <= 0; 
        else state <= state + 1; 
    always @(state) 
        if (state == 10000) elapsed = 1; 
        else elapsed = 0; 
    assign clk_out = elapsed; 
endmodule