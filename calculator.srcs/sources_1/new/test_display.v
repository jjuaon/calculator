`timescale 1ns / 1ps

module test_display(
    input clk,               // System clock
    input btnL,             // Left button
    input btnR,             // Right button
    input btnC,             // Center button
    input btnU,             // Up button
    input btnD,             // Down button
    output [6:0] seg,       // 7-segment display segments
    output [3:0] an,        // 7-segment display anodes
    output [15:0] led       // LED display
);
    // Internal wires
    wire refresh_rate;
    wire [3:0] result_bin;
    wire return_to_main;    
    
    // Reset any outputs that might need default values
    reg rst = 0;
    initial begin
        rst = 1;
        #100 rst = 0;
    end
    
    // Refresh rate generator
    SegRefreshRate refresh_gen(
        .clk(clk),
        .clk_out(refresh_rate)
    );
    
    // Instantiate Logic module (renamed from Logi)
    Logi logic_unit(
        .enLogi(1'b1),      // Change back to enLogi to match the module definition
        .rr(refresh_rate),
        .clk(clk),
        .btnU(btnU),
        .btnD(btnD),
        .btnL(btnL),
        .btnR(btnR),
        .btnC(btnC),
        .seg(seg),
        .an(an),
        .Out(result_bin),
        .return_to_main(return_to_main)
    );
        assign led = {12'b0, result_bin};

endmodule