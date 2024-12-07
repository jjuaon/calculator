`timescale 1ns / 1ps
module test_display(
    input clk, btnL, btnR, btnC, btnU, btnD,            
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led
);
    wire refresh_rate;          // Refresh rate signal
    wire [3:0] result_bin;      // Result from Logi module
    
    // Instantiate Logi module with refresh rate connection
    Logi logic_unit(
        .clk(clk),
        .rr(refresh_rate),      // Connect refresh rate
        .btnU(btnU),
        .btnD(btnD),
        .btnL(btnL),
        .btnR(btnR),
        .btnC(btnC),
        .seg(seg),
        .an(an),
        .Out(result_bin)
    );
    
    // Refresh rate generator using provided module
    SegRefreshRate refresh_gen(
        .clk(clk),
        .clk_out(refresh_rate)  // Using clk_out as refresh rate signal
    );
    
    // LED output assignment
    assign led = {12'b1, result_bin};
    
endmodule